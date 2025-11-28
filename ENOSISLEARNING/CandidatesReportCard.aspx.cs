using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace ENOSISLEARNING
{
    public partial class CandidatesReportCard : System.Web.UI.Page
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
                    if (Request.QueryString["Id"] != null)
                    {
                        int CanId = Convert.ToInt32(Request.QueryString["Id"]);
                        BindReports(CanId);
                        BindChart(CanId);
                        BindInternal(CanId);
                        BindExternal(CanId);
                        div1.Visible = true;

                    }
                    else
                    {
                        div1.Visible = false;
                        BindReports(0);
                        BindChart(0);
                    }
                }
            }
            catch(Exception ex)
            {
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }
        }
        private void BindInternal(int CanId)
        {
            string query = "select can.CANDIDATEID,can.DATEOFTEST,c.COURSENAME,can.UPDATEDBY,can.TESTTYPE,can.SCORE,can.OUTOF,can.FEEDBACK from (select * from candidate_testresults union select * from CANDIDATE_INTERVIEWRESULTS) can INNER JOIN COURSES_DETAIL c on can.COURSEID = c.COURSEID where can.ASSESSMENTTYPE = 'INTERNAL' AND can.CANDIDATEID=" + CanId + " order by CAN.COURSEID,CAN.DATEOFTEST";

           
            SqlDataAdapter adap = new SqlDataAdapter(query, sconn);

            DataTable dt = new DataTable();
            adap.Fill(dt);

            if (dt.Rows.Count > 0)
            {
            
                grInternals.DataSource = dt;
                grInternals.DataBind();
            }
            else
            {
            
                grInternals.DataSource = null;
                grInternals.DataBind();
            }
        }
        public void BindChart(int CandId)
        {
            string query=string.Empty;
            if(CandId==0)
            {
                query = "select Convert(date,Dateoftest) as Dateoftest,avg(score/outof) as score from candidate_testresults group by Convert(date,Dateoftest)";
            }
            else
            {
                query = "select Dateoftest,avg(score/outof) as score from candidate_testresults where Candidateid="+CandId+" group by testid,Dateoftest";
            }
            using(SqlCommand scmd=new SqlCommand(query,sconn))
            {
                 SqlDataAdapter adap = new SqlDataAdapter(scmd);
      
            DataTable dt = new DataTable();
            adap.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                chartcandidatereports.DataSource = dt;
                chartcandidatereports.DataBind();
            }
        }
        }
        private void BindReports(int CanId)
        {
            SqlCommand comm1 = new SqlCommand("SP_CANDIDATETESTRESULTS", sconn);
#pragma warning disable CS0618 // 'SqlParameterCollection.Add(string, object)' is obsolete: 'Add(String parameterName, Object value) has been deprecated.  Use AddWithValue(String parameterName, Object value).  http://go.microsoft.com/fwlink/?linkid=14202'
            comm1.Parameters.Add("@ID", typeof(int)).Value = CanId;
#pragma warning restore CS0618 // 'SqlParameterCollection.Add(string, object)' is obsolete: 'Add(String parameterName, Object value) has been deprecated.  Use AddWithValue(String parameterName, Object value).  http://go.microsoft.com/fwlink/?linkid=14202'

            comm1.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adap = new SqlDataAdapter(comm1);
      
            DataTable dt = new DataTable();
            adap.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                ViewState["candidatename"] = dt.Rows[0][1].ToString();

                grvCandidatesReports.DataSource = dt;
                grvCandidatesReports.DataBind();
            }
            else
            {
               // chartcandidatereports.DataSource = null;
               // chartcandidatereports.DataBind();
                grvCandidatesReports.DataSource = null;
                grvCandidatesReports.DataBind();
           }

        }


        private void BindExternal(int CanId)
        {
            string query = "select can.CANDIDATEID,can.DATEOFTEST,c.COURSENAME,can.UPDATEDBY,can.TESTTYPE,can.SCORE,can.OUTOF,can.FEEDBACK from (select * from candidate_testresults union select * from CANDIDATE_INTERVIEWRESULTS) can INNER JOIN COURSES_DETAIL c on can.COURSEID = c.COURSEID where can.ASSESSMENTTYPE = 'EXTERNAL' AND can.CANDIDATEID=" + CanId + " order by CAN.COURSEID,CAN.DATEOFTEST";


            SqlDataAdapter adap = new SqlDataAdapter(query, sconn);
      
            DataTable dt = new DataTable();
            adap.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                grExternals.DataSource = dt;
                grExternals.DataBind();
            }
            else
            {
                grExternals.DataSource = null;
                grExternals.DataBind();
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
         
        } 
        protected void btnExcel_ServerClick(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = string.Empty;
            if (ViewState["candidatename"] != null)
            {
                FileName = ViewState["candidatename"].ToString() + DateTime.Now + ".xls";
            }
            else
            {
                FileName ="Internal Test result" + DateTime.Now + ".xls";
            }
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            grInternals.GridLines = GridLines.Both;
            grInternals.HeaderStyle.Font.Bold = true;
            grInternals.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();    
        }

        protected void btnPdf_ServerClick(object sender, EventArgs e)
        {

        }

        protected void grvCandidatesReports_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvCandidatesReports.PageIndex = e.NewPageIndex;

        }
    }
}