using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using ENOSISLEARNING.Libraries;

namespace ENOSISLEARNING
{
    enum TESTTYPE
    {
        INTERNAL,
        EXTERNAL
    }
   
    public partial class CandidatesResults : System.Web.UI.Page
    {
        public SqlConnection sqlconn = null;
        
        public static int CandidateId = 0;
        private DataTable GetTestData(string TYPE)
        {
             SqlDataAdapter ad = new SqlDataAdapter("SELECT CT.TESTID,CT.CANDIDATEID,CT.DATEOFTEST,CT.TESTTYPE,CT.COURSEID,CC.COURSENAME,CT.SCORE,CT.OUTOF,CT.UPDATEDDATE,CT.UPDATEDBY,CT.FEEDBACK,CT.ASSESSMENTTYPE,CT.TESTANSWERS_FILENAME FROM CANDIDATE_TESTRESULTS CT INNER JOIN COURSES_DETAIL CC ON CT.COURSEID = CC.COURSEID WHERE CT.CANDIDATEID=" + CandidateId + " AND  CT.ASSESSMENTTYPE='" + TYPE + "'", sqlconn);

            DataTable dt = new DataTable();
            ad.Fill(dt);
            return dt;
        }
        private DataTable GetInterviewData(string TYPE)
        {
            SqlDataAdapter ad = new SqlDataAdapter(" SELECT CI.INTERVIEWID,CI.CANDIDATEID,CI.DATEOFINTERVIEW,CI.INTERVIEWTYPE,CI.COURSEID,CC.COURSENAME,CI.SCORE,CI.OUTOF,CI.UPDATEDDATE,CI.UPDATEDBY,CI.FEEDBACK,CI.ASSESSMENTTYPE,CI.TESTANSWERS_FILENAME FROM CANDIDATE_INTERVIEWRESULTS CI INNER JOIN COURSES_DETAIL CC ON CI.COURSEID = CC.COURSEID WHERE CI.CANDIDATEID=" + CandidateId + " AND CI.ASSESSMENTTYPE='" + TYPE + "'", sqlconn);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            return dt;
        }
        private void ShowPercentage()
        {
            SqlDataAdapter ad = new SqlDataAdapter("SELECT sum(CT.SCORE) as score,sum(CT.OUTOF) as OUTOF,Round(sum(CT.SCORE) / sum(CT.OUTOF),2) * 100 FROM CANDIDATE_TESTRESULTS CT WHERE CT.CANDIDATEID  =" + CandidateId, sqlconn);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            if (dt != null && dt.Rows.Count > 0)
            { 

            hr1.InnerText = hr1.InnerText + " PERCENTAGE SCORE :" + dt.Rows[0][2].ToString();
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //SELECT sum(CT.SCORE) as score,sum(CT.OUTOF) as OUTOF,sum(CT.SCORE) / sum(CT.OUTOF)
//FROM CANDIDATE_TESTRESULTS CT WHERE CT.CANDIDATEID = 6919

                if (Session["USERNAME"] != null)
                {
                    TESTRESULTS.USERNAME = Session["USERNAME"].ToString();
                }
                else
                {
                    Response.Redirect("~/Login.aspx");
                }
                string connectionString = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

                sqlconn = new SqlConnection(connectionString);
                if (!Page.IsPostBack)
                {
                    if (Request.QueryString["Id"] != null)
                    {
                        CandidateId = Convert.ToInt32(Request.QueryString["Id"].ToString());
                        TESTRESULTS.CANDIDATEID = CandidateId;
                        hr1.InnerText = hr1.InnerText + Session["STUDNAME"].ToString() + " )";

                        BindInternalTestsData();
                        BindInternalInterviewsData();
                        ShowPercentage();
                    }

                  //  BindExternalTestsData();
                    //BindExternalInterviewsData();
                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message.ToString();
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);

            }
        }

