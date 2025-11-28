using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace ENOSISLEARNING
{
    public partial class StudentView : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USERNAME"] != null && Session["CANDID"] != null)
            {
                lbltxt.Text = "Welcome " + Session["USERNAME"].ToString();
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
            if (!IsPostBack)
            {
               
            }
        }
        // Bind Course Dropdown// 
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<Course> GetCourses()
        {
            List<Course> courses = new List<Course>();
            string query = "SELECT COURSEID, COURSENAME FROM COURSES_DETAIL WHERE STATUS = 'A'";

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString()))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    courses.Add(new Course
                    {
                        CourseID = reader["COURSEID"].ToString(),
                        CourseName = reader["COURSENAME"].ToString()
                    });
                }
            }

            return courses;
        }

        public class Course
        {
            public string CourseID { get; set; }
            public string CourseName { get; set; }
        }

        // Bind Course Dropdown// 
        // Bind Faculty Dropdown// 
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<Faculty> GetFaculty()
        {
            List<Faculty> faculty = new List<Faculty>();
            string query = "SELECT USERID, FULLNAME FROM USERDETAILS WHERE (STATUS = 'ACTIVE' OR STATUS = '1') AND FULLNAME IS NOT NULL ORDER BY FULLNAME ASC";

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString()))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    faculty.Add(new Faculty
                    {
                        UserId = reader["USERID"].ToString(),
                        UserName = reader["FULLNAME"].ToString()
                    });
                }
            }

            return faculty;
        }

        public class Faculty
        {
            public string UserId { get; set; }
            public string UserName { get; set; }
        }
        // Bind Faculty Dropdown// 
        // Request For Batch Enrollment//
        [WebMethod]
        public static string SaveEnrollment(int facultyID, int candidateID, int courseID, string approvedBy)
        {
            string connString = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connString))
            {
                con.Open();

                //Check if the candidate is already enrolled
                string checkQuery = "SELECT COUNT(*) FROM CandidateBatchMapping WHERE CANDIDATE_CODE = @CandidateID AND COURSEID = @CourseID";
                SqlCommand checkCmd = new SqlCommand(checkQuery, con);
                checkCmd.Parameters.AddWithValue("@CandidateID", candidateID);
                checkCmd.Parameters.AddWithValue("@CourseID", courseID);

                int count = (int)checkCmd.ExecuteScalar();

                if (count > 0)
                {
                    return "AlreadyEnrolled"; // Return message if user is already enrolled
                }
                //If not enrolled, insert new enrollment
                string insertQuery = @"INSERT INTO FacultyCourseApproval (FacultyID, CandidateID, CourseID, ApprovalStatus, ApprovedBy, RequestedDate)
                               VALUES (@FacultyID, @CandidateID, @CourseID, 0, @ApprovedBy, GETDATE())";
                SqlCommand cmd = new SqlCommand(insertQuery, con);
                cmd.Parameters.AddWithValue("@FacultyID", facultyID);
                cmd.Parameters.AddWithValue("@CandidateID", candidateID);
                cmd.Parameters.AddWithValue("@CourseID", courseID);
                cmd.Parameters.AddWithValue("@ApprovedBy", approvedBy);

                int result = cmd.ExecuteNonQuery();
                return result > 0 ? "Success" : "Error";
            }
        }
        // Request For Batch Enrollment// 
    }
}