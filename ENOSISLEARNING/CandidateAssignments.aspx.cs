using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ENOSISLEARNING
{
    public partial class CandidateAssignments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CANDID"] != null)
                {
                    string candidateCode = Session["CANDID"].ToString();
                    hfCandidateID.Value = candidateCode.ToString();
                }
                else
                {
                    Response.Redirect("~/Login.aspx");
                }
            }
        }
        public class Course
        {
            public string CourseID { get; set; }
            public string CourseName { get; set; }
        }
        [WebMethod]
        public static List<Course> GetCourses(int candidateId)
        {
            List<Course> courses = new List<Course>();
            string connStr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"
                SELECT CBM.CourseID, CD.COURSENAME 
                FROM CandidateBatchMapping CBM
                INNER JOIN COURSES_DETAIL CD ON CBM.CourseID = CD.COURSEID
                WHERE CBM.CANDIDATE_CODE = @CandidateID
                ORDER BY CBM.CourseID DESC
                ";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@CandidateID", candidateId);
                    con.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            courses.Add(new Course
                            {
                                CourseID = dr["CourseID"].ToString(),
                                CourseName = dr["COURSENAME"].ToString()
                            });
                        }
                    }
                }
            }
            return courses;
        }
        //class for Mapping Assignment to Candidate
        public static class CourseFolderMapper
        {
            // CourseID -> FolderName
            private static readonly Dictionary<int, string> _map =
                new Dictionary<int, string>
                {
            { 1, "C" },
            { 2, "CPP" },
            { 4, "Net" },
            { 5, "Asp.Net" },
            { 6, "SQL" },
            { 8, "Designing" },
            { 11, "SSIS" },
            { 12, "SSRS" },
            { 13, "SSAS" },
            { 17, "MVC" },
            { 20, "Java" },
            { 21, "Testing" },
            { 25, "PowerBI" }
                };

            public static string GetFolderByCourseId(int courseId)
            {
                return _map.ContainsKey(courseId) ? _map[courseId] : string.Empty;
            }
        }

        public class AssignmentVM
        {
            public int CourseId { get; set; }
            public string AssignmentName { get; set; }
            public string DownloadUrl { get; set; }
        }

        [WebMethod]
        public static List<AssignmentVM> GetAssignments(int courseId)
        {
            List<AssignmentVM> list = new List<AssignmentVM>();

            string folderName = CourseFolderMapper.GetFolderByCourseId(courseId);
            if (string.IsNullOrEmpty(folderName))
                return list;

            string path = HttpContext.Current.Server.MapPath("~/Assignments/" + folderName);
            if (!Directory.Exists(path))
                return list;

            foreach (string file in Directory.GetFiles(path))
            {
                list.Add(new AssignmentVM
                {
                    CourseId = courseId,
                    AssignmentName = Path.GetFileName(file),
                    DownloadUrl = "Assignments/" + folderName + "/" + Path.GetFileName(file)
                });
            }

            return list;
        }

    }
}