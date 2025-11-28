using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Net;
using ENOSISLEARNING.Libraries;
 
namespace ENOSISLEARNING
{
    public partial class SearchCandidate : System.Web.UI.Page
    {
        dbconnect db = new dbconnect();
        DataTable dt = new DataTable();


        private void BindRCourses()
        {
            try
            {
                string QUERY = "SELECT COURSEID,COURSENAME FROM COURSES_DETAIL WHERE STATUS='A'";
                drpDCourse1.DataSource = dbconnect.GetDataSet(QUERY);
                drpDCourse1.DataTextField = "COURSENAME";
                drpDCourse1.DataValueField = "COURSEID";
                drpDCourse1.DataBind();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message.ToString();
            }
        }
        private void BindRQualification()
        {
            try
            {
                drpRQualifications.DataSource = DBGetData.GetEducation();
                drpRQualifications.DataTextField = "NAME";
                drpRQualifications.DataValueField = "ID";
                drpRQualifications.DataBind();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message.ToString();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
               
                if (!Page.IsPostBack)
                {
                    chkAll.Checked = true;
                    BindRCourses();
                    BindRQualification();

                    BindEducation();
                    BindCourses();
                    BindPassingYear();
                    BindExpYear();
                   // DashBoardCount();
                    BindYears();

                    GetCandidates(0);
                }
                if (Session["USERNAME"] == null)
                {
                    ShowData(false);
                    grvCandidatesDetail.Columns[18].Visible = false;
                }
                else
                {
                    grvCandidatesDetail.Columns[18].Visible = true;
                    if (Session["DESIGNATION"] != null)
                    {
                        if ((Session["DESIGNATION"].ToString() == USERROLES.COUNSELLOR.ToString()) || (Session["DESIGNATION"].ToString() == USERROLES.MANAGER.ToString()) || (Session["DESIGNATION"].ToString() == USERROLES.FACULTY.ToString()))
                        {
                            ShowData(true);
                        }
                        else
                        {
                            ShowData(false);
                        }
                    }
                }
            }
            catch(Exception ex)
            {
                lblError.Text = ex.Message;
               // lblError.Text = ex.Message;
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }
        }
        public void BindYears()
        {
            int endyear = DateTime.Today.Year;
            for (int y = 1992; y <= endyear; y = y + 1)
            {
                drpYear.Items.Add(y.ToString());
            }
        }
        public void ShowData(bool b)
        {
            grvCandidatesDetail.Columns[13].Visible = b;
            grvCandidatesDetail.Columns[14].Visible = b;
            grvCandidatesDetail.Columns[15].Visible = b;
            grvCandidatesDetail.Columns[16].Visible = b;
            grvCandidatesDetail.Columns[17].Visible = b;
            //coursetarget.Visible = b;
            //btnAddCandidate.Visible = b;
            btnPendingFees.Visible = b;
        }
      
        public void BindCourses()
        {
            drpCourses.DataSource = DBGetData.GetCourses();
            drpCourses.DataTextField = "COURSENAME";
            drpCourses.DataValueField = "COURSEID";
            drpCourses.DataBind();
            
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
            drpYearPassing.DataSource = DBGetData.GetYears();
            drpYearPassing.DataBind();
        }

        public void BindExpYear()
        {
            drpExperience.DataSource = DBGetData.GetExpYear();
            drpExperience.DataTextField = "YEARSEXPERIENCE";
            drpExperience.DataValueField = "YEARSEXPERIENCE";
            drpExperience.DataBind();
        }
        protected void btnSearchedResumes_Click(object sender, EventArgs e)
        {
            try
            {
                string query = SearchQuery(1);
              //  ZIPLIB.CovertToZip(query);
            }
            catch(Exception ex)
            {
                lblError.Text = ex.Message.ToString();
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }
        }
        
