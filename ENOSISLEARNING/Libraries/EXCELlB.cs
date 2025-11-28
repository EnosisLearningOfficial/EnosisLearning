using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.IO;
using System.Text;
using System.Web.UI.HtmlControls;
using System.Configuration;
using Ionic.Zip;
using System.Net;
using iTextSharp.text;
using iTextSharp.text.pdf;
using ENOSISLEARNING.Libraries;


namespace ENOSISLEARNING
{
    public static class EXCELLIB
    {
     
        public static void ExportToCSVFile(string filename, DataTable dt)
        {
            HttpContext context = HttpContext.Current;
            context.Response.Clear();
            foreach (DataColumn column in dt.Columns)
            {
                context.Response.Write(column.ColumnName + ",");
            }
            context.Response.Write(Environment.NewLine);
            foreach (DataRow row in dt.Rows)
            {
                for (var i = 0; i < dt.Columns.Count; i++)
                {
                    context.Response.Write(row[i].ToString().Replace(",", string.Empty) + ",");
                }
                context.Response.Write(Environment.NewLine);
            }
            context.Response.ContentType = "text/csv";
            context.Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename + ".csv");
            context.Response.End();
        }
        public static void Export(GridView grv,HttpResponse response,string filename)
        {
            response.Clear();
            response.Buffer = true;
            response.ClearContent();
            response.ClearHeaders();
            response.Charset = "";
            //string FileName = "CandidatesList.xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);
            response.ContentType = "application/vnd.ms-excel";
            response.AddHeader("Content-Disposition", "attachment;filename=" + filename);
            grv.GridLines = GridLines.Both;
            grv.HeaderStyle.Font.Bold = true;
            grv.RenderControl(htmltextwrtter);
            response.Write(strwritter.ToString());
            response.End();

        }
        public static void ExportDataToExcel(HttpResponse response,string query)
        {
            DataTable dt = dbconnect.GetDataSet(query);
            GridView gv = new GridView();
            gv.DataSource = dt; //Your datasource from database
            gv.DataBind();
            
            response.ClearContent();
            response.Buffer = true;
            //Response.ClearContent();
            //Response.Buffer = true;
            response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "CandidatesList.xls"));
            response.ContentType = "application/ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            // gvDetails.AllowPaging = true;
            int j = 1;
            //This loop is used to apply stlye to cells based on particular row
            foreach (GridViewRow gvrow in gv.Rows)
            {
                gvrow.BackColor = System.Drawing.Color.White;
                if (j <= gv.Rows.Count)
                {
                    if (j % 2 != 0)
                    {
                        for (int k = 0; k < gvrow.Cells.Count; k++)
                        {
                            gvrow.Cells[k].Style.Add("background-color", "#EFF3FB");

                        }
                    }
                }
                j++;
            }
            gv.RenderControl(htw);
            response.Write(sw.ToString());
            response.End();
        }


    }
}