using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ENOSISLEARNING
{
    public partial class BatchApproval : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["FACULTYID"] == null)
                {
                    Response.Redirect("Login.aspx"); // Ensure faculty is logged in
                }
                else
                {
                    LoadEnrollmentRequests();
                }
            }
        }
        private void LoadEnrollmentRequests()
        {
            int facultyId = Convert.ToInt32(Session["FACULTYID"]);
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
            {
                string query = @"SELECT FCA.ApprovalID, C.CANDIDATE_CODE AS CandidateID, C.FULLNAME AS CandidateName, CD.COURSENAME AS RequestedCourse, FCA.RequestedDate, ISNULL(EnrolledCourses.PreviousCourse, 'Not Enrolled') AS PreviouslyEnrolledCourse FROM FacultyCourseApproval FCA INNER JOIN Candidates C ON FCA.CandidateID = C.CANDIDATE_CODE INNER JOIN COURSES_DETAIL CD ON FCA.CourseID = CD.COURSEID LEFT JOIN (SELECT BCM.CANDIDATE_CODE, STRING_AGG(CD.COURSENAME, ', ') AS PreviousCourse FROM CandidateBatchMapping BCM INNER JOIN COURSES_DETAIL CD ON BCM.CourseID = CD.COURSEID GROUP BY BCM.CANDIDATE_CODE) AS EnrolledCourses ON C.CANDIDATE_CODE = EnrolledCourses.CANDIDATE_CODE WHERE FCA.FacultyID = @FacultyID AND FCA.ApprovalStatus = 0";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@FacultyID", facultyId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvEnrollmentRequests.DataSource = dt;
                gvEnrollmentRequests.DataBind();
            }
        }
        protected void gvEnrollmentRequests_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvEnrollmentRequests.PageIndex = e.NewPageIndex;
            LoadEnrollmentRequests();
        }
        protected void btnApprove_Click(object sender, EventArgs e)
        {
            int facultyId = Convert.ToInt32(Session["FACULTYID"]);
            string facultyname = Session["USERNAME"].ToString();
            Button btn = (Button)sender;
            int approvalId = Convert.ToInt32(btn.CommandArgument);

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
            {
                string updateQuery = "UPDATE FacultyCourseApproval SET ApprovalStatus = 1, ApprovedBy = @FacultyName , ApprovedDate = GETDATE() WHERE ApprovalID = @ApprovalID";
                SqlCommand cmd = new SqlCommand(updateQuery, conn);
                cmd.Parameters.AddWithValue("@FacultyName", facultyname);
                cmd.Parameters.AddWithValue("@ApprovalID", approvalId);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            LoadEnrollmentRequests(); // Refresh GridView
        }
        protected void btnReject_Click(object sender, EventArgs e)
        {
            int facultyId = Convert.ToInt32(Session["FACULTYID"]);
            string facultyname = Session["USERNAME"].ToString();
            Button btn = (Button)sender;
            int approvalId = Convert.ToInt32(btn.CommandArgument);

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
            {
                string updateQuery = "UPDATE FacultyCourseApproval SET ApprovalStatus = 2, ApprovedBy = @FacultyName  WHERE ApprovalID = @ApprovalID";
                SqlCommand cmd = new SqlCommand(updateQuery, conn);
                cmd.Parameters.AddWithValue("@FacultyName", facultyname);
                cmd.Parameters.AddWithValue("@ApprovalID", approvalId);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            LoadEnrollmentRequests(); // Refresh GridView
        }

    }
}