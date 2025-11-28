using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static ENOSISLEARNING.StudentView;

namespace ENOSISLEARNING
{
    //27/11/2025   BatchesDetails
    public partial class BatchesDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetCourses();
                GetCoordinator();
            }
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static object GetCompleteBatches()
        {
            try
            {
                string constr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

                using (SqlConnection Conn = new SqlConnection(constr))
                {
                    string query = @"    
                SELECT 
                    B.BatchId,
                    B.BatchMode,
                    B.BatchSubject,
                    B.FaclutyName,
                    ISNULL(BSD.TotalDays, 0) AS TotalDays
                FROM Enosis.BatchesInfo B
                LEFT JOIN 
                (
                    SELECT 
                        BatchId,
                        COUNT(Date) AS TotalDays
                    FROM Enosis.BatchSheetDetails
                    GROUP BY BatchId
                ) BSD 
                    ON B.BatchId = BSD.BatchId
                WHERE 
                    B.Status IN ('Completed', 'Complete')";

                    using (SqlCommand cmd = new SqlCommand(query, Conn))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);

                            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();

                            foreach (DataRow dr in dt.Rows)
                            {
                                Dictionary<string, object> row = new Dictionary<string, object>();
                                foreach (DataColumn col in dt.Columns)
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
            catch (Exception ex)
            {
                return new { error = ex.Message, stack = ex.StackTrace };
            }
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static object GetBatches()
        {
            string constr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = "SELECT    bi.*,   cd.COURSEID,   ISNULL(completed.CompletedDays, 0) AS CompletedDays,   DATEDIFF(DAY, bi.StartDate, bi.EndDate) + 1 AS TotalDays,    CAST(        ROUND(        (ISNULL(completed.CompletedDays, 0) * 100.0) /        NULLIF((DATEDIFF(DAY, bi.StartDate, bi.EndDate) + 1), 0),        0)    AS INT) AS ProgressPercent FROM enosis.BatchesInfo AS bi LEFT JOIN (    SELECT        BatchID,        COUNT(Date) AS CompletedDays    FROM enosis.BatchSheetDetails    GROUP BY BatchID) AS completed    ON bi.BatchID = completed.BatchID LEFT JOIN COURSES_DETAIL AS cd  ON bi.BatchSubject = cd.COURSENAME WHERE bi.Status NOT IN ('Completed', 'Complete')";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);

                        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();

                        foreach (DataRow dr in dt.Rows)
                        {
                            Dictionary<string, object> row = new Dictionary<string, object>();
                            foreach (DataColumn col in dt.Columns)
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
        public class Batch
        {
            public int BatchId { get; set; }
            public string BatchType { get; set; }
            public string BatchMode { get; set; }
            public string BatchSubject { get; set; }
            public DateTime StartDate { get; set; }
            public DateTime EndDate { get; set; }
            public DateTime StartTime { get; set; }
            public DateTime EndTime { get; set; }
            public string FaclutyName { get; set; }
            public string ExpectedStudent { get; set; }
            public string Status { get; set; }
            public int USERID { get; set; }
            public int COURSEID { get; set; }
            public int LastChapterNumber { get; set; }
        }
        public class Candidate
        {
            public string ID { get; set; }
            public string Name { get; set; }
        }
        void GetCourses()
        {
            string con = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString();
            try
            {
                string query = "select * from COURSES_DETAIL WHERE STATUS = 'A'";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable data = new DataTable();
                sda.Fill(data);
                drpDCourse.DataSource = data;
                drpDCourse.DataTextField = "COURSENAME";
                drpDCourse.DataValueField = "COURSEID";
                drpDCourse.DataBind();
            }
            catch (Exception ex)
            {

                //lblmsg.Text = ex.Message;
            }
        }
        //Bind Coordinator DropDown//
        void GetCoordinator()
        {
            string con = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString();
            try
            {
                string query = "SELECT USERID, FULLNAME FROM USERDETAILS WHERE (STATUS = 'ACTIVE' OR STATUS = '1') AND FULLNAME IS NOT NULL ORDER BY FULLNAME ASC";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable data = new DataTable();
                sda.Fill(data);
                drpFaculty.DataSource = data;
                drpFaculty.DataTextField = "FULLNAME";
                drpFaculty.DataValueField = "USERID";
                drpFaculty.DataBind();
                FilterFacultyDrp.DataSource = data;
                FilterFacultyDrp.DataTextField = "FULLNAME";
                FilterFacultyDrp.DataValueField = "FULLNAME";
                FilterFacultyDrp.DataBind();
            }
            catch (Exception ex)
            {

                //lblmsg.Text = ex.Message;
            }
        }
        [WebMethod]
        public static List<Candidate> GetCandidates(string keyword)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT CANDIDATE_CODE, FULLNAME FROM CANDIDATES WHERE FULLNAME LIKE @kw + '%' ORDER BY CANDIDATE_CODE DESC", con);
                cmd.Parameters.AddWithValue("@kw", keyword);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                List<Candidate> candidates = new List<Candidate>();
                while (reader.Read())
                {
                    candidates.Add(new Candidate
                    {
                        ID = reader["CANDIDATE_CODE"].ToString(),
                        Name = reader["FULLNAME"].ToString()
                    });
                }

                return candidates;
            }
        }
        //Add Batch
        [WebMethod]
        public static string AddBatch(
     string batchType,
     string batchMode,
     string batchSubject,
     string startDate,
     string endDate,
     string startTime,
     string endTime,
     string facultyName,
     string expectedStudent,
     string status,
     int userId,
     int courseId,
     string selectedIDs,
     string selectedNames
 )
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ToString()))
                {
                    con.Open();

                    // Convert date/time
                    DateTime SD = Convert.ToDateTime(startDate);
                    DateTime ED = Convert.ToDateTime(endDate);
                    DateTime ST = Convert.ToDateTime(startTime);
                    DateTime ET = Convert.ToDateTime(endTime);

                    // Insert into BatchesInfo
                    SqlCommand cmd = new SqlCommand(@"
                INSERT INTO Enosis.BatchesInfo
                (BatchType, BatchMode, BatchSubject, StartDate, EndDate, StartTime, EndTime, 
                 FaclutyName, ExpectedStudent, Status, CreatetedBy, USERID, COURSEID)
                VALUES
                (@BatchType, @BatchMode, @BatchSubject, @StartDate, @EndDate, @StartTime, @EndTime,
                 @FaclutyName, @ExpectedStudent, @Status, @CreatetedBy, @USERID, @COURSEID);
                SELECT SCOPE_IDENTITY();", con);

                    // Parameters
                    cmd.Parameters.AddWithValue("@BatchType", batchType);
                    cmd.Parameters.AddWithValue("@BatchMode", batchMode);
                    cmd.Parameters.AddWithValue("@BatchSubject", batchSubject);
                    cmd.Parameters.AddWithValue("@StartDate", SD);
                    cmd.Parameters.AddWithValue("@EndDate", ED);
                    cmd.Parameters.AddWithValue("@StartTime", ST);
                    cmd.Parameters.AddWithValue("@EndTime", ET);
                    cmd.Parameters.AddWithValue("@FaclutyName", facultyName);
                    cmd.Parameters.AddWithValue("@ExpectedStudent", expectedStudent);
                    cmd.Parameters.AddWithValue("@Status", status);

                    // Logged-in username
                    string CreatedBy = HttpContext.Current.Session["USERNAME"].ToString();
                    cmd.Parameters.AddWithValue("@CreatetedBy", CreatedBy);

                    cmd.Parameters.AddWithValue("@USERID", userId);
                    cmd.Parameters.AddWithValue("@COURSEID", courseId);

                    // Get inserted BatchId
                    int batchId = Convert.ToInt32(cmd.ExecuteScalar());

                    // Insert mapping rows
                    if (!string.IsNullOrEmpty(selectedIDs))
                    {
                        string[] studentIdList = selectedIDs.Split(',');

                        foreach (string studentId in studentIdList)
                        {
                            if (string.IsNullOrWhiteSpace(studentId)) continue;

                            SqlCommand cmdStudent = new SqlCommand(@"
                        INSERT INTO CandidateBatchMapping (CANDIDATE_CODE, COURSEID, BATCHID)
                        VALUES (@CandidateID, @COURSEID, @BatchID)", con);

                            cmdStudent.Parameters.AddWithValue("@CandidateID", studentId.Trim());
                            cmdStudent.Parameters.AddWithValue("@COURSEID", courseId);
                            cmdStudent.Parameters.AddWithValue("@BatchID", batchId);

                            try
                            {
                                cmdStudent.ExecuteNonQuery();
                            }
                            catch
                            {
                                // Ignore duplicates
                            }
                        }
                    }

                    return "success";
                }
            }
            catch (Exception ex)
            {
                return "error: " + ex.Message;
            }
        }
        //Edit
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static Batch GetBatchById(int batchId)
        {
            Batch batch = null;
            string connStr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"
            SELECT 
                bi.*, 
                cd.COURSEID, 
                lc.ChapterNumber AS LastChapterNumber
            FROM enosis.BatchesInfo AS bi
            LEFT JOIN (
                SELECT 
                    BatchID,
                    MAX(ChapterNumber) AS ChapterNumber
                FROM enosis.BatchSheetDetails
                GROUP BY BatchID
            ) AS lc 
                ON bi.BatchID = lc.BatchID
            LEFT JOIN COURSES_DETAIL AS cd 
                ON bi.BatchSubject = cd.COURSENAME
            WHERE 
                bi.Status != 'Complete' 
                AND bi.BatchID = @BatchId";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@BatchId", batchId);
                    con.Open();

                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        batch = new Batch
                        {
                            BatchId = Convert.ToInt32(dr["BatchID"]),
                            BatchType = dr["BatchType"].ToString(),
                            BatchSubject = dr["BatchSubject"].ToString(),
                            BatchMode = dr["BatchMode"].ToString(),
                            StartDate = DateTime.SpecifyKind(Convert.ToDateTime(dr["StartDate"]), DateTimeKind.Utc),
                            EndDate = DateTime.SpecifyKind(Convert.ToDateTime(dr["EndDate"]), DateTimeKind.Utc),
                            StartTime = dr["StartTime"] != DBNull.Value ? DateTime.Today.Add((TimeSpan)dr["StartTime"]) : DateTime.MinValue,
                            EndTime = dr["EndTime"] != DBNull.Value ? DateTime.Today.Add((TimeSpan)dr["EndTime"]) : DateTime.MinValue,
                            FaclutyName = dr["FaclutyName"].ToString(),
                            ExpectedStudent = dr["ExpectedStudent"].ToString(),
                            Status = dr["Status"].ToString(),
                            USERID = Convert.ToInt32(dr["USERID"]),
                            COURSEID = Convert.ToInt32(dr["COURSEID"])
                        };
                    }
                    dr.Close();
                }
            }

            return batch;
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string UpdateBatchAsComplete(int id, string status)
        {
            try
            {
                using (SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ToString()))
                {
                    Conn.Open();
                    string query = "UPDATE enosis.BatchesInfo SET Status=@Status WHERE BatchId=@BatchId";
                    using (SqlCommand cmd = new SqlCommand(query, Conn))
                    {
                        cmd.Parameters.AddWithValue("@Status", status);
                        cmd.Parameters.AddWithValue("@BatchId", id);
                        cmd.ExecuteNonQuery();
                    }
                    return "success";
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
        //Update Batch
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string UpdateBatch(int batchId, string batchType, string batchMode, string batchSubject,
 string startDate, string endDate, string startTime, string endTime,
 string facultyName, string expectedStudent, string status, int userId, int courseId, string selectedIDs,
  string selectedNames)
        {
            try
            {
                string currentUser = HttpContext.Current.Session["USERNAME"]?.ToString() ?? "System";

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ToString()))
                {
                    con.Open();
                    string query = @"UPDATE enosis.BatchesInfo 
                             SET BatchType=@BatchType,
                                 BatchMode=@BatchMode,
                                 BatchSubject=@BatchSubject,
                                 StartDate=@StartDate,
                                 EndDate=@EndDate,
                                 StartTime=@StartTime,
                                 EndTime=@EndTime,
                                 FaclutyName=@FacultyName,
                                 ExpectedStudent=@ExpectedStudent,
                                 Status=@Status,
                                 UpdatedDate=@UpdatedDate,
                                 UpdatedBy=@UpdatedBy,
                                 USERID=@USERID,
                                 COURSEID=@COURSEID
                             WHERE BatchId=@BatchId";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@BatchType", batchType);
                        cmd.Parameters.AddWithValue("@BatchMode", batchMode);
                        cmd.Parameters.AddWithValue("@BatchSubject", batchSubject);
                        cmd.Parameters.AddWithValue("@StartDate", startDate);
                        cmd.Parameters.AddWithValue("@EndDate", endDate);
                        cmd.Parameters.AddWithValue("@StartTime", startTime);
                        cmd.Parameters.AddWithValue("@EndTime", endTime);
                        cmd.Parameters.AddWithValue("@FacultyName", facultyName);
                        cmd.Parameters.AddWithValue("@ExpectedStudent", expectedStudent);
                        cmd.Parameters.AddWithValue("@Status", status);
                        cmd.Parameters.AddWithValue("@UpdatedDate", DateTime.Now);
                        cmd.Parameters.AddWithValue("@UpdatedBy", currentUser);
                        cmd.Parameters.AddWithValue("@USERID", userId);
                        cmd.Parameters.AddWithValue("@COURSEID", courseId);
                        cmd.Parameters.AddWithValue("@BatchId", batchId);

                        cmd.ExecuteNonQuery();
                    }

                    //INSERT NEW MAPPINGS
                    if (!string.IsNullOrEmpty(selectedIDs))
                    {
                        string[] studentIdList = selectedIDs.Split(',');

                        foreach (string studentId in studentIdList)
                        {
                            if (string.IsNullOrWhiteSpace(studentId)) continue;

                            SqlCommand cmdStudent = new SqlCommand(@"
            IF NOT EXISTS (
                SELECT 1 FROM CandidateBatchMapping 
                WHERE CANDIDATE_CODE = @CandidateID 
                AND BATCHID = @BatchID
            )
            BEGIN
                INSERT INTO CandidateBatchMapping (CANDIDATE_CODE, COURSEID, BATCHID)
                VALUES (@CandidateID, @COURSEID, @BatchID)
            END
        ", con);

                            cmdStudent.Parameters.AddWithValue("@CandidateID", studentId.Trim());
                            cmdStudent.Parameters.AddWithValue("@COURSEID", courseId);
                            cmdStudent.Parameters.AddWithValue("@BatchID", batchId);

                            cmdStudent.ExecuteNonQuery();
                        }
                    }

                    return "success";
                }
            }
            catch (Exception ex)
            {
                return "error: " + ex.Message;
            }
        }
        //Delete Batch
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string DeleteBatch(int batchId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                SqlTransaction transaction = con.BeginTransaction();

                try
                {
                    // Step 1: Delete dependent records from CandidateBatchMapping
                    using (SqlCommand cmd1 = new SqlCommand("DELETE FROM CandidateBatchMapping WHERE BATCHID = @BatchId", con, transaction))
                    {
                        cmd1.Parameters.AddWithValue("@BatchId", batchId);
                        cmd1.ExecuteNonQuery();
                    }

                    // Step 2: Delete dependent records from BatchSheetDetails
                    using (SqlCommand cmd2 = new SqlCommand("DELETE FROM enosis.BatchSheetDetails WHERE BatchId = @BatchId", con, transaction))
                    {
                        cmd2.Parameters.AddWithValue("@BatchId", batchId);
                        cmd2.ExecuteNonQuery();
                    }

                    // Step 3: Delete the batch itself
                    using (SqlCommand cmd3 = new SqlCommand("DELETE FROM enosis.BatchesInfo WHERE BatchId = @BatchId", con, transaction))
                    {
                        cmd3.Parameters.AddWithValue("@BatchId", batchId);
                        cmd3.ExecuteNonQuery();
                    }

                    // Commit the transaction
                    transaction.Commit();
                    return "Success";
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    return "Error: " + ex.Message;
                }
            }
        }
        //Info button click Event for session value
        [WebMethod(EnableSession = true)]
        public static void SetBatchSession(string BatchId, string FacultyName, string StartDate, string EndDate, string CourseId, string BatchSubject)
        {
            HttpContext.Current.Session["BatchId"] = BatchId;
            HttpContext.Current.Session["FacultyName"] = FacultyName;
            HttpContext.Current.Session["StartDate"] = StartDate;
            HttpContext.Current.Session["EndDate"] = EndDate;
            HttpContext.Current.Session["CourseId"] = CourseId;
            HttpContext.Current.Session["BatchSubject"] = BatchSubject;
        }

    }
}