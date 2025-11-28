using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;


namespace ENOSISLEARNING.Resumes
{
    public partial class DocViewer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "hikjhkk", "resize1();", true);
                this.Page.Title = "Viewer";

                //string s = CommonFunction.Decryptdata(Request.QueryString["Path"].ToString());
                string s = Request.QueryString["Path"].ToString();
                //@"\localhost\tfs\801001_RA.pdf";
                //
                //string ss= s.Replace("\","\");


           //    s = "letter.pdf";

                WebClient client = new WebClient();
                if (!(s.Equals(string.Empty)))
                {
                    //string path = CommonFunction.GetSiteRootUrl() + "/Resumes/" + s;
                    // Byte[] buffer = new Byte[10000];
                    // buffer=client.DownloadData(s);
                    // if (buffer != null)
                    // {

                    string ext = System.IO.Path.GetExtension(s);
                    Response.Clear();
                    Response.ContentType = CommonFunctions.ReturnExtension(ext);// "application/pdf";

                    //Response.AddHeader("content-length", buffer.Length.ToString());
                    Response.WriteFile(s);
                    Response.Flush();
                    //Response.BinaryWrite(buffer);
                    //}
                }
                else
                {
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "ex", "alert('No File is available for this Document..!!');", true);
                }
            }
            catch (Exception ex)
            {
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "ex", "alert('" + ex.Message + "');", true);
            }
        }
    }
}