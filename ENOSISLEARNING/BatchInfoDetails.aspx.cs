using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ENOSISLEARNING
{
    public partial class BatchInfoDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindChapterDrp();
                // Retrieve values from session
                string batchId = Session["BatchId"]?.ToString();
                string facultyName = Session["FacultyName"]?.ToString();
                string startDate = Session["StartDate"]?.ToString();
                string endDate = Session["EndDate"]?.ToString();
                string courseId = Session["CourseId"]?.ToString();
                string expectedStudent = Session["ExpectedStudent"]?.ToString();
                string courseName = Session["BatchSubject"]?.ToString();

                // Check if the values are not null
                if (batchId != null)
                    BatchId.Text = batchId;
                if (courseName != null)
                {
                    BatchSubject.Text = courseName;
                }

                // Format faculty name to show only the first name (trim after first space)
                if (facultyName != null)
                {
                    string firstName = facultyName; 
                    FaclutyName.Text = firstName;
                }

                // Format start date to show only date (without time)
                if (startDate != null && DateTime.TryParse(startDate, out DateTime startDateValue))
                {
                    StartDate.Text = startDateValue.ToString("dd-MM-yyyy"); // Change format as per your requirement (e.g., "MM/dd/yyyy")
                }

                // Format end date to show only date (without time)
                if (endDate != null && DateTime.TryParse(endDate, out DateTime endDateValue))
                {
                    EndDate.Text = endDateValue.ToString("dd-MM-yyyy"); // Change format as per your requirement (e.g., "MM/dd/yyyy")
                }
                if (Session["CANDID"] != null)
                {
                    string CandidateId = Session["CANDID"].ToString();
                }
                int CurrentbatchId = Convert.ToInt32(Session["BatchId"]?.ToString());
                //LoadChatMessages(CurrentbatchId);
            }
        }
        public class BatchSheetModel
        {
            public int BatchSheetId { get; set; }
            public string Date { get; set; } // ISO date string from client
            public string ChapterNumber { get; set; }
            public string StudentName { get; set; }
            public string TopicCovered { get; set; }
            public string Comments { get; set; }
            public int? BatchId { get; set; } // optional

            // runtime-only (NOT stored in DB)
            public string FileBase64 { get; set; }        // base64 content if new file uploaded
            public string FileName { get; set; }          // original file name
            public string ExistingFileName { get; set; }  // current filename stored in DB
        }


        //Initialize BatchSheet
        [System.Web.Services.WebMethod]
        public static object GetBatchSheetDetails()
        {
            try
            {
                int BatchId = Convert.ToInt32(HttpContext.Current.Session["BatchId"]);
                DataTable dt = new DataTable();
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
                {
                    string query = "SELECT * FROM enosis.BatchSheetDetails WHERE BatchId = @BatchId";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    da.SelectCommand.Parameters.AddWithValue("@BatchId", BatchId);  
                    da.Fill(dt);
                }

                // Convert DataTable to List<object>
                var rows = new List<Dictionary<string, object>>();
                foreach (DataRow dr in dt.Rows)
                {
                    var row = new Dictionary<string, object>();
                    foreach (DataColumn col in dt.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }
                    rows.Add(row);
                }

                return rows;
            }
            catch (Exception ex)
            {
                return new { error = ex.Message };
            }
        }

        //Get Chapters
        void BindChapterDrp()
        {
            try
            {
                string courseId = Session["CourseId"]?.ToString();
                string query = "SELECT Chapter_Id, Chapter_Number FROM enosis.COURSE_CHAPTER_DETAIL WHERE Course_Id = @CourseId";
                DataTable data = new DataTable();
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@CourseId", courseId);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    sda.Fill(data);
                    drpChapter.DataSource = data;
                    drpChapter.DataTextField = "Chapter_Number";
                    drpChapter.DataValueField = "Chapter_Number";
                    drpChapter.DataBind();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        //Add BatchShet Details
        [System.Web.Services.WebMethod]
        public static string AddBatchSheet(string Date, string ChapterId, string Topic, string Comments, string FileName)
        {
            try
            {
                string batchId = HttpContext.Current.Session["BatchId"]?.ToString();
                if (string.IsNullOrEmpty(batchId))
                    return "Session Expired";

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
                {
                    con.Open();

                    string folderPath = HttpContext.Current.Server.MapPath("~/Files/");
                    if (!Directory.Exists(folderPath))
                        Directory.CreateDirectory(folderPath);

                    // FileName is only the uploaded filename from AJAX (handled separately via upload)
                    string filePath = string.IsNullOrEmpty(FileName) ? null : "~/Files/" + FileName;

                    SqlCommand cmd = new SqlCommand(@"
                INSERT INTO enosis.BatchSheetDetails
                (Date, ChapterNumber, TopicCovered,BatchId, uploads,Comments,Status)
                VALUES
                (@Date, @Chapter, @Topic, @BatchId, @Uploads, @Comments, 'Present')", con);

                    cmd.Parameters.AddWithValue("@Date", Convert.ToDateTime(Date));
                    cmd.Parameters.AddWithValue("@Chapter", ChapterId);
                    cmd.Parameters.AddWithValue("@Topic", Topic);
                    cmd.Parameters.AddWithValue("@BatchId", batchId);
                    cmd.Parameters.AddWithValue("@Uploads", (object)filePath ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Comments", Comments);

                    cmd.ExecuteNonQuery();
                }

                return "Success";
            }
            catch (Exception ex)
            {
                return "Error: " + ex.Message;
            }
        }
        [WebMethod]
        public static string UploadFile()
        {
            HttpPostedFile file = HttpContext.Current.Request.Files["file"];
            if (file != null)
            {
                string folderPath = HttpContext.Current.Server.MapPath("~/Files/");
                if (!Directory.Exists(folderPath)) Directory.CreateDirectory(folderPath);

                string fileName = Path.GetFileName(file.FileName);
                file.SaveAs(folderPath + fileName);
                return fileName;
            }
            return null;
        }
        //Get BatchSheetDetails By Id
        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json)]
        public static List<BatchSheetModel> GetBatchSheetById(int batchSheetId)
        {
            var list = new List<BatchSheetModel>();
            string cs = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

            string query = @"
        SELECT BatchSheetId, Date, ChapterNumber, StudentName,
               TopicCovered, Comments, BatchId, uploads
        FROM enosis.BatchSheetDetails
        WHERE BatchSheetId = @id";

            using (var con = new SqlConnection(cs))
            using (var cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@id", batchSheetId);
                con.Open();
                using (var dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        list.Add(new BatchSheetModel
                        {
                            BatchSheetId = Convert.ToInt32(dr["BatchSheetId"]),
                            Date = dr["Date"] != DBNull.Value ? Convert.ToDateTime(dr["Date"]).ToString("o") : "", // ISO string
                            ChapterNumber = dr["ChapterNumber"] != DBNull.Value ? dr["ChapterNumber"].ToString() : "",
                            StudentName = dr["StudentName"] != DBNull.Value ? dr["StudentName"].ToString() : "",
                            TopicCovered = dr["TopicCovered"] != DBNull.Value ? dr["TopicCovered"].ToString() : "",
                            Comments = dr["Comments"] != DBNull.Value ? dr["Comments"].ToString() : "",
                            BatchId = dr["BatchId"] != DBNull.Value ? (int?)Convert.ToInt32(dr["BatchId"]) : null,
                            ExistingFileName = dr["uploads"] != DBNull.Value ? dr["uploads"].ToString() : ""
                        });
                    }
                }
            }
            return list;
        }
        //Update BatchSheet Details
        [System.Web.Services.WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string UpdateBatchSheet(BatchSheetModel model)
        {
            try
            {
                if (model == null)
                    return "error: invalid model";

                // Resolve BatchId
                int batchIdToUse = 0;
                if (model.BatchId.HasValue && model.BatchId.Value != 0)
                    batchIdToUse = model.BatchId.Value;
                else if (HttpContext.Current.Session["BatchId"] != null)
                    int.TryParse(HttpContext.Current.Session["BatchId"].ToString(), out batchIdToUse);

                // Folder
                string folder = HttpContext.Current.Server.MapPath("~/Files/");
                if (!Directory.Exists(folder))
                    Directory.CreateDirectory(folder);

                // Keep existing file name unless new one uploaded
                string finalFileName = model.ExistingFileName ?? "";

                // SAVE NEW FILE
                if (!string.IsNullOrEmpty(model.FileBase64) && !string.IsNullOrEmpty(model.FileName))
                {
                    finalFileName = Path.GetFileName(model.FileName);

                    byte[] bytes = Convert.FromBase64String(model.FileBase64);
                    string savePath = Path.Combine(folder, finalFileName);

                    File.WriteAllBytes(savePath, bytes);

                    if (!File.Exists(savePath))
                        return "error: file not saved";
                }

                // Convert date
                object dateParam = DBNull.Value;
                if (!string.IsNullOrEmpty(model.Date) &&
                    DateTime.TryParse(model.Date, out DateTime parsedDate))
                {
                    dateParam = parsedDate;
                }

                // DB Update
                string cs = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

                string query = @"
UPDATE enosis.BatchSheetDetails
SET Date = @Date,
    ChapterNumber = @ChapterNumber,
    StudentName = @StudentName,
    TopicCovered = @TopicCovered,
    Comments = @Comments,
    BatchId = @BatchId,
    uploads = @Uploads
WHERE BatchSheetId = @BatchSheetId";

                using (var con = new SqlConnection(cs))
                using (var cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Date", dateParam);
                    cmd.Parameters.AddWithValue("@ChapterNumber", (object)model.ChapterNumber ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@StudentName", (object)model.StudentName ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@TopicCovered", (object)model.TopicCovered ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Comments", (object)model.Comments ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@BatchId", batchIdToUse == 0 ? (object)DBNull.Value : batchIdToUse);

                    // ✅ STORE FULL PATH IN DB
                    cmd.Parameters.AddWithValue("@Uploads",
                        string.IsNullOrEmpty(finalFileName)
                        ? (object)DBNull.Value
                        : "~/Files/" + finalFileName
                    );

                    cmd.Parameters.AddWithValue("@BatchSheetId", model.BatchSheetId);

                    con.Open();
                    int rows = cmd.ExecuteNonQuery();

                    return rows > 0 ? "success" : "error: no rows updated";
                }
            }
            catch (Exception ex)
            {
                return "error: " + ex.Message;
            }
        }
        //Delete Batchsheet Details
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string DeleteBatchSheet(int BatchSheetId)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "DELETE FROM enosis.BatchSheetDetails WHERE BatchSheetId = @BatchSheetId";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@BatchSheetId", BatchSheetId);
                        con.Open();
                        int rows = cmd.ExecuteNonQuery();
                        con.Close();

                        return rows > 0 ? "Success" : "No record found";
                    }
                }
            }
            catch (Exception ex)
            {
                return "Error: " + ex.Message;
            }
        }
        public class ChatMessage
        {
            public string Sender { get; set; }
            public string MessageText { get; set; }
            public string MessageDateTime { get; set; }
            public string FileAttachment { get; set; }
        }
        [System.Web.Services.WebMethod]
        public static List<ChatMessage> GetChatMessages(int batchSheetId)
        {
            List<ChatMessage> list = new List<ChatMessage>();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT Sender, MessageText, MessageDateTime, FileAttachment FROM ChatMessages WHERE BatchSheetId=@id ORDER BY MessageDateTime", con);
                cmd.Parameters.AddWithValue("@id", batchSheetId);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    list.Add(new ChatMessage
                    {
                        Sender = dr["Sender"].ToString(),
                        MessageText = dr["MessageText"].ToString(),
                        MessageDateTime = Convert.ToDateTime(dr["MessageDateTime"]).ToString("dd-MM-yyyy hh:mm tt"),
                        FileAttachment = dr["FileAttachment"].ToString()
                    });
                }
            }

            return list;
        }

        [System.Web.Services.WebMethod]
        public static string SaveReply(int batchSheetId, string message, string fileName, string fileData)
        {
            string savedFileName = "";

            if (!string.IsNullOrEmpty(fileData) && !string.IsNullOrEmpty(fileName))
            {
                byte[] bytes = Convert.FromBase64String(fileData);
                savedFileName = Guid.NewGuid() + "_" + fileName;

                string path = HttpContext.Current.Server.MapPath("~/Uploads/" + savedFileName);
                File.WriteAllBytes(path, bytes);
            }

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO ChatMessages (BatchSheetId, Sender, MessageText, MessageDateTime, FileAttachment) VALUES (@BatchSheetId, @Sender, @MessageText, GETDATE(), @FileAttachment)", con);

                cmd.Parameters.AddWithValue("@BatchSheetId", batchSheetId);
                cmd.Parameters.AddWithValue("@Sender", "Admin");
                cmd.Parameters.AddWithValue("@MessageText", message);
                cmd.Parameters.AddWithValue("@FileAttachment", savedFileName);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            return "success";
        }
    }
}