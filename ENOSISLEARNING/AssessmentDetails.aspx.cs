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
    public partial class AssessmentDetails : System.Web.UI.Page
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
            string ename = "";
            
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["EMPLOYEENAME"] != null)
                {
                    ename = Request.QueryString["EMPLOYEENAME"].ToString();
                    BindTests(ename);
                    BindInterviews(ename);
                }
            }
        }
        private void BindTests(string name)
        {
              SqlDataAdapter adap = new SqlDataAdapter("select CT.TESTID,CT.DATEOFTEST,C.FULLNAME,CT.TESTTYPE,CD.COURSENAME,CT.SCORE,CT.OUTOF,(CT.SCORE/CT.OUTOF) * 100 AS PERCENTAGE,CT.UPDATEDBY,CT.FEEDBACK from CANDIDATE_TESTRESULTS CT INNER JOIN CANDIDATES C ON CT.CANDIDATEID = C.CANDIDATE_CODE INNER JOIN COURSES_DETAIL CD ON CT.COURSEID = CD.COURSEID where CT.UPDATEDBY='" + name + "'", sconn);

            DataTable dt = new DataTable();
            adap.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                grvTests.DataSource = dt;
                grvTests.DataBind();
            }
            else
            {
                grvTests.DataSource = null;
                grvTests.DataBind();
            }

        }

        private void BindInterviews(string name)
        {
           SqlDataAdapter adap = new SqlDataAdapter("select CI.INTERVIEWID,CI.DATEOFINTERVIEW,C.FULLNAME,CI.INTERVIEWTYPE,CD.COURSENAME,CI.SCORE,CI.OUTOF,(CI.SCORE/CI.OUTOF) * 100 AS PERCENTAGE,CI.UPDATEDBY,CI.FEEDBACK from CANDIDATE_INTERVIEWRESULTS CI INNER JOIN CANDIDATES C ON CI.CANDIDATEID = C.CANDIDATE_CODE INNER JOIN COURSES_DETAIL CD ON CI.COURSEID = CD.COURSEID where CI.UPDATEDBY='" + name + "'", sconn);

            DataTable dt = new DataTable();
            adap.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                grvInterviews.DataSource = dt;
                grvInterviews.DataBind();
}
            else
            {
                grvInterviews.DataSource = null;
                grvInterviews.DataBind();
           }

        }

        protected void grvTests_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvTests.PageIndex = e.NewPageIndex;
            if (Request.QueryString["EMPLOYEENAME"] != null)
            {
               string ename = Request.QueryString["EMPLOYEENAME"].ToString();
                BindTests(ename);
               // BindInterviews(ename);
            }
           
        }

        protected void grvInterviews_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvInterviews.PageIndex = e.NewPageIndex;
            if (Request.QueryString["EMPLOYEENAME"] != null)
            {
                string ename = Request.QueryString["EMPLOYEENAME"].ToString();
                //BindTests(ename);
                BindInterviews(ename);
            }
        }
    }
}