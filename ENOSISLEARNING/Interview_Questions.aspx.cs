using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;


namespace ENOSISLEARNING
{
    public partial class Csharp_Question_Paper : System.Web.UI.Page
    {
      
        dbconnect db = new dbconnect();
        private int Page_size = 10;
        private string course = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            
            try
            {
                if (Request.QueryString["lag"] != null)
                {
                    course = Request.QueryString["lag"].ToString();
                    if (course.Contains("Csharp"))
                    {
                        course = "C# Programming";
                    }
                    if (course.Contains("cpp"))
                    {
                        course = "C++ Programming";
                    }
                    
                }
                else
                {
                    course = "C# Programming";
                }
                lblcourse.Text = course.ToString();
                Session["course"] = lblcourse.Text;
                txtselectcourse.Text = course.ToString();
                if (!IsPostBack)
                {

                    this.GetCustomersPageWise(1);
                    this.bindpostques(1);
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }
        }
        protected void bindquestiondetails()
        {
            try
            {
                string action = "pdf";
                DataTable dt = db.quesdetails(action, course);
                if (dt.Rows.Count != 0)
                {
                    rpquesdetails.DataSource = dt;
                    rpquesdetails.DataBind();
                }
                else
                {
                    rpquesdetails.DataSource = null;
                    rpquesdetails.DataBind();
                }
            }
#pragma warning disable CS0168 // The variable 'ex' is declared but never used
            catch (Exception ex)
#pragma warning restore CS0168 // The variable 'ex' is declared but never used
            {

                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }
        }
     
        private void PopulatePager(int recordCount, int currentPage)
        {
            try
            {
                double dblPageCount = (double)((decimal)recordCount / Convert.ToDecimal(Page_size));
                int pageCount = (int)Math.Ceiling(dblPageCount);
                List<System.Web.UI.WebControls.ListItem> pages = new List<System.Web.UI.WebControls.ListItem>();
                if (pageCount > 0)
                {
                    for (int i = 1; i <= pageCount; i++)
                    {
                        pages.Add(new System.Web.UI.WebControls.ListItem(i.ToString(), i.ToString(), i != currentPage));
                    }
                }
                rptPager.DataSource = pages;
                rptPager.DataBind();
            }
             
            catch (Exception ex)
            {
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }
        }
        private void GetCustomersPageWise(int pageIndex)
        {
            try
            {
            int recordCount=0;
            DataTable idr = db.getQuestionPageWise(pageIndex, Page_size, out recordCount,course);
            
                    rpquesdetails.DataSource = idr;
                    rpquesdetails.DataBind();
                   
                    
                    this.PopulatePager(recordCount, pageIndex);

            }
            catch (Exception ex)
            {
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }
        }
        protected void bindpostques(int pageIndex)
        {
            try
            {
                int recordCount = 0;
                DataTable idr = db.postedquesdetail(pageIndex, Page_size, course, out recordCount);

                rppostques.DataSource = idr;
                rppostques.DataBind();


                this.PopulatePostquesPager(recordCount, pageIndex);
            
             }
            catch (Exception ex)
            {
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);

            }

        }
        private void PopulatePostquesPager(int recordCount, int currentPage)
        {
            try
            {
                double dblPageCount = (double)((decimal)recordCount / Convert.ToDecimal(Page_size));
                int pageCount = (int)Math.Ceiling(dblPageCount);
                List<System.Web.UI.WebControls.ListItem> pages = new List<System.Web.UI.WebControls.ListItem>();
                if (pageCount > 0)
                {
                    for (int i = 1; i <= pageCount; i++)
                    {
                        pages.Add(new System.Web.UI.WebControls.ListItem(i.ToString(), i.ToString(), i != currentPage));
                    }
                }
                rppostquestpager.DataSource = pages;
                rppostquestpager.DataBind();
            }
             
            catch (Exception ex)
            {
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }
        }
     
        protected void btndownload_Click(object sender, EventArgs e)
        {
            try
            {
                string userip = Request.UserHostAddress;
                VisitorTrackerLib.InsertVisitordetailsIPAPIFREE(userip, "DownLoad.aspx");

                Document document = new Document(PageSize.A4, 40f, 40f, 100f, 50f);

                using (System.IO.MemoryStream memoryStream = new System.IO.MemoryStream())
                {
                    PdfWriter writer = PdfWriter.GetInstance(document, memoryStream);

                    writer.PageEvent = new ITextEvents();
                    ITextEvents ic = new ITextEvents();
                    ic.getcourse(course);


                    document.Open();

                    string action = "pdf";
                    DataTable dt = db.quesdetails(action, course);
                    iTextSharp.text.Font baseFontBig = new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 10f, iTextSharp.text.Font.NORMAL, iTextSharp.text.BaseColor.BLACK);
                    string content = null;
                    if (dt.Rows.Count != 0)
                    {
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            content += "Ques." + dt.Rows[i][0].ToString() + " " + dt.Rows[i][1].ToString() + "\n" + "Ans. " + dt.Rows[i][2].ToString() + "\n\n";

                        }

                    }

                    Paragraph para = new Paragraph(content, baseFontBig);

                    para.Alignment = Element.ALIGN_JUSTIFIED;
                    //para.SpacingBefore = 300f;
                    para.SetLeading(0.5f, 2.0f);

                    document.Add(para);
                    document.NewPage();


                    document.Close();
                    byte[] bytes = memoryStream.ToArray();
                    memoryStream.Close();
                    Response.Clear();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("Content-Disposition", "attachment; filename=" + course + "interview_ques.pdf");

                    Response.Buffer = true;
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.BinaryWrite(bytes);
                    Response.End();
                    Response.Close();

                }
            }
            catch (Exception ex)
            {
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }


        }
    

        protected void lnkPage_Click(object sender, EventArgs e)
        {
            try
            {
                int pageIndex = int.Parse((sender as LinkButton).CommandArgument);
                this.GetCustomersPageWise(pageIndex);
            }
             
            catch (Exception ex)
            {
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }

        }
        protected void lnkPage_Click1(object sender, EventArgs e)
        {
            try
            {
                int pageIndex = int.Parse((sender as LinkButton).CommandArgument);
                this.bindpostques(pageIndex);
            }

            catch (Exception ex)
            {
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }

        }

        protected void btnpost_Click(object sender, EventArgs e)
        {
            try
            {
               
                
                    int result = db.postques(txtpost.Text, course,txtemail.Text,1);
                    if (result != 0)
                    {
                        Response.Write("<script language=javascript>alert('Question Posted Sucessfully')</script>");
                        
                    }
                    else
                    {
                        Response.Write("<script language=javascript>alert('Something Went Wrong')</script>");
                    }
                    this.bindpostques(1);   
            }
              

            catch (Exception ex)
            {
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }
        }
    }
}