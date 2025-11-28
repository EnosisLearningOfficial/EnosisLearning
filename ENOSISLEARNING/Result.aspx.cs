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
    public partial class Result : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USERNAME"] != null && Session["CANDID"] != null)
            {
                lbltxt.Text = "Welcome " + Session["USERNAME"].ToString();
                hfCandidateID.Value = Session["CANDID"].ToString();
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
            if (!IsPostBack)
            {

            }
        }
        //Bind Result GidView//
        [WebMethod]
        public static object GetResults(int courseId, int candidateId)
        {
            List<object> resultList = new List<object>();

            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
                {
                    string query = @"
                SELECT 
                    CT.CANDIDATEID,
                    C.CANDIDATE_CODE,
                    C.FULLNAME,
                    CT.COURSEID,
                    CBM.COURSEID AS MappedCourseID,
                    CT.SCORE,
                    CT.OUTOF,
                    CT.UPDATEDDATE,
                    CT.UPDATEDBY AS Faculty,
                    CT.FEEDBACK,
                    CT.ASSESSMENTTYPE,
                    CT.TESTANSWERS_FILENAME
                FROM CANDIDATE_TESTRESULTS CT
                JOIN CANDIDATES C ON CT.CANDIDATEID = C.CANDIDATE_CODE
                JOIN CandidateBatchMapping CBM 
                    ON CBM.CANDIDATE_CODE = C.CANDIDATE_CODE 
                    AND CBM.COURSEID = CT.COURSEID
                JOIN enosis.BatchesInfo B 
                    ON CBM.BATCHID = B.BatchID
                WHERE C.CANDIDATE_CODE = @CandidateID
                AND CT.COURSEID = @CourseID
                ORDER BY CT.UPDATEDDATE DESC";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@CandidateID", candidateId);
                        cmd.Parameters.AddWithValue("@CourseID", courseId);

                        con.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                resultList.Add(new
                                {
                                    CANDIDATEID = reader["CANDIDATEID"],
                                    CANDIDATE_CODE = reader["CANDIDATE_CODE"],
                                    FULLNAME = reader["FULLNAME"],
                                    COURSEID = reader["COURSEID"],
                                    SCORE = reader["SCORE"],
                                    OUTOF = reader["OUTOF"],
                                    UPDATEDDATE = Convert.ToDateTime(reader["UPDATEDDATE"]).ToString("dd-MM-yyyy"),
                                    UPDATEDBY = reader["Faculty"],
                                    FEEDBACK = reader["FEEDBACK"],
                                    ASSESSMENTTYPE = reader["ASSESSMENTTYPE"],
                                    TESTANSWERS_FILENAME = reader["TESTANSWERS_FILENAME"]
                                });
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                return new { error = ex.Message };
            }

            return resultList;
        }


        public class ResultRecord
        {
            public string CANDIDATEID { get; set; }
            public string CANDIDATE_CODE { get; set; }
            public string FULLNAME { get; set; }
            public string COURSEID { get; set; }
            public string SCORE { get; set; }
            public string OUTOF { get; set; }
            public string UPDATEDDATE { get; set; }
            public string UPDATEDBY { get; set; }
            public string FEEDBACK { get; set; }
            public string ASSESSMENTTYPE { get; set; }
            public string TESTANSWERS_FILENAME { get; set; }
        }
        //Courses DropDown//
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
                ORDER BY CBM.CourseID DESC";

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
        public class Course
        {
            public int CourseID { get; set; }
            public string CourseName { get; set; }
        }
    }
}