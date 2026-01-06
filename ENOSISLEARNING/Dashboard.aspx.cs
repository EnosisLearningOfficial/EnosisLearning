using DocumentFormat.OpenXml.Bibliography;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace ENOSISLEARNING
{
    public partial class StudentView : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CANDID"] != null)
                {
                    string candidateCode = Session["CANDID"].ToString();
                    hfCandidateID.Value = candidateCode.ToString();
                    DataTable dt = GetCandidateBatchDetails(candidateCode);
                   
                    if (dt.Rows.Count > 0)
                    {
                        // Bind labels
                        int totalDays = Convert.ToInt32(dt.Rows[0]["TotalDays"]);
                        int completedDays = Convert.ToInt32(dt.Rows[0]["CompletedDays"]);
                        int pendingDays = totalDays - completedDays;

                        lblTotalDays.Text = totalDays.ToString();
                        lblCompletedDays.Text = completedDays.ToString();
                        lblPendingDays.Text = pendingDays.ToString();

                        // Progress %
                        int progress = Convert.ToInt32(dt.Rows[0]["ProgressPercent"]);
                        lblProgress.Text = progress + "%";

                        // Animate progress bar
                        string script = $@"
                    <script>
                        var bar = document.getElementById('divProgress');
                        bar.style.transition = 'width 1s ease-in-out';
                        bar.style.width = '{progress}%';
                        bar.setAttribute('aria-valuenow', '{progress}');
                    </script>";
                        ClientScript.RegisterStartupScript(this.GetType(), "animateProgress", script);
                    }
                }
                else
                {
                    Response.Redirect("~/Login.aspx");
                }
            }
        }
        [WebMethod]
        public static object GetAISummary(string candidateId, string courseId)
        {
            string constr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

            int weekAttendance = 0;
            int totalTopics = 0;
            int completedTopics = 0;
            double speedPercent = 0;
            string estimatedFinish = "";
            string estimatedRemark = "";

            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();

                //for live server enosis.Candidatebatchmapping
                SqlCommand cmd = new SqlCommand(@"
                SELECT TOP 1 BatchID
                FROM enosis.CandidateBatchMapping
                WHERE CANDIDATE_CODE = @CandidateID
                  AND CourseID = @CourseID
                ORDER BY BatchID ASC", con);


                cmd.Parameters.AddWithValue("@CandidateID", candidateId);
                cmd.Parameters.AddWithValue("@CourseID", courseId);

                object batchObj = cmd.ExecuteScalar();
                if (batchObj == null)
                {
                    return new { error = "No batch found" };
                }
                string batchId = batchObj.ToString();

                cmd = new SqlCommand(@"
            SELECT COUNT(*)
            FROM enosis.BatchSheetDetails
            WHERE BatchID = @BatchID
              AND Date >= DATEADD(day, -7, GETDATE())
              AND Status = 'Present'", con);

                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@BatchID", batchId);

                weekAttendance = Convert.ToInt32(cmd.ExecuteScalar());

                cmd = new SqlCommand(@"
            SELECT 
                COUNT(*) AS TotalTopics,
                SUM(CASE WHEN Status = 'Completed' THEN 1 ELSE 0 END) AS CompletedTopics
            FROM enosis.BatchSheetDetails
            WHERE BatchID = @BatchID", con);

                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@BatchID", batchId);

                SqlDataReader r = cmd.ExecuteReader();
                if (r.Read())
                {
                    totalTopics = Convert.ToInt32(r["TotalTopics"]);
                    completedTopics = Convert.ToInt32(r["CompletedTopics"]);
                }
                r.Close();

                if (totalTopics > 0)
                {
                    speedPercent = Math.Round((completedTopics * 100.0) / totalTopics, 2);
                }

                double remaining = totalTopics - completedTopics;

                double avgWeekly = weekAttendance > 0 ? weekAttendance : 1; 
                double weeksNeeded = remaining / avgWeekly;

                DateTime finishDate = DateTime.Now.AddDays(weeksNeeded * 7);
                estimatedFinish = finishDate.ToString("dd MMM yyyy");

                estimatedRemark = remaining > 0
                    ? $"You may finish in approx {Math.Ceiling(weeksNeeded)} weeks."
                    : "Congratulations! You have completed the course.";
            }

            return new
            {
                WeekAttendance = weekAttendance,
                WeekAttendanceRemark = weekAttendance >= 4 ? "Excellent consistency!" : "Try improving your weekly attendance.",

                TopicSpeed = speedPercent,
                TopicSpeedRemark = speedPercent >= 60 ? "Great topic completion pace!" : "Try to speed up your topics.",

                EstimatedFinish = estimatedFinish,
                EstimatedRemark = estimatedRemark
            };
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<AttendanceRecord> GetAttendanceData(string candidateId, string courseId)
        {
            List<AttendanceRecord> attendanceList = new List<AttendanceRecord>();
            List<string> batchIds = new List<string>();

            string constr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(@"
            SELECT BatchID 
            FROM CandidateBatchMapping
            WHERE CANDIDATE_CODE = @CandidateID AND COURSEID = @CourseID
            ORDER BY BatchID ASC", con);

                cmd.Parameters.AddWithValue("@CandidateID", candidateId);
                cmd.Parameters.AddWithValue("@CourseID", courseId);

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                    batchIds.Add(reader["BatchID"].ToString());
                reader.Close();

                if (batchIds.Count == 0)
                    return attendanceList;

                string batchList = string.Join(",", batchIds.Select(id => $"'{id}'"));


                cmd = new SqlCommand($@"
            SELECT Date, ChapterNumber, TopicCovered, Status, BatchID
            FROM enosis.BatchSheetDetails
            WHERE BatchID IN ({batchList})
            ORDER BY Date ASC", con);

                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    attendanceList.Add(new AttendanceRecord
                    {
                        Date = Convert.ToDateTime(reader["Date"]).ToString("dd-MM-yyyy"),
                        ChapterNumber = reader["ChapterNumber"].ToString(),
                        TopicCovered = reader["TopicCovered"].ToString(),
                        Status = reader["Status"].ToString(),
                        BatchID = reader["BatchID"].ToString()
                    });
                }
                reader.Close();
            }

            return attendanceList;
        }
        public DataTable GetCandidateBatchDetails(string candidateCode)
        {
            string constr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(constr))
            {
                string query = @"
SELECT    
    DATEDIFF(DAY, bi.StartDate, bi.EndDate) + 1 AS TotalDays,
    ISNULL(completed.CompletedDays, 0) AS CompletedDays,
    CAST(
        ROUND(
            (ISNULL(completed.CompletedDays, 0) * 100.0) / 
            NULLIF((DATEDIFF(DAY, bi.StartDate, bi.EndDate) + 1), 0),
        0) AS INT
    ) AS ProgressPercent
FROM CandidateBatchMapping cbm
INNER JOIN enosis.BatchesInfo bi
    ON cbm.BATCHID = bi.BatchID
    AND cbm.COURSEID = bi.CourseID
LEFT JOIN (
    SELECT BatchID, COUNT(Date) AS CompletedDays
    FROM enosis.BatchSheetDetails
    GROUP BY BatchID
) AS completed
    ON bi.BatchID = completed.BatchID
WHERE cbm.CANDIDATE_CODE = @CandidateCode
  AND cbm.Status = 'Active'
  AND bi.Status != 'Completed'";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@CandidateCode", candidateCode);

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        return dt;
                    }
                }
            }
        }

        public class Course
        {
            public string CourseID { get; set; }
            public string CourseName { get; set; }
        }
        public class AttendanceRecord
        {
            public string ChapterNumber { get; set; }
            public string TopicCovered { get; set; }
            public string Date { get; set; }
            public string Uploads { get; set; }
            public string Status { get; set; }

            public string BatchID { get; set; }
        }
        [WebMethod]
        public static List<Course> GetCourses(int candidateId)
        {
            List<Course> courses = new List<Course>();
            string connStr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"
                SELECT CBM.CourseID, CD.COURSENAME 
                FROM CandidateBatchMapping CBM
                INNER JOIN COURSES_DETAIL CD ON CBM.CourseID = CD.COURSEID
                WHERE CBM.CANDIDATE_CODE = @CandidateID
                ORDER BY CBM.CourseID DESC
                ";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@CandidateID", candidateId);
                    con.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            courses.Add(new Course
                            {
                                CourseID = dr["CourseID"].ToString(),
                                CourseName = dr["COURSENAME"].ToString()
                            });
                        }
                    }
                }
            }
            return courses;
        }
        //Get Candidate Overall Score Summary
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static object GetCandidateScoreData(int candidateId)
        {
            string constr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

            DataTable dt = new DataTable();

            string query = @"
        SELECT 
            DateOfTest AS TestDate,
            Score,
            OutOf,
            CourseID,
            'Test' AS SourceType
        FROM CANDIDATE_TESTRESULTS
        WHERE CandidateID = @CandidateID

        UNION ALL

        SELECT 
            DateOfInterview AS TestDate,
            Score,
            OutOf,
            CourseID,
            'Interview' AS SourceType
        FROM CANDIDATE_INTERVIEWRESULTS
        WHERE CandidateID = @CandidateID

        ORDER BY TestDate;
    ";

            using (SqlConnection con = new SqlConnection(constr))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@CandidateID", candidateId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }

            // Add Percentage directly in result
            var result = dt.AsEnumerable().Select(row => new
            {
                TestDate = Convert.ToDateTime(row["TestDate"]).ToString("yyyy-MM-dd"),

                // Raw score
                Score = Convert.ToDecimal(row["Score"]),
                OutOf = Convert.ToDecimal(row["OutOf"]),

                // ⭐ Percentage value (Final used in graph)
                Percentage = Math.Round(
                                (Convert.ToDecimal(row["Score"]) /
                                 Convert.ToDecimal(row["OutOf"])) * 100,
                                2),

                CourseID = Convert.ToInt32(row["CourseID"]),
                SourceType = row["SourceType"].ToString()
            }).ToList();
            return result;
        }
        [WebMethod]
        public static object GetCourseProgress(string candidateId, string courseId)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ToString()))
            {
                SqlCommand cmd = new SqlCommand(@"
            SELECT 
                TotalDays,
                CompletedDays,
                (CompletedDays * 100 / TotalDays) AS ProgressPercent
            FROM BatchProgress
            WHERE CandidateID = @CID AND CourseID = @CourseID", con);

                cmd.Parameters.AddWithValue("@CID", candidateId);
                cmd.Parameters.AddWithValue("@CourseID", courseId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }

            if (dt.Rows.Count == 0) return null;

            return new
            {
                Total = dt.Rows[0]["TotalDays"],
                Done = dt.Rows[0]["CompletedDays"],
                Percent = dt.Rows[0]["ProgressPercent"]
            };
        }
        [WebMethod]
        public static object GetCourseSummary(string candidateCode, string courseId)
        {
            string constr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(constr))
            {
                string query = @"
SELECT    
    DATEDIFF(DAY, bi.StartDate, bi.EndDate) + 1 AS TotalDays,
    COUNT(bsd.Date) AS CompletedDays,

    CAST(
        ROUND(
            (COUNT(bsd.Date) * 100.0) / 
            NULLIF((DATEDIFF(DAY, bi.StartDate, bi.EndDate) + 1), 0),
        0) AS INT
    ) AS ProgressPercent

FROM CandidateBatchMapping cbm

INNER JOIN enosis.BatchesInfo bi
    ON cbm.BATCHID = bi.BatchID

LEFT JOIN enosis.BatchSheetDetails bsd
    ON bsd.BatchID = cbm.BATCHID
   

WHERE cbm.CANDIDATE_CODE = @CandidateCode
  AND cbm.CourseID = @CourseID
  AND cbm.Status = 'Active'

GROUP BY bi.StartDate, bi.EndDate
";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@CandidateCode", candidateCode);
                cmd.Parameters.AddWithValue("@CourseID", courseId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count == 0)
                    return null;

                int totalDays = Convert.ToInt32(dt.Rows[0]["TotalDays"]);
                int completedDays = Convert.ToInt32(dt.Rows[0]["CompletedDays"]);

                return new
                {
                    TotalDays = totalDays,
                    CompletedDays = completedDays,
                    PendingDays = totalDays - completedDays,
                    Progress = Convert.ToInt32(dt.Rows[0]["ProgressPercent"])
                };
            }
        }

    }
}