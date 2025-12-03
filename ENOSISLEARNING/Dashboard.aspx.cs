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
            if (!IsPostBack)
            {
                if (Session["CANDID"] != null)
                {
                    string candidateCode = Session["CANDID"].ToString();
                    DataTable dt = GetCandidateBatchDetails(candidateCode);

                    if (dt.Rows.Count > 0)
                    {
                        // Bind labels
                        int totalDays = Convert.ToInt32(dt.Rows[0]["TotalDays"]);
                        int completedDays = Convert.ToInt32(dt.Rows[0]["CompletedDays"]);
                        int pendingDays = totalDays - completedDays;

                        lblTotalDays.Text = totalDays.ToString();
                        lblCompletedDays.Text = completedDays.ToString();
                        lblPendingDays.Text = pendingDays.ToString();

                        // Progress %
                        int progress = Convert.ToInt32(dt.Rows[0]["ProgressPercent"]);
                        lblProgress.Text = progress + "%";

                        // Animate progress bar
                        string script = $@"
                    <script>
                        var bar = document.getElementById('divProgress');
                        bar.style.transition = 'width 1s ease-in-out';
                        bar.style.width = '{progress}%';
                        bar.setAttribute('aria-valuenow', '{progress}');
                    </script>";
                        ClientScript.RegisterStartupScript(this.GetType(), "animateProgress", script);
                    }
                }
                else
                {
                    Response.Redirect("~/Login.aspx");
                }
            }
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static object GetAttendanceData(string candidateCode)
        {
            DataTable dt = new DataTable();
            string constr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(constr))
            {
                string query = @"
            SELECT 
                BSD.Date,
                BSD.ChapterNumber,
                BSD.TopicCovered,
                BSD.StudentID,
                BSD.Status
            FROM enosis.BatchSheetDetails BSD
            INNER JOIN enosis.CandidateBatchMapping CBM
                ON BSD.BatchID = CBM.BATCHID
            WHERE CBM.CANDIDATE_CODE = @CandidateCode
            ORDER BY BSD.Date";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@CandidateCode", candidateCode);
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
            }

            //Convert DataTable to list of objects for JSON
            var list = dt.AsEnumerable().Select(r => new
            {
                Date = Convert.ToDateTime(r["Date"]).ToString("dd-MMM-yyyy"),
                Chapter = r["ChapterNumber"],
                Topic = r["TopicCovered"],
                Student = r["StudentID"],
                Status = r["Status"]
            }).ToList();

            return list;  
        }
        public DataTable GetMonthlyAttendance(string candidateCode)
        {
            string constr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(constr))
            {
                string query = @"
SELECT 
    COUNT(CASE WHEN BSD.Status = 'Present' THEN 1 END) AS PresentDays,
    COUNT(CASE WHEN BSD.Status = 'Absent' THEN 1 END) AS AbsentDays
FROM enosis.BatchSheetDetails BSD
INNER JOIN enosis.CandidateBatchMapping CBM
    ON BSD.BatchID = CBM.BATCHID
WHERE CBM.CANDIDATE_CODE = @CandidateCode
  AND CBM.Status = 'Active'";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@CandidateCode", candidateCode);

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        return dt;
                    }
                }
            }
        }
        public DataTable GetCandidateBatchDetails(string candidateCode)
        {
            string constr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(constr))
            {
                string query = @"
SELECT    
    DATEDIFF(DAY, bi.StartDate, bi.EndDate) + 1 AS TotalDays,
    ISNULL(completed.CompletedDays, 0) AS CompletedDays,
    CAST(
        ROUND(
            (ISNULL(completed.CompletedDays, 0) * 100.0) / 
            NULLIF((DATEDIFF(DAY, bi.StartDate, bi.EndDate) + 1), 0),
        0) AS INT
    ) AS ProgressPercent
FROM enosis.CandidateBatchMapping cbm
INNER JOIN enosis.BatchesInfo bi
    ON cbm.BATCHID = bi.BatchID
    AND cbm.COURSEID = bi.CourseID
LEFT JOIN (
    SELECT BatchID, COUNT(Date) AS CompletedDays
    FROM enosis.BatchSheetDetails
    GROUP BY BatchID
) AS completed
    ON bi.BatchID = completed.BatchID
WHERE cbm.CANDIDATE_CODE = @CandidateCode
  AND cbm.Status = 'Active'
  AND bi.Status != 'Completed'";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@CandidateCode", candidateCode);

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        return dt;
                    }
                }
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