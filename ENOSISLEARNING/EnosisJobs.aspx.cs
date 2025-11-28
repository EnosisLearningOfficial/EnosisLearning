using System;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;


namespace ENOSISLEARNING
{
    public partial class EnosisJobs : System.Web.UI.Page
    {
        //https://www.aspsnippets.com/Articles/Server-Side-Code-Behind-Yes-No-Confirmation-Message-Box-in-ASPNet.aspx
        //https://www.geeksforgeeks.org/input-groups-in-bootstrap-with-examples/
        //https://bootstrapshuffle.com/classes/form-input-groups/input-group-prepend



        private static string MODE = string.Empty;
        private int regNo = 0;
        dbconnect objDB = new dbconnect();
      
        private string message = string.Empty;
        public void BindPassingYear()
        {
            drpPassingYears.DataSource = DBGetData.GetYears();
            //drpYearPassing.DataTextField = "passingyear";
            //drpYearPassing.DataValueField = "passingyear";
            drpPassingYears.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            { 
            if (!IsPostBack)
            {
                    BindPassingYear();
                BindQualification();
                if (Session["USEREMAIL"] != null)
                {
                    this.txtEmail.Text = Session["USEREMAIL"].ToString();
                    
                }
                this.txtCity.Text = "PUNE";
                this.rbMale.Checked = true;
                this.txtExp.Text = "0";
                this.txtExpSal.Text = "0";
                this.txtNoticePeriod.Text = "0";
                    this.txtSkills.Text = "C,C++";

                    

             
               
                if (Request.QueryString["Id"] != null)
                {
                    lblError.Text = "Please fill the details below and submit your resume successfully";
                    MODE = OPERATION.EDIT.ToString();
                        Session["REGNO"] = regNo = Convert.ToInt32(Request.QueryString["Id"].ToString());
                   // Session["REGNO"] = regNo.ToString();
                    ShowDetails(regNo);
              
                }
                else
                {
                    lblError.Text = "Please fill the details below and submit your resume successfully";
                    MODE = OPERATION.ADD.ToString();
                }
            }
            txtName.Focus();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex);


            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int CandidateId = 0;
            try
            {

                int code = 0;
                code = objDB.CheckEmail(txtEmail.Text);
                if (code > 0)
                {
                    MODE = OPERATION.EDIT.ToString();
                    Session["REGNO"] = code;
                }
                else
                {
                    MODE = OPERATION.ADD.ToString();
                }


                if (Page.IsValid)
                {
                    string filename = "";

                    //  if ( txtName.Enabled == true)
                    if (MODE == OPERATION.ADD.ToString())
                    {
                        filename=  SaveResume();
                        UpdateDB(filename);
                        string loginurl = "EnosisJobs.aspx?Id=" + CandidateId + "";

                        try
                        {
                            //COMMENTED ON 18TH AUGUST
                           // SENDEMAIL objMail = new SENDEMAIL();
                            //objMail.SendJobApplicationEmail(txtName.Text, txtEmail.Text, CandidateId, drpPosition.Text);
                          
                            //  objMail.SendResume(txtEmail.Text, "Resume", "Resume-Attached", fResume.FileName);
                        }
                        catch(Exception ex)
                        {

                            string pageName = System.IO.Path.GetFileName(Request.Path);
                            dbconnect.LogError(pageName, ex.Message);
                        }
                    }
                    else
                    {
                        // string filename = ViewState["RESUME"].ToString();// hykResume.Text;
                        if (Session["REGNO"] != null)
                        { 
                        CandidateId = Convert.ToInt32(Session["REGNO"].ToString());
                        }
                        if (ViewState["RESUME"] != null)
                        {
                            filename = ViewState["RESUME"].ToString();// hykResume.Text;
                        }
                       // CandidateId = Convert.ToInt32(Session["REGNO"].ToString());
                        if (fResume.FileName != null && fResume.FileName != "")
                        {
                            filename = SaveResume();
                        }
                        else
                        {
                            filename = ViewState["RESUME"].ToString();
                            hykResume.Text = filename;
                            hykResume.NavigateUrl = "~/Resumes/" + filename;
                        }
                        UpdateDB(filename);
                    }
                }
                string message = "You have submitted you detais successfully.Please find your personal details in the next page to complete the process";
                string msg = "<script language=javascript>alert('" + message + "')</script>";
                Response.Write(msg);

                //  string msg = "<script language=javascript>alert('" + message + "')</script>";
                //Response.Write(msg);

                Response.Redirect("ProfileGoals.aspx?CODE=" + Session["REGNO"],false);

            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message.ToString();
                string pageName = System.IO.Path.GetFileName(Request.Path);
                
                dbconnect.LogError(pageName, ex);
            }
            finally
            {
            }
        }
        private void ShowDetails(int RegNo)
        {
            string QUERY = "SELECT * FROM CANDIDATES WHERE CANDIDATE_CODE=" + RegNo;
            DataTable dt = dbconnect.GetDataSet(QUERY);
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["POSITION_APPLIED"] != null && dt.Rows[0]["POSITION_APPLIED"].ToString().Length > 0)
                {
                   // drpPosition.SelectedItem.Text = dt.Rows[0]["POSITION_APPLIED"].ToString();
                  //  drpPosition.SelectedItem.Value = dt.Rows[0]["POSITION_APPLIED"].ToString().Trim();

                    drpPosition.SelectedItem.Text = dt.Rows[0]["POSITION_APPLIED"].ToString().Trim();
                }

                if (dt.Rows[0]["FULLNAME"].ToString() != null && dt.Rows[0]["FULLNAME"].ToString() != "")
                {
                    txtName.Text = dt.Rows[0]["FULLNAME"].ToString();
                }
                else
                {
                    txtName.Text = dt.Rows[0]["EMAIL"].ToString();
                }
                if (dt.Rows[0]["GENDER"].ToString().ToUpper() == "MALE")
                {
                    rbMale.Checked = true;
                }
                else
                {
                    rbFeMale.Checked = true;
                }
                //1956

                if (dt.Rows[0]["DOB"].ToString() != null && dt.Rows[0]["DOB"].ToString() != "")
                {
                    DateTime dtDOB = Convert.ToDateTime(dt.Rows[0]["DOB"].ToString());

                    txtDOB.Text = dtDOB.ToString("yyyy-MM-dd");

                    //string sdate = dtDOB.ToString("dd/MM/yyyy");
                    //sdate = sdate.Replace("-", "/");
                    //txtDOB.Text = sdate;

                  //  txtDOB.Attributes.Add("Text", sdate);
                    //txtDOB.Attributes.Add("val", sdate);

                }
                //txtDOB.Text = dt.Rows[0]["DOB"].ToString();
                if (dt.Rows[0]["MOBILENO"].ToString() != null && dt.Rows[0]["MOBILENO"].ToString() != "")
                    txtMobileNo.Text = dt.Rows[0]["MOBILENO"].ToString();

                if (dt.Rows[0]["EMAIL"].ToString() != null && dt.Rows[0]["EMAIL"].ToString() != "")
                    txtEmail.Text = dt.Rows[0]["EMAIL"].ToString();

                if (dt.Rows[0]["YEARSEXPERIENCE"].ToString() != null && dt.Rows[0]["YEARSEXPERIENCE"].ToString() != "")
                {
                    txtExp.Text = dt.Rows[0]["YEARSEXPERIENCE"].ToString() + "." + dt.Rows[0]["MONTHSEXPERIENCE"].ToString();
                }

                if (dt.Rows[0]["TOTALFEES"] != null && dt.Rows[0]["TOTALFEES"].ToString() != "")
                    txtExpSal.Text = dt.Rows[0]["TOTALFEES"].ToString();

                if (dt.Rows[0]["NOTICEPERIOD"] != null && dt.Rows[0]["NOTICEPERIOD"].ToString() != "")
                    txtNoticePeriod.Text = dt.Rows[0]["NOTICEPERIOD"].ToString();

                if (dt.Rows[0]["SKILLS"] != null && dt.Rows[0]["SKILLS"].ToString() != "")
                    txtSkills.Text = dt.Rows[0]["SKILLS"].ToString();

                if (dt.Rows[0]["CITY"] != null && dt.Rows[0]["CITY"].ToString() != "")
                    txtCity.Text = dt.Rows[0]["CITY"].ToString();

                if (dt.Rows[0]["PASSINGYEAR"] != null && dt.Rows[0]["PASSINGYEAR"].ToString() != "")
                    drpPassingYears.SelectedValue = dt.Rows[0]["PASSINGYEAR"].ToString();

                if (dt.Rows[0]["QUALIFICATION"] != null && dt.Rows[0]["QUALIFICATION"].ToString() != "")
                    drpQualifications.SelectedValue = dt.Rows[0]["QUALIFICATION"].ToString();

                if (dt.Rows[0]["COMMENTS"] != null && dt.Rows[0]["COMMENTS"].ToString() != "")
                    txtComments.Text = dt.Rows[0]["COMMENTS"].ToString();

                if (dt.Rows[0]["RESUME"] != null && dt.Rows[0]["RESUME"].ToString() != "")
                {
                    if (Session["RESUMENAME"] != null)
                    {
                        hykResume.Text = "<i class=\"	fa fa-download\"></i>  " + Session["RESUMENAME"].ToString();
                        ViewState["RESUME"] = Session["RESUMENAME"].ToString();
                        hykResume.NavigateUrl = "~/Resumes/" + Session["RESUMENAME"].ToString();
                        Session["RESUMENAME"] = null;
                    }
                    else
                    {

                        hykResume.Text = "<i class=\"	fa fa-download\"></i>  " + dt.Rows[0]["RESUME"].ToString();
                        ViewState["RESUME"] = dt.Rows[0]["RESUME"].ToString();
                        hykResume.NavigateUrl = "~/Resumes/" + dt.Rows[0]["RESUME"].ToString();
                    }
                }
                else
                {
                    if (Session["RESUMENAME"] != null)
                    {
                        hykResume.Text = "<i class=\"	fa fa-download\"></i>  " + Session["RESUMENAME"].ToString();
                        ViewState["RESUME"] = Session["RESUMENAME"].ToString();
                        hykResume.NavigateUrl = "~/Resumes/" + Session["RESUMENAME"].ToString();
                        Session["RESUMENAME"] = null;
                    }
                }
            }

        }
        private void BindQualification()
        {
            DataTable dt = dbconnect.GetDataSet("SELECT ID, NAME FROM dbo.[QUALIFICATION]");

            drpQualifications.DataSource = dt;
            drpQualifications.DataTextField = "NAME";
            drpQualifications.DataValueField = "ID";
            drpQualifications.DataBind();

        }
        private void UpdateDB(string filename1)
        {
            CandidateEntity obj = new CandidateEntity();

            obj.CandidateId = 0;
           // string Name, Gender, dob, semail, smobile, Skills, City;
            obj.Name = txtName.Text.ToString();
            //  ViewState["FULLNAME"]=txtTFullName.Text = Name;

            obj.Gender = "";
            if (rbMale.Checked == true)
            {
             obj.Gender = rbMale.Text;
            }
            else
            {
                obj.Gender = rbFeMale.Text;
            }
            obj.semail = txtEmail.Text.ToString();

            obj.smobile = txtMobileNo.Text.ToString();
            obj.Skills = txtSkills.Text;
            obj.City = txtCity.Text;
            if (drpQualifications.SelectedValue != null)
            {
                obj.Qualification = Convert.ToInt32(drpQualifications.SelectedItem.Value.ToString());
            }

            if (drpPassingYears.SelectedValue != null)
            {
                obj.PassingYears = Convert.ToInt32(drpPassingYears.SelectedValue);
            }

            double ExpYears = Convert.ToDouble(txtExp.Text);
            string[] years = ExpYears.ToString().Split('.');
            if (years.Length > 0)
            {
              obj.iExpYears = Convert.ToInt32(years[0]);
            }
            if (years.Length > 1)
            {
                obj.iExpMonths = Convert.ToInt32(years[1]);
            }
        
            if (txtExpSal.Text.Length > 0)
            {
                obj.dExpSalary = Convert.ToDouble(txtExpSal.Text);
            }
           
            obj.strPosition = drpPosition.SelectedItem.Text.ToString();

            if (txtNoticePeriod.Text.Length > 0)
            { 
            obj.iNoticePeriod = Convert.ToInt32(txtNoticePeriod.Text);
            }

            string[] dates = null;
            if (txtDOB.Text.Length > 0)
            {

                if (txtDOB.Text.Contains("/"))
            {
                dates = txtDOB.Text.Split('/');
            }
            else if (txtDOB.Text.Contains("-"))
            {
                dates = txtDOB.Text.Split('-');
            }

           
                obj.dob = dates[1].ToString() + "/" + dates[0].ToString() + "/" + dates[2].ToString();
            }
            obj.Comments = txtComments.Text;
            obj.filename = filename1;

            obj.SaveJobProfile();
          
            
        }
        private string SaveResume()
        {
            string filename = "";
            string fullpath = string.Empty;
            if (fResume.FileName != null && fResume.FileName != "")
            {

             
                filename = fResume.FileName;
                //System.IO.FileInfo f = new System.IO.FileInfo(fResume.FileName);
                //filename = txtName.Text + drpPassingYears.SelectedValue.ToString() + "_O" + f.Extension.ToString();
                // fullpath = Server.MapPath(@"~\Resumes\") + filename;
                fResume.SaveAs(Server.MapPath(@"~\Resumes\") + filename);


                hykResume.Text = filename;
                hykResume.NavigateUrl = "~/Resumes/" + filename;
            }
            else if (ViewState["RESUMENAME"] != null && (string)ViewState["RESUMENAME"] != "")
            {
                filename = ViewState["RESUMENAME"].ToString();
                //string Resume = Session["RESUMENAME"].ToString();
                //System.IO.FileInfo f = new System.IO.FileInfo(Session["RESUMENAME"].ToString());
                //filename = txtName.Text + drpPassingYears.SelectedValue.ToString() + "_O" + f.Extension.ToString();
                //fullpath = Server.MapPath(@"~\Resumes\") + filename;
               // fResume.SaveAs(Server.MapPath(@"~\Resumes\") + filename);
                //hykResume.Text = filename;
                //hykResume.NavigateUrl = "~/Resumes/" + filename;
            }
            return filename;
        }




    }
}
