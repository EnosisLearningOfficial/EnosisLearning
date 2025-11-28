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
    public partial class SubmitResume : System.Web.UI.Page
    {

        DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                trInfo.Visible = false;
            }
        }
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            string url = "";
            try
            {
                string QUERY = "SELECT CANDIDATE_CODE,FULLNAME,EMAIL,CAN_TYPE FROM CANDIDATES WHERE EMAIL='" + txtEmail.Text.Trim() + "'";
                dt = dbconnect.GetDataSet(QUERY);
                if (dt.Rows.Count > 0)
                {
                    string name = dt.Rows[0]["FULLNAME"].ToString();
                    int CandidateId = Convert.ToInt32(dt.Rows[0]["CANDIDATE_CODE"].ToString());
                    string Email = dt.Rows[0]["EMAIL"].ToString();
                    UpdateProfiles(CandidateId, name, Email);
                    lblRegNo.Text = CandidateId.ToString();
                    trInfo.Visible = true;
                    if (trInfo.Visible == true)
                    {
                         url = "EnosisJobs.aspx?Id=" + CandidateId;
                        //Response.Redirect(url);
                    }
                }
                else
                {
                    Session["RESUMENAME"] = fResume.FileName;
                    Session["USEREMAIL"] = txtEmail.Text;
                    string query = "INSERT INTO CANDIDATES(EMAIL,RESUME,UPDATEDDATE,RESUMEDATE,REQPLACEMENT,CAN_TYPE,STATUS) VALUES('" + txtEmail.Text + "','" + fResume.FileName + "',GETDATE(),GETDATE(),1,'O','A') SELECT @@IDENTITY";
                    fResume.SaveAs(Server.MapPath(@"~\Resumes\") + fResume.FileName);
                    int Code = dbconnect.ExecuteScalerQuery(query);//  Convert.ToInt32(scomm.ExecuteScalar().ToString());


                    string query1 = "INSERT INTO profile_jobstatus(CANDIDATEID, STATUSID) VALUES(" + Code + ", 1)";

                    dbconnect.ExecuteQuery(query1);

                     url = "EnosisJobs.aspx?Id=" + Code;
                    //Response.Redirect(url);
                }
                Response.Redirect(url,false);
            }
            catch(Exception ex)
            {
                lblError.Text = ex.Message.ToString();
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);

            }

        }

        private void UpdateProfiles(int CandidateId, string name,string email)
        {
            try
            {
                //  string Resume = fResume.FileName;
                //string extension = System.IO.Path.GetExtension(fResume.FileName);
                //string filename = name + extension;
                Session["RESUMENAME"] = fResume.FileName;
                fResume.SaveAs(Server.MapPath(@"~\Resumes\") + fResume.FileName);
                string query1 = "UPDATE CANDIDATES SET  [RESUME]='" + fResume.FileName + "',[UPDATEDDATE]=GETDATE(),[RESUMEDATE]=GETDATE(),REQPLACEMENT=1,UPDATEDDATE=GETDATE() WHERE CANDIDATE_CODE=" + CandidateId;
                dbconnect.ExecuteQuery(query1);
               // SENDEMAIL s1 = new SENDEMAIL();
             //   s1.SendResume(email, "UpdatedResume", "Please Find Your Latest Resume attached in the Email", Resume);

            }
            catch(Exception ex)
            {
                lblError.Text = ex.Message;
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);

            }
        }

    }
}