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


    public partial class SampleResumes : System.Web.UI.Page
    {



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
                    Bind_DBResumes();
                    Bind_Net();
                    BindJava();

                }
            }
            catch(Exception ex)
            {
               // lblInfo.Text = ex.Message;
            }

        }



        private void Bind_DBResumes()
        {
            BindList("~/SampleCV/DB");
            grvDB.DataSource = lstFiles;
            grvDB.DataBind();
        }


        private void Bind_Net()
        {
            BindList("~/SampleCV/NET");
            grv_Net.DataSource = lstFiles;
            grv_Net.DataBind();
        }


        private void BindJava()
        {
            BindList("~/SampleCV/JAVA");
            grvJava.DataSource = lstFiles;
            grvJava.DataBind();
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
               // lblInfo.Text = ex.Message.ToString();
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }
        }

        protected void grv_Net_SelectedIndexChanged(object sender, EventArgs e)
        {

            string filename = grv_Net.SelectedDataKey.Value.ToString();
            string filepath = Server.MapPath(@"~\SampleCV\NET\" + filename);
            DownLoadFile(filepath);
        }

        protected void grvJava_SelectedIndexChanged(object sender, EventArgs e)
        {
            string filename = grvJava.SelectedDataKey.Value.ToString();
            string filepath = Server.MapPath(@"~\SampleCV\JAVA\" + filename);
            DownLoadFile(filepath);
        }

        protected void grvDB_SelectedIndexChanged(object sender, EventArgs e)
        {
            string filename = grvDB.SelectedDataKey.Value.ToString();
            string filepath = Server.MapPath(@"~\SampleCV\DB\" + filename);
            DownLoadFile(filepath);
        }
    }


}
    