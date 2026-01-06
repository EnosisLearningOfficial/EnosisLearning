using System;
using System.Collections.Generic;
using System.Data;
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

        //Get All Students
        [WebMethod]
        public static object GetAllStudents()
        {
            string Connectionstring = "Data Source=DESKTOP-MPE7G61;Initial Catalog=Student;Integrated Security=true;";
            using (SqlConnection Conn = new SqlConnection(Connectionstring))
            {
                string query = "select * from Student";
                using(SqlCommand cmd = new SqlCommand(query,Conn))
                {
                    using(SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        List<Dictionary<string,object>> rows = new List<Dictionary<string,object>>();
                        foreach(DataRow dr in dt.Rows)
                        {
                            Dictionary<string,object> row = new Dictionary<string,object>();
                            foreach(DataColumn col in dt.Columns)
                            {
                                row.Add(col.ColumnName, dr[col]);
                            }
                            rows.Add(row);
                        }
                        return new { data = rows };
                    }
                }
            }
        }
        //Get Student By Id
        [WebMethod]
        public static Student GetStudentById(int id)
        {
            string Connectionstring = "Data Source=DESKTOP-MPE7G61;Initial Catalog=Student;Integrated Security=true;";
            using(SqlConnection Conn = new SqlConnection(Connectionstring))
            {
                string query = "select * from Student where Id=@id";
                using(SqlCommand cmd = new SqlCommand(query,Conn))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    Conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if(reader.Read())
                    {
                        return new Student
                        {
                            Id = Convert.ToInt32(reader["Id"]),
                            Name = reader["Name"].ToString(),
                            Email = reader["Email"].ToString(),
                            Course = reader["Course"].ToString()
                        };
                    }
                }
            }
            return null;
        }
        [WebMethod]
        public static string UpdateStudent(int id,string name,string email,string course)
        {
            string Connectionstring = "Data Source=DESKTOP-MPE7G61;Initial Catalog=Student;Integrated Security=true;";
            using(SqlConnection Conn = new SqlConnection(Connectionstring))
            {
                string query = "update Student set Name=@Name,Email=@Email,Course=@Course where Id=@Id";
                using(SqlCommand cmd = new SqlCommand(query,Conn))
                {
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Course", course);
                    Conn.Open();
                    int rows = cmd.ExecuteNonQuery();
                    return rows > 0 ? "success" : "error";
                }
            }
        }
    }
}