using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ENOSISLEARNING
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string ConnectionString = "Data Source=DESKTOP-MPE7G61;Initial Catalog=EmployeeDB;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEmployees();
            }
        }

        protected void Savebtn_Click(object sender, EventArgs e)
        {
            try
            {
                string name = nametxt.Text;
                int age = int.Parse(agetxt.Text);
                string designation = destxt.Text;
                string email = emailtxt.Text;
                string contact = contacttxt.Text;
                using (SqlConnection Conn = new SqlConnection(ConnectionString))
                {
                    string query = "INSERT INTO Employee (Name, Age, Designation, Email, Contact) VALUES (@Name, @Age, @Designation, @Email, @Contact)";
                    using (SqlCommand cmd = new SqlCommand(query, Conn))
                    {
                        cmd.Parameters.AddWithValue("@Name", name);
                        cmd.Parameters.AddWithValue("@Age", age);
                        cmd.Parameters.AddWithValue("@Designation", designation);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Contact", contact);
                        Conn.Open();
                        int rows = cmd.ExecuteNonQuery();
                        if (rows > 0)
                        {
                            Response.Write("Record Inserted Successfully");
                        }
                        else
                        {
                            Response.Write("Record Insertion Failed");
                        }
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void Viewbtn_Click(object sender, EventArgs e)
        {
            LoadEmployees();
        }
        private void LoadEmployees()
        {
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                string query = "SELECT Id, Name, Age, Designation, Email, Contact FROM Employee";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                }
            }
        }

    }
}