using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace ENOSISLEARNING
{
    public partial class CMS : System.Web.UI.Page 
    {
        SqlConnection con;



        private void BindEnquiries()
        {
            string strcomm = "SELECT TOP 20 ENQUIRYID,[NAME], [CONTACTEMAIL], [CONTACTMOBILENO], [COURSENAME], [CREATED_DATE], [ENQTIME] FROM [ENQUIRIES] WHERE STATUS NOT IN('INACTIVE') order by created_date desc";
            DataTable dtEnquiries = new DataTable();
            SqlDataAdapter adap = new SqlDataAdapter(strcomm, con);
            adap.Fill(dtEnquiries);
            grvEnquiries.DataSource = dtEnquiries;
            grvEnquiries.DataBind();


        }
        private void BindContactUs()
        {
            string strcomm = "SELECT TOP 10 CREATED_DATE,CONTACTDETAILSID,CONTACTNAME,CONTACT_SUBJECT,REMARKS,CONTACTEMAIL,CONTACTPHONENO FROM CONTACTDETAILS ORDER BY CREATED_DATE DESC";
            DataTable dtContacts = new DataTable();
            SqlDataAdapter adap = new SqlDataAdapter(strcomm, con);
            adap.Fill(dtContacts);
            grvContactUs.DataSource = dtContacts;
            grvContactUs.DataBind();

        }
        private void BindRegistration()
        {
            string strcomm = "select top 10 CREATED_DATE,registrationid,name,mobileno,emailaddress,coursename,batchid,batchname,registrationfees,address from candidate_registration order by created_date desc";
            DataTable dtReg = new DataTable();
            SqlDataAdapter adap = new SqlDataAdapter(strcomm, con);
            adap.Fill(dtReg);
            grvRegistration.DataSource = dtReg;
            grvRegistration.DataBind();

        }
        private void BindReferals()
        {
            string strcomm = "SELECT TOP 20 * FROM TBL_REFERALDATA order by ReferalDate desc";
            DataTable dtRef = new DataTable();
            SqlDataAdapter adap = new SqlDataAdapter(strcomm, con);
            adap.Fill(dtRef);
            grvReferals.DataSource = dtRef;
            grvReferals.DataBind();

        }
        private void BindVisitors()
        {
            string strcomm = "SELECT DAY(VISITEDDATE) AS MONTHDAY,COUNT(VISITORID) AS TOTALVISITORS FROM (SELECT VISITORID,IPADDRESS,VISITEDDATE FROM WEB_VISITORS_DETAILS WHERE VISITEDDATE > (GETDATE()- 7)) V GROUP BY DAY(V.VISITEDDATE)";
            DataTable dtRef = new DataTable();
            SqlDataAdapter adap = new SqlDataAdapter(strcomm, con);
            adap.Fill(dtRef);
            grvVisitors.DataSource = dtRef;
            grvVisitors.DataBind();

        }
        private void BindPageVisitors()
        {
            string strcomm = "SELECT PAGE_NAME,COUNT(VISITORID) AS TOTALVISITORS FROM WEB_VISITORS_DETAILS GROUP BY PAGE_NAME ORDER BY TOTALVISITORS DESC";
            DataTable dtRef = new DataTable();
            SqlDataAdapter adap = new SqlDataAdapter(strcomm, con);
            adap.Fill(dtRef);
            grvPageVisitors.DataSource = dtRef;
            grvPageVisitors.DataBind();

        }

        private void BindQuestions()
        {
            string strcomm = "SELECT Course,COUNT(*) FROM interview_question_Master GROUP BY Course";
            DataTable dtRef = new DataTable();
            SqlDataAdapter adap = new SqlDataAdapter(strcomm, con);
            adap.Fill(dtRef);
            grvQuestions.DataSource = dtRef;
            grvQuestions.DataBind();

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string CONNSTRING = System.Configuration.ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ToString();

                con = new SqlConnection(CONNSTRING);


                if (!Page.IsPostBack)
                {
                    BindEnquiries();
                    BindContactUs();
                    BindRegistration();
                    BindReferals();
                    BindVisitors();
                    BindPageVisitors();
                    BindQuestions();
                    BindErrors();



                }
            }
            catch(Exception ex)
            {
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }

        }
        private void BindErrors()
        {

            string strcomm = "SELECT TOP 20 * FROM EXCEPTIONLOGS ORDER BY EXCEPTIONID DESC";
            DataTable dtRef = new DataTable();
            SqlDataAdapter adap = new SqlDataAdapter(strcomm, con);
            adap.Fill(dtRef);
            grvErrors.DataSource = dtRef;
            grvErrors.DataBind();

        }

        protected void grvEnquiries_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int iEnqId = Convert.ToInt32(grvEnquiries.Rows[e.RowIndex].Cells[1].Text);
            EnquiriesEntity obj = new EnquiriesEntity();

            obj.EnquiryId = iEnqId;
            obj.DeleteEnquiry();
            /*string query = "UPDATE ENQUIRIES SET STATUS = 'INACTIVE' WHERE ENQUIRYID = " + EnquiryId;

            //string query = "DELETE FROM ENQUIRIES WHERE ENQUIRYID=" + EnquiryId;
            dbconnect.ExecuteQuery(query);

            string strcomm = "DELETE FROM [ENQUIRIES] WHERE ENQUIRYID=" + iEnqId;
            SqlCommand scomm = new SqlCommand(strcomm, con);

            con.Open();
            scomm.ExecuteNonQuery();
            con.Close();*/
            BindEnquiries();
        }

        protected void grvContactUs_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            int iConId = Convert.ToInt32(grvContactUs.Rows[e.RowIndex].Cells[2].Text);
            string strcomm = "DELETE FROM CONTACTDETAILS WHERE CONTACTDETAILSID=" + iConId;
            SqlCommand scomm = new SqlCommand(strcomm, con);

            con.Open();
            scomm.ExecuteNonQuery();
            con.Close();
            BindContactUs();
        }

        protected void grvRegistration_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void grvContactUs_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != grvContactUs.EditIndex)
            {
                (e.Row.Cells[0].Controls[0] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }

        protected void grvEnquiries_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void grvEnquiries_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != grvContactUs.EditIndex)
            {
                (e.Row.Cells[0].Controls[0] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }
    }
}
