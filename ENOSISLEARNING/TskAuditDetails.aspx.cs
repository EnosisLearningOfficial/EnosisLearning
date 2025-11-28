using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DocumentFormat.OpenXml.Bibliography;
using System.EnterpriseServices.Internal;

namespace ENOSISLEARNING
{
    public partial class TskAuditDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString());
        string ConnectionString = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
        string jobId = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //string jobCode = Request.QueryString["JobCode"];
                //txtJobID.Text = jobCode;
                string id = Request.QueryString["Id"];

                if (!string.IsNullOrEmpty(id))
                {
                    // Call the method to fetch and bind the job details
                    GetJobDetails(id);
                }
                else
                {
                    // Handle the case when JobCode is not provided in the query string
                    Response.Write("Invalid Id.");
                }

            }

        }
        public void GetJobDetails(string id)
        {
            string query = "SELECT * FROM AuditTaskManager WHERE EmployeeID = @Id"; //AuditTaskManager

            try
            {
                using (SqlConnection con = new SqlConnection(ConnectionString))
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Adding the parameter for JobCode
                    cmd.Parameters.AddWithValue("@Id", id);

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        // Create a DataTable to hold the data
                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        // Bind the DataTable to the Repeater control
                        AuditGrv.DataSource = dt;
                        AuditGrv.DataBind();
                    }
                    else
                    {
                        // If no job details found, handle appropriately
                        Response.Write("No Emp Id found for the given EMPCODE.");
                    }

                    reader.Close();
                }
            }
            catch (Exception ex)
            {
                // Log or display any error message
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", $"alert('Error: {ex.Message}')", true);
            }
        }

        protected void AuditGrv_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (AuditGrv.PageIndex == 0 && e.NewPageIndex < 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showWarning", "alert('You are already on the first page.');", true);
                e.Cancel = true;
            }
            else
            {
                AuditGrv.PageIndex = e.NewPageIndex;
                DataBind();
            }

           
            //GetJobDetails();
            if (!string.IsNullOrEmpty(jobId))
            {
                GetJobDetails(jobId); // Pass the jobId that was stored earlier
            }
        }
    }
}