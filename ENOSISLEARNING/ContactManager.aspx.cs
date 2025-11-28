using ENOSISLEARNING.Entity;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DocumentFormat.OpenXml.Spreadsheet;
using AjaxControlToolkit;
using System.Web.UI.HtmlControls;

namespace ENOSISLEARNING
{
    public partial class ContactManager : System.Web.UI.Page
    {
        Contactmanager01 Objcontactmanager01 = new Contactmanager01();
        BLContactmanager ObjBLContactmanager = new BLContactmanager();
        DataTable dt = new DataTable();


        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString());
        string ConnectionString = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {

                    if (hdnFirstModalOpen.Value == "open")
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "openModal", "openModal();", true);
                    }

                    DataBind();
                    CateoryDrp();
                    CateoryDrp2();

                }
            }
            catch (Exception ex)
            {
                //lblError.Text = ex.Message;
                throw;
            }
        }
        private void DataBind()
        {
            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter dataAdapter = new SqlDataAdapter("SELECT * FROM tbl_CategoryManager ORDER BY CategoryId DESC", ConnectionString);
                dataAdapter.Fill(dt);
                gvCategory.DataSource = dt;
                gvCategory.DataBind();
            }
            catch (Exception ex)
            {
                //lblError.Text = ex.Message;
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            try
            {
                Contactmanager01 Objcontactmanager01 = new Contactmanager01();
                BLContactmanager objBLContactmanager = new BLContactmanager();

                int categoryId = string.IsNullOrWhiteSpace(TxtCategoryNo.Text.Trim()) ? 0 : Convert.ToInt32(TxtCategoryNo.Text.Trim());
                Objcontactmanager01.intCategoryId = categoryId;
                Objcontactmanager01.strName = TxtFullName.Text.Trim();
                Objcontactmanager01.strEmail = TxtEmailID.Text.Trim();
                Objcontactmanager01.strMobile = TxtMobileNo.Text.Trim();

                if (CategoryDrp2.SelectedIndex != 0)
                {
                    string Category = CategoryDrp2.SelectedItem.Text;
                    TxtCategoryName.Text = Category;
                    Objcontactmanager01.strCategoryName = TxtCategoryName.Text.Trim();
                }
                else
                {
                    Objcontactmanager01.strCategoryName = TxtCategoryName.Text.Trim();
                }

                Objcontactmanager01.strComments = TxtComments.Text.Trim();
                Objcontactmanager01.strAddress = TextAddress.Text.Trim();
                Objcontactmanager01.strWebsite = TextWebsite.Text.Trim();

                // Get the rating value
                Objcontactmanager01.strRating = RatingList.SelectedValue;

                Objcontactmanager01.strflag = "SaveData";
                objBLContactmanager.fnsaveDetail(Objcontactmanager01);

                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Record Inserted Successfully........ !')", true);
                ClerField();
                DataBind();
                CateoryDrp();
                CateoryDrp2();
                hdnFirstModalOpen.Value = "true";
            }
            catch (Exception ex)
            {
               // lblError.Text = ex.Message;
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Record Not Inserted !')", true);
            }
        }

        protected void gvCategory_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowState.HasFlag(DataControlRowState.Edit))
            {
                CateoryDrpDDL(e.Row);
            }

            if (e.Row.RowType == DataControlRowType.DataRow && !e.Row.RowState.HasFlag(DataControlRowState.Edit))

                try
                {
                    dt.Clear();
                    Objcontactmanager01.strflag = "GetEmployeefillgrd";
                    dt = ObjBLContactmanager.FnGetAllCategoryData(Objcontactmanager01);
                    if (dt != null)
                    {
                        if (dt.Rows.Count > 0)
                        {
                            gvCategory.DataSource = dt;
                            gvCategory.DataBind();
                        }
                        else
                        {
                            gvCategory.DataSource = null;
                            gvCategory.DataBind();
                        }
                    }
                }
                catch(Exception ex)
                {
                   // lblError.Text = ex.Message;
                }
        }

        protected void gvCategory_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                gvCategory.EditIndex = e.NewEditIndex;
                DataBind(); // Rebind the grid

                // Bind the dropdown in the edited row
                DropDownList CategoryDrp3 = (DropDownList)gvCategory.Rows[e.NewEditIndex].FindControl("CategoryDrp3");
                //CateoryDrp3(); // Populate the dropdown
            }
            catch (Exception ex)
            {
               // lblError.Text = ex.Message;
                throw;
            }
        }
        protected void gvCategory_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCategory.EditIndex = -1;
            DataBind();
        }

        protected void gvCategory_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow grv = (GridViewRow)gvCategory.Rows[e.RowIndex];
                int id = Convert.ToInt32(gvCategory.DataKeys[e.RowIndex].Values["Categoryid"].ToString());

                // Retrieve controls
                TextBox Name = (TextBox)grv.FindControl("NameTxt") as TextBox;
                TextBox Email = (TextBox)grv.FindControl("txtEEmail") as TextBox;
                TextBox Contact = (TextBox)grv.FindControl("txtEMobile") as TextBox;
                DropDownList Category = (DropDownList)grv.FindControl("CategoryDrp3") as DropDownList;
                TextBox Comment = (TextBox)grv.FindControl("txtEREMARKS") as TextBox;
                TextBox Address = (TextBox)grv.FindControl("textEAddress") as TextBox;
                TextBox Website = (TextBox)grv.FindControl("textEWebsite") as TextBox;
                RadioButtonList rblRating = (RadioButtonList)grv.FindControl("rblRating");
                Label EditLabel = (Label)grv.FindControl("EdittxtCategoryName") as Label;
                Label EditLabelR = (Label)grv.FindControl("EditlblRating") as Label;

                // Determine the rating value to use
                int rating;
                if (rblRating.SelectedValue != null)
                {
                    // Use the selected rating from the RadioButtonList
                    rating = int.Parse(rblRating.SelectedValue);
                }
                else
                {
                    // Fallback to the label's rating value if no selection is made
                    int.TryParse(EditLabelR.Text, out rating);
                }

                // Determine which value to use for CategoryName
                string categoryName = Category.SelectedValue;
                if (string.IsNullOrEmpty(categoryName))
                {
                    // Use the label's text if dropdown has no selected value
                    categoryName = EditLabel.Text;
                }

                // Update database
                con.Open();
                string updateQuery = "UPDATE tbl_CategoryManager SET Name = @Name, Email = @Email, Mobile = @Mobile, CategoryName = @CategoryName, Comments = @Comments, Address = @Address, Website = @Website, Rating = @Rating WHERE CategoryId = @CategoryId";

                using (SqlCommand cmd = new SqlCommand(updateQuery, con))
                {
                    cmd.Parameters.AddWithValue("@Name", Name.Text);
                    cmd.Parameters.AddWithValue("@Email", Email.Text);
                    cmd.Parameters.AddWithValue("@Mobile", Contact.Text);
                    cmd.Parameters.AddWithValue("@CategoryName", categoryName);  // Use the determined CategoryName
                    cmd.Parameters.AddWithValue("@Comments", Comment.Text);
                    cmd.Parameters.AddWithValue("@Address", Address.Text);
                    cmd.Parameters.AddWithValue("@Website", Website.Text);
                    cmd.Parameters.AddWithValue("@Rating", rating);
                    cmd.Parameters.AddWithValue("@CategoryId", id);

                    cmd.ExecuteNonQuery();
                }
                con.Close();

                gvCategory.EditIndex = -1;
                DataBind();
            }
            catch (Exception ex)
            {
               // lblError.Text = ex.Message;
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Record Not Updated!')", true);
            }
        }

        protected string GetRatingStars(object ratingObj)
        {
            try
            {
                int rating;
                if (int.TryParse(ratingObj.ToString(), out rating))
                {
                    return new string('★', rating); // Repeat ★ based on the rating value
                }
                return string.Empty; // Return empty if parsing fails
            }
            catch (Exception ex)
            {
               // lblError.Text = ex.Message;
                throw;
            }
        }

        protected void gvCategory_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(gvCategory.DataKeys[e.RowIndex].Values["Categoryid"].ToString());
                con.Open();
                SqlCommand cmd = new SqlCommand("delete tbl_CategoryManager where CategoryId=" + id, con);
                cmd.ExecuteNonQuery();
                con.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('record Deleted');", true);
                DataBind();
            }
            catch (Exception ex)
            {
               // lblError.Text = ex.Message;
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('No record found!')", true);
            }
        }


        protected void gvCategory_DataBound(object sender, EventArgs e)
        {
            try
            {
                dt.Clear();
                Objcontactmanager01.strflag = "GetEmployeefillgrd";
                dt = ObjBLContactmanager.FnGetAllCategoryData(Objcontactmanager01);
                if (dt != null)
                {
                    if (dt.Rows.Count > 0)
                    {
                        gvCategory.DataSource = dt;
                        gvCategory.DataBind();
                    }
                    else
                    {
                        gvCategory.DataSource = null;
                        gvCategory.DataBind();
                    }
                }
            }
            catch(Exception ex)
            {
               // lblError.Text = ex.Message;
            }
        }

        protected void gvCategory_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "AddNew")
                {
                    TextBox Name = (TextBox)gvCategory.FooterRow.FindControl("txtFName") as TextBox;
                    TextBox Email = (TextBox)gvCategory.FooterRow.FindControl("txtFEmail") as TextBox;
                    TextBox Contact = (TextBox)gvCategory.FooterRow.FindControl("txtFMobile") as TextBox;
                    TextBox Cateogary = (TextBox)gvCategory.FooterRow.FindControl("txtFCategoryName") as TextBox;
                    TextBox Comment = (TextBox)gvCategory.FooterRow.FindControl("txtFREMARKS") as TextBox;
                    TextBox Address = (TextBox)gvCategory.FooterRow.FindControl("txtFAddress") as TextBox;
                    TextBox Website = (TextBox)gvCategory.FooterRow.FindControl("txtFWebsite") as TextBox;
                    con.Open();
                    SqlCommand Cmd = new SqlCommand("insert into tbl_CategoryManager(Name,Email,Mobile,CategoryName,Comment)values('" + Name.Text + "','" + Email.Text + "','" + Contact.Text + "','" + Cateogary.Text + "','" + Comment.Text + "','" + Address.Text + "','" + Website.Text + "')", con);
                    Cmd.ExecuteNonQuery();
                    con.Close();
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('record Inserted');", true);
                    DataBind();
                }
            }
            catch (Exception ex)
            {
                //lblError.Text = ex.Message;
                throw;
            }
        }

        public void ClerField()
        {
            try
            {
                TxtCategoryNo.Text = string.Empty;
                TxtFullName.Text = "";
                TxtEmailID.Text = "";
                TxtMobileNo.Text = "";
                TxtComments.Text = "";
                TxtCategoryName.Text = "";
                txtName.Text = "";
                txtMobNo.Text = "";
                TextAddress.Text = string.Empty;
                TextWebsite.Text = string.Empty;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$('#myModal').modal('show');", true);
            }
            catch (Exception ex)
            {
                //lblError.Text = ex.Message;
                throw;
            }

        }
        protected void ClearSearch_Click1(object sender, EventArgs e)
        {
            ClerField();

        }
        void CateoryDrp()
        {
            try
            {
                // Fetch data from database or any other source
                DataTable data = GetDataFromDatabase();

                // Bind dropdown list
                CategoryDrp.DataSource = data;
                CategoryDrp.DataTextField = "CategoryName"; // Column name to display
                CategoryDrp.DataValueField = "CategoryName"; // Column name as value
                CategoryDrp.DataBind();
            }
            catch (Exception ex)
            {
                //lblError.Text = ex.Message;
                throw;
            }
        }
        void CateoryDrp2()
        {
            try
            {
                // Fetch data from database or any other source
                DataTable data = GetDataFromDatabase();

                // Bind dropdown list
                CategoryDrp2.DataSource = data;
                CategoryDrp2.DataTextField = "CategoryName"; // Column name to display
                CategoryDrp2.DataValueField = "CategoryName"; // Column name as value
                CategoryDrp2.DataBind();
                CategoryDrp2.Items.Insert(0, new ListItem("Select Category", "0"));
            }
            catch (Exception ex)
            {
               // lblError.Text = ex.Message;
                throw;
            }
        }

        protected void CateoryDrpDDL(GridViewRow row)
        {
            DropDownList CategoryDrp3 = (DropDownList)row.FindControl("CategoryDrp3");
            if (CategoryDrp3 == null)
            {
                // Handle the error: DropDownList not found
                return;
            }

            try
            {
                string Query = "SELECT DISTINCT CategoryName from tbl_MasterCategory";

                using (SqlConnection Connection = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand command = new SqlCommand(Query, Connection))
                    {
                        Connection.Open();
                        SqlDataAdapter sda = new SqlDataAdapter(command);
                        DataTable data = new DataTable();
                        sda.Fill(data);

                        CategoryDrp3.DataSource = data;
                        CategoryDrp3.DataTextField = "CategoryName";
                        CategoryDrp3.DataValueField = "CategoryName";
                        CategoryDrp3.DataBind();

                        // Insert a default item
                        CategoryDrp3.Items.Insert(0, new ListItem("Select Course", ""));
                    }
                }
            }
            catch (SqlException ex)
            {
                //lblError.Text = ex.Message;
            }
        }

        private DataTable GetDataFromDatabase()
        {
            try
            {
                // Fetch data from database
                string connectionString = ConnectionString;
                string query = "SELECT DISTINCT CategoryName from tbl_MasterCategory";
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        con.Open();
                        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);
                        return dataTable;
                    }
                }
            }
            catch (Exception ex)
            {
                //lblError.Text = ex.Message;
                throw;
            }
        }

        protected string GetStarRating(object rating)
        {
            try
            {
                int ratingValue = Convert.ToInt32(rating);
                string stars = string.Empty;
                for (int i = 1; i <= 5; i++)
                {
                    if (i <= ratingValue)
                    {
                        stars += "<i class='fas fa-star checked'></i>"; // Full star
                    }
                    else
                    {
                        stars += "<i class='fas fa-star'></i>"; // Empty star
                    }
                }
                return stars;
            }
            catch (Exception ex)
            {
                //lblError.Text = ex.Message;
                throw;
            }
        }


        protected void gvCategory_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (gvCategory.PageIndex == 0 && e.NewPageIndex < 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showWarning", "alert('You are already on the first page.');", true);
                e.Cancel = true;
            }
            else
            {
                gvCategory.PageIndex = e.NewPageIndex;
                DataBind();
            }
        }
        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            try
            {
                string categoryName = TxtCategoryName.Text.Trim();

                if (!string.IsNullOrEmpty(categoryName))
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;


                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        string query = "INSERT INTO tbl_MasterCategory (CategoryName) VALUES (@CategoryName)";

                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@CategoryName", categoryName);

                            conn.Open();
                            cmd.ExecuteNonQuery();
                            conn.Close();
                        }
                    }

                    CateoryDrp();
                    CateoryDrp2();
                    hdnFirstModalOpen.Value = "true";
                    TxtCategoryName.Text = string.Empty;

                }
                else
                {
                    // Handle the case where the textbox is empty (optional)
                }
            }
            catch (Exception ex)
            {
               // lblError.Text = ex.Message;
                throw;
            }
        }

        protected void LinkSearch_Click(object sender, EventArgs e)
        {
            try
            {
                string Category = CategoryDrp.SelectedItem.Text;
                SqlDataAdapter dataAdapter = new SqlDataAdapter("SELECT * FROM tbl_CategoryManager WHERE Mobile ='" + txtMobNo.Text + "' OR Name ='" + txtName.Text + "' OR CategoryName='" + Category + "'", ConnectionString);
                DataTable dt = new DataTable();
                dataAdapter.Fill(dt);
                gvCategory.DataSource = dt;
                gvCategory.DataBind();
               
            }
        
            catch (Exception ex)
            {
               // lblError.Text = ex.Message;
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('No record found!')", true);
            }
            finally
            {
                con.Close();
            }
        }

        protected void ViewData_Click(object sender, EventArgs e)
        {
            DataBind();
            ClerField();
        }
    }
}