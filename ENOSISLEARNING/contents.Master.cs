using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ENOSISLEARNING.Libraries;

namespace ENOSISLEARNING
{
    public partial class contents : System.Web.UI.MasterPage
    {

        EnquiriesEntity obj = new EnquiriesEntity();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void BindCourses()
        {
            string[] enumNames = Enum.GetNames(typeof(ENQCOURSES));
            foreach (string item in enumNames)
            {
                //get the enum item value
                int value = (int)Enum.Parse(typeof(ENQCOURSES), item);
                ListItem listItem = new ListItem(item, value.ToString());
                drpDCourse.Items.Add(listItem);
            }
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            Response.ContentType = "Application/pdf";
            Response.AppendHeader("Content-Disposition", "attachment; filename=ASPnet.pdf");
            Response.TransmitFile(Server.MapPath("coursepdfs/Advanced.Net.pdf"));
            Response.End();
        }
        protected void WebservicesDownload_Click(object sender, EventArgs e)
        {
            Response.ContentType = "Application/pdf";
            Response.AppendHeader("Content-Disposition", "attachment; filename=Your_Pdf_File.pdf");
            Response.TransmitFile(Server.MapPath("pdf/SQL-SERVER-2012-BROCHURE.pdf"));
            Response.End();
        }
        protected void btnSend_Click(object sender, EventArgs e)
        {

            string msgstring = "Your Details have been saved";
            string content = "window.onload=function(){alert('";
            content += msgstring;
            content += "');";
            content += "window.location='";
            content += Request.Url.AbsoluteUri;
            content += "';}";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "SucessMessage", content, true);
            try
            {

                obj.Name = txtUserName.Text;
                obj.Email = txtEmailId.Text;
                obj.Mobile = txtUserContactNo.Text;
                obj.Course = drpDCourse.SelectedItem.Text;
                obj.InsertEnquiry();
                head6.InnerText = "We have received your request, will reach to you soon for the demo session.";


                clearAll();
            }
            catch (Exception ex)
            {
                head6.InnerText = ex.Message;
                // lblError.Text = ex.Message;
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);

            }
        }
        public void clearAll()
        {
            try
            {
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}