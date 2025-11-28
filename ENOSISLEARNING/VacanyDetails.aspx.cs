using System;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;
using System.Text;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DocumentFormat.OpenXml.Bibliography;
using System.EnterpriseServices.Internal;
using System.Drawing.Imaging;
using System.Drawing;

namespace ENOSISLEARNING
{
    //Maya: VacanyDetails 07-07-2025
    public partial class VacanyDetails : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString());
        string ConnectionString = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //string jobCode = Request.QueryString["JobCode"];
                //txtJobID.Text = jobCode;
                string jobCode = Request.QueryString["JobCode"];

                if (!string.IsNullOrEmpty(jobCode))
                {
                    // Call the method to fetch and bind the job details
                    GetJobDetails(jobCode);
                }
                else
                {
                    // Handle the case when JobCode is not provided in the query string
                    Response.Write("Invalid JobCode.");
                }

            }
        }
        public void GetJobDetails(string jobCode)
        {
            string query = "SELECT * FROM VACANCYDETAILS WHERE JOBCODE = @JobCode";

            try
            {
                using (SqlConnection con = new SqlConnection(ConnectionString))
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Adding the parameter for JobCode
                    cmd.Parameters.AddWithValue("@JobCode", jobCode);

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        // Create a DataTable to hold the data
                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        // Bind the DataTable to the Repeater control
                        rptJobDetails.DataSource = dt;
                        rptJobDetails.DataBind();
                    }
                    else
                    {
                        // If no job details found, handle appropriately
                        Response.Write("No job details found for the given JobCode.");
                    }

                    reader.Close();
                }
            }
            catch (Exception ex)
            {
                // Log or display any error message
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", $"alert('Error: {ex.Message}')", true);
            }
        }

        protected void btnPDF_Click(object sender, EventArgs e)
        {
            Document pdfDoc = new Document(PageSize.A4);

            // Create a memory stream to hold the PDF data
            using (MemoryStream ms = new MemoryStream())
            {
                // Create a PdfWriter instance to write the document to the memory stream
                PdfWriter writer = PdfWriter.GetInstance(pdfDoc, ms);

                // Open the document to begin writing
                pdfDoc.Open();

                // Add a title to the document
                pdfDoc.Add(new Paragraph("Job Details"));

                // Add logo to the document
                string logoPath = Server.MapPath("~/Images/enosislogo.PNG"); // Path to your logo
                if (File.Exists(logoPath))
                {
                    iTextSharp.text.Image logo = iTextSharp.text.Image.GetInstance(logoPath);
                    logo.ScaleToFit(250f, 250f); // Resize the logo
                    logo.Alignment = Element.ALIGN_CENTER;
                    pdfDoc.Add(logo);
                }

                // Add a separator line
                pdfDoc.Add(new Chunk("\n"));
                pdfDoc.Add(new Chunk("----------------------------------------------------------"));
                pdfDoc.Add(new Chunk("\n"));
                // Iterate through the items in the Repeater control and add the data to the PDF
                foreach (RepeaterItem item in rptJobDetails.Items)
                {
                    // Extract data from controls inside the Repeater (e.g., TextBox, Label)
                    string positionName = ((TextBox)item.FindControl("txtPositionName")).Text;
                    string skills = ((TextBox)item.FindControl("txtSkills")).Text;
                    string location = ((TextBox)item.FindControl("txtLocation")).Text;
                    string experience = ((TextBox)item.FindControl("txtExperience")).Text;
                    string salary = ((TextBox)item.FindControl("txtSalary")).Text;
                    string qualification = ((TextBox)item.FindControl("txtQualification")).Text;
                    string companyName = ((TextBox)item.FindControl("txtCompanyName")).Text;
                    string companyEmail = ((TextBox)item.FindControl("txtCONTACTEMAILID")).Text;
                    string companyPhone = ((TextBox)item.FindControl("txtCOMPANYPHONENO")).Text;
                    string companyWebsite = ((TextBox)item.FindControl("txtCOMPANYWEBSITE")).Text;
                    string jobDescription = ((TextBox)item.FindControl("txtJOBDESCRIPTION")).Text;

                    // Add the data to the PDF
                    pdfDoc.Add(new Paragraph($"Position: {positionName}"));
                    pdfDoc.Add(new Paragraph($"Skills: {skills}"));
                    pdfDoc.Add(new Paragraph($"Location: {location}"));
                    pdfDoc.Add(new Paragraph($"Experience: {experience}"));
                    pdfDoc.Add(new Paragraph($"Salary: {salary}"));
                    pdfDoc.Add(new Paragraph($"Qualification: {qualification}"));
                    pdfDoc.Add(new Paragraph($"Company: {companyName}"));
                    pdfDoc.Add(new Paragraph($"Email: {companyEmail}"));
                    pdfDoc.Add(new Paragraph($"Phone: {companyPhone}"));
                    pdfDoc.Add(new Paragraph($"Website: {companyWebsite}"));
                    pdfDoc.Add(new Paragraph($"Job Description: {jobDescription}"));
                    pdfDoc.Add(new Paragraph("----------------------------------------------------------"));
                }

                // Close the document
                pdfDoc.Close();

                // Write the memory stream content to the Response output
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=JobDetails.pdf");
                Response.OutputStream.Write(ms.ToArray(), 0, ms.ToArray().Length);
                Response.End();
            }
        }

       

        protected void btnImages_Click(object sender, EventArgs e)
        {
            int width = 600;
            int height = 1000;
            using (Bitmap bitmap = new Bitmap(width, height))
            using (Graphics graphics = Graphics.FromImage(bitmap))
            {
                graphics.Clear(Color.White);
                System.Drawing.Font font = new System.Drawing.Font("Arial", 12);
                Brush brush = Brushes.Black;
                float x = 20, y = 20;

                string logoPath = Server.MapPath("~/Images/enosislogo.PNG");
                if (File.Exists(logoPath))
                {
                    using (System.Drawing.Image logo = System.Drawing.Image.FromFile(logoPath))
                    {
                        int logoWidth = 100;
                        int logoHeight = 100;
                        int logoX = (width - logoWidth) / 2;
                        int logoY = 20;
                        graphics.DrawImage(logo, new PointF(logoX, logoY));
                        y = logoY + logoHeight + 10;
                    }
                }

                foreach (RepeaterItem item in rptJobDetails.Items)
                {
                    string positionName = ((TextBox)item.FindControl("txtPositionName")).Text;
                    string skills = ((TextBox)item.FindControl("txtSkills")).Text;
                    string location = ((TextBox)item.FindControl("txtLocation")).Text;
                    string experience = ((TextBox)item.FindControl("txtExperience")).Text;
                    string salary = ((TextBox)item.FindControl("txtSalary")).Text;
                    string qualification = ((TextBox)item.FindControl("txtQualification")).Text;
                    string companyName = ((TextBox)item.FindControl("txtCompanyName")).Text;
                    string companyEmail = ((TextBox)item.FindControl("txtCONTACTEMAILID")).Text;
                    string companyPhone = ((TextBox)item.FindControl("txtCOMPANYPHONENO")).Text;
                    string companyWebsite = ((TextBox)item.FindControl("txtCOMPANYWEBSITE")).Text;
                    string jobDescription = ((TextBox)item.FindControl("txtJOBDESCRIPTION")).Text;

                    graphics.DrawString($"Position: {positionName}", font, brush, new PointF(x, y)); y += 20;
                    graphics.DrawString($"Skills: {skills}", font, brush, new PointF(x, y)); y += 20;
                    graphics.DrawString($"Location: {location}", font, brush, new PointF(x, y)); y += 20;
                    graphics.DrawString($"Experience: {experience}", font, brush, new PointF(x, y)); y += 20;
                    graphics.DrawString($"Salary: {salary}", font, brush, new PointF(x, y)); y += 20;
                    graphics.DrawString($"Qualification: {qualification}", font, brush, new PointF(x, y)); y += 20;
                    graphics.DrawString($"Company: {companyName}", font, brush, new PointF(x, y)); y += 20;
                    graphics.DrawString($"Email: {companyEmail}", font, brush, new PointF(x, y)); y += 20;
                    graphics.DrawString($"Phone: {companyPhone}", font, brush, new PointF(x, y)); y += 20;
                    graphics.DrawString($"Website: {companyWebsite}", font, brush, new PointF(x, y)); y += 20;
                    graphics.DrawString($"Job Description: {jobDescription}", font, brush, new PointF(x, y)); y += 40;
                    graphics.DrawString("------------------------------------------------------------", font, brush, new PointF(x, y)); y += 20;
                }

                // Option 1: Save to folder (ensure directory exists)
                /*
                string folderPath = Server.MapPath("~/GeneratedImages/");
                if (!Directory.Exists(folderPath)) Directory.CreateDirectory(folderPath);
                string filePath = Path.Combine(folderPath, "JobDetails.png");
                bitmap.Save(filePath, ImageFormat.Png);

                FileInfo fileInfo = new FileInfo(filePath);
                if (fileInfo.Exists)
                {
                    Response.Clear();
                    Response.ContentType = "image/png";
                    Response.AddHeader("Content-Disposition", "attachment; filename=JobDetails.png");
                    Response.WriteFile(filePath);
                    Response.End();
                }
                */

                // Option 2: Stream to browser directly (Recommended)
                using (MemoryStream ms = new MemoryStream())
                {
                    bitmap.Save(ms, ImageFormat.Png);
                    byte[] byteImage = ms.ToArray();

                    Response.Clear();
                    Response.ContentType = "image/png";
                    Response.AddHeader("Content-Disposition", "attachment; filename=JobDetails.png");
                    Response.BinaryWrite(byteImage);
                    Response.End();
                }
            }
        }

    }
}