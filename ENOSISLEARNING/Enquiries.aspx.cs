using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZXing;

namespace ENOSISLEARNING
{
    public partial class NewEnquiries : System.Web.UI.Page
    {
        //SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetCoordinator();
                GetCoordinators();
                GetCourses();
            }
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static object GetEnquiries(string status, string course, string mode, string assignTo, string source, string name)
        {
            try
            {
                List<Enquiry> list = new List<Enquiry>();
                string connStr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = @"SELECT 
                                    E.ENQUIRYID,
                                    E.NAME,
                                    E.CONTACTMOBILENO,
                                    E.CONTACTEMAIL,
                                    E.COURSENAME,
                                    E.STATUS,
                                    E.MODE,
                                    E.ASSIGNEDTO,
                                    E.SOURCE,
                                    E.NEXTENQDATE,
                                    E.CREATED_DATE,
                                    E.UPDATEDBY,
                                    ISNULL(LatestChat.LatestComment, E.COMMENTS) AS COMMENTS
                                FROM 
                                    ENQUIRIES E
                                OUTER APPLY (
                                    SELECT TOP 1 C.MessageText AS LatestComment
                                    FROM EnquiryChat C
                                    WHERE C.EnquiryId = E.ENQUIRYID
                                    ORDER BY C.MessageTime DESC
                                ) AS LatestChat
                                WHERE 1=1";
                    if (string.IsNullOrEmpty(status) || status.ToUpper() == "ALL")
                    {
                        query += " AND STATUS IN ('NEW','INTERESTED') AND STATUS NOT IN ('INACTIVE')";
                    }
                    else
                    {
                        query += " AND STATUS = @status";
                    }

                    // ✅ Course filter
                    if (!string.IsNullOrEmpty(course) && course.ToUpper() != "ALL" && course != "0")
                    {
                        query += " AND COURSENAME = @course";
                    }

                    // ✅ Mode filter
                    if (!string.IsNullOrEmpty(mode) && mode.ToUpper() != "ALL" && mode != "0")
                    {
                        query += " AND MODE = @mode";
                    }

                    // ✅ AssignTo filter
                    if (!string.IsNullOrEmpty(assignTo) && assignTo.ToUpper() != "ALL" && assignTo != "0")
                    {
                        query += " AND ASSIGNEDTO = @assignTo";
                    }

                    // ✅ Source filter
                    if (!string.IsNullOrEmpty(source) && source.ToUpper() != "ALL" && source != "0")
                    {
                        query += " AND SOURCE = @source";
                    }

                    // ✅ Name filter (LIKE %...%)
                    if (!string.IsNullOrEmpty(name))
                    {
                        query += " AND NAME LIKE @name";
                    }

                    query += " ORDER BY CREATED_DATE DESC;";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        if (!string.IsNullOrEmpty(status) && status.ToUpper() != "ALL" && status != "0")
                            cmd.Parameters.AddWithValue("@status", status);

                        if (!string.IsNullOrEmpty(course) && course.ToUpper() != "ALL" && course != "0")
                            cmd.Parameters.AddWithValue("@course", course);

                        if (!string.IsNullOrEmpty(mode) && mode.ToUpper() != "ALL" && mode != "0")
                            cmd.Parameters.AddWithValue("@mode", mode);

                        if (!string.IsNullOrEmpty(assignTo) && assignTo.ToUpper() != "ALL" && assignTo != "0")
                            cmd.Parameters.AddWithValue("@assignTo", assignTo);

                        if (!string.IsNullOrEmpty(source) && source.ToUpper() != "ALL" && source != "0")
                            cmd.Parameters.AddWithValue("@source", source);

                        if (!string.IsNullOrEmpty(name))
                            cmd.Parameters.AddWithValue("@name", "%" + name + "%");

                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        while (dr.Read())
                        {
                            list.Add(new Enquiry
                            {
                                CREATED_DATE = dr["CREATED_DATE"] == DBNull.Value ? "" : Convert.ToDateTime(dr["CREATED_DATE"]).ToString("dd/MM/yyyy"),
                                UPDATEDBY = dr["UPDATEDBY"].ToString(),
                                NAME = dr["NAME"].ToString(),
                                CONTACTMOBILENO = dr["CONTACTMOBILENO"].ToString(),
                                CONTACTEMAIL = dr["CONTACTEMAIL"].ToString(),
                                COURSENAME = dr["COURSENAME"].ToString(),
                                STATUS = dr["STATUS"].ToString(),
                                MODE = dr["MODE"].ToString(),
                                ASSIGNEDTO = dr["ASSIGNEDTO"].ToString(),
                                SOURCE = dr["SOURCE"].ToString(),
                                NEXTENQDATE = dr["NEXTENQDATE"] == DBNull.Value ? "" : Convert.ToDateTime(dr["NEXTENQDATE"]).ToString("dd/MM/yyyy"),
                                COMMENTS = dr["COMMENTS"].ToString(),
                                ENQUIRYID = dr["ENQUIRYID"] == DBNull.Value ? 0 : Convert.ToInt32(dr["ENQUIRYID"])
                            });
                        }
                        dr.Close();
                    }
                }

                return new { data = list };
            }
            catch (Exception ex)
            {
                return new { error = ex.Message };
            }
        }


        //Edit
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static Enquiry GetEnquiryById(int enquiryId)
        {
            Enquiry enquiry = null;
            string connStr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"SELECT 
                            CREATED_DATE, 
                            UPDATEDBY, 
                            NAME, 
                            CONTACTMOBILENO, 
                            CONTACTEMAIL,
                            COURSENAME, 
                            STATUS, 
                            MODE, 
                            ASSIGNEDTO, 
                            SOURCE, 
                            NEXTENQDATE,
                            COMMENTS, 
                            ENQUIRYID
                         FROM ENQUIRIES
                         WHERE ENQUIRYID = @EnquiryId";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@EnquiryId", enquiryId);
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        enquiry = new Enquiry
                        {
                            CREATED_DATE = dr["CREATED_DATE"] == DBNull.Value ? "" : Convert.ToDateTime(dr["CREATED_DATE"]).ToString("dd/MM/yyyy"),
                            UPDATEDBY = dr["UPDATEDBY"].ToString(),
                            NAME = dr["NAME"].ToString(),
                            CONTACTMOBILENO = dr["CONTACTMOBILENO"].ToString(),
                            CONTACTEMAIL = dr["CONTACTEMAIL"].ToString(),
                            COURSENAME = dr["COURSENAME"].ToString(),
                            STATUS = dr["STATUS"].ToString(),
                            MODE = dr["MODE"].ToString(),
                            ASSIGNEDTO = dr["ASSIGNEDTO"].ToString(),
                            SOURCE = dr["SOURCE"].ToString(),
                            NEXTENQDATE = dr["NEXTENQDATE"] == DBNull.Value ? "" : Convert.ToDateTime(dr["NEXTENQDATE"]).ToString("yyyy-MM-dd"), // input[type=date] ke liye yyyy-MM-dd
                            COMMENTS = dr["COMMENTS"].ToString(),
                            ENQUIRYID = Convert.ToInt32(dr["ENQUIRYID"])
                        };
                    }
                    dr.Close();
                }
            }

            return enquiry;
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string UpdateEnquiry(int enquiryId, string name, string contactMobileNo,
                                 string contactEmail, string courseName, string status, string mode,
                                 string assignedTo, string source, string nextEnqDate, string comments)
        {
            string connStr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = @"UPDATE ENQUIRIES 
                          SET 
                             NAME = @Name,
                             CONTACTMOBILENO = @ContactMobileNo,
                             CONTACTEMAIL = @ContactEmail,
                             COURSENAME = @CourseName,
                             STATUS = @Status,
                             MODE = @Mode,
                             ASSIGNEDTO = @AssignedTo,
                             SOURCE = @Source,
                             NEXTENQDATE = @NextEnqDate,
                             COMMENTS = @Comments
                          WHERE ENQUIRYID = @EnquiryId";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Parameters with DBNull handling
                        cmd.Parameters.AddWithValue("@EnquiryId", enquiryId);
                        cmd.Parameters.AddWithValue("@Name", string.IsNullOrEmpty(name) ? (object)DBNull.Value : name);
                        cmd.Parameters.AddWithValue("@ContactMobileNo", string.IsNullOrEmpty(contactMobileNo) ? (object)DBNull.Value : contactMobileNo);
                        cmd.Parameters.AddWithValue("@ContactEmail", string.IsNullOrEmpty(contactEmail) ? (object)DBNull.Value : contactEmail);
                        cmd.Parameters.AddWithValue("@CourseName", string.IsNullOrEmpty(courseName) ? (object)DBNull.Value : courseName);
                        cmd.Parameters.AddWithValue("@Status", string.IsNullOrEmpty(status) ? (object)DBNull.Value : status);
                        cmd.Parameters.AddWithValue("@Mode", string.IsNullOrEmpty(mode) ? (object)DBNull.Value : mode);
                        cmd.Parameters.AddWithValue("@AssignedTo", string.IsNullOrEmpty(assignedTo) ? (object)DBNull.Value : assignedTo);
                        cmd.Parameters.AddWithValue("@Source", string.IsNullOrEmpty(source) ? (object)DBNull.Value : source);

                        if (string.IsNullOrEmpty(nextEnqDate))
                            cmd.Parameters.AddWithValue("@NextEnqDate", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@NextEnqDate",
                                DateTime.ParseExact(nextEnqDate, "yyyy-MM-dd", CultureInfo.InvariantCulture));

                        cmd.Parameters.AddWithValue("@Comments", string.IsNullOrEmpty(comments) ? (object)DBNull.Value : comments);

                        con.Open();
                        int rows = cmd.ExecuteNonQuery();
                        return rows > 0 ? "Success" : "Failed";
                    }
                }
            }
            catch (Exception ex)
            {
                return "Error: " + ex.Message;
            }
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string DeleteEnquiry(int enquiryId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                using (SqlTransaction tran = con.BeginTransaction())
                {
                    try
                    {
                        
                        SqlCommand cmd1 = new SqlCommand("DELETE FROM EnquiryChat WHERE ENQUIRYID = @id", con, tran);
                        cmd1.Parameters.AddWithValue("@id", enquiryId);
                        cmd1.ExecuteNonQuery();

                        
                        SqlCommand cmd2 = new SqlCommand("DELETE FROM Enquiries WHERE ENQUIRYID = @id", con, tran);
                        cmd2.Parameters.AddWithValue("@id", enquiryId);
                        int rows = cmd2.ExecuteNonQuery();

                        tran.Commit();
                        return rows > 0 ? "Success" : "Failed";
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        // Exception logging optional: log ex.Message
                        return "Error: " + ex.Message;
                    }
                }
            }
        }

        public class Enquiry
        {
            public string CREATED_DATE { get; set; }
            public string UPDATEDBY { get; set; }
            public string NAME { get; set; }
            public string CONTACTMOBILENO { get; set; }
            public string CONTACTEMAIL { get; set; }
            public string COURSENAME { get; set; }
            public string STATUS { get; set; }
            public string MODE { get; set; }
            public string ASSIGNEDTO { get; set; }
            public string SOURCE { get; set; }
            public string NEXTENQDATE { get; set; }
            public string COMMENTS { get; set; }
            public int ENQUIRYID { get; set; }
        }

        [WebMethod]
        public static string AddEnquiry(string name, string email, string mobile, string course, string status, string mode, string assigned, string source, string followUpDate, string comment)
        {
            string result = string.Empty;
            string Username = HttpContext.Current.Session["USERNAME"] != null
                                ? HttpContext.Current.Session["USERNAME"].ToString()
                                : "Admin";
            try
            {
                // Define the connection string
                string connectionString = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

                // Convert the next enquiry date into the correct format
                DateTime nextEnqDateParsed;
                if (!DateTime.TryParse(followUpDate, out nextEnqDateParsed))
                {
                    return "Invalid date format";
                }

                // SQL query for insertion
                string query = "INSERT INTO ENQUIRIES (NAME, CONTACTEMAIL, CONTACTMOBILENO, COURSENAME, STATUS, MODE, ASSIGNEDTO, SOURCE, NEXTENQDATE, COMMENTS,UPDATEDBY) " +
                               "VALUES (@Name, @Email, @ContactNo, @CourseName, @Status, @Mode, @AssignedTo, @Source, @NextEnqDate, @Comments,@UpdatedBy)";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Adding parameters
                        cmd.Parameters.AddWithValue("@Name", name);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@ContactNo", mobile);
                        cmd.Parameters.AddWithValue("@CourseName", course);
                        cmd.Parameters.AddWithValue("@Status", status);
                        cmd.Parameters.AddWithValue("@Mode", mode);
                        cmd.Parameters.AddWithValue("@AssignedTo", assigned);
                        cmd.Parameters.AddWithValue("@Source", source);
                        cmd.Parameters.AddWithValue("@NextEnqDate", nextEnqDateParsed);
                        cmd.Parameters.AddWithValue("@Comments", comment);
                        cmd.Parameters.AddWithValue("@UpdatedBy", Username);

                        // Open connection and execute the command
                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                        result = rowsAffected > 0 ? "success" : "error";
                    }
                }
            }
            catch (Exception ex)
            {
                result = "error: " + ex.Message;
            }
            return result;
        }
        //Bind Coordinator DropDown//
        void GetCoordinator()
        {
            string con = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString() ;
            try
            {
                string query = "select USERID,UPPER(USERNAME) AS USERNAME from USERDETAILS WHERE STATUS='ACTIVE'";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable data = new DataTable();
                sda.Fill(data);
                drpPAssigned.DataSource = data;
                drpPAssigned.DataTextField = "USERNAME";
                drpAssigned.DataValueField = "USERNAME";
                drpPAssigned.DataBind();
            }
            catch (Exception ex)
            {

                //lblmsg.Text = ex.Message;
            }
        }
        void GetCourses()
        {
            string con = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString() ;
            try
            {
                string query = "select * from COURSES_DETAIL WHERE STATUS = 'A'";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable data = new DataTable();
                sda.Fill(data);
                drpcourses.DataSource = data;
                drpcourses.DataTextField = "COURSENAME";
                drpcourses.DataValueField = "COURSENAME";
                drpcourses.DataBind();
                drpDCourse.DataSource = data;
                drpDCourse.DataTextField = "COURSENAME";
                drpDCourse.DataValueField = "COURSENAME";
                drpDCourse.DataBind();
                //ListItem selectitem = new ListItem("Course", "Course");
                //selectitem.Selected = true;
                //drpcourses.Items.Insert(0, selectitem);
                ListItem selectitem2 = new ListItem("Course", "Course");
                //selectitem.Selected = true;
                drpDCourse.Items.Insert(0, selectitem2);
            }
            catch (Exception ex)
            {

                //lblmsg.Text = ex.Message;
            }
        }

        void GetCoordinators()
        {
            string con = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString();
            try
            {
                string query = "select USERID,UPPER(USERNAME) AS USERNAME from USERDETAILS WHERE STATUS='ACTIVE'";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable data = new DataTable();
                sda.Fill(data);
                drpAssigned.DataSource = data;
                drpAssigned.DataTextField = "USERNAME";
                drpAssigned.DataValueField = "USERNAME";
                drpAssigned.DataBind();
            }
            catch (Exception ex)
            {

                //lblmsg.Text = ex.Message;
            }
        }
        [System.Web.Services.WebMethod]
        public static List<ChatMessage> GetChatMessages(string enquiryId)
        {
            Enquiry eq = new Enquiry();
            List<ChatMessage> messages = new List<ChatMessage>();

            string constr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand cmd = new SqlCommand("SELECT MessageText, Sender, MessageTime FROM EnquiryChat WHERE ENQUIRYID = @id ORDER BY MessageTime ASC", con);
                cmd.Parameters.AddWithValue("@id", enquiryId);
                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    messages.Add(new ChatMessage
                    {
                        MessageText = dr["MessageText"].ToString(),
                        Sender = dr["Sender"].ToString(),
                        MessageTime = Convert.ToDateTime(dr["MessageTime"]).ToString("dd MMM yyyy hh:mm tt")
                    });
                }
            }
            return messages;
        }
        public class ChatMessage
        {
            public string MessageText { get; set; }
            public string Sender { get; set; }
            public string MessageTime { get; set; }
        }
        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string SaveReply(int enquiryId, string message, string status, string nextEnqDate)
        {
            try
            {
                string senderName = HttpContext.Current.Session["FULLNAME"]?.ToString() ?? "Admin";

                using (SqlConnection conn = new SqlConnection(
                    ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
                {
                    conn.Open();

                    // 1️⃣ Insert into Chat table
                    string chatQuery = "INSERT INTO EnquiryChat (ENQUIRYID, MessageText, Sender) VALUES (@EnquiryId, @MessageText, @SenderName)";
                    using (SqlCommand chatCmd = new SqlCommand(chatQuery, conn))
                    {
                        chatCmd.Parameters.AddWithValue("@EnquiryId", enquiryId);
                        chatCmd.Parameters.AddWithValue("@MessageText", message);
                        chatCmd.Parameters.AddWithValue("@SenderName", senderName);
                        chatCmd.ExecuteNonQuery();
                    }

                    // 2️⃣ Update Status & NextEnquiryDate in Enquiries table
                    string updateQuery = "UPDATE ENQUIRIES SET STATUS=@Status, NEXTENQDATE=@NextEnqDate WHERE ENQUIRYID=@EnquiryId";
                    using (SqlCommand updateCmd = new SqlCommand(updateQuery, conn))
                    {
                        updateCmd.Parameters.AddWithValue("@Status", status);
                        updateCmd.Parameters.AddWithValue("@NextEnqDate", string.IsNullOrEmpty(nextEnqDate) ? (object)DBNull.Value : nextEnqDate);
                        updateCmd.Parameters.AddWithValue("@EnquiryId", enquiryId);
                        updateCmd.ExecuteNonQuery();
                    }
                }

                return "Reply & enquiry details saved successfully!";
            }
            catch (Exception ex)
            {
                return "Error: " + ex.Message;
            }
        }
        //Initial Comment Binding Method
        [WebMethod]
        public static string GetInitialComment(int enquiryId)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
                {
                    string query = "SELECT ISNULL(COMMENTS, '') FROM ENQUIRIES WHERE ENQUIRYID = @EnquiryId";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@EnquiryId", enquiryId);
                    conn.Open();
                    object result = cmd.ExecuteScalar();
                    return result?.ToString() ?? "";
                }
            }
            catch (Exception ex)
            {
                return "Error: " + ex.Message;
            }
        }

    }
}