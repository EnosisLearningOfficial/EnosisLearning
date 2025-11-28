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
    public partial class AdmissionAnalysis : System.Web.UI.Page
    {
        string CONNSTRING = System.Configuration.ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ToString();
        SqlConnection sconn = null;
        private string uname = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
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
                    BindCounsellorFees();
                }
            }

            catch (Exception ex)
            {
             //   lblError.Text = ex.Message;
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);

            }
        }
        private void BindCounsellorFees()
        {
            SqlDataAdapter adap = new SqlDataAdapter("SELECT COUNSELLORNAME,SUM(ISNULL(TOTALFEES,0)) AS TOTALFEES,COUNT(*) AS STUDENTCOUNTS FROM CANDIDATES GROUP BY COUNSELLORNAME ", sconn);

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

        protected void grvCandidatesFees_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                grvCandidatesFees.PageIndex = e.NewPageIndex;
                BindCounsellorFees();
            }
            catch (Exception ex)
            {
             //   lblError.Text = ex.Message;
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);

            }
        }
    }
}