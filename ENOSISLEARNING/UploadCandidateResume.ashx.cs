using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace ENOSISLEARNING
{
    /// <summary>
    /// Summary description for UploadCandidateResume
    /// </summary>
    public class UploadCandidateResume : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            if (context.Request.Files.Count == 0)
                return;

            string candidateId = context.Session["CANDID"]?.ToString();
            if (string.IsNullOrEmpty(candidateId))
                return;

            HttpPostedFile file = context.Request.Files[0];
            string ext = Path.GetExtension(file.FileName).ToLower();

            if (ext != ".pdf" && ext != ".doc" && ext != ".docx")
                return;

            string folder = context.Server.MapPath("~/Resumes/");
            if (!Directory.Exists(folder))
                Directory.CreateDirectory(folder);

            string fileName = Path.GetFileName(file.FileName);
            string savePath = Path.Combine(folder, fileName);

            file.SaveAs(savePath);

            string dbPath = "/Resumes/" + fileName;

            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(
                    "UPDATE CANDIDATES SET RESUME=@R WHERE CANDIDATE_CODE=@CID", con);

                cmd.Parameters.AddWithValue("@R", dbPath);
                cmd.Parameters.AddWithValue("@CID", candidateId);

                con.Open();
                cmd.ExecuteNonQuery();
            }
            context.Response.Write(fileName);
        }

        public bool IsReusable => false;
    }
}