        private void BindInternalTestsData()
        {

            DataTable dt= new DataTable();
             dt=GetTestData(TESTTYPE.INTERNAL.ToString());

            if (dt.Rows.Count <= 0)
            {
                DataRow dr = (DataRow)dt.NewRow();
                dt.Rows.Add(0, 0, "1/1/1990", string.Empty, 0, 0, 0,0, "1/1/1990");
        
                grvInternalTests.DataSource = dt;
                grvInternalTests.DataBind();

                grvInternalTests.Rows[0].Visible = false;

              

            }
            else
            {
                grvInternalTests.DataSource = dt;
                grvInternalTests.DataBind();

              
            }

        }

        private void BindInternalInterviewsData()
        {

            DataTable dt = new DataTable();
            dt = GetInterviewData(TESTTYPE.INTERNAL.ToString());

            if (dt.Rows.Count <= 0)
            {
                DataRow dr = (DataRow)dt.NewRow();
                dt.Rows.Add(0, 0, "1/1/1990", string.Empty, 0, 0, 0,0, "1/1/1990");
          
          
                grvInternalInterviews.DataSource = dt;
                grvInternalInterviews.DataBind();

                grvInternalInterviews.Rows[0].Visible = false;

            }
            else
            {


                grvInternalInterviews.DataSource = dt;
                grvInternalInterviews.DataBind();

            }

        }



        protected void grvInternalTests_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {

                // We are checking against the "ADD"
                TESTRESULTS objTests = new TESTRESULTS();
                    
                if (e.CommandName == "SAVE")
                {
                    objTests.testdate = ((TextBox)grvInternalTests.FooterRow.FindControl("txtDateofTest")).Text;
                    objTests.Score = Convert.ToDouble(((TextBox)grvInternalTests.FooterRow.FindControl("txtScore")).Text);
                    objTests.OutOf = Convert.ToDouble(((TextBox)grvInternalTests.FooterRow.FindControl("txtOUTOF")).Text);
                    objTests.feedback = ((TextBox)grvInternalTests.FooterRow.FindControl("txtFeedback")).Text;

                    objTests.TestType = ((DropDownList)grvInternalTests.FooterRow.FindControl("drpTestType")).SelectedItem.Text;
                    objTests.CourseId = Convert.ToInt32(((DropDownList)grvInternalTests.FooterRow.FindControl("drpCourses")).SelectedValue);

                    objTests.CourseName = ((DropDownList)grvInternalTests.FooterRow.FindControl("drpCourses")).SelectedItem.Text.ToString();

                    FileUpload fTestPaper = (FileUpload)grvInternalTests.FooterRow.FindControl("fTestPaper");
                    if (fTestPaper.FileName != null && fTestPaper.FileName != "")
                    {
                        fTestPaper.SaveAs(Server.MapPath(@"~\TestResults\") + fTestPaper.FileName);
                    }
                    objTests.TestFileName = fTestPaper.FileName;


                    objTests.InsertTestResults(TESTTYPE.INTERNAL.ToString());
                    
                    BindInternalTestsData();
                  

                }
                if (e.CommandName == "DEL")
                {
                    int TestId = Convert.ToInt32(grvInternalTests.DataKeys[0].Value.ToString());
                    objTests.DeleteTestResults(TestId);
                    BindInternalTestsData();


                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message.ToString();
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }

        }

        protected void grvInternalTests_DataBound(object sender, EventArgs e)
        {
            try
            {
                TextBox txtDateofTest = grvInternalTests.FooterRow.FindControl("txtDateofTest") as TextBox;

                
                txtDateofTest.Text = System.DateTime.Today.ToShortDateString();
                DropDownList drpCourses = grvInternalTests.FooterRow.FindControl("drpCourses") as DropDownList;
                //    drpCourses.DataSource = CommonFunctions.GetCandidatesCourses(TESTRESULTS.CANDIDATEID);
                drpCourses.DataSource = DBGetData.GetCourses();
                drpCourses.DataTextField = "COURSENAME";
                drpCourses.DataValueField = "COURSEID";
                drpCourses.DataBind();
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message.ToString();
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }
        }

        protected void grvInternalInterviews_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                TESTRESULTS objTests = new TESTRESULTS();

                if (e.CommandName == "save")
                {
                  
                    objTests.testdate = ((TextBox)grvInternalInterviews.FooterRow.FindControl("txtDateofInterview")).Text;
                    objTests.Score = Convert.ToDouble(((TextBox)grvInternalInterviews.FooterRow.FindControl("txtScore")).Text);
                    objTests.OutOf = Convert.ToDouble(((TextBox)grvInternalInterviews.FooterRow.FindControl("txtOUTOF")).Text);
                    objTests.feedback = ((TextBox)grvInternalInterviews.FooterRow.FindControl("txtFeedback")).Text;

                    objTests.TestType = ((DropDownList)grvInternalInterviews.FooterRow.FindControl("drpTestType")).SelectedItem.Text;
                    objTests.CourseId = Convert.ToInt32(((DropDownList)grvInternalInterviews.FooterRow.FindControl("drpCourses")).SelectedValue);

                    FileUpload fTestPaper = (FileUpload)grvInternalTests.FooterRow.FindControl("fTestPaper");
                    if (fTestPaper.FileName != null && fTestPaper.FileName != "")
                    {
                        fTestPaper.SaveAs(Server.MapPath(@"~\TestResults\") + fTestPaper.FileName);
                    }
                    objTests.TestFileName = fTestPaper.FileName;

                    objTests.InsertInterviewResults(TESTTYPE.INTERNAL.ToString());

                    BindInternalInterviewsData();
               
                }
                if (e.CommandName == "del")
                {
                    //int InterviewId = Convert.ToInt32(grvInternalInterviews.DataKeys[0].Value.ToString());
                    //objTests.DeleteInterviewResults(InterviewId);
                    //BindInternalInterviewsData();
                    int index = Convert.ToInt32(e.CommandArgument);
                    int InterviewId = Convert.ToInt32(grvInternalInterviews.DataKeys[index].Value);
                    objTests.DeleteInterviewResults(InterviewId);
                    BindInternalInterviewsData();


                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message.ToString();
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }
        }

        protected void grvInternalInterviews_DataBound(object sender, EventArgs e)
        {
            try
            {
                TextBox txtDateofTest = grvInternalInterviews.FooterRow.FindControl("txtDateofInterview") as TextBox;

                txtDateofTest.Text = System.DateTime.Today.ToShortDateString();

                DropDownList drpCourses = grvInternalInterviews.FooterRow.FindControl("drpCourses") as DropDownList;
                // drpCourses.DataSource = CommonFunctions.GetCandidatesCourses(TESTRESULTS.CANDIDATEID);
                drpCourses.DataSource = DBGetData.GetCourses();
                drpCourses.DataTextField = "COURSENAME";
                drpCourses.DataValueField = "COURSEID";
                drpCourses.DataBind();
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message.ToString();
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }
        }

        protected void lnkIDownload_Click(object sender, EventArgs e)
        {
            string filename = (sender as LinkButton).CommandArgument;
            string path = Server.MapPath("~/TestResults/");
            string filepath = path + "" + filename;
            if (File.Exists(filepath))
            {

                Response.Clear();
                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("Content-Disposition", "filename=" + Path.GetFileName(filepath));
                Response.TransmitFile(Server.MapPath("~/TestResults/") + Path.GetFileName(filepath));
                Response.End();
            }
        }

        protected void lnkEDownload_Click(object sender, EventArgs e)
        {
            string filename = (sender as LinkButton).CommandArgument;
            string path = Server.MapPath("~/TestResults/");
            string filepath = path + "" + filename;
            if (File.Exists(filepath))
            {

                Response.Clear();
                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("Content-Disposition", "filename=" + Path.GetFileName(filepath));
                Response.TransmitFile(Server.MapPath("~/TestResults/") + Path.GetFileName(filepath));
                Response.End();
            }
        }



    }
}