        protected void btnSearchedExcel_Click(object sender, EventArgs e)
        {
            try
            {
                string query = SearchQuery(1);
                var response = ((HttpApplication)sender).Response;
                EXCELLIB.ExportDataToExcel(response, query);
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message.ToString();
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }
        }
        protected void btnExcel_Click(object sender,EventArgs e)
        {
            try
            {
                var response = ((HttpApplication)sender).Response;
                EXCELLIB.ExportDataToExcel(response, "SELECT C.CANDIDATE_CODE, C.FULLNAME, C.GENDER, C.DOB, C.MOBILENO, C.EMAIL, CT.COURSENAME, C.SKILLS, C.LOCATION, C.CITY, Q.NAME AS QUALIFICATION, C.YEARSEXPERIENCE, C.COMPANYNAME, C.RESUME FROM CANDIDATES C INNER JOIN COURSES_DETAIL CT ON C.COURSEID = CT.COURSEID INNER JOIN QUALIFICATION Q ON C.QUALIFICATION = Q.ID ORDER BY C.UPDATEDDATE DESC");
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message.ToString();
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }
        }
        protected void btnprint_Click(object sender,EventArgs e)
        {
            try
            {
                //changes done on 29thmarch by aruna
                dt = dbconnect.GetDataSet("SELECT C.CANDIDATE_CODE,C.FULLNAME,C.GENDER,C.DOB,C.MOBILENO,C.EMAIL,CT.COURSENAME,C.SKILLS,C.LOCATION,C.CITY,Q.NAME AS QUALIFICATION,C.YEARSEXPERIENCE,C.COMPANYNAME,C.RESUME FROM CANDIDATES C INNER JOIN COURSES_DETAIL CT ON C.COURSEID=CT.COURSEID INNER JOIN QUALIFICATION Q ON C.QUALIFICATION = Q.ID ORDER BY C.UPDATEDDATE DESC");
                GridView gv = new GridView();
                gv.DataSource = dt; //Your datasource from database
                gv.DataBind();
                gv.AllowPaging = false;
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                gv.RenderControl(hw);
                string gridHTML = sw.ToString().Replace("\"", "'")
                    .Replace(System.Environment.NewLine, "");
                StringBuilder sb = new StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload = new function(){");
                sb.Append("var printWin = window.open('', '', 'left=0");
                sb.Append(",top=0,width=1200,height=900,status=0');");
                sb.Append("printWin.document.write(\"");
                sb.Append(gridHTML);
                sb.Append("\");");
                sb.Append("printWin.document.close();");
                sb.Append("printWin.focus();");
                sb.Append("printWin.print();");
                sb.Append("printWin.close();};");
                sb.Append("</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "GridPrint", sb.ToString());
                gv.AllowPaging = false;
                gv.DataBind();
            }
            catch(Exception ex)
            {
                lblError.Text = ex.Message.ToString();
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);


            }


        }
        private void BindCounsellorCandidates(string BATCH)
        {
            dt = dbconnect.GetDataSet("SELECT TOP 5 CANDIDATE_CODE, FULLNAME FROM CANDIDATES WHERE BATCHNAME = '" + BATCH + "'");
            if (dt.Rows.Count > 0)
            {
                grvCounsellorCandidates.DataSource = dt;
                grvCounsellorCandidates.DataBind();
                //spncandidatescount.InnerText = "Total Number of Candidates Selected = " + dt.Rows.Count.ToString();
            }
            else
            {
                grvCounsellorCandidates.DataSource = null;
                grvCounsellorCandidates.DataBind();
                //spncandidatescount.InnerText = "No Candidates Found In The Search Criteria";
            }
        }
        private void BindCandidates()
        {
            string query = SearchQuery(1);
            dt = dbconnect.GetDataSet(query);
            if (dt.Rows.Count > 0)
            {
                grvCandidatesDetail.DataSource = dt;
                grvCandidatesDetail.DataBind();
                //spncandidatescount.InnerText = "Total Number of Candidates Selected = " + dt.Rows.Count.ToString();
                //lblselected.Text = dt.Rows.Count.ToString(); 
            }
            else
            {
                grvCandidatesDetail.DataSource = null;
                grvCandidatesDetail.DataBind();
                //spncandidatescount.InnerText = "No Candidates Found In The Search Criteria";
            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //Checking the RowType of the Row  
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
               
                   //If Salary is less than 10000 than set the row Background Color to Cyan  
                   //HtmlIframe frame =(HtmlIframe) e.Row.FindControl("frmDoc");
                   //frame.Attributes.Add("src", " http://docs.google.com/gview?url=http://www.enosislearning.com//Resumes//" + "Onkar Dattatray Hulgunde.docx");
            }
        }
        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            grvCandidatesDetail.PageIndex = e.NewPageIndex;
            BindCandidates();
        }
    
