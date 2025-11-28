using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace ENOSISLEARNING
{
  
    public partial class DownLoads : System.Web.UI.Page
    {
        EnquiriesEntity obj = new EnquiriesEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindFiles();
            }
        }

        private void BindFiles()
        {
            List<FileModel> lstFiles = new List<FileModel>();

            DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/Downloads"));
            int i = 0;
            foreach (var item in dirInfo.GetFiles())
            {
                lstFiles.Add(new FileModel()
                {
                    Id = i + 1,
                    Name = item.Name,
                    Path = dirInfo.FullName + @"\" + item.Name
                });
                i = i + 1;
            }
            grvFiles.DataSource = lstFiles;
            grvFiles.DataBind();

        }

        protected void grvFiles_SelectedIndexChanged(object sender, EventArgs e)
        {
            string filename = grvFiles.SelectedDataKey.Value.ToString();
            // Get the physical Path of the file(test.doc)
            string filepath = Server.MapPath(@"~\Downloads\" + filename);
            // Create New instance of FileInfo class to get the properties of the file being downloaded
            FileInfo file = new FileInfo(filepath);
            Response.ClearContent();
            Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);

            // Add the file size into the response header
            Response.AddHeader("Content-Length", file.Length.ToString());
            // Set the Content Type 
            Response.ContentType = FILEOPERATIONS.ReturnExtension(file.Extension.ToLower());
            // Write the file into the response (TransmitFile is for ASP.NET 2.0. In ASP.NET 1.1 you have to use WriteFile instead)
            Response.TransmitFile(file.FullName);
            // End the response 
            Response.End();
           

        
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                obj.Name = txtEUserName.Text;
                obj.Email = txtEEmailId.Text;
                obj.Mobile = txtEUserContactNo.Text;
                obj.Course = drpDCourse.SelectedItem.Text;
                obj.Status = "NEW";
                obj.Source = "WEBSITE";
                obj.Source = "DILLIP";

                obj.InsertEnquiry();
                //lblRes.Text = "We Have Received Your Enquiry, Will Soon Give You Details";
                Response.Write("<script language=javascript>alert('We Have Received Your Enquiry, Will Soon Give You Details')</script>");



                clearAll();
            }
            catch (Exception ex)
            {
                //lblRes.Text = ex.Message.ToString();
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }
        }

        public void clearAll()
        {
            try
            {
                txtEUserName.Text = "";
                txtEEmailId.Text = "";
                txtEUserContactNo.Text = "";
                drpDCourse.SelectedIndex = 0;
                //lblRes.Text = "";

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}