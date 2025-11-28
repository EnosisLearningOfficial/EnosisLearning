using DocumentFormat.OpenXml.Wordprocessing;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using ListItem = System.Web.UI.WebControls.ListItem;

namespace ENOSISLEARNING
{
    //Maya: PostVacancy 19-08-2025
    public partial class PostVacancy : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString());
        string ConnectionString = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CompanyNameDrp();
                CompanyInformation.Visible = false;
            }
           
            TextAddress.Enabled = false;
            TextPhoneNo.Enabled = false;
            TextWebsite.Enabled = false;
            TxtCompanyCode.Enabled = false;
            TextContactPerson.Enabled = false;
            TextEmail.Enabled = false;
        }
       

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            if (CompanyName.SelectedIndex == 0 || CompanyName.SelectedValue == "0" || string.IsNullOrWhiteSpace(CompanyName.SelectedValue))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please select company name');", true);
                return; 
            }
            try
            {
                    using (SqlConnection Conn = new SqlConnection(ConnectionString))
                    {
                        string query = @"
                         INSERT INTO VACANCYDETAILS(POSITIONNAME,JOBLOCATION,JOBDESCRIPTION,PRIMARYSKILLS,SECONDARYSKILLS,EXPERIENCE,QUALIFICATION,SALARY,LASTDATETOAPPLY,CONTACTPERSONNAME,CONTACTEMAILID,CONTACTMOBILENO,COMPANYNAME,COMPANYCODE,COMPANYADDRESS,COMPANYCONTACTPERSON,COMPANYPHONENO,COMPANYEMAIL,COMPANYWEBSITE,COMPANYID) VALUES (@POSITIONNAME,@JOBLOCATION,@JOBDESCRIPTION,@PRIMARYSKILLS,@SECONDARYSKILLS,@EXPERIENCE,@QUALIFICATION,@SALARY,@LASTDATETOAPPLY,@CONTACTPERSONNAME,@CONTACTEMAILID,@CONTACTMOBILENO,@COMPANYNAME,@COMPANYCODE,@COMPANYADDRESS,@COMPANYCONTACTPERSON,@COMPANYPHONENO,@COMPANYEMAIL,@COMPANYWEBSITE,@COMPANYID)";
                        using (SqlCommand cmd = new SqlCommand(query, Conn))
                        {
                            cmd.Parameters.AddWithValue("@POSITIONNAME", TxtPositionName.Text);
                            cmd.Parameters.AddWithValue("@JOBLOCATION", TxtJobLocation.Text);
                            cmd.Parameters.AddWithValue("@JOBDESCRIPTION", TxtJobDescription.Text);
                            cmd.Parameters.AddWithValue("@PRIMARYSKILLS", TxtPrimarySkills.Text);
                            cmd.Parameters.AddWithValue("@SECONDARYSKILLS", TxtSecondarySkills.Text);
                            cmd.Parameters.AddWithValue("@EXPERIENCE", TxtExperience.Text);
                            cmd.Parameters.AddWithValue("@QUALIFICATION", TxtQualification.Text);

                            double salary;
                            if (!double.TryParse(TxtSalary.Text, out salary))
                            {
                                salary = 0;
                            }
                            cmd.Parameters.AddWithValue("@SALARY", salary);

                     

                        DateTime lastDateToApply;
                        if (DateTime.TryParse(txtDate.Text, out lastDateToApply))
                        {
                            if (lastDateToApply.Date < DateTime.Today)
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please select today or a future date only.');", true);
                                return;
                            }

                            cmd.Parameters.AddWithValue("@LASTDATETOAPPLY", lastDateToApply);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Invalid End Date format');", true);
                            return;
                        }


                        cmd.Parameters.AddWithValue("@CONTACTPERSONNAME", TxtContactName.Text);
                            cmd.Parameters.AddWithValue("@CONTACTEMAILID", TextContactEmailId.Text);
                            cmd.Parameters.AddWithValue("@CONTACTMOBILENO", TextContactMobileNo.Text);


                            if (CompanyName.SelectedIndex != 0)
                            {
                                cmd.Parameters.AddWithValue("@COMPANYNAME", CompanyName.SelectedItem.Text);
                            }
                            else
                            {
                                cmd.Parameters.AddWithValue("@COMPANYNAME", DBNull.Value);
                            }

                            cmd.Parameters.AddWithValue("@COMPANYCODE", TxtCompanyCode.Text);
                            cmd.Parameters.AddWithValue("@COMPANYADDRESS", TextAddress.Text);
                            cmd.Parameters.AddWithValue("@COMPANYCONTACTPERSON", TextContactPerson.Text);
                            cmd.Parameters.AddWithValue("@COMPANYPHONENO", TextPhoneNo.Text);
                            cmd.Parameters.AddWithValue("@COMPANYEMAIL", TextEmail.Text);
                            cmd.Parameters.AddWithValue("@COMPANYWEBSITE", TextWebsite.Text);
                            if (CompanyName.SelectedIndex != 0)
                            {
                                cmd.Parameters.AddWithValue("@COMPANYID", CompanyName.SelectedValue);
                            }
                            else
                            {
                                cmd.Parameters.AddWithValue("@COMPANYID", DBNull.Value);
                            }
                            Conn.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }
                    ClearFields();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Inserted Successfully........ !');", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Record Not Inserted........ !');", true);
                   
                    Response.Write($"Error: {ex.Message}");
                }
                finally
                {
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    }
                }
            }
        private DataTable GetDataFromDatabase()
        { 
            try
            {
                
                string connectionString = ConnectionString;
                string query = "SELECT DISTINCT COMPANY_NAME from COMPANY_CLIENTS";
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        con.Open();
                        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);
                        return dataTable;
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                throw;
            }
        }


        //void CompanyNameDrp()
        //{
        //    try
        //    {
        //        string query = "SELECT COMPANY_ID, COMPANY_NAME\r\nFROM [dbo].[COMPANY_CLIENTS]\r\nWHERE [COMPANY_NAME] IS NOT NULL ORDER BY [COMPANY_NAME] ASC";
        //        SqlDataAdapter sda = new SqlDataAdapter(query, con);
        //        DataTable data = new DataTable();
        //        sda.Fill(data);
        //        CompanyName.DataSource = data;
        //        CompanyName.DataTextField = "COMPANY_NAME";
        //        CompanyName.DataValueField = "COMPANY_ID";
        //        CompanyName.DataBind();
        //        System.Web.UI.WebControls.ListItem selectitem = new System.Web.UI.WebControls.ListItem(" ", "0");
        //        selectitem.Selected = true;
        //        CompanyName.Items.Insert(0, selectitem);
        //    }
        //    catch (Exception ex)
        //    {
        //        //Handle exception (log it, show a message, etc.)
        //        Console.WriteLine("An error occurred: " + ex.Message);
        //    }
        //}

        void CompanyNameDrp()
        {
            try
            {
                string query = @"SELECT COMPANY_ID, COMPANY_NAME
                         FROM [dbo].[COMPANY_CLIENTS]
                         WHERE [COMPANY_NAME] IS NOT NULL 
                         ORDER BY [COMPANY_NAME] ASC";

                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable data = new DataTable();
                sda.Fill(data);

                CompanyName.DataSource = data;
                CompanyName.DataTextField = "COMPANY_NAME";
                CompanyName.DataValueField = "COMPANY_ID";
                CompanyName.DataBind();

                ListItem selectitem = new ListItem("-- Select Company --", "0");
                selectitem.Selected = true;
                CompanyName.Items.Insert(0, selectitem);
            }
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred: " + ex.Message);
            }
        }

        private void ClearFields()
        {
            TxtPositionName.Text = "";
            TxtJobLocation.Text = "";
            TxtJobDescription.Text = "";
            TxtPrimarySkills.Text = "";
            TxtSecondarySkills.Text = "";
            TxtExperience.Text = "";
            TxtQualification.Text = "";
            TxtSalary.Text = "";
            txtDate.Text = "";
            TxtContactName.Text = "";
            TextContactEmailId.Text = "";
            TextContactMobileNo.Text = "";
            CompanyName.SelectedIndex = 0;
            TxtCompanyCode.Text = "";
            TextAddress.Text = "";
            TextContactPerson.Text = "";
            TextPhoneNo.Text = "";
            TextEmail.Text = "";
            TextWebsite.Text = "";
        }


        protected void CompanyName_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (CompanyName.SelectedIndex == 0 || string.IsNullOrEmpty(CompanyName.SelectedValue) || CompanyName.SelectedValue == "0")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please select a company. Record not inserted!');", true);
                return;
            }
            int id;
            if (int.TryParse(CompanyName.SelectedValue, out id))
            {
                string query = "SELECT COMPANY_ID, EMAIL, CONTACT_NO, S_CONTACTNAME, COMPANY_ADDRESS, WEBSITE FROM COMPANY_CLIENTS WHERE COMPANY_ID = @COMPANY_ID";

                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@COMPANY_ID", id);

                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.Read())
                        {
                            TxtCompanyCode.Text = reader["COMPANY_ID"].ToString();
                            TextAddress.Text = reader["COMPANY_ADDRESS"].ToString();
                            TextContactPerson.Text = reader["S_CONTACTNAME"].ToString();
                            TextPhoneNo.Text = reader["CONTACT_NO"].ToString();
                            TextEmail.Text = reader["EMAIL"].ToString();
                            TextWebsite.Text = reader["WEBSITE"].ToString();
                        }
                        reader.Close();
                        CompanyInformation.Visible = true;
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("An error occurred: " + ex.Message);
                    }
                }
            }
        }

        protected void btnAddCompany_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("AddCompany.aspx");
        }

        protected void btnViewCompany_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("ViewCompany.aspx"); 
        }

        protected void HideBtn_Click(object sender, EventArgs e)
        {
            CompanyInformation.Visible = false;
        }

        protected void cvCompanyName_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !(string.IsNullOrEmpty(CompanyName.SelectedValue) || CompanyName.SelectedValue == "0");
          
        }
    } 
}