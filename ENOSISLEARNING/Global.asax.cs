using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using ENOSISLEARNING;

namespace ENOSISLEARNING
{
    public class Global : HttpApplication
    {
        public static void LogErrorToDB(Exception ex,string urlname)
        {
           StringBuilder sb = new StringBuilder();
            sb.Append("********************" + " Error Log - " + DateTime.Now + "*********************");
            sb.Append(Environment.NewLine);
            sb.Append(Environment.NewLine);
            sb.Append("Exception Type : " + ex.GetType().Name);
            sb.Append(Environment.NewLine);
            sb.Append("Error Message : " + ex.Message);
            sb.Append(Environment.NewLine);
            sb.Append("Error Source : " + ex.Source);
            sb.Append(Environment.NewLine);
            if (ex.StackTrace != null)
            {
                sb.Append("Error Trace : " + ex.StackTrace);
            }
            Exception innerEx = ex.InnerException;
            while (innerEx != null)
            {
                sb.Append(Environment.NewLine);
                sb.Append(Environment.NewLine);
                sb.Append("Exception Type : " + innerEx.GetType().Name);
                sb.Append(Environment.NewLine);
                sb.Append("Error Message : " + innerEx.Message);
                sb.Append(Environment.NewLine);
                sb.Append("Error Source : " + innerEx.Source);
                sb.Append(Environment.NewLine);
                if (ex.StackTrace != null)
                {
                    sb.Append("Error Trace : " + innerEx.StackTrace);
                }
                innerEx = innerEx.InnerException;
            }
            String Connection = System.Configuration.ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
            SqlConnection conn = new SqlConnection(Connection);
            SqlCommand cmd = new SqlCommand("Sp_LogException", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter param = new SqlParameter();
            cmd.Parameters.Add("@UrlName", SqlDbType.NVarChar).Value = urlname;
            cmd.Parameters.Add("@ExceptionMessage", SqlDbType.NVarChar).Value = sb.ToString();
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close(); 
        }  
        void Application_Start(object sender, EventArgs e)
        {
             //Code that runs on application startup
            AuthConfig.RegisterOpenAuth();
            RouteConfig.RegisterRoutes(RouteTable.Routes);
        }

        void Application_End(object sender, EventArgs e)
        {
              //Code that runs on application shutdown

        }

        void Application_Error(object sender, EventArgs e)
        {
           /* string urlname = Request.UrlReferrer.ToString();
            
            Exception Ex = Server.GetLastError();
             Server.ClearError();
              //ExceptionLogging.LogErrorToEventViewer(Ex);  

             LogErrorToDB(Ex,"");
            Response.Redirect("EnosisError.aspx");
        //   Server.Transfer("EnosisError.aspx");  
             //Code that runs when an unhandled error occurs*/

        }
    }
}
