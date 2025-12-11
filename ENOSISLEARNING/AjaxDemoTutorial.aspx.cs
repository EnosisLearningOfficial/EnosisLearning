using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZXing.OneD;

namespace ENOSISLEARNING
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public class Student
        {
            public int Id { get; set; }
            public string Name { get; set; }
            public string Email { get; set; }
            public string Course { get; set; }
        }

        //Insertstudents
        [WebMethod]
        public static string InsertStudent(string name,string email,string course)
        {
            string Connectionstring = "Data Source=DESKTOP-MPE7G61;Initial Catalog=Student;Integrated Security=true;";
            using(SqlConnection Conn = new SqlConnection(Connectionstring))
            {
                string query = "insert into Student(Name,Email,Course)values(@Name,@Email,@Course)";
                using(SqlCommand cmd = new SqlCommand(query,Conn))
                {
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Course", course);
                    Conn.Open();
                    int rows = cmd.ExecuteNonQuery();
                    Conn.Close();
                    return rows > 0 ? "success" : "error";
                }
            }
        }
    }
}