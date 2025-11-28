using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Web;
using System.Web.Services;
using System.Web.UI.WebControls;

namespace ENOSISLEARNING
{
    public partial class PhotoClickByCamera : System.Web.UI.Page
    {

        string constr = System.Configuration.ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid()
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM PhotoClickByCamera", con);
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

        [WebMethod]
        public static string SaveImage(string imageData, string name)
        {
            string filePath = "";
            try
            {
                byte[] imageBytes = Convert.FromBase64String(imageData.Split(',')[1]);
                using (MemoryStream ms = new MemoryStream(imageBytes))
                {
                    using (Bitmap bitmap = new Bitmap(ms))
                    {
                        string fileName = name + "_" + DateTime.Now.ToString("yyyyMMddHHmmssfff") + ".jpeg";
                        filePath = "~/Images/" + fileName;
                        string serverPath = System.Web.HttpContext.Current.Server.MapPath(filePath);
                        bitmap.Save(serverPath, ImageFormat.Jpeg);
                    }
                }

                string constr = System.Configuration.ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO PhotoClickByCamera (Name, ImagePath) VALUES (@Name, @ImagePath)"))
                    {
                        cmd.Parameters.AddWithValue("@Name", name);
                        cmd.Parameters.AddWithValue("@ImagePath", filePath);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();

                    }

                }

                DataTable dt = new DataTable();
                using (SqlConnection con = new SqlConnection(constr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM PhotoClickByCamera", con);
                    SqlDataAdapter ad = new SqlDataAdapter(cmd);

                    ad.Fill(dt);
                }

                var json = JsonConvert.SerializeObject(dt, new JsonSerializerSettings
                {
                    ReferenceLoopHandling = ReferenceLoopHandling.Ignore

                });
                return json;
            }
            catch (Exception)
            {
                return null;// "Error: " + ex.Message;
            }
        }

        [WebMethod]
        public static string DeleteImage(string ID)
        {
            try
            {
                string constr = System.Configuration.ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("Delete from PhotoClickByCamera where id='"+ID+"'"))
                    {                       
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }

                }

                DataTable dt = new DataTable();
                using (SqlConnection con = new SqlConnection(constr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM PhotoClickByCamera", con);
                    SqlDataAdapter ad = new SqlDataAdapter(cmd);

                    ad.Fill(dt);
                }

                var json = JsonConvert.SerializeObject(dt, new JsonSerializerSettings
                {
                    ReferenceLoopHandling = ReferenceLoopHandling.Ignore

                });
                return json;
            }
            catch (Exception ex)
            {
                return "fail";
                throw ex; 
            }
        }
        [WebMethod]
        public static string UpdateImage(int ID, string Name, string ImagePath)
        {
            try
            {
                string constr = System.Configuration.ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    
                    string query = "UPDATE PhotoClickByCamera SET Name = '"+ Name + "', ImagePath = '"+ ImagePath + "' WHERE id = '"+ ID + "'";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {                        
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }

                // Fetch the updated data to return
                DataTable dt = new DataTable();
                using (SqlConnection con = new SqlConnection(constr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM PhotoClickByCamera", con);
                    SqlDataAdapter ad = new SqlDataAdapter(cmd);
                    ad.Fill(dt);
                }

                var json = JsonConvert.SerializeObject(dt, new JsonSerializerSettings
                {
                    ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                });

                return json;
            }
            catch (Exception ex)
            {
                return "fail";
                throw ex;
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGrid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string name = (row.FindControl("txtName") as TextBox).Text;
                string imagePath = (row.FindControl("txtImagePath") as TextBox).Text;

                string constr = System.Configuration.ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("UPDATE PhotoClickByCamera SET Name = @Name, ImagePath = @ImagePath WHERE id = @id"))
                    {
                        cmd.Parameters.AddWithValue("@id", id);
                        cmd.Parameters.AddWithValue("@Name", name);
                        cmd.Parameters.AddWithValue("@ImagePath", imagePath);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }

                ClientScript.RegisterStartupScript(this.GetType(), "updateAlert", "alert('Record updated successfully!');", true);
            }
            catch (Exception ex)
            {
                // Handle exception
                ClientScript.RegisterStartupScript(this.GetType(), "updateAlert", $"alert('Error: {ex.Message}');", true);
            }

            GridView1.EditIndex = -1;
            BindGrid();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string constr = System.Configuration.ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM PhotoClickByCamera WHERE id = @id"))
                    {
                        cmd.Parameters.AddWithValue("@id", id);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }

                ClientScript.RegisterStartupScript(this.GetType(), "deleteAlert", "alert('Record deleted successfully!');", true);
            }
            catch (Exception ex)
            {
                // Handle exception
                ClientScript.RegisterStartupScript(this.GetType(), "deleteAlert", $"alert('Error: {ex.Message}');", true);
            }

            BindGrid();
        }

        protected void Btnclear_Click(object sender, EventArgs e)
        {
            TxtName.Text = string.Empty;
            BindGrid();
        }

        protected void BtnSearchh_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            string searchTerm = TxtName.Text.Trim();
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM PhotoClickByCamera WHERE Name LIKE @SearchTerm", con);
                cmd.Parameters.AddWithValue("@SearchTerm", "%" + searchTerm + "%");
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                ad.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGrid();

        }
        
    }
}