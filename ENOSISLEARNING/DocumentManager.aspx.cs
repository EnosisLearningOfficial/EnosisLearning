using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Xml.Linq;


namespace ENOSISLEARNING
{
    public partial class DocumentManager : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getbind();
            }
        }
        protected void getbind()
        {
            SqlCommand cmd = new SqlCommand("select *from DocumentUpload9", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
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

        protected void Btnsearch_Click(object sender, EventArgs e)
        {
            string query = "SELECT * FROM DocumentUpload9 WHERE DocumentName = @DocumentName";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@DocumentName", txtdocname.Text);

                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                ad.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        //protected void btnadd_Click(object sender, EventArgs e)
        //{
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$('#myModal').modal('show');", true);
        //}

        protected void Btnsave_Click(object sender, EventArgs e)
        {
            string DocName = txtname.Text;
            if (FileUpload1.HasFile)
            {
                try
                {
                    // Extract the file name from the uploaded file
                    string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);

                    // Save the file in the "/Docu/" folder in the web application
                    string filePath = Server.MapPath("~/Docu/") + fileName;
                    FileUpload1.SaveAs(filePath);

                    // Insert the document name and the file name (not the full path) into the database
                    SqlCommand cmd = new SqlCommand("INSERT INTO DocumentUpload9 (DocumentName, DocumentFile) VALUES (@DocumentName, @DocumentFile)", con);
                    cmd.Parameters.AddWithValue("@DocumentName", DocName);
                    cmd.Parameters.AddWithValue("@DocumentFile", fileName);

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    con.Close();
                    txtname.Text = "";

                    if (rowsAffected > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('File uploaded and record inserted successfully');", true);
                        getbind();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Insert failed');", true);
                    }
                    ClerField();
                }
                catch (Exception ex)
                {
                    Response.Write($"Error: {ex.Message}");
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please select a file to upload');", true);
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            getbind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            getbind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

                string query = "DELETE FROM DocumentUpload9 WHERE docId = @docId";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@docId", id);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }


                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Record Deleted Successfully');", true);
                getbind();
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Record Deletion Failed');", true);
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            string name = (GridView1.Rows[e.RowIndex].FindControl("txtdname") as TextBox).Text;
            FileUpload fileUpload = GridView1.Rows[e.RowIndex].FindControl("txtpath") as FileUpload;

            string filePath = null;
            if (fileUpload.HasFile)
            {
                try
                {
                    string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
                    filePath = Server.MapPath("~/Docu/") + fileName;
                    fileUpload.SaveAs(filePath);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", $"alert('Error: {ex.Message}');", true);
                    return; // Exit the method on error
                }
            }
            else
            {
                // If no file was uploaded, you may want to handle this scenario.
                // For now, if no file is uploaded, set filePath to the existing file path or handle accordingly.
                filePath = (GridView1.Rows[e.RowIndex].FindControl("lblpath") as Label).Text;
            }

            try
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE DocumentUpload9 SET DocumentName = @DocumentName, DocumentFile = @DocumentFile WHERE docId = @docId", con))
                {
                    cmd.Parameters.AddWithValue("@docId", id);
                    cmd.Parameters.AddWithValue("@DocumentName", name);
                    cmd.Parameters.AddWithValue("@DocumentFile", filePath);

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    con.Close();

                    if (rowsAffected > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('File Updated successfully');", true);
                        GridView1.EditIndex = -1;
                        getbind(); // Rebind the GridView
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Update failed');", true);
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", $"alert('Error: {ex.Message}');", true);
            }
        }


        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
           

            if (GridView1.PageIndex == 0 && e.NewPageIndex < 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showWarning", "alert('You are already on the first page.');", true);
                e.Cancel = true;
            }
            else
            {
                GridView1.PageIndex = e.NewPageIndex;
                getbind();
            }
        }
        public void ClerField()
        {
            txtdocname.Text = string.Empty;
            txtname.Text = "";


            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$('#myModal').modal('show');", true);

        }
        protected void Btnsearch_Click1(object sender, EventArgs e)
        {
            string query = "SELECT * FROM DocumentUpload9 WHERE DocumentName = @DocumentName";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@DocumentName", txtdocname.Text);

                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                ad.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            ClerField();
        }

        protected void ViewAll_Click(object sender, EventArgs e)
        {
            getbind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewDocument")
            {
                string fileName = e.CommandArgument.ToString();
                string filePath = Server.MapPath("~/Docu/") + fileName;
                string fileExtension = System.IO.Path.GetExtension(fileName).ToLower();

                // Determine the MIME type
                string mimeType = "";

                switch (fileExtension)
                {
                    case ".xls":
                    case ".xlsx":
                        mimeType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                        break;
                    case ".doc":
                    case ".docx":
                        mimeType = "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
                        break;
                    case ".ppt":
                    case ".pptx":
                        mimeType = "application/vnd.openxmlformats-officedocument.presentationml.presentation";
                        break;
                    case ".pdf":
                        mimeType = "application/pdf";
                        break;
                    default:
                        mimeType = "application/octet-stream"; // Fallback for unknown types
                        break;
                }

                Response.ContentType = mimeType;

                // Try to open the file in the browser
                Response.AppendHeader("Content-Disposition", "inline; filename=" + fileName);
                Response.TransmitFile(filePath);
                Response.End();
            }
          }
      }
   }
    
    


