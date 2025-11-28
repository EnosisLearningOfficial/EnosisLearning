using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using Ionic.Zip;
using System.Net;

namespace ENOSISLEARNING.Libraries
{
    public static class ZIPLIB
    {
        public static void CovertToZip(string query)
        {
            using (ZipFile zip = new ZipFile())
            {
                //Zip Start
                //string query = SearchQuery(1);
                DataTable dt = dbconnect.GetDataSet(query);
                zip.AlternateEncodingUsage = ZipOption.AsNecessary;
                zip.AddDirectoryByName("Files");
                for (int r = 0; r < dt.Rows.Count; r = r + 1)
                {
                    if (dt.Rows[r]["RESUME"].ToString() != "")
                    {
                        string path = HttpContext.Current.Server.MapPath("~/Resumes/") + dt.Rows[r]["RESUME"].ToString();
                        zip.AddFile(path, "Files");
                    }
                }

                HttpContext.Current.Response.Clear();
                HttpContext.Current.Response.BufferOutput = false;
                string zipName = String.Format("Zip_{0}.zip", DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"));
                HttpContext.Current.Response.ContentType = "application/zip";
                HttpContext.Current.Response.AddHeader("content-disposition", "attachment; filename=" + zipName);
                zip.Save(HttpContext.Current.Response.OutputStream);
                HttpContext.Current.Response.End();
            }//zip End
        }
    }
}