        private void GetCandidates(int n)
        {
            string query = SearchQuery(n);
            dt = dbconnect.GetDataSet(query);
            if (dt.Rows.Count > 0)
            {
                grvCandidatesDetail.DataSource = dt;
                grvCandidatesDetail.DataBind();
                //spncandidatescount.InnerText = "Total Number of Candidates Selected = " + dt.Rows.Count.ToString();
                //SetDashBoard();
              
            }
            else
            {
                grvCandidatesDetail.DataSource = null;
                grvCandidatesDetail.DataBind();
                //spncandidatescount.InnerText = "No Candidates Found In The Search Criteria";
            }
   
         
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                GetCandidates(1);
                //Response.Write("<script>alert('Button is Clicked')</script>");
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message.ToString();
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }

        }
        public string SearchQuery(int n)
        {
            string mainquery = "SELECT C.CANDIDATE_CODE,C.FULLNAME,C.GENDER,CONVERT(varchar(8),C.DOB,3) as DOB,C.MOBILENO,C.EMAIL,CT.COURSENAME,C.SKILLS,C.LOCATION,C.CITY,Q.NAME AS QUALIFICATION,C.YEARSEXPERIENCE,C.COMPANYNAME,C.RESUME,C.CAN_TYPE,C.BATCHNAME,c.Certificate_Status,c.Registration_status FROM CANDIDATES C LEFT OUTER JOIN COURSES_DETAIL CT ON C.COURSEID=CT.COURSEID INNER JOIN QUALIFICATION Q ON C.QUALIFICATION = Q.ID ";
            string whereclause = "where 1=1 AND C.STATUS='A' AND C.CAN_TYPE='I' ";

            if (txtRegNo.Text != "")
            {
                int RegNo = Convert.ToInt32(txtRegNo.Text);
                mainquery += "and C.CANDIDATE_CODE = " + RegNo + "";
            }

            if (txtName.Text != "")
                whereclause += "and C.FULLNAME LIKE '%" + txtName.Text + "%'";
            if (txtSkills.Text != "")
                whereclause += "and C.SKILLS LIKE '%" + txtSkills.Text + "%'";
            if (drpCourses.SelectedItem.Value != "0")
                whereclause += "and C.COURSEID = " + drpCourses.SelectedItem.Value;
            if (drpEducation.SelectedItem.Value != "0")
                whereclause += "and C.QUALIFICATION = " + drpEducation.SelectedItem.Value;
            if (drpYearPassing.SelectedItem.Value != "0")
                whereclause += " and C.passingyear = " + drpYearPassing.SelectedItem.Value;
            if (drpExperience.SelectedItem.Value != "-1")
                whereclause += " and C.yearsexperience = " + drpExperience.SelectedItem.Value;
            if (chkPlacement.Checked == true)
                whereclause += "and C.ReqPlacement = 1";
            if (drpYear.SelectedItem.Value != "-1")
                whereclause += " and DATEPART(YEAR,C.DateofRegistration) = " + drpYear.SelectedItem.Value;
            else if (drpYear.SelectedItem.Value == "-1" && n ==0)
               whereclause += " and DATEPART(YEAR,C.DateofRegistration) = " + DateTime.Now.Year.ToString(); 
            if (drpMonth.SelectedItem.Value != "-1" )
            {
                whereclause += " and DATEPART(MONTH,C.DateofRegistration) = " + drpMonth.SelectedItem.Value;
            }
            else if (drpMonth.SelectedItem.Value == "-1" && n ==0)
            {
                whereclause += " and DATEPART(MONTH,C.DateofRegistration) = " + DateTime.Now.Month.ToString();
            }
            string query = mainquery + whereclause + " ORDER BY C.UPDATEDDATE DESC";
            return query;
        }
        protected void btnEmail_Click(object sender, EventArgs e)
        {
            try
            {
                SENDEMAIL obj = new SENDEMAIL();
                string subject = Subjects.Text;
                string body = Body.Text;
                FileUpload file = fattach;
                obj.SendMail(ToEmail.Text, Subjects.Text, Body.Text);  //db.sendmail(strSMTP, strUserName, strPassword,emailid,subject,body,file);
            }
            catch (Exception ex)
            {
                lblError.Text = "Issue sending email, Error Details=" + ex.Message.ToString();
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
    
                    GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                    int index = row.RowIndex;
                    string CandidateId = grvCandidatesDetail.DataKeys[index].Values[0].ToString();
                    string type = row.Cells[14].Text.ToString();

                    Session["REGNO"] = row.Cells[0].Text.ToString();
                    Session["STUDNAME"] = row.Cells[1].Text.ToString();
                    Session["STUDEMAIL"] = row.Cells[5].Text.ToString();
                    string loginurl = "";

                    if (type == CANTYPE.I.ToString())
                    {
                        loginurl = "EnosisRegistration.aspx?Id=" + CandidateId + "";
                    }
                    else if (type == CANTYPE.O.ToString())
                    {
                        loginurl = "EnosisNewRegistration.aspx?Id=" + CandidateId + "";
                    }
                    else if (type == CANTYPE.INTERN.ToString())
                    {
                        loginurl = "Intern.aspx?Id=" + CandidateId + "";
                    }
                    else
                    {
                        loginurl = "EnosisRegistration.aspx?Id=" + CandidateId + "";
                    }
                    if (e.CommandName == "EDIT")
                    {
                        Response.Redirect(loginurl);
                    }
                    if (e.CommandName == "FEES")
                    {
                        loginurl = "RegConfirmation.aspx?Id=" + CandidateId + "";
                        Response.Redirect(loginurl);
                    }
                    if (e.CommandName == "EMAIL")
                    {
                        ToEmail.Text = row.Cells[5].Text.ToString();
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "popup()", true);
                    }
                    if (e.CommandName == "DEACTIVATE")
                    {
                        DeActivateStudent(CandidateId);
                    }
                    if (e.CommandName == "UPGRADE")
                    {
                        loginurl = "UpgradeCourses.aspx?Id=" + CandidateId + "";
                        Response.Redirect(loginurl);
                    }
                    if (e.CommandName == "ASSESSMENTS")
                    {
                        //loginurl = "RegConfirmation.aspx?Id=" + CandidateId + "";
                        loginurl = "CandidatesResults.aspx?Id=" + CandidateId + "";
                        Response.Redirect(loginurl);
                    }
                   
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message.ToString();
 
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);

            }
        }
        public void DeActivateStudent(string CandidateId)
        {
            dbconnect.ExecuteQuery("UPDATE candidates SET STATUS='X' WHERE CANDIDATE_CODE=" + CandidateId);
            GetCandidates(1);
        }
        public string Batch = "";
   
        private string GetYearMonth()
        {
            return drpMonth.SelectedValue.ToString() + "-" + drpYear.SelectedValue.ToString() + "-" +  drpMonth.SelectedItem.Text.ToString();
        }
       
        protected void btnAddCandidate_Click(object sender,EventArgs e)
        {
            Response.Redirect("EnosisRegistration.aspx");
        }
        protected void btnPendingFees_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/FeesCollection.aspx");
        }

        protected void btnACPP_Click1(object sender, EventArgs e)
        {
            Batch = GetYearMonth() + "-" + COURSES.CCPP.ToString();
            Response.Redirect("ShowCounsellorCandidates.aspx?BATCHNAME=" + Batch);
        }
        protected void btnAdmissionAnalysis_Click(object sender,EventArgs e)
        {
            Response.Redirect("AdmissionAnalysis.aspx");
        }
        protected void btnFacultyAssessments_Click(object sender,EventArgs e)
        {
            Response.Redirect("AssessmentsTaken.aspx");
        }
        protected void btnStudentsResults_Click(object sender,EventArgs e)
        {
            Response.Redirect("CandidatesReportCard.aspx");
        }
        protected void btngenrate_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtsdate.Text == " " || txtedate.Text == " " || txtgrade.Text == " ")
                {
                    Response.Write("<script>alert('Please fill all the fields');</Script>");
                }
                else if (Convert.ToDateTime(txtsdate.Text) > Convert.ToDateTime(txtedate.Text))
                {
                    Response.Write("<script>alert('Please Enter End Date greater than Start Date');</Script>");
                }
                else
                {
                    //  GenerateCertificatetxtsdate.Text
                    PDFLIB.GeneratePdf(lblsname.Text, txtcourse.Text, txtsdate.Text, txtedate.Text, txtgrade.Text);
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message.ToString();
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }

        }


        protected void updatecertificatestatus(int candid,string course)
        {
  
            if (ViewState["filename"] != null)
            {
                string file=  ViewState["filename"].ToString()+".pdf";
                int i = db.updatestatus(candid, file,course);
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            GetCandidates(1);
          
        }
        protected void lnkDownload_Click(object sender, EventArgs e)
        {
            try
            {

                string filename = (sender as LinkButton).CommandArgument;
                string path = Server.MapPath("~/Resumes/");
                string filepath = path + "" + filename;
         

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
                    Response.End();
                }
            }
            catch(Exception ex)
            {
                lblError.Text = ex.Message.ToString();
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);

            }



        }
        protected void lblviewcertificate_Click(object sender, EventArgs e)
        {
           
        }
        protected void btnviewregform_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                int rowindex = ((GridViewRow)((sender as Control)).NamingContainer).RowIndex;
                int candid = Convert.ToInt32(grvCandidatesDetail.DataKeys[rowindex].Values[0].ToString());
                string file = db.selectRegistrationStatus(candid);
                string filepath = Server.MapPath("~/RegistrationForm/") + file;
                WebClient w = new WebClient();
                Byte[] filebuffer = w.DownloadData(filepath);
                if (filebuffer != null)
                {
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-lenght", filebuffer.Length.ToString());
                    Response.BinaryWrite(filebuffer);
                }
            }
            catch (Exception ex)
            {
//                throw ex;
                lblError.Text = ex.Message.ToString();
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);

            }
        }

        protected void btnSAVE_Click(object sender, EventArgs e)
        {
            string Name = txtUserName.Text;
            string Email = txtEmailId.Text;
            string dob = txtDob.Text;
            string Mobile = txtMobile.Text;

            int CourseId = Convert.ToInt32(drpDCourse1.SelectedItem.Value);

            float Fees = float.Parse(txtFees.Text);
            string sCounsellor = drpCounsellor1.Text;
            
            int QualId = Convert.ToInt32(drpRQualifications.SelectedItem.Value);


            string query = "INSERT INTO CANDIDATES(FULLNAME,MOBILENO,EMAIL,DOB,COURSEID,QUALIFICATION,DateofRegistration,CREATEDDATE,UPDATEDDATE,ReqPlacement,CAN_TYPE,COUNSELLORNAME,TOTALFEES,STATUS,Certificate_Status) " +
                "VALUES('" + Name + "','" + Mobile + "','" + Email + "','"+dob+"'," + CourseId + "," + QualId + ",GETDATE(),GETDATE(),GETDATE(),1,'I','" + sCounsellor + "'," + Fees + ",'A',0)";
            dbconnect.ExecuteQuery(query);


            int CandidateId = dbconnect.ExecuteScalerQuery("select ident_current('CANDIDATES')");// Convert.ToInt32(scomm2.ExecuteScalar());
            string query1 = "INSERT INTO CANDIDATE_FEESDETAIL([CANDIDATEID],[FEESTYPE],[FEESAMOUNT],[STATUS]) VALUES(" + CandidateId + ",'REGISTRATION FEES',500,'PENDING')";

            dbconnect.ExecuteQuery(query1);

            dbconnect.ExecuteQuery("DELETE FROM CANDIDATES_COURSES WHERE CANDIDATEID=" + CandidateId);
            string message = "";
            foreach (System.Web.UI.WebControls.ListItem item in drpDCourse1.Items)
            {
                if (item.Selected)
                {
                    dbconnect.ExecuteQuery("insert into CANDIDATES_COURSES values(" + CandidateId + "," + item.Value.ToString() + ",GETDATE())");
                    message += item.Text + " " + item.Value + "\\n";
                }
            }



            //string Name = txtName.Text.ToString(); 
            //txtUserName
            //  txtEmailId
            //drpDCourse1
            //txtFees
            //drpCounsellor1



            //string Email 
        }

        //protected void btnSearch_Click(object sender, EventArgs e)
        //{
        //    Response.Write("Clicked");
        //}
    }
}