using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.ComponentModel;

namespace ENOSISLEARNING
{


    public partial class Assignments : System.Web.UI.Page
    {

        EnquiriesEntity obj = new EnquiriesEntity();

        List<FileModel> lstFiles;
        DirectoryInfo dirInfo;

        private void BindList(string dir)
        {
            lstFiles = new List<FileModel>();
            dirInfo = new DirectoryInfo(Server.MapPath(dir));
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
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (!Page.IsPostBack)
                {
                    BindC();
                    BindJava();
                    BindNet();
                    BindAspNet();
                    BindMVC();
                    BindDesigning();
                    BindSQL();
                    BindSSIS();
                    BindSSRS();
                    BindSSAS();
                    BindPowerBI();

                }
            }
            catch(Exception ex)
            {
                lblInfo.Text = ex.Message;
            }

        }

     
        private void BindPowerBI()
        {
            BindList("~/Assignments/PowerBI");
            grvPowerBI.DataSource = lstFiles;
            grvPowerBI.DataBind();
        }

        private void BindC()
        {
            BindList("~/Assignments/C");
            grvC.DataSource = lstFiles;
            grvC.DataBind();
        }

        private void BindJava()
        {
            BindList("~/Assignments/Java");
            grvJava.DataSource = lstFiles;
            grvJava.DataBind();

        }

        private void BindNet()
        {

            BindList("~/Assignments/Net");

            grvNet.DataSource = lstFiles;
            grvNet.DataBind();

        }
        private void BindAspNet()
        {
            BindList("~/Assignments/Asp.Net");
            grvAsp.DataSource = lstFiles;
            grvAsp.DataBind();

        }

        private void BindMVC()
        {
            BindList("~/Assignments/MVC");
           
            grvMvc.DataSource = lstFiles;
            grvMvc.DataBind();

        }

        private void BindDesigning()
        {
            BindList("~/Assignments/Designing");
          
            grvDesigning.DataSource = lstFiles;
            grvDesigning.DataBind();

        }

        private void BindSQL()
        {
            BindList("~/Assignments/SQL");
           
            grvSQL.DataSource = lstFiles;
            grvSQL.DataBind();

        }

        private void BindSSIS()
        {
            BindList("~/Assignments/SSIS");
         
            grvSSIS.DataSource = lstFiles;
            grvSSIS.DataBind();

        }

        private void BindSSRS()
        {
            BindList("~/Assignments/SSRS");
         
            grvSSRS.DataSource = lstFiles;
            grvSSRS.DataBind();

        }

        private void BindSSAS()
        {
            BindList("~/Assignments/SSAS");
           
            grvSSAS.DataSource = lstFiles;
            grvSSAS.DataBind();

        }

        protected void grvC_SelectedIndexChanged(object sender, EventArgs e)
        {
            string filename = grvC.SelectedDataKey.Value.ToString();
            string filepath = Server.MapPath(@"~\Assignments\C\" + filename);
            DownLoadFile(filepath);

        }

        protected void grvJava_SelectedIndexChanged(object sender, EventArgs e)
        {
            string filename = grvJava.SelectedDataKey.Value.ToString();
            string filepath = Server.MapPath(@"~\Assignments\Java\" + filename);
            DownLoadFile(filepath);

        }

        protected void grvNet_SelectedIndexChanged(object sender, EventArgs e)
        {
            string filename = grvNet.SelectedDataKey.Value.ToString();
            string filepath = Server.MapPath(@"~\Assignments\Net\" + filename);
            DownLoadFile(filepath);

        }

        protected void grvAsp_SelectedIndexChanged(object sender, EventArgs e)
        {
            string filename = grvAsp.SelectedDataKey.Value.ToString();
            string filepath = Server.MapPath(@"~\Assignments\Asp.Net\" + filename);
            DownLoadFile(filepath);

        }

        protected void grvSQL_SelectedIndexChanged(object sender, EventArgs e)
        {
            string filename = grvSQL.SelectedDataKey.Value.ToString();
            string filepath = Server.MapPath(@"~\Assignments\SQL\" + filename);
            DownLoadFile(filepath);
        }

        protected void grvSSRS_SelectedIndexChanged(object sender, EventArgs e)
        {
            string filename = grvSSRS.SelectedDataKey.Value.ToString();
            string filepath = Server.MapPath(@"~\Assignments\SSRS\" + filename);
            DownLoadFile(filepath);
        }

        protected void grvSSAS_SelectedIndexChanged(object sender, EventArgs e)
        {
            string filename = grvSSAS.SelectedDataKey.Value.ToString();
            string filepath = Server.MapPath(@"~\Assignments\SSAS\" + filename);
            DownLoadFile(filepath);

        }

        protected void grvMvc_SelectedIndexChanged(object sender, EventArgs e)
        {
            string filename = grvMvc.SelectedDataKey.Value.ToString();
            string filepath = Server.MapPath(@"~\Assignments\MVC\" + filename);
            DownLoadFile(filepath);

        }

        protected void grvDesigning_SelectedIndexChanged(object sender, EventArgs e)
        {
            string filename = grvDesigning.SelectedDataKey.Value.ToString();
            string filepath = Server.MapPath(@"~\Assignments\Designing\" + filename);
            DownLoadFile(filepath);

      
            
        }

        protected void grvSSIS_SelectedIndexChanged(object sender, EventArgs e)
        {
            string filename = grvSSIS.SelectedDataKey.Value.ToString();
            string filepath = Server.MapPath(@"~\Assignments\SSIS\" + filename);
            DownLoadFile(filepath);

        }

        protected void grvPowerBI_SelectedIndexChanged(object sender, EventArgs e)
        {
            string filename = grvPowerBI.SelectedDataKey.Value.ToString();
            string filepath = Server.MapPath(@"~\Assignments\PowerBI\" + filename);
            DownLoadFile(filepath);

        }


        private void DownLoadFile(string filepath)
        {
            try
            {
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
            catch(Exception ex)
            {
                lblInfo.Text = ex.Message.ToString();
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }
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
                lblRes.Text = "We Have Received Your Enquiry, Will Soon Give You Details";
                Response.Write("<script language=javascript>alert('We Have Received Your Enquiry, Will Soon Give You Details')</script>");



                clearAll();
            }
            catch (Exception ex)
            {
                lblRes.Text = ex.Message.ToString();
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
                lblRes.Text = "";

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }


}
    