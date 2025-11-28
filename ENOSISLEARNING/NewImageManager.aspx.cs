using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ENOSISLEARNING
{
    public partial class NewImagelider : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getbind();
                bindImg();

            }
        }

        protected void getbind()
        {
            SqlCommand cmd = new SqlCommand("select *from [ImageUpload]", con);
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

        protected void bindImg()
        {
            string dirPath = Server.MapPath("~/Docu/");
            if (Directory.Exists(dirPath))
            {
                var images = Directory.GetFiles(dirPath);
                bool isActiveSet = false;

                for (int i = 0; i < images.Length; i++)
                {
                    string imageName = Path.GetFileName(images[i]);
                    string indicator = $"<li data-target='#carouselExampleIndicators' data-slide-to='{i}' class='{(isActiveSet ? "" : "active")}'></li>";
                    string carouselItem = $@"
                        <div class='carousel-item {(isActiveSet ? "" : "active")}'>
                            <img src='Docu/{imageName}' alt='Image' width='100%' height='350px'>
                        </div>";

                    carouselIndicators.Controls.Add(new LiteralControl(indicator));
                    carouselInner.Controls.Add(new LiteralControl(carouselItem));

                    isActiveSet = true;
                }
            }
        }

        protected void LoadAllImagePaths()
        {
            SqlCommand cmd = new SqlCommand("SELECT filePath FROM [ImageUpload]", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            List<string> imagePaths = new List<string>();
            foreach (DataRow row in dt.Rows)
            {
                imagePaths.Add(row["filePath"].ToString());
            }
            //hfImagePaths.Value = string.Join(",", imagePaths);
        }

        protected void Btnsearch_Click(object sender, EventArgs e)
        {
            string query = "SELECT * FROM [ImageUpload] WHERE ImageName = @ImageName";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@ImageName", txtdocname.Text);

                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                ad.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }


        protected void Btnsave_Click(object sender, EventArgs e)
        {
            string DocName = txtname.Text;
            if (FileUpload1.HasFile)
            {
                try
                {
                    string ImgName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    string fileExtension = Path.GetExtension(ImgName).ToLower();
                    string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };

                    if (Array.Exists(allowedExtensions, ext => ext == fileExtension))
                    {
                        string relativePath = "~/Docu/" + ImgName;
                        string filePath = Server.MapPath(relativePath);
                        FileUpload1.SaveAs(filePath);

                        SqlCommand cmd = new SqlCommand("INSERT INTO [ImageUpload](ImageName, filePath) VALUES (@ImageName, @filePath)", con);
                        cmd.Parameters.AddWithValue("@ImageName", DocName);
                        cmd.Parameters.AddWithValue("@filePath", relativePath);

                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                        con.Close();
                        txtname.Text = "";

                        if (rowsAffected > 0)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Image uploaded and record inserted successfully');", true);
                            getbind();
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Insert failed');", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Only image files (.jpg, .jpeg, .png, .gif) are allowed');", true);
                    }
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

                string query = "DELETE FROM [ImageUpload] WHERE imgId = @imgId";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@imgId", id);

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

            if (fileUpload.HasFile)
            {
                // File upload logic
                try
                {
                    string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
                    string relativePath = "~/Docu/" + fileName;
                    string filePath = Server.MapPath(relativePath);
                    fileUpload.SaveAs(filePath);

                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ToString()))
                    {
                        SqlCommand cmd = new SqlCommand("UPDATE [ImageUpload] SET ImageName = @ImageName, filePath = @filePath WHERE imgId = @imgId", con);
                        cmd.Parameters.AddWithValue("@imgId", id);
                        cmd.Parameters.AddWithValue("@ImageName", name);
                        cmd.Parameters.AddWithValue("@filePath", relativePath);

                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Image Updated successfully');", true);
                            GridView1.EditIndex = -1; // Reset the edit index
                            getbind();
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Update failed');", true);
                        }
                    }
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
        
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            getbind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                try
                {
                    // Get the row index from the command argument
                    int index = Convert.ToInt32(e.CommandArgument);

                    // Get the file path from the GridView
                    GridViewRow row = GridView1.Rows[index];
                    string filePath = ((Label)row.FindControl("lblpath")).Text;

                    // Open the image in a new tab or window
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "OpenImage", $"window.open('{ResolveUrl(filePath)}', '_blank');", true);
                }
                catch (Exception ex)
                {
                    // Handle the exception (e.g., log it and/or show a message to the user)
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ErrorAlert", $"alert('An error occurred while trying to open the image: {ex.Message}');", true);
                }
            }
        }

        protected void Btnclear_Click(object sender, EventArgs e)
        {
            txtdocname.Text = string.Empty;

        }
        protected void Cancel_Click(object sender, EventArgs e)
        {
            getbind();
        }
    }
}