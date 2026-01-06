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
    public class UploadProfilePic : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            // 🔥 VERY FIRST CHECK
            if (context.Session == null)
            {
                context.Response.Write("");
                return;
            }

            string candidateId = context.Session["CANDID"] as string;

            if (string.IsNullOrEmpty(candidateId))
            {
                context.Response.Write("");
                return;
            }

            if (context.Request.Files.Count == 0)
            {
                context.Response.Write("");
                return;
            }

            HttpPostedFile file = context.Request.Files[0];
            if (file == null)
            {
                context.Response.Write("");
                return;
            }

            string ext = System.IO.Path.GetExtension(file.FileName).ToLower();
            if (ext != ".jpg" && ext != ".jpeg" && ext != ".png")
            {
                context.Response.Write("");
                return;
            }

            string folderPath = context.Server.MapPath("~/Uploads/");
            if (!System.IO.Directory.Exists(folderPath))
                System.IO.Directory.CreateDirectory(folderPath);

            string fileName = candidateId + ext;
            string savePath = System.IO.Path.Combine(folderPath, fileName);
            file.SaveAs(savePath);

            string dbPath = "/Uploads/" + fileName;

            using (var con = new System.Data.SqlClient.SqlConnection(
                System.Configuration.ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
            {
                var cmd = new System.Data.SqlClient.SqlCommand(
                    "UPDATE CANDIDATES SET ProfilePhotoPath=@P WHERE CANDIDATE_CODE=@CID", con);
                cmd.Parameters.AddWithValue("@P", dbPath);
                cmd.Parameters.AddWithValue("@CID", candidateId);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            // 🔥 RETURN PATH
            context.Response.Write(dbPath);
        }

        public bool IsReusable => false;
    }
}