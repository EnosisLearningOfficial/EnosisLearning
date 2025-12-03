using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ENOSISLEARNING
{
    public partial class NewMyAdmin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUserProfilePicture();
                //int count = GetNotificationCount(); // Fetch count from DB
                //notificationCount.InnerHtml = count.ToString(); // Assign count
            }
            //Session["Username"] = ;
            if (Session["USERNAME"] != null && Session["FACULTYID"] != null)
            {
                lbltxt.Text = "Welcome " + Session["USERNAME"].ToString();
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }
        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            // Clear session data
            Session.Clear();
            Session.Abandon();

            // Remove authentication ticket if using Forms Authentication
            System.Web.Security.FormsAuthentication.SignOut();

            // Redirect to the login page or homepage
            Response.Redirect("~/Login.aspx");
        }
        protected void lnkUploadProfile_Click(object sender, EventArgs e)
        {
            uploadDiv.Visible = true;
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            uploadDiv.Visible = false;
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                try
                {
                    // Validate file type
                    string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };
                    string fileExtension = Path.GetExtension(FileUpload1.FileName).ToLower();

                    if (!Array.Exists(allowedExtensions, ext => ext == fileExtension))
                    {
                        lblMessage.Text = "Only image files (.jpg, .jpeg, .png, .gif) are allowed.";
                        return;
                    }
                    if (FileUpload1.PostedFile.ContentLength > 2 * 1024 * 1024)
                    {
                        lblMessage.Text = "File size must be less than 2 MB.";
                        return;
                    }

                    // Save file to server
                    string fileName = Path.GetFileName(FileUpload1.FileName);
                    string savePath = Server.MapPath("~/Uploads/") + fileName;
                    FileUpload1.SaveAs(savePath);

                    // Save file path in the database
                    string relativePath = "~/Uploads/" + fileName;
                    SaveProfilePictureToDatabase(relativePath);
                    Session["ProfilePicture"] = relativePath;
                    // Display uploaded image
                    imgProfilePreview.ImageUrl = relativePath;

                    uploadDiv.Visible = false;
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }
            else
            {
                lblMessage.Text = "Please select a file to upload.";
            }
        }
        // Save profile picture path in the database
        private void SaveProfilePictureToDatabase(string profilePicturePath)
        {
            string UserName = Session["USERNAME"].ToString();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString()))
            {
                string query = "UPDATE USERDETAILS SET ProfilePicturePath = @ProfilePicturePath where USERNAME = @UserName";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@ProfilePicturePath", profilePicturePath);
                    cmd.Parameters.AddWithValue("@UserName", UserName);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Profile Picture Updated Successfully.')</script>");
                    return;
                }
            }
        }
        private void LoadUserProfilePicture()
        {
            string UserName = Session["USERNAME"]?.ToString(); // Ensure session value exists
            if (string.IsNullOrEmpty(UserName)) return;

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString()))
            {
                string query = "SELECT ProfilePicturePath FROM USERDETAILS WHERE USERNAME = @UserName";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UserName", UserName);

                    con.Open();
                    object result = cmd.ExecuteScalar();
                    if (result != null && !string.IsNullOrEmpty(result.ToString()))
                    {
                        imgProfilePreview.ImageUrl = result.ToString();
                        Session["ProfilePicture"] = result.ToString(); // Store in session for quick access
                    }
                    else
                    {
                        imgProfilePreview.ImageUrl = "~/Images/add.png"; // Default profile picture
                    }
                }
            }
        }
        //GetPendingRequestCount//
        //private int GetNotificationCount()
        //{
        //    int facultyId = Convert.ToInt32(Session["FACULTYID"]); // Ensure Session Exists
        //    int count = 0;

        //    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
        //    {
        //        string query = "SELECT COUNT(*) FROM FacultyCourseApproval WHERE FacultyID = @FacultyID AND ApprovalStatus = 0";
        //        SqlCommand cmd = new SqlCommand(query, conn);
        //        cmd.Parameters.AddWithValue("@FacultyID", facultyId);

        //        conn.Open();
        //        count = Convert.ToInt32(cmd.ExecuteScalar());
        //    }
        //    return count;
        //}
    }
}