using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace ENOSISLEARNING
{
    /// <summary>
    /// Summary description for DownloadFile
    /// </summary>
    public class DownloadFile : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string filePath = context.Request.QueryString["file"];

            if (string.IsNullOrEmpty(filePath))
            {
                context.Response.Write("File parameter is missing.");
                return;
            }

            filePath = context.Server.UrlDecode(filePath);

            if (filePath.StartsWith("~"))
                filePath = context.Server.MapPath(filePath);
            else
                filePath = context.Server.MapPath("~" + filePath);

            if (!File.Exists(filePath))
            {
                context.Response.Write("File not found.");
                return;
            }

            context.Response.ContentType = "application/octet-stream";
            context.Response.AddHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
            context.Response.TransmitFile(filePath);
            context.Response.End();
        }

        public bool IsReusable { get { return false; } }
    }
}