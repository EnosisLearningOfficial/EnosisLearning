using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ENOSISLEARNING
{
    public partial class StudentMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CANDID"] != null)
                {
                    string candId = Session["CANDID"].ToString();
                    LoadStudentDetails(candId);
                }
                else
                {
                    Response.Redirect("~/Login.aspx");
                }
            }
        }
        private void LoadStudentDetails(string candId)
        {
            string constr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = @"
            SELECT 
                C.CANDIDATE_CODE,
                C.FULLNAME,
                CS.COURSENAME
            FROM CANDIDATES C
            LEFT JOIN COURSES_DETAIL CS ON C.COURSEID = CS.COURSEID
            WHERE C.CANDIDATE_CODE = @CandidateId";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@CandidateId", candId);

                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        lblID.Text = dr["CANDIDATE_CODE"].ToString();     // ID
                        lblName.Text = dr["FULLNAME"].ToString();      // Full Name
                        lblCourse.Text = dr["COURSENAME"].ToString();  // Course
                    }
                }
            }
        }
    }
}