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
    //Maya: SearchVacancy 10-09-2025
    public partial class SearchVacancy : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString());
        string ConnectionString = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindVacancies();
            }
        }

        private void BindVacancies()
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

            string query = "SELECT * FROM VACANCYDETAILS ORDER BY JOBCODE DESC";

            try
            {
                using (SqlConnection con = new SqlConnection(ConnectionString))
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        // Create a DataTable to hold the data
                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        // Bind the DataTable to the GridView
                        gvVacancies.DataSource = dt;
                        gvVacancies.DataBind();
                    }
                    else
                    {
                        // No records found, clear the GridView
                        gvVacancies.DataSource = null;
                        gvVacancies.DataBind();
                    }

                    reader.Close();
                }
            }
            catch (Exception ex)
            {
                // Display error message
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", $"alert('Error: {ex.Message}')", true);
            }
        }

        protected void GridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void gvSearchVacancy_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void gvSearchVacancy_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void gvSearchVacancy_DataBound(object sender, EventArgs e)
        {

        }

        protected void gvSearchVacancy_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
        //(@JobCode = '' OR JOBCODE = @JobCode)
        //AND (@PositionName = '' OR POSITIONNAME = @PositionName)
        // AND (@CompanyName = '' OR COMPANYNAME = @CompanyName)
        protected void LinkSearch_Click(object sender, EventArgs e)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

            string query = @"
            SELECT * FROM VACANCYDETAILS 
            WHERE 
            
             (@Skills = '' OR PRIMARYSKILLS = @Skills)
            AND (@Location = '' OR JOBLOCATION = @Location)
            AND (@Experience = '' OR EXPERIENCE = @Experience)
            AND (@Salary = '' OR SALARY = @Salary)
            AND (@Qualification = '' OR QUALIFICATION = @Qualification)";

            try
            {
                using (SqlConnection con = new SqlConnection(ConnectionString))
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    //cmd.Parameters.AddWithValue("@JobCode", TextJOBCODE.Text.Trim());
                    //int jobCode;
                    //if (int.TryParse(TextJOBCODE.Text.Trim(), out jobCode))
                    //{ 
                    //    cmd.Parameters.AddWithValue("@JobCode", jobCode);
                    //}
                    //else
                    //{
                    //    Response.Write("Invalid JobCode. Please enter a valid integer.");
                    //}
                   // cmd.Parameters.AddWithValue("@PositionName", TxtPositionName.Text.Trim());
                    //cmd.Parameters.AddWithValue("@CompanyName", TextCompantName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Skills", TxtSkills.Text.Trim());
                    cmd.Parameters.AddWithValue("@Location", TextLocation.Text.Trim());
                    cmd.Parameters.AddWithValue("@Experience", TextExperience.Text.Trim());
                    cmd.Parameters.AddWithValue("@Salary", TextSalary.Text.Trim());
                    cmd.Parameters.AddWithValue("@Qualification", TextQualificaTion.Text.Trim());

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        // Create a DataTable to hold the data
                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        // Bind the DataTable to the GridView
                        gvVacancies.DataSource = dt;
                        gvVacancies.DataBind();
                    }
                    else
                    {
                        // No records found, clear the GridView
                        gvVacancies.DataSource = null;
                        gvVacancies.DataBind();

                        // Optionally, show a message indicating no results
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('No record found!')", true);
                    }

                    reader.Close();
                }
            }
            catch (Exception ex)
            {
                // Display error message
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", $"alert('Error: {ex.Message}')", true);
            }
        }
       

        protected void gvVacancies_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (gvVacancies.PageIndex == 0 && e.NewPageIndex < 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showWarning", "alert('You are already on the first page.');", true);
                e.Cancel = true;
            }
            else
            {
                gvVacancies.PageIndex = e.NewPageIndex;
                DataBind();
            }

            // TaskGrv.PageIndex = e.NewPageIndex;
            BindVacancies();
        }

        protected void gvVacancies_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "SelectPosition")
            {
                // Get the Job ID from the CommandArgument
                string jobCode = e.CommandArgument.ToString();

                // Redirect to the VacancyDetails.aspx page with the job code as a query string
                Response.Redirect("VacanyDetails.aspx?JobCode=" + jobCode);
            }
        }

        protected void AllVacancys_Click(object sender, EventArgs e)
        {
            BindVacancies();
        }
    }

}