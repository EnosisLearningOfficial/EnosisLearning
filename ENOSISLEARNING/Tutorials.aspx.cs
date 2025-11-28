using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;


namespace ENOSISLEARNING
{
   
    public partial class Tutorials : System.Web.UI.Page
    {
        EnquiriesEntity obj = new EnquiriesEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //
                BindC();
                BindCPP();
                BindDesigning();
                BindJava();

                //
                BindNet();
                BindAspNet();

                BindMVC();
                BindFiles2();
                BindSQL();

                BindPowerBI();
                //
                BindSSIS();
                BindSSRS();
                BindSSAS();
                
            }

        }
        private void BindC()
        {
            List<FileModel> lstFiles = new List<FileModel>();


            DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/Tutorials/C"));
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
            grvC.DataSource = lstFiles;
            grvC.DataBind();

        }
        private void BindCPP()
        {
            List<FileModel> lstFiles = new List<FileModel>();


            DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/Tutorials/CPP"));
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
            grvCPP.DataSource = lstFiles;
            grvCPP.DataBind();

        }
        private void BindDesigning()
        {
            List<FileModel> lstFiles = new List<FileModel>();


            DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/Tutorials/Designing"));
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
            grvDesigning.DataSource = lstFiles;
            grvDesigning.DataBind();

        }


        private void BindJava()
        {
            List<FileModel> lstFiles = new List<FileModel>();


            DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/Tutorials/Java"));
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
            grvJava.DataSource = lstFiles;
            grvJava.DataBind();

        }

        private void BindNet()
        {
            List<FileModel> lstFiles = new List<FileModel>();

           
            DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/Tutorials/CSHARP"));
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
            grvNet.DataSource = lstFiles;
            grvNet.DataBind();

        }


        private void BindAspNet()
        {
            List<FileModel> lstFiles = new List<FileModel>();


            DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/Tutorials/ASP.NET"));
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
            grvASP.DataSource = lstFiles;
            grvASP.DataBind();

        }
        private void BindMVC()
        {
            List<FileModel> lstFiles = new List<FileModel>();

            DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/Tutorials/MVC"));
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
            grvMvc.DataSource = lstFiles;
            grvMvc.DataBind();

        }

        private void BindFiles2()
        {
            List<FileModel> lstFiles = new List<FileModel>();

            DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/Tutorials2"));
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
             grvFiles2.DataSource = lstFiles;
             grvFiles2.DataBind();

        }

        private void BindSQL()
        {
            List<FileModel> lstFiles = new List<FileModel>();

            DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/Tutorials/SQL"));
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
            grvSQL.DataSource = lstFiles;
            grvSQL.DataBind();

        }

        private void BindPowerBI()
        {
            List<FileModel> lstFiles = new List<FileModel>();

            DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/Tutorials/POWERBI"));
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
            grvPowerBI.DataSource = lstFiles;
            grvPowerBI.DataBind();

        }

        private void BindSSIS()
        {
            List<FileModel> lstFiles = new List<FileModel>();

            DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/Tutorials/SSIS"));
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
            grvSSIS.DataSource = lstFiles;
            grvSSIS.DataBind();

        }

        private void BindSSRS()
        {
            List<FileModel> lstFiles = new List<FileModel>();

            DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/Tutorials/SSRS"));
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
            grvSSRS.DataSource = lstFiles;
            grvSSRS.DataBind();

        }

        private void BindSSAS()
        {
            List<FileModel> lstFiles = new List<FileModel>();

            DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/Tutorials/SSAS"));
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
            grvSSAS.DataSource = lstFiles;
            grvSSAS.DataBind();

        }

        protected void grvFiles_SelectedIndexChanged(object sender, EventArgs e)
        {

            
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