using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ENOSISLEARNING
{
    public partial class View_Certificate : System.Web.UI.Page
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
            string role = "";
            if (Session["role"] != null)
            {
                role = Session["role"].ToString();
            }
            if (!role.Contains("Student"))
            {
                showgridviewheader();
            }
            int candid = 0;
            if (Session["candid"] != null || Session["candname"] != null)
            {
                candid = Convert.ToInt32(Session["candid"]);

                // lblname.Text = Convert.ToString(Session["candname"]);
            }
            getcertificate(candid);
        }
        protected void showgridviewheader()
        {

            grvCandidatescertificate.Columns[2].Visible = true;
            grvCandidatescertificate.Columns[3].Visible = true;
            grvCandidatescertificate.Columns[4].Visible = true;
            grvCandidatescertificate.Columns[5].Visible = true;
            grvCandidatescertificate.Columns[6].Visible = true;
            grvCandidatescertificate.Columns[7].Visible = true;
            grvCandidatescertificate.Columns[8].Visible = true;
            grvCandidatescertificate.Columns[9].Visible = true;
        }
        protected void getcertificate(int candid)
        {
            dbconnect db = new dbconnect();
            DataTable dt = db.selectcertificatestatus(candid);
            if (dt.Rows.Count > 0)
            {
                grvCandidatescertificate.DataSource = dt;
                grvCandidatescertificate.DataBind();

            }
            else
            {

                // string filepath = Server.MapPath("~/Certificate/") + i;

                //WebClient w = new WebClient();
                //Byte[] filebuffer = w.DownloadData(filepath);
                //if (filebuffer != null)
                //{
                //    Response.ContentType = "application/pdf";
                //    Response.AddHeader("content-lenght", filebuffer.Length.ToString());
                //   Response.BinaryWrite(filebuffer);
                //    iframepdf.Attributes.Add("src", filepath);
                //}
                //iframepdf.Attributes.Add("src",filepath);


            }
        }
        protected void lblviewcertificate_Click(object sender, EventArgs e)
        {
            try
            {
                string filename = (sender as LinkButton).CommandArgument;
                string filepath = Server.MapPath("~/Certificate/") + filename;
                WebClient w = new WebClient();
                Byte[] filebuffer = w.DownloadData(filepath);
                if (filebuffer != null)
                {
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-lenght", filebuffer.Length.ToString());
                    Response.BinaryWrite(filebuffer);
                }
            }
            catch (Exception)
            {
            }
        }
        protected void grvCandidatescertificate_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvCandidatescertificate.PageIndex = e.NewPageIndex;
            int candid = 0;
            if (Session["candid"] != null || Session["candname"] != null)
            {
                candid = Convert.ToInt32(Session["candid"]);

                // lblname.Text = Convert.ToString(Session["candname"]);
            }
            getcertificate(candid);
        }
    }
}