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
    public partial class PaymentGateway : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCourses();
            }

        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$('#mymodal').modal('show');", true);

        }

        private void LoadCourses()
        {
            string connString = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT CourseID, CourseName FROM Courses";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                ddlCourse.DataSource = reader;
                ddlCourse.DataTextField = "CourseName";
                ddlCourse.DataValueField = "CourseID";
                ddlCourse.DataBind();
                reader.Close();
            }
            ddlCourse.Items.Insert(0, new ListItem("Please select a course", ""));
        }

        protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (ddlCourse.SelectedValue != "")
            {
                string connString = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = "SELECT CourseCharge FROM Courses WHERE CourseID = @CourseID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@CourseID", ddlCourse.SelectedValue);
                    conn.Open();
                    object result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        txtCourseCharge.Text = result.ToString();
                    }
                }
            }
            else
            {
                txtCourseCharge.Text = "";
            }

        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string email = txtEmail.Text;
            int courseId = int.Parse(ddlCourse.SelectedValue);
            decimal courseCharge = decimal.Parse(txtCourseCharge.Text);

            string connString = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "INSERT INTO UserPayments (FullName, Email, CourseID, CourseCharge) VALUES (@FullName, @Email, @CourseID, @CourseCharge)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@FullName", name);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@CourseID", courseId);
                cmd.Parameters.AddWithValue("@CourseCharge", courseCharge);
                conn.Open();
                cmd.ExecuteNonQuery();
                Response.Redirect("UPIpay.aspx");

            }
        }
    }
    
}