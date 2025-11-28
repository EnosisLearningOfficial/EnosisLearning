using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ENOSISLEARNING
{
    public partial class Attendence : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!IsPostBack) // Avoid reloading session data
                {
                    if (Session["USERNAME"] != null && Session["CANDID"] != null)
                    {
                        lbltxt.Text = "Welcome " + Session["USERNAME"].ToString();
                        hfCandidateID.Value = Session["CANDID"].ToString();
                    }
                    else
                    {
                        hfCandidateID.Value = "0";
                        Response.Redirect("Login.aspx"); // Redirect to login if session is null
                    }
                }
            }
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
                                CourseID = Convert.ToInt32(dr["CourseID"]),
                                CourseName = dr["COURSENAME"].ToString()
                            });
                        }
                    }
                }
            }
            return courses;
        }

        //[WebMethod]
        //public static object GetStudentBatchData(string courseId)
        //{
        //    string studentId = HttpContext.Current.Session["CANDID"]?.ToString();
        //    if (string.IsNullOrEmpty(studentId) || string.IsNullOrEmpty(courseId))
        //        return null;

        //    List<string> batchIds = new List<string>();
        //    var data = new
        //    {
        //        Attendance = new List<object>(),
        //        Messages = new List<object>()
        //    };

        //    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ToString()))
        //    {
        //        con.Open();

        //        // 🔵 Step 1: Get BatchIDs for selected CourseID only
        //        SqlCommand cmd = new SqlCommand(@"
        //    SELECT BatchID 
        //    FROM CandidateBatchMapping 
        //    WHERE CANDIDATE_CODE = @StudentID AND COURSEID = @CourseID", con);
        //        cmd.Parameters.AddWithValue("@StudentID", studentId);
        //        cmd.Parameters.AddWithValue("@CourseID", courseId);
        //        SqlDataReader reader = cmd.ExecuteReader();
        //        while (reader.Read())
        //            batchIds.Add(reader["BatchID"].ToString());
        //        reader.Close();

        //        if (batchIds.Count == 0) return data;

        //        string batchIdList = string.Join(",", batchIds.Select(id => $"'{id}'"));

        //        // 🔵 Step 2: Get Attendance for those batch IDs
        //        cmd = new SqlCommand($@"
        //    SELECT Date, ChapterNumber, TopicCovered, Uploads, Status, BatchID 
        //    FROM enosis.BatchSheetDetails 
        //    WHERE BatchID IN ({batchIdList})", con);
        //        reader = cmd.ExecuteReader();
        //        while (reader.Read())
        //        {
        //            data.Attendance.Add(new
        //            {
        //                Date = Convert.ToDateTime(reader["Date"]).ToString("dd-MM-yyyy"),
        //                ChapterNumber = reader["ChapterNumber"].ToString(),
        //                TopicCovered = reader["TopicCovered"].ToString(),
        //                Uploads = reader["Uploads"]?.ToString(),
        //                Status = reader["Status"].ToString(),
        //                BatchID = reader["BatchID"].ToString()
        //            });
        //        }
        //        reader.Close();
        //    }

        //    return data;
        //}
        [WebMethod]
        public static object GetStudentBatchData(string courseId)
        {
            string studentId = HttpContext.Current.Session["CANDID"]?.ToString();
            if (string.IsNullOrEmpty(studentId) || string.IsNullOrEmpty(courseId))
                return null;

            List<string> batchIds = new List<string>();
            var data = new
            {
                Attendance = new List<object>(),
                Messages = new List<object>()
            };

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ToString()))
            {
                con.Open();

                //Step 1: Get BatchIDs for selected CourseID only
                SqlCommand cmd = new SqlCommand(@"
            SELECT BatchID 
            FROM CandidateBatchMapping 
            WHERE CANDIDATE_CODE = @StudentID AND COURSEID = @CourseID", con);

                cmd.Parameters.AddWithValue("@StudentID", studentId);
                cmd.Parameters.AddWithValue("@CourseID", courseId);
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                    batchIds.Add(reader["BatchID"].ToString());
                reader.Close();

                if (batchIds.Count == 0) return data;

                string batchIdList = string.Join(",", batchIds.Select(id => $"'{id}'"));

                // Step 2: Get Attendance for those batch IDs
                cmd = new SqlCommand($@"
            SELECT Date, ChapterNumber, TopicCovered, Uploads, Status, BatchID 
            FROM enosis.BatchSheetDetails 
            WHERE BatchID IN ({batchIdList})", con);

                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    string uploadsPath = reader["Uploads"] == DBNull.Value ? null : reader["Uploads"].ToString();

                    // Convert ~/Files/... to absolute URL
                    string finalPath = string.IsNullOrEmpty(uploadsPath) ? null :
                                       VirtualPathUtility.ToAbsolute(uploadsPath);

                    data.Attendance.Add(new
                    {
                        Date = Convert.ToDateTime(reader["Date"]).ToString("dd-MM-yyyy"),
                        ChapterNumber = reader["ChapterNumber"].ToString(),
                        TopicCovered = reader["TopicCovered"].ToString(),
                        Uploads = finalPath,
                        Status = reader["Status"].ToString(),
                        BatchID = reader["BatchID"].ToString()
                    });
                }
                reader.Close();
            }

            return data;
        }


        public class Course
        {
            public int CourseID { get; set; }
            public string CourseName { get; set; }
        }

        public class AttendanceRecord
        {
            public string ChapterNumber { get; set; }
            public string TopicCovered { get; set; }
            public string Date { get; set; }
            public string Uploads { get; set; }
            public string Status { get; set; }
        }
    }
}