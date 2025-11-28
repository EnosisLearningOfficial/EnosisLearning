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
    public partial class UpgradeCourses : System.Web.UI.Page
    {
        string CONNSTRING = System.Configuration.ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ToString();
        SqlConnection sconn = null;

        private void ShowDetails(int RegNo)
        {
       
            string QUERY1 = "SELECT CC.COURSEID,CD.COURSENAME FROM CANDIDATES_COURSES CC INNER JOIN COURSES_DETAIL CD ON CC.COURSEID = CD.COURSEID WHERE CC.CANDIDATEID=" + RegNo;
            SqlDataAdapter adap1 = new SqlDataAdapter(QUERY1, sconn);
            DataTable dt1 = new DataTable();
            adap1.Fill(dt1);
            string message = "";

            for (int r = 0; r < dt1.Rows.Count; r = r + 1)
            {
                if (message.Length > 0)
                {
                    message = message + "," + dt1.Rows[r]["COURSENAME"].ToString();
                }
                else
                {
                    message = dt1.Rows[r]["COURSENAME"].ToString();
                }
            }
            lblEnrolledCourses.Text = message.ToString();
            if (message.Length > 0)
            {
                sconn.Open();
                string str = "SELECT SUM(TOTALFEES) FROM CANDIDATES WHERE CANDIDATE_CODE=" + RegNo;
                SqlCommand COMM1 = new SqlCommand(str, sconn);
                double fees = Convert.ToDouble(COMM1.ExecuteScalar().ToString());
                sconn.Close();
                lblOldFees.Visible = true;
                lblOldFees.Text = lblOldFees.Text + " = " + fees.ToString();
            }
            else
            {
                lblOldFees.Visible = false;
            }

           



        }
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
            try
            {
                if (!Page.IsPostBack)
                {


                    int RegNo = 0;
                    if (Request.QueryString["Id"] != null)
                    {
                        RegNo = Convert.ToInt32(Request.QueryString["Id"].ToString());
                        string url = "EnosisRegistration.aspx?Id=" + RegNo + "";
                        string baseurl = CommonFunction.GetSiteRootUrl();
                        string loginurl = baseurl + "//" + url;
              lblRegNo.Text = RegNo.ToString();

                        hykRegUrl.Text = url;// "http://www.enosislearning.com/EnosisRegistration.aspx?Id=" + RegNo;
                        hykRegUrl.NavigateUrl = url;// "http://www.enosislearning.com/EnosisRegistration?Id=" + RegNo;*/
                        ShowDetails(RegNo);
                    }
                    else
                    {
                   }
                    string previousPageName = System.IO.Path.GetFileName(Request.UrlReferrer.AbsolutePath);
                    if (previousPageName.Contains("EnosisRegistration.aspx"))
                    {
                     }
                    BindCourses();
                      }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }
        private void BindCourses()
        {

            string QUERY = "SELECT COURSEID,COURSENAME FROM COURSES_DETAIL WHERE STATUS='A'";
            SqlDataAdapter adap = new SqlDataAdapter(QUERY, sconn);
            DataTable dt = new DataTable();
            adap.Fill(dt);

            drpCourses.DataSource = dt;
            drpCourses.DataTextField = "COURSENAME";
            drpCourses.DataValueField = "COURSEID";
            drpCourses.DataBind();
        }
        protected void drpCourses_SelectedIndexChanged(object sender, EventArgs e)
        {
            string message = "";
            foreach (ListItem item in drpCourses.Items)
            {
                if (item.Selected)
                {
                    if (message.Length > 0)
                    {
                        message = message + "," + item.Value;
                    }
                    else
                    {
                        message = item.Value;
                    }
                }
            }
            if (message.Length > 0)
            {
                sconn.Open();
                string str = "select sum(fees) from COURSES_DETAIL where COURSEID in(" + message + ")";
                SqlCommand COMM1 = new SqlCommand(str, sconn);
                double fees = Convert.ToDouble(COMM1.ExecuteScalar().ToString());
                sconn.Close();
                lblFees.Visible = true;
                txtNewCourseFees.Visible = true;
                txtNewCourseFees.Text = fees.ToString();
            }
            else
            {
                lblFees.Visible = false;
                txtNewCourseFees.Visible = false;
            }
        }

        protected void InsertCourses()
        {
            int RegNo = Convert.ToInt32(lblRegNo.Text);


            sconn.Open();
            string message = "";
            foreach (ListItem item in drpCourses.Items)
            {
                if (item.Selected)
                {
                    SqlCommand COMM1 = new SqlCommand("insert into CANDIDATES_COURSES values(" + RegNo + "," + item.Value.ToString() + ",GETDATE())", sconn);
                    COMM1.ExecuteNonQuery();
                    message += item.Text + " " + item.Value + "\\n";
                }
            }

            double fees = Convert.ToDouble(txtNewCourseFees.Text.ToString());

            SqlCommand COMM2 = new SqlCommand("UPDATE CANDIDATES SET TOTALFEES +=" + fees + " WHERE CANDIDATE_CODE=" + RegNo, sconn);
            COMM2.ExecuteNonQuery();

            sconn.Close();
            string str = "YOUR HAVE UPGRADED TO THE FOLLOWING COURSES " + message + " SUCCESSFULLY";


            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + str + "');", true);
        }

        protected void btnNewCourses_Click(object sender, EventArgs e)
        {
            InsertCourses();
            int CandidateId = 0;
            CandidateId = Convert.ToInt32(lblRegNo.Text);
            Response.Redirect("RegConfirmation.aspx?Id=" + CandidateId + "");
            Response.Redirect("RegConfirmation.aspx");
        }
    }
}