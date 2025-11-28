using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Collections;
using System.Collections.Generic;
using System.Web.Services;
using ENOSISLEARNING.Libraries;
using System.Web;

namespace ENOSISLEARNING
{

    public partial class Profiles : System.Web.UI.Page
    {
        string CONNSTRING = System.Configuration.ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ToString();
        SqlConnection sconn = null;
        dbconnect objDB = new dbconnect();

        public void BindJobStatus()
        {

            drpstatus.DataSource = dbconnect.GetDataSet("select statusid, status from enosis.jobstatus");
            drpstatus.DataTextField = "status";
            drpstatus.DataValueField = "statusid";
            drpstatus.DataBind();
        }
        public void BindExpYear()
        {
            drpExperience.DataSource = DBGetData.GetExpYear();
            drpExperience.DataTextField = "yearsexperience";
            drpExperience.DataValueField = "yearsexperience";
            drpExperience.DataBind();
        }
        public void BindEducation()
        {
            drpEducation.DataSource = DBGetData.GetEducation();
            drpEducation.DataTextField = "Name";
            drpEducation.DataValueField = "ID";
            drpEducation.DataBind();
        }
        public void BindPassingYear()
        {
            drpYearPassing.DataSource = DBGetData.GetPassingYear();
            drpYearPassing.DataTextField = "passingyear";
            drpYearPassing.DataValueField = "passingyear";
            drpYearPassing.DataBind();
        }
        private void BindProfiles()
        {
            string query = SearchQuery();
            SqlDataAdapter adap = new SqlDataAdapter(query, sconn);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                grvCandidatesDetail.DataSource = dt;
                grvCandidatesDetail.DataBind();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                sconn = new SqlConnection(CONNSTRING);
                if (!Page.IsPostBack)
                {
                    BindEducation();
                    BindPassingYear();
                    BindExpYear();
                    BindJobStatus();
                    BindProfiles();

                }
            }
            catch (Exception ex)
            {
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex);

            }

        }
        public string SearchQuery()
        {
            try
            {

                string mainquery = "select c.CANDIDATE_CODE, c.FULLNAME, p.statusid, j.status,C.GENDER,CONVERT(varchar(8),C.DOB,3) as DOB,C.MOBILENO,C.EMAIL,C.SKILLS,C.CITY,Q.NAME AS QUALIFICATION,C.YEARSEXPERIENCE,C.COMPANYNAME,C.RESUME,C.CAN_TYPE,c.UPDATEDDATE,c.POSITION_APPLIED,c.PASSINGYEAR,c.CAN_TYPE,c.NOTICEPERIOD,c.TOTALFEES as PACKAGE from candidates c  left JOIN QUALIFICATION Q ON C.QUALIFICATION = Q.ID left join profile_jobstatus p on c.CANDIDATE_CODE = p.CANDIDATEID left join jobstatus j on j.statusid = p.statusid where C.REQPLACEMENT=1 AND C.STATUS='A' and p.statusid = (select max(statusid) from profile_jobstatus where candidateid = c.CANDIDATE_CODE ) ";

                if (Request.QueryString["REGNO"] != null)
                {
                    int RegNo = Convert.ToInt32(Request.QueryString["REGNO"].ToString());
                    mainquery += "and C.CANDIDATE_CODE = " + RegNo + "";
                }
                if (txtName.Text != "")
                {
                    mainquery += "and C.FULLNAME LIKE '%" + txtName.Text + "%'";
                }
                if (txtSkills.Text != "")
                {
                    mainquery += "and C.SKILLS LIKE '%" + txtSkills.Text + "%'";
                }
                if (drpPositions.SelectedItem.Value != "0")
                {
                    mainquery += "and C.POSITION_APPLIED LIKE '%" + drpPositions.SelectedItem.Text + "%'"; //drpPositions.SelectedItem.Text ;
                }
                if (drpEducation.SelectedItem.Value != "0")
                {
                    mainquery += "and C.QUALIFICATION = " + drpEducation.SelectedItem.Value;
                }
                if (drpYearPassing.SelectedItem.Value != "0")
                {
                    mainquery += " and C.passingyear = " + drpYearPassing.SelectedItem.Value;
                }
                if (drpPositions.SelectedItem.Value != "0")
                {
                    mainquery += " and C.POSITION_APPLIED = '" + drpPositions.SelectedItem.Text + "'";
                }
                if (drpExperience.SelectedItem.Value != "0")
                {
                    mainquery += " and C.yearsexperience >= " + drpExperience.SelectedItem.Value;
                }
                if (drpstatus.SelectedItem.Value != "0")
                {
                    mainquery += " and j.statusid = " + drpstatus.SelectedItem.Value;
                }
                if (drpType.SelectedItem.Value != "0")
                {
                    mainquery += " and c.can_type = '" + drpType.SelectedItem.Text + "'";
                }
                mainquery += " ORDER BY C.UPDATEDDATE DESC";
                return mainquery;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void grvCandidatesDetail_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            grvCandidatesDetail.PageIndex = e.NewPageIndex;
            BindProfiles();
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                BindProfiles();
            }
            catch (Exception ex)
            {
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {

        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            CandidateEntity obj = new CandidateEntity();
            try
            {
                TextBox txtName = (TextBox)grvCandidatesDetail.FooterRow.FindControl("txtName");
                obj.Name = txtName.Text;
                DropDownList drpGender = (DropDownList)grvCandidatesDetail.FooterRow.FindControl("drpGender");
                obj.Gender = drpGender.SelectedValue.ToLower();
                TextBox txtMob = (TextBox)grvCandidatesDetail.FooterRow.FindControl("txtMob");
                obj.smobile = txtMob.Text;

                TextBox txtEmail = (TextBox)grvCandidatesDetail.FooterRow.FindControl("txtEmail");
                obj.semail = txtEmail.Text;
                TextBox txtExp = (TextBox)grvCandidatesDetail.FooterRow.FindControl("txtExp");
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
                TextBox txtPackage = (TextBox)grvCandidatesDetail.FooterRow.FindControl("txtPackage");
                obj.dExpSalary = Convert.ToDouble(txtPackage.Text);

                TextBox txtNotice = (TextBox)grvCandidatesDetail.FooterRow.FindControl("txtNotice");
                obj.iNoticePeriod = Convert.ToInt32(txtNotice.Text);

                TextBox txtSkill = (TextBox)grvCandidatesDetail.FooterRow.FindControl("txtSkill");
                obj.Skills = txtSkill.Text;
                DropDownList drpPosition = (DropDownList)grvCandidatesDetail.FooterRow.FindControl("drpPosition");
                obj.strPosition = drpPosition.SelectedItem.Text.ToString();
                DropDownList drpQualifications = (DropDownList)grvCandidatesDetail.FooterRow.FindControl("drpQualifications");
                obj.Qualification = Convert.ToInt32(drpQualifications.SelectedValue.ToString());

                DropDownList drpPassingYears = (DropDownList)grvCandidatesDetail.FooterRow.FindControl("drpPassingYears");
                obj.PassingYears = Convert.ToInt32(drpPassingYears.SelectedValue);


                FileUpload fResume = (FileUpload)grvCandidatesDetail.FooterRow.FindControl("fResume");

                string filename = "";
                string fullpath = string.Empty;
                if (fResume.FileName != null && fResume.FileName != "")
                {
                    string Resume = fResume.FileName;
                    System.IO.FileInfo f = new System.IO.FileInfo(fResume.FileName);
                    filename = txtName.Text + drpPassingYears.SelectedValue.ToString() + "_O" + f.Extension.ToString();
                    fullpath = Server.MapPath(@"~\Resumes\") + filename;
                    fResume.SaveAs(Server.MapPath(@"~\Resumes\") + filename);
                }
                obj.filename = fResume.FileName;
                int code = objDB.CheckEmail(obj.semail);
                if (code > 0)
                {
                    //  MODE = OPERATION.EDIT.ToString();
                    //Session["REGNO"] = code;
                }
                else
                {

                    string script = "window.onload = function(){ alert('";
                    script += "Profile/Resume details added successfully";
                    script += "')};";
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                }
                //BindProfiles();
            }
            catch (Exception ex)
            {
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }

        }
        protected void grvCandidatesDetail_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandSource != null)
                {
                    if (e.CommandName == "btnEdit")
                    {
                        GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                        int index = row.RowIndex;
                        string CandidateId = grvCandidatesDetail.DataKeys[index].Values[0].ToString();
                        Response.Redirect("EnosisJobs.aspx?Id=" + CandidateId);
                    }
                    if (e.CommandName == "btnViewGoals")
                    {
                        GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                        int index = row.RowIndex;
                        string CandidateId = grvCandidatesDetail.DataKeys[index].Values[0].ToString();
                        Response.Redirect("ProfileGoals.aspx?CODE=" + CandidateId);
                    }
                    if (e.CommandName == "btnStatus")
                    {
                        GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                        int index = row.RowIndex;
                        string CandidateId = grvCandidatesDetail.DataKeys[index].Values[0].ToString();
                        Session["CANDNAME"] = grvCandidatesDetail.DataKeys[index].Values[1].ToString();


                        Response.Redirect("ProfileStatus.aspx?Id=" + CandidateId);
                    }
                    if (e.CommandName == "btnAssessments")
                    {
                        GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                        int index = row.RowIndex;
                        string CandidateId = grvCandidatesDetail.DataKeys[index].Values[0].ToString();
                        Session["STUDNAME"] = grvCandidatesDetail.DataKeys[index].Values[1].ToString();



                        Response.Redirect("CandidatesResults.aspx?Id=" + CandidateId);
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message.ToString());
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
           
        }
        protected void OnView(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            Session["FileName"] = filePath;
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
        }
        protected void lnkDownload_Click(object sender, EventArgs e)
        {
            try
            {
                string filename = (sender as LinkButton).CommandArgument;
                string path = Server.MapPath("~/Resumes/");
                string filepath = path + "" + filename;
                FileInfo fi = new FileInfo(filepath);
                string extn = "application/" + fi.Extension;
                extn = extn.Replace(".", "");

                if (File.Exists(filepath))
                {

                    Response.Clear();
                    Response.ContentType = "application/octet-stream";
                    Response.AppendHeader("Content-Disposition", "filename=" + Path.GetFileName(filepath));
                    Response.TransmitFile(Server.MapPath("~/Resumes/") + Path.GetFileName(filepath));
                    Response.End();
                }
                else
                {
                    string path1 = Server.MapPath("~/Resumes/Others/");
                    string filepath1 = path1 + "" + filename;
                    Response.Clear();
                    Response.ContentType = "application/octet-stream";
                    Response.AppendHeader("Content-Disposition", "filename=" + Path.GetFileName(filepath1));
                    Response.TransmitFile(Server.MapPath("~/Resumes/Others/") + Path.GetFileName(filepath1));
                    Response.AppendHeader("Content-Disposition", "filename=" + Path.GetFileName(filepath));
                    Response.TransmitFile(Server.MapPath("~/Resumes/") + Path.GetFileName(filepath));
                    Response.End();
                }
            }
            catch (Exception ex)
            {
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }
        }

        protected void grvCandidatesDetail_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells.RemoveAt(0);

                e.Row.Cells[0].ColumnSpan = 2;
                e.Row.Cells.RemoveAt(11);
                e.Row.Cells[11].ColumnSpan = 2;
                e.Row.Cells.RemoveAt(13);
                e.Row.Cells[12].ColumnSpan = 2;




            }
        }

        protected void grvCandidatesDetail_DataBound(object sender, EventArgs e)
        {
            DropDownList drpQualifications = grvCandidatesDetail.FooterRow.FindControl("drpQualifications") as DropDownList;



            drpQualifications.DataSource = dbconnect.GetDataSet("SELECT ID,NAME FROM dbo.[QUALIFICATION]");
            drpQualifications.DataTextField = "NAME";
            drpQualifications.DataValueField = "ID";
            drpQualifications.DataBind();


        }

        protected void btnAddCandidate_Click(object sender, EventArgs e)
        {
            Response.Redirect("EnosisJobs.aspx");
        }

        protected void btnAdd_Click1(object sender, ImageClickEventArgs e)
        {
            CandidateEntity obj = new CandidateEntity();
            try
            {
                TextBox txtName = (TextBox)grvCandidatesDetail.FooterRow.FindControl("txtName");
                obj.Name = txtName.Text;
                DropDownList drpGender = (DropDownList)grvCandidatesDetail.FooterRow.FindControl("drpGender");
                obj.Gender = drpGender.SelectedValue.ToLower();
                TextBox txtMob = (TextBox)grvCandidatesDetail.FooterRow.FindControl("txtMob");
                obj.smobile = txtMob.Text;

                TextBox txtEmail = (TextBox)grvCandidatesDetail.FooterRow.FindControl("txtEmail");
                obj.semail = txtEmail.Text;
                TextBox txtExp = (TextBox)grvCandidatesDetail.FooterRow.FindControl("txtExp");
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
                TextBox txtPackage = (TextBox)grvCandidatesDetail.FooterRow.FindControl("txtPackage");
                obj.dExpSalary = Convert.ToDouble(txtPackage.Text);

                TextBox txtNotice = (TextBox)grvCandidatesDetail.FooterRow.FindControl("txtNotice");
                obj.iNoticePeriod = Convert.ToInt32(txtNotice.Text);

                TextBox txtSkill = (TextBox)grvCandidatesDetail.FooterRow.FindControl("txtSkill");
                obj.Skills = txtSkill.Text;
                DropDownList drpPosition = (DropDownList)grvCandidatesDetail.FooterRow.FindControl("drpPosition");
                obj.strPosition = drpPosition.SelectedItem.Text.ToString();
                DropDownList drpQualifications = (DropDownList)grvCandidatesDetail.FooterRow.FindControl("drpQualifications");
                obj.Qualification = Convert.ToInt32(drpQualifications.SelectedValue.ToString());

                DropDownList drpPassingYears = (DropDownList)grvCandidatesDetail.FooterRow.FindControl("drpPassingYears");
                obj.PassingYears = Convert.ToInt32(drpPassingYears.SelectedValue);


                FileUpload fResume = (FileUpload)grvCandidatesDetail.FooterRow.FindControl("fResume");

                string filename = "";
                string fullpath = string.Empty;
                if (fResume.FileName != null && fResume.FileName != "")
                {
                    string Resume = fResume.FileName;
                    System.IO.FileInfo f = new System.IO.FileInfo(fResume.FileName);
                    filename = txtName.Text + drpPassingYears.SelectedValue.ToString() + "_O" + f.Extension.ToString();
                    fullpath = Server.MapPath(@"~\Resumes\") + filename;
                    fResume.SaveAs(Server.MapPath(@"~\Resumes\") + filename);
                }
                obj.filename = fResume.FileName;
                int code = objDB.CheckEmail(obj.semail);
                if (code > 0)
                {
                  
                }
                else
                {

                   

                    string script = "window.onload = function(){ alert('";
                    script += "Profile/Resume details added successfully";
                    script += "')};";
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                }
                BindProfiles();
            }
            catch (Exception ex)
            {
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }
        }
    }
}