using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace ENOSISLEARNING
{
    public partial class AddCompany1 : System.Web.UI.Page
    {
        string CONNSTRING = System.Configuration.ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ToString();
        SqlConnection sconn = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //rightForm.Visible = false;btnRegister_Click

                if (Request.QueryString["COMPID"] != null)
                {
                    string COMPANYID = Request.QueryString["COMPID"].ToString();
                    ViewState["COMPANYID"] = COMPANYID;
                    string query = "SELECT * FROM COMPANY_CLIENTS WHERE COMPANY_ID=" + COMPANYID;
                    sconn = new SqlConnection(CONNSTRING);
                    SqlDataAdapter adap = new SqlDataAdapter(query, sconn);
                    DataTable dt = new DataTable();
                    adap.Fill(dt);

                    //txt_companyname.Value = "amit";
                    txt_companyname.Value = dt.Rows[0]["COMPANY_NAME"].ToString();
                    txt_companywebsite.Value = dt.Rows[0]["WEBSITE"].ToString();
                    txtCompanyContactNo.Value = dt.Rows[0]["CONTACT_NO"].ToString();
                    txtCompanyAddress.Value = dt.Rows[0]["COMPANY_ADDRESS"].ToString();
                    txtcompanyemailid.Value = dt.Rows[0]["EMAIL"].ToString();
                    txtcomments.Value = dt.Rows[0]["COMMENTS"].ToString();

                    drp_CompanyType.Value = dt.Rows[0]["COMPANY_TYPE"].ToString();
                    drp_Technology.Value = dt.Rows[0]["TECHNOLOGY"].ToString();

                    txtPContactName.Value = dt.Rows[0]["P_CONTACTNAME"].ToString();
                    txtPContactEmail.Value = dt.Rows[0]["P_EMAIL"].ToString();
                    txtPContactNo.Value = dt.Rows[0]["P_MOBILENUMBER"].ToString();
                    txtPDesignation.Value = dt.Rows[0]["P_DESIGNATION"].ToString();

                    txtSContactName.Value = dt.Rows[0]["S_CONTACTNAME"].ToString();
                    txtSContactEmail.Value = dt.Rows[0]["P_EMAIL"].ToString();
                    txtSContactNo.Value = dt.Rows[0]["S_MOBILENUMBER"].ToString();
                    txtSDesignation.Value = dt.Rows[0]["S_DESIGNATION"].ToString();

                }
            }

        }

        

        protected void Registerbtn_Click(object sender, EventArgs e)
        {
            SaveCompanyData();
            Response.Redirect("PostVacancy.aspx");
            
        }

        private void SaveCompanyData()
        {
            SqlConnection sconn = new SqlConnection(CONNSTRING);
            string str = "";

            // Check if the ViewState contains COMPANYID (i.e., update or insert logic)
            if (ViewState["COMPANYID"] == null)
            {
                // Insert new record
                str = "INSERT INTO [COMPANY_CLIENTS]([COMPANY_NAME],[WEBSITE],[COMPANY_TYPE],[TECHNOLOGY],[COMPANY_ADDRESS],[CONTACT_NO],[EMAIL],[COMMENTS],[P_CONTACTNAME],[P_DESIGNATION],[P_EMAIL],[P_MOBILENUMBER],[S_CONTACTNAME],[S_DESIGNATION],[S_EMAIL],[S_MOBILENUMBER]) VALUES ";
                str += "(@COMPANY_NAME, @WEBSITE, @COMPANY_TYPE, @TECHNOLOGY, @COMPANY_ADDRESS, @CONTACT_NO, @EMAIL, @COMMENTS, @P_CONTACTNAME, @P_DESIGNATION, @P_EMAIL, @P_MOBILENUMBER, @S_CONTACTNAME, @S_DESIGNATION, @S_EMAIL, @S_MOBILENUMBER)";
            }
            else
            {
                // Update existing record
                string COMPANYID = ViewState["COMPANYID"].ToString();
                str = "UPDATE [COMPANY_CLIENTS] SET [COMPANY_NAME] = @COMPANY_NAME, [WEBSITE] = @WEBSITE, [COMPANY_TYPE] = @COMPANY_TYPE, [TECHNOLOGY] = @TECHNOLOGY, [COMPANY_ADDRESS] = @COMPANY_ADDRESS, [CONTACT_NO] = @CONTACT_NO, [EMAIL] = @EMAIL, [COMMENTS] = @COMMENTS, [P_CONTACTNAME] = @P_CONTACTNAME, [P_DESIGNATION] = @P_DESIGNATION, [P_EMAIL] = @P_EMAIL, [P_MOBILENUMBER] = @P_MOBILENUMBER, [S_CONTACTNAME] = @S_CONTACTNAME, [S_DESIGNATION] = @S_DESIGNATION, [S_EMAIL] = @S_EMAIL, [S_MOBILENUMBER] = @S_MOBILENUMBER WHERE [COMPANY_ID] = @COMPANY_ID";
            }

            SqlCommand cmd = new SqlCommand(str, sconn);

            // Add parameters to avoid SQL injection
            cmd.Parameters.AddWithValue("@COMPANY_NAME", txt_companyname.Value);
            cmd.Parameters.AddWithValue("@WEBSITE", txt_companywebsite.Value);
            cmd.Parameters.AddWithValue("@COMPANY_TYPE", drp_CompanyType.Value);
            cmd.Parameters.AddWithValue("@TECHNOLOGY", drp_Technology.Value);
            cmd.Parameters.AddWithValue("@COMPANY_ADDRESS", txtCompanyAddress.Value);
            cmd.Parameters.AddWithValue("@CONTACT_NO", txtCompanyContactNo.Value);
            cmd.Parameters.AddWithValue("@EMAIL", txtcompanyemailid.Value);
            cmd.Parameters.AddWithValue("@COMMENTS", txtcomments.Value);

            cmd.Parameters.AddWithValue("@P_CONTACTNAME", txtPContactName.Value);
            cmd.Parameters.AddWithValue("@P_DESIGNATION", txtPDesignation.Value);
            cmd.Parameters.AddWithValue("@P_EMAIL", txtPContactEmail.Value);
            cmd.Parameters.AddWithValue("@P_MOBILENUMBER", txtPContactNo.Value);

            cmd.Parameters.AddWithValue("@S_CONTACTNAME", txtSContactName.Value);
            cmd.Parameters.AddWithValue("@S_DESIGNATION", txtSDesignation.Value);
            cmd.Parameters.AddWithValue("@S_EMAIL", txtSContactEmail.Value);
            cmd.Parameters.AddWithValue("@S_MOBILENUMBER", txtSContactNo.Value);

            // Add company ID parameter if updating an existing record
            if (ViewState["COMPANYID"] != null)
            {
                cmd.Parameters.AddWithValue("@COMPANY_ID", ViewState["COMPANYID"].ToString());
            }

            try
            {
                sconn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                // Handle errors (e.g., log it)
                Response.Write("Error: " + ex.Message);
            }
            finally
            {
                sconn.Close();
            }

            // Redirect to the ViewCompany page after successful submission
          
            rightForm.Visible = true;
            leftForm.Visible = false;
       
        }

        //protected void btnNext_Click(object sender, EventArgs e)
        //{
        //    rightForm.Visible = true;
        //    leftForm.Visible = false;
        //}

        protected void btnBack_Click(object sender, EventArgs e)
        {
            leftForm.Visible = true;
            rightForm.Visible = false;
        }
    }
}