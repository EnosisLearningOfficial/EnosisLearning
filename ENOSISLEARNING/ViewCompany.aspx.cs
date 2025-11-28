using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Configuration;


namespace ENOSISLEARNING
{
    public partial class ViewCompany : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString());
        string CONNSTRING = System.Configuration.ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ToString();
        SqlConnection sconn = null;

        protected void Page_Load(object sender, EventArgs e)
        {

            sconn = new SqlConnection(CONNSTRING);
            if (!Page.IsPostBack)
            {
                BindCompany();
            }
        }

        private void BindCompany()
        {
            string query = "SELECT * FROM COMPANY_CLIENTS ORDER BY COMPANY_ID DESC";
            SqlDataAdapter adap = new SqlDataAdapter(query, sconn);

            DataTable dt = new DataTable();
            adap.Fill(dt);

            if (dt.Rows.Count > 0)
            {

                grvCompany.DataSource = dt;
                grvCompany.DataBind();
            }
        }

        protected void btnAddCompany_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("AddCompany.aspx");
        }

        protected void grvCompany_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
        }

        protected void grvCompany_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (grvCompany.PageIndex == 0 && e.NewPageIndex < 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showWarning", "alert('You are already on the first page.');", true);
                e.Cancel = true;
            }
            else
            {
                grvCompany.PageIndex = e.NewPageIndex;
                BindCompany();
            }
        }

        protected void grvCompany_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(grvCompany.DataKeys[e.RowIndex].Values["COMPANY_ID"].ToString());
                con.Open();
                SqlCommand cmd = new SqlCommand("delete COMPANY_CLIENTS where COMPANY_ID=" + id, con);
                cmd.ExecuteNonQuery();
                con.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('record Deleted');", true);
                BindCompany();
            }
            catch (Exception ex)
            {
                // lblError.Text = ex.Message;
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('No record found!')", true);
            }
        }


        protected void grvCompany_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow grv = grvCompany.Rows[e.RowIndex];
                int id = Convert.ToInt32(grvCompany.DataKeys[e.RowIndex].Values["COMPANY_ID"].ToString());

                // Retrieve controls
                TextBox txtCompanyName = (TextBox)grv.FindControl("txtECOMPANY_NAME");
                TextBox txtWebsite = (TextBox)grv.FindControl("txtEWEBSITE");
                TextBox txtAddress = (TextBox)grv.FindControl("textECOMPANY_ADDRESS");
                TextBox txtContactNo = (TextBox)grv.FindControl("txtECONTACT_NO");
                TextBox txtEmail = (TextBox)grv.FindControl("txtEEmail");

               
               // using (SqlConnection con = new SqlConnection("CONN_ENOSISLEARNING"))
                //{
                    con.Open();
                    string updateQuery = "UPDATE COMPANY_CLIENTS SET COMPANY_NAME = @CompanyName, WEBSITE = @Website, " +
                                         "COMPANY_ADDRESS = @Address, CONTACT_NO = @ContactNo, EMAIL = @Email WHERE COMPANY_ID = @CompanyId";

                    using (SqlCommand cmd = new SqlCommand(updateQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@CompanyName", txtCompanyName.Text);
                        cmd.Parameters.AddWithValue("@Website", txtWebsite.Text);
                        cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                        cmd.Parameters.AddWithValue("@ContactNo", txtContactNo.Text);
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@CompanyId", id);

                        cmd.ExecuteNonQuery();
                    }
                    con.Close();
              //}
                grvCompany.EditIndex = -1; // Reset edit index
                BindCompany(); // Refresh the GridView
            }
            catch (Exception ex)
            {
                // Log the exception or display an error message
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Record Not Updated! " + ex.Message + "')", true);
            }
        }

        protected void grvCompany_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grvCompany.EditIndex = e.NewEditIndex;
            BindCompany();
        }

        protected void grvCompany_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grvCompany.EditIndex = -1;
            BindCompany();
        }

       
    }
}