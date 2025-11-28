using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.Script.Services;

namespace ENOSISLEARNING
{
    public partial class contact : System.Web.UI.Page
    {
        string CONNSTRING = System.Configuration.ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ToString();
        EnquiriesEntity obj = new EnquiriesEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static void SaveRecord(string Name, string Email, string Contact, string Subject, string Remark)
        {
            string CONNSTRING = System.Configuration.ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ToString();
            using (SqlConnection conn = new SqlConnection(CONNSTRING))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO [dbo].[CONTACTDETAILS] ([CONTACTNAME],[CONTACTEMAIL],[CONTACTPHONENO],[CONTACT_SUBJECT],[REMARKS]) values (@Name,@Email,@Contact,@Subject,@Remark)", conn))
                {
                    try
                    {
                        cmd.Parameters.AddWithValue("@Name", Name);
                        cmd.Parameters.AddWithValue("@Email", Email);
                        cmd.Parameters.AddWithValue("@Contact", Contact);
                        cmd.Parameters.AddWithValue("@Subject", Subject);
                        cmd.Parameters.AddWithValue("@Remark", Remark);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("Error while saving record: " + ex.Message);
                    }
                }
            }
        }
    }
}