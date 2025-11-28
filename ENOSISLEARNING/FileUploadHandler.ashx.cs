using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace ENOSISLEARNING
{
    /// <summary>
    /// This generic file is for Upload physical files to the server and return the filename to AJAX call.
    /// </summary>
    public class FileUploadHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                HttpPostedFile file = context.Request.Files["file"];
                if (file == null)
                {
                    context.Response.Write("NoFile");
                    return;
                }

                string folderPath = context.Server.MapPath("~/Files/");
                if (!Directory.Exists(folderPath))
                    Directory.CreateDirectory(folderPath);

                string fileName = Path.GetFileName(file.FileName);
                string fullPath = Path.Combine(folderPath, fileName);

                file.SaveAs(fullPath);

                context.Response.Write(fileName);  // return filename to AJAX
            }
            catch (Exception ex)
            {
                context.Response.Write("Error: " + ex.Message);
            }
        }

        public bool IsReusable { get { return false; } }
    }
}