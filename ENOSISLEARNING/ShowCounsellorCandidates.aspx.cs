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
    public partial class ShowCounsellorCandidates : System.Web.UI.Page
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

            if (Request.QueryString["BATCHNAME"] != null)
            {
                string  batch_name = Request.QueryString["BATCHNAME"].ToString();
                string[] names = batch_name.Split('-');
                int i_month = Convert.ToInt32(names[0].ToString());
                int year = Convert.ToInt32(names[1].ToString());
                string month_name = names[2].ToString();
                string course = names[3].ToString();

                lblYear.Text = year.ToString();
                lblMonth.Text = month_name.ToString();
                lblCourse.Text = course.ToString();
                BindCounsellorCandidates(i_month,year,batch_name);
            }
        }
        private void BindCounsellorCandidates(int month,int year,string BATCH)
        {
            string str_COURSES = Session["COURSE"].ToString();
        
            string query = "SELECT C.CANDIDATE_CODE,C.FULLNAME,C.GENDER,C.MOBILENO,C.EMAIL,C.COUNSELLORNAME,cc.COURSEID,cd.COURSENAME FROM ENOSISLEARNING.CANDIDATES_COURSES CC INNER JOIN CANDIDATES  C ";
            query = query + "ON CC.CANDIDATEID = C.CANDIDATE_CODE inner join COURSES_DETAIL cd on cc.COURSEID = cd.COURSEID WHERE C.STATUS='A' AND CC.COURSEID IN(" + str_COURSES + ") AND  YEAR(CC.CREATED_DATE)=" + year + " AND MONTH(CC.CREATED_DATE) = " + month + "";

            SqlDataAdapter adap = new SqlDataAdapter(query, sconn);

            DataTable dt = new DataTable();
            adap.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                grvCounsellorCandidates.DataSource = dt;
                grvCounsellorCandidates.DataBind();
            }
            else
            {
                grvCounsellorCandidates.DataSource = null;
                grvCounsellorCandidates.DataBind();
            }

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("SearchCandidate.aspx");
        }
    }
}