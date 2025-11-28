using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.IO;
using System.Text;
using System.Web.UI.HtmlControls;
using System.Configuration;
using Ionic.Zip;
using System.Net;


namespace ENOSISLEARNING
{
    public partial class FeesCollection : System.Web.UI.Page
    {
        string CONNSTRING = System.Configuration.ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ToString();
        SqlConnection sconn = null;
        private string uname = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USERNAME"] != null)
            {
                uname = Convert.ToString(Session["USERNAME"]);
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
            sconn = new SqlConnection(CONNSTRING);
            if (!Page.IsPostBack)
            {
                BindCandidatesFees();
            }
        }
        private void BindCandidatesFees()
        {
           SqlDataAdapter adap = new SqlDataAdapter("SELECT F.RECEIPTID,c.CANDIDATE_CODE,C.FULLNAME,F.FEESAMOUNT,F.FEESDUEDATE,c.EMAIL,c.MOBILENO,CD.COURSENAME,C.BATCHNAME,C.COUNSELLORNAME FROM CANDIDATE_FEESDETAIL F INNER JOIN CANDIDATES C ON F.CANDIDATEID=C.CANDIDATE_CODE INNER JOIN COURSES_DETAIL CD ON C.COURSEID=CD.COURSEID WHERE C.STATUS='A' AND F.STATUS='PENDING' AND F.FEESDUEDATE< GETDATE() + 2 ORDER BY FEESDUEDATE ASC", sconn);

            DataTable dt = new DataTable();
            adap.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                grvCandidatesFees.DataSource = dt;
                grvCandidatesFees.DataBind();
           }
            else
            {
                grvCandidatesFees.DataSource = null;
                grvCandidatesFees.DataBind();
            }

        }

        protected void grvCandidatesFees_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandSource != null)
                {
                    GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
                    int index = row.RowIndex;
                    string CandidateId = grvCandidatesFees.DataKeys[index].Values[0].ToString();

                
                    string loginurl = "";

                   

                    if (e.CommandName == "btnFees")
                    {
                        loginurl = "RegConfirmation.aspx?Id=" + CandidateId + "";
                        Response.Redirect(loginurl);
                    }

                    if (e.CommandName == "btnEmail")
                    {

                         Session["TOEMAIL"] = row.Cells[5].Text.ToString();
                        ToEmail.Text = Session["TOEMAIL"].ToString();
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "popup()", true);
                   }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void SubEmail_Click(object sender, EventArgs e)
        {
            string strSMTP = ConfigurationManager.AppSettings["NETSMTP"];
            string strUserName = ConfigurationManager.AppSettings["NETUSERNAME"];
            string strPassword = ConfigurationManager.AppSettings["NETPASSWORD"];

            using (MailMessage mm = new MailMessage())
            {

                ToEmail.Text = Session["TOEMAIL"].ToString();
                mm.To.Add(new MailAddress(Session["TOEMAIL"].ToString()));
                mm.Subject = Subjects.Text;
                mm.Body = Body.Text;
                if (fattach.HasFile)
                {
                    string FileName = Path.GetFileName(fattach.PostedFile.FileName);
                    mm.Attachments.Add(new Attachment(fattach.PostedFile.InputStream, FileName));
                }
                mm.IsBodyHtml = false;


                NetworkCredential loginInfo = new NetworkCredential(strUserName, strPassword);
                SmtpClient client = new SmtpClient(strSMTP);
                client.UseDefaultCredentials = false;
                client.Credentials = loginInfo;
                client.Send(mm);
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email sent.');", true);
            }
        }

        protected void grvCandidatesFees_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            grvCandidatesFees.PageIndex = e.NewPageIndex;
            BindCandidatesFees();

        }
    }
}