using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.XPath;


namespace ENOSISLEARNING
{
    public partial class EmailManager : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRecord();
            }
        }
        void LoadRecord()
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM email", con);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                ad.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    GridView1.Rows[0].Cells.Clear();
                    GridView1.Rows[0].Cells.Add(new TableCell());
                    GridView1.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                    GridView1.Rows[0].Cells[0].Text = "No Data Found";
                    GridView1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                }
            }
        }
        protected void Btncompose_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$('#mymodal').modal('show');", true);
        }
        protected void BtnSend_Click(object sender, EventArgs e)
        {
            string emailSender = txtname.Text;
            string senderPassword = TextBox1.Text;
            string mailTo = TextBox3.Text;
            string subject = TextBox4.Text;
            string message = TextBox5.Text;

            try
            {
                // Sending email logic
                using (MailMessage mail = new MailMessage())
                {
                    mail.From = new MailAddress(emailSender);
                    mail.To.Add(mailTo);
                    mail.Subject = subject;
                    mail.Body = message;
                    mail.IsBodyHtml = false; // Change to true if your message is HTML

                    if (FileUpload1.HasFile)
                    {
                        string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                        mail.Attachments.Add(new Attachment(FileUpload1.PostedFile.InputStream, FileName));
                    }

                    using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                    {
                        smtp.Credentials = new NetworkCredential(emailSender, senderPassword);
                        smtp.EnableSsl = true; // Set to true if your SMTP server requires SSL

                        smtp.Send(mail);
                        Label7.Text = "Email sent successfully...!";
                    }
                }
                // Save email details to the database
                using (SqlConnection con = new SqlConnection(constr))
                {
                    string query = "INSERT INTO email (Mail_To, Subject, Message) VALUES (@Mail_To, @Subject, @Message)";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Mail_To", mailTo);
                        cmd.Parameters.AddWithValue("@Subject", subject);
                        cmd.Parameters.AddWithValue("@Message", message);

                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                        con.Close();

                        if (rowsAffected > 0)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Email sent and record inserted successfully');", true);
                            LoadRecord();
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Insert failed');", true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write($"Error: {ex.Message}");
            }
        }

        protected void Btnsearch_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = "SELECT * FROM email WHERE Mail_To = @Mail_To";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Mail_To", TxtMail.Text);

                    SqlDataAdapter ad = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    ad.Fill(dt);

                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            LoadRecord();
        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            LoadRecord();
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int key = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
                TextBox text1 = (GridView1.Rows[e.RowIndex].FindControl("txtmailto") as TextBox);
                TextBox text2 = (GridView1.Rows[e.RowIndex].FindControl("txtsubject") as TextBox);
                TextBox text3 = (GridView1.Rows[e.RowIndex].FindControl("txtmessage") as TextBox);

                string query = "UPDATE email SET Mail_To = @Mail_To, Subject = @Subject, Message = @Message WHERE id = @id";

                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Mail_To", text1.Text);
                        cmd.Parameters.AddWithValue("@Subject", text2.Text);
                        cmd.Parameters.AddWithValue("@Message", text3.Text);
                        cmd.Parameters.AddWithValue("@id", key);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }

                GridView1.EditIndex = -1;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Record Updated Successfully');", true);
                LoadRecord();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Record Updation Failed');", true);
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int key = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

                string query = "DELETE FROM email WHERE id = @id";

                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@id", key);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Record Deleted Successfully');", true);
                LoadRecord();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Record Deletion Failed');", true);
            }
        }

        protected void Btnclear_Click(object sender, EventArgs e)
        {
            TxtMail.Text = string.Empty;
            LoadRecord();
        }

        protected void BtnClearModal_Click(object sender, EventArgs e)
        {
            // Clear modal dialog fields
            txtname.Text = string.Empty;
            TextBox1.Text = string.Empty;
            TextBox3.Text = string.Empty;
            TextBox4.Text = string.Empty;
            TextBox5.Text = string.Empty;
            FileUpload1.Attributes.Clear();

            // Re - open the modal
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$('#mymodal').modal('show');", true);

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadRecord();
        }

        protected void Btnexl_Click(object sender, EventArgs e)
        {
            // Server-side validation
            if (!Page.IsValid)
            {
                return;
            }

            Label7.Text = ""; // Clear any previous messages

            if (uploadexl.HasFile)
            {

                string pathname = Server.MapPath("/Downloads/") + uploadexl.FileName;
                uploadexl.SaveAs(pathname);
                //  uploadexl.SaveAs(@"E:/Maya/21STAUG24/ENOSISLEARNING_WEBSITE/ENOSISLEARNING/Downloads/" + uploadexl.FileName);

                string filepath = Server.MapPath("/Downloads/" + uploadexl.FileName);
                string fileExtension = Path.GetExtension(uploadexl.FileName).ToLower();

                if (fileExtension == ".xlsx")
                {
                    using (FileStream fs = new FileStream(filepath, FileMode.Open, FileAccess.Read))
                    using (SpreadsheetDocument doc = SpreadsheetDocument.Open(fs, false))
                    {
                        WorkbookPart workbookPart = doc.WorkbookPart;
                        SharedStringTablePart sstpart = workbookPart.GetPartsOfType<SharedStringTablePart>().FirstOrDefault();
                        SharedStringTable sst = sstpart?.SharedStringTable;

                        WorksheetPart worksheetPart = workbookPart.WorksheetParts.First();
                        Worksheet sheet = worksheetPart.Worksheet;

                        var cells = sheet.Descendants<Cell>();
                        var rows = sheet.Descendants<Row>();

                        Console.WriteLine("Row count = {0}", rows.LongCount());
                        Console.WriteLine("Cell count = {0}", cells.LongCount());

                        // HashSet to accumulate unique email addresses
                        HashSet<string> uniqueEmails = new HashSet<string>();

                        // Go through each cell in the sheet
                        foreach (Cell cell in cells)
                        {
                            string cellText = null;

                            if ((cell.DataType != null) && (cell.DataType == CellValues.SharedString))
                            {
                                int ssid = int.Parse(cell.CellValue.Text);
                                cellText = sst.ChildElements[ssid].InnerText;
                                Console.WriteLine("Shared string {0}: {1}", ssid, cellText);
                            }
                            else if (cell.CellValue != null)
                            {
                                cellText = cell.CellValue.Text;
                                Console.WriteLine("Cell contents: {0}", cellText);
                            }

                            // Add email to the set
                            if (cellText != null)
                            {
                                uniqueEmails.Add(cellText);
                            }
                        }

                        // Convert unique emails to comma-separated string
                        TextBox3.Text = string.Join(",", uniqueEmails);

                        // Re-open the modal
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$('#mymodal').modal('show');", true);
                    }
                }
            }
        }
    }
}

        





