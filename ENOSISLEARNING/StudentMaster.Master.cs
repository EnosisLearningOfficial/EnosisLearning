using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ENOSISLEARNING
{
    public partial class StudentMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CANDID"] != null)
                {
                    string candId = Session["CANDID"].ToString();
                    LoadStudentDetails(candId);
                    LoadProfilePhoto();
                }
                else
                {
                    Response.Redirect("~/Login.aspx");
                }
            }
        }
        //upload profile picture of candidate on page load
        private void LoadProfilePhoto()
        {
            if (Session["CANDID"] == null)
                return;

            string candidateId = Session["CANDID"].ToString();
            string photoPath = null;

            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT ProfilePhotoPath FROM CANDIDATES WHERE CANDIDATE_CODE = @CID", con);

                cmd.Parameters.AddWithValue("@CID", candidateId);

                con.Open();
                object result = cmd.ExecuteScalar();

                if (result != null && result != DBNull.Value)
                    photoPath = result.ToString();
            }

            if (!string.IsNullOrEmpty(photoPath))
            {
                Profileimg.ImageUrl = photoPath;
                ProfilePic.ImageUrl = photoPath;
            }
            else
            {
                Profileimg.ImageUrl = "~/Images/addman.png";
                ProfilePic.ImageUrl = "~/Images/addman.png";
            }
        }
        private void LoadStudentDetails(string candId)
        {
            string constr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = @"
            SELECT 
                *,
                CS.COURSENAME
            FROM CANDIDATES C
            LEFT JOIN COURSES_DETAIL CS ON C.COURSEID = CS.COURSEID
            WHERE C.CANDIDATE_CODE = @CandidateId";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@CandidateId", candId);

                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        lblID.Text = dr["CANDIDATE_CODE"].ToString();     
                        lblName.Text = dr["FULLNAME"].ToString();      
                        ProfileNamelbl.Text = dr["FULLNAME"].ToString();     
                        lblCourse.Text = dr["COURSENAME"].ToString();
                        Emaillbl.Text = dr["EMAIL"].ToString();
                        Mobilelbl.Text = dr["MOBILENO"].ToString();
                        courselbl.Text = dr["COURSENAME"].ToString();
                        DORlbl.Text = Convert.ToDateTime(dr["DateOfRegistration"]).ToString("dd/MM/yyyy");
                        courseDesclbl.Text = dr["COURSEDESC"].ToString();
                        Addresslbl.Text = dr["ADDRESS"].ToString();
                        Feelbl.Text = dr["FEES"].ToString();
                        string ResumePath = dr["RESUME"] == DBNull.Value ? "" : dr["RESUME"].ToString();

                        if (!string.IsNullOrEmpty(ResumePath))
                        {
                            Resumelbl.Text = Path.GetFileName(ResumePath);

                            Resumelbl.Attributes["data-resume"] = ResolveUrl(ResumePath);
                        }
                        else
                        {
                            Resumelbl.Text = "Not Uploaded";
                            Resumelbl.CssClass = "text-muted";
                        }

                        string resumePath = dr["RESUME"] == DBNull.Value ? "" : dr["RESUME"].ToString();

                        if (!string.IsNullOrEmpty(resumePath))
                        {
                            lnkResume.Text = Path.GetFileName(resumePath);
                            lnkResume.Attributes["data-resume"] = ResolveUrl("~/Resumes/" + resumePath);
                            lnkResume.CssClass = "resume-link";
                        }
                        else
                        {
                            lnkResume.Text = "Upload Your Resume";
                            lnkResume.Attributes.Remove("data-resume");
                        }
                    }
                }
            }
        }
        //Upload profile picture
        //[System.Web.Services.WebMethod(EnableSession = true)]
        //public static string UploadProfilePic()
        //{
        //    HttpContext context = HttpContext.Current;

        //    if (context.Request.Files.Count == 0)
        //        return "";

        //    HttpPostedFile file = context.Request.Files[0];
        //    string candidateId = context.Session["CANDID"]?.ToString();

        //    if (file == null || string.IsNullOrEmpty(candidateId))
        //        return "";

        //    string ext = Path.GetExtension(file.FileName).ToLower();

        //    if (ext != ".jpg" && ext != ".jpeg" && ext != ".png")
        //        return "";

        //    string folderPath = context.Server.MapPath("~/Uploads/");
        //    if (!Directory.Exists(folderPath))
        //        Directory.CreateDirectory(folderPath);

        //    string fileName = candidateId + ext;
        //    string savePath = Path.Combine(folderPath, fileName);
        //    file.SaveAs(savePath);

        //    string dbPath = "/Uploads/" + fileName;

        //    using (SqlConnection con = new SqlConnection(
        //        ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
        //    {
        //        SqlCommand cmd = new SqlCommand(
        //            "UPDATE CANDIDATES SET ProfilePhotoPath=@P WHERE CANDIDATE_CODE=@CID", con);

        //        cmd.Parameters.AddWithValue("@P", dbPath);
        //        cmd.Parameters.AddWithValue("@CID", candidateId);

        //        con.Open();
        //        cmd.ExecuteNonQuery();
        //    }

        //    // ✅ VERY IMPORTANT
        //    return dbPath;
        //}
    }
}