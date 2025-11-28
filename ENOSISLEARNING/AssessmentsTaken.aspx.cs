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
    public partial class AssessmentsTaken : System.Web.UI.Page
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
                edate.Text = DateTime.Now.ToString("yyyy-MM-dd"); DateTime.Today.ToString("dd/MM/yyyy"); //DateTime.Now.ToShortDateString();
                sdate.Text = DateTime.Now.AddDays(-7).ToString("yyyy-MM-dd"); //ToShortDateString();

                BindAdmissions();
            }
        }

        private void BindAdmissions()
        {
            string enddate = Convert.ToDateTime(edate.Text).ToString("MM/dd/yyyy");//.ToString("MM/dd/yyyy");
            string strdate = Convert.ToDateTime(sdate.Text).ToString("MM/dd/yyyy");//.ToString("MM/dd/yyyy");
       
            string query = "SELECT CAN.UPDATEDBY AS EMPLOYEENAME,CAN.INTERVIEWTYPE AS TESTYPES,COUNT(*) AS NOOFASSIGNMENTS FROM(SELECT * FROM CANDIDATE_INTERVIEWRESULTS UNION SELECT * FROM CANDIDATE_TESTRESULTS) CAN  where CAN.UPDATEDDATE >= '" + strdate + "' and  CAN.UPDATEDDATE <= '" + enddate + "' GROUP BY CAN.UPDATEDBY,CAN.INTERVIEWTYPE";
            SqlDataAdapter adap = new SqlDataAdapter(query, sconn);
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
            grvCandidatesFees.PageIndex = e.NewPageIndex;
            BindAdmissions();
        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
            BindAdmissions();
        }
    }
}