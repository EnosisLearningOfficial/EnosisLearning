using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static ENOSISLEARNING.CandidateAssignments;

namespace ENOSISLEARNING
{
    public partial class AssignmentUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CANDID"] == null)
            {
                Response.StatusCode = 401;
                return;
            }

            int candidateId = Convert.ToInt32(Session["CANDID"]);
            int courseId = Convert.ToInt32(Request.Form["CourseId"]);
            HttpPostedFile file = Request.Files["AssignmentFile"];

            if (file == null || file.ContentLength == 0)
            {
                Response.StatusCode = 400;
                return;
            }

            string folderName = CourseFolderMapper.GetFolderByCourseId(courseId);

            string saveDir = Server.MapPath(
                $"~/Assignments/{folderName}/Submissions/{candidateId}"
            );

            if (!Directory.Exists(saveDir))
                Directory.CreateDirectory(saveDir);

            string originalFileName = Path.GetFileName(file.FileName);
            string submittedFileName =
                $"{candidateId}_{courseId}_{DateTime.Now:yyyyMMddHHmmss}_{originalFileName}";

            string savePath = Path.Combine(saveDir, submittedFileName);
            file.SaveAs(savePath);

            string dbPath =
                $"Assignments/{folderName}/Submissions/{candidateId}/{submittedFileName}";

            SaveSubmissionToDB(candidateId, courseId, originalFileName, submittedFileName, dbPath);

            Response.Write("SUCCESS");
        }
        private void SaveSubmissionToDB(
     int candidateId,
     int courseId,
     string originalFileName,
     string submittedFileName,
     string filePath
 )
        {
            string connStr = ConfigurationManager
                .ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"
        INSERT INTO AssignmentSubmissions
        (
            CandidateId,
            CourseId,
            AssignmentFileName,
            SubmittedFileName,
            SubmittedFilePath,
            SubmittedOn
        )
        VALUES
        (
            @CandidateId,
            @CourseId,
            @AssignmentFileName,
            @SubmittedFileName,
            @SubmittedFilePath,
            GETDATE()
        )";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@CandidateId", SqlDbType.Int).Value = candidateId;
                    cmd.Parameters.Add("@CourseId", SqlDbType.Int).Value = courseId;
                    cmd.Parameters.Add("@AssignmentFileName", SqlDbType.NVarChar).Value = originalFileName;
                    cmd.Parameters.Add("@SubmittedFileName", SqlDbType.NVarChar).Value = submittedFileName;
                    cmd.Parameters.Add("@SubmittedFilePath", SqlDbType.NVarChar).Value = filePath;

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}