using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;
using System.Web.UI;
using System.Net.NetworkInformation;
namespace ENOSISLEARNING
{
    public partial class QuestionRepository : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString());
        string ConnectionString = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindTopicDropDown();
                BindFilterTopicDropDown();
                BindAllFile();
                BindLogPopUpGridView();
                BindLogTopicDropDown();
            }
            if (hfModalState.Value == "open")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "openModal", "openModal();", true);
            }
        }
        //Bind Topic DropDownList//
        void BindTopicDropDown()
        {
            try
            {
                string query = "SELECT TopicID,TopicName FROM TOPIC";
                SqlDataAdapter sda = new SqlDataAdapter(query, ConnectionString);
                DataTable data = new DataTable();
                sda.Fill(data);
                TopicDrp.DataSource = data;
                TopicDrp.DataTextField = "TopicName";
                TopicDrp.DataValueField = "TopicID";
                TopicDrp.DataBind();
                ListItem selectitem = new ListItem("Select  Topic", "Select Topic");
                selectitem.Selected = true;
                TopicDrp.Items.Insert(0, selectitem);
            }
            catch (Exception ex)
            {

                lblmsg.Text = ex.Message;
            }
        }
        //Bind Topic DropDownList//

        //Bind Log Topic DropDownList//
        void BindLogTopicDropDown()
        {
            try
            {
                string query = "SELECT TopicID,TopicName FROM TOPIC";
                SqlDataAdapter sda = new SqlDataAdapter(query, ConnectionString);
                DataTable data = new DataTable();
                sda.Fill(data);
                LogTopicDrp.DataSource = data;
                LogTopicDrp.DataTextField = "TopicName";
                LogTopicDrp.DataValueField = "TopicID";
                LogTopicDrp.DataBind();
                ListItem selectitem = new ListItem("Select  Course", "Select Course");
                selectitem.Selected = true;
                LogTopicDrp.Items.Insert(0, selectitem);
            }
            catch (Exception ex)
            {

                lblmsg.Text = ex.Message;
            }
        }
        //Bind Log Topic DropDownList//

        //Bind Filter Topic DropDownList//
        void BindFilterTopicDropDown()
        {
            try
            {
                string query = "SELECT TopicID,TopicName FROM TOPIC";
                SqlDataAdapter sda = new SqlDataAdapter(query, ConnectionString);
                DataTable data = new DataTable();
                sda.Fill(data);
                FilterDrp.DataSource = data;
                FilterDrp.DataTextField = "TopicName";
                FilterDrp.DataValueField = "TopicID";
                FilterDrp.DataBind();
                ListItem selectitem = new ListItem("All", "All");
                selectitem.Selected = true;
                FilterDrp.Items.Insert(0, selectitem);
            }
            catch (Exception ex)
            {

                lblmsg.Text = ex.Message;
            }
        }
        //Bind Filter Topic DropDownList//

        //Bind Filter File DropDownList//
        void BindAllFile()
        {
            try
            {
                string query = "SELECT DISTINCT FileName FROM QuestionRepository";
                SqlDataAdapter sda = new SqlDataAdapter(query, ConnectionString);
                DataTable data = new DataTable();
                sda.Fill(data);
                FileDrp.DataSource = data;
                FileDrp.DataTextField = "FileName";
                FileDrp.DataValueField = "FileName";
                FileDrp.DataBind();
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }
        //Bind Filter File DropDownList//

        //Filter DropDown Slected Index Change Event//
        protected void FilterDrp_SelectedIndexChanged(object sender, EventArgs e)
        {

            try
            {
                if (FileDrp.SelectedValue != null)
                {
                    int TopicId = Convert.ToInt32(FilterDrp.SelectedValue);
                    string query = "SELECT DISTINCT FileName FROM QuestionRepository where TopicID =" + TopicId;
                    SqlDataAdapter sda = new SqlDataAdapter(query, ConnectionString);
                    DataTable data = new DataTable();
                    sda.Fill(data);
                    FileDrp.DataSource = data;
                    FileDrp.DataTextField = "FileName";
                    FileDrp.DataValueField = "FileName";
                    FileDrp.DataBind();
                    ListItem selectitem = new ListItem("Select  File Name", "Select File Name");
                    selectitem.Selected = true;
                    FileDrp.Items.Insert(0, selectitem);
                }
            }
            catch (Exception ex)
            {
                BindAllFile();
            }
        }
        //Filter DropDown Slected Index Change Event//

        //Method For Import Excel File//
        private void InsertRecordsFromExcel(string filePath, string FileName)
        {
            string query = "INSERT INTO QuestionRepository (QuestionType, DifficultyLevel, QuestionText, OptionA, OptionB, OptionC, OptionD, OptionE, CorrectAnswer,FileName, TopicID) VALUES (@QuestionType, @DifficultyLevel, @QuestionText, @OptionA, @OptionB, @OptionC, @OptionD, @OptionE, @CorrectAnswer,@FileName, @TopicID)";

            try
            {
                using (ExcelPackage package = new ExcelPackage(new FileInfo(filePath)))
                {
                    ExcelWorksheet worksheet = package.Workbook.Worksheets[0];

                    using (SqlConnection connection = new SqlConnection(ConnectionString))
                    {
                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            connection.Open();

                            for (int row = 2; row <= worksheet.Dimension.End.Row; row++)
                            {
                                string questionType;
                                if (worksheet.Cells[row, 1].Value != null)
                                {
                                    questionType = worksheet.Cells[row, 1].Value.ToString();
                                }
                                else
                                {
                                    break;
                                }
                                string difficultyLevel = worksheet.Cells[row, 2].Value.ToString();
                                string questionText = worksheet.Cells[row, 3].Value.ToString();
                                string optionA = worksheet.Cells[row, 4].Value?.ToString() ?? "NULL";
                                string optionB = worksheet.Cells[row, 5].Value?.ToString() ?? "NULL";
                                string optionC = worksheet.Cells[row, 6].Value?.ToString() ?? "NULL";
                                string optionD = worksheet.Cells[row, 7].Value?.ToString() ?? "NULL";
                                string optionE = worksheet.Cells[row, 8].Value?.ToString() ?? "NULL";
                                int correctAnswer = Convert.ToInt32(worksheet.Cells[row, 9].Value);
                                //string FileName = Path.GetFileName(fileUpload.PostedFile.FileName);
                                int topicID = Convert.ToInt32(TopicDrp.SelectedValue);

                                command.Parameters.Clear();
                                command.Parameters.AddWithValue("@QuestionType", questionType);
                                command.Parameters.AddWithValue("@DifficultyLevel", difficultyLevel);
                                command.Parameters.AddWithValue("@QuestionText", questionText);
                                command.Parameters.AddWithValue("@OptionA", optionA);
                                command.Parameters.AddWithValue("@OptionB", optionB);
                                command.Parameters.AddWithValue("@OptionC", optionC);
                                command.Parameters.AddWithValue("@OptionD", optionD);
                                command.Parameters.AddWithValue("@OptionE", optionE);
                                command.Parameters.AddWithValue("@CorrectAnswer", correctAnswer);
                                command.Parameters.AddWithValue("@FileName", FileName);
                                command.Parameters.AddWithValue("@TopicID", topicID);
                                command.ExecuteNonQuery();
                            }
                        }
                    }
                    TopicDrp.SelectedIndex = 0;
                    ScriptManager.RegisterStartupScript(this, GetType(), "success", "alert('Records inserted successfully');", true);
                    BindAllFile();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "failure", "alert('Failed to insert records: " + ex.Message + "');", true);
            }
        }
        //Method For Import Excel File//

        //Method for Insert Records in Audit Table//
        private void InsertFileUploadAudit(string fileName, string filePath, int TopicId)
        {
            string auditQuery = "INSERT INTO FileUploadAudit (FileName, FilePath, TopicId) VALUES (@FileName, @FilePath, @TopicId)";

            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand command = new SqlCommand(auditQuery, connection))
                    {
                        connection.Open();
                        command.Parameters.AddWithValue("@FileName", fileName);
                        command.Parameters.AddWithValue("@FilePath", filePath);
                        command.Parameters.AddWithValue("@TopicId", TopicId);
                        command.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "failure", "alert('Failed to insert records: " + ex.Message + "');", true);
            }
        }
        //Method for Insert Records in Audit Table//

        //On Click Button Event to Excel File Insertion//
        protected void BtnExport_Click(object sender, EventArgs e)
        {
            try
            {
                string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
                string filePath = Server.MapPath("~/QuestionRepository/" + fileName);
                int TopicId = Convert.ToInt32(TopicDrp.SelectedValue);
                string fileExtension = System.IO.Path.GetExtension(fileUpload.FileName);
                if (fileUpload.HasFile && fileExtension == ".xls" || fileExtension == ".xlsx")
                {
                    fileUpload.SaveAs(filePath);
                    InsertRecordsFromExcel(filePath, fileName);
                    InsertFileUploadAudit(fileName, filePath, TopicId);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "failure", "alert('Failed to Upload file.Please Select A Valid file.');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "failure", "alert('Failed to Upload file :" + ex.Message + "'');", true);
            }

        }
        //On Click Button Event to Excel File Insertion//

        //On Click Button Event to Show Question Repository GridView// 
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string FileName = FileDrp.SelectedValue;
                BindGridView(FileName);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "failure", "alert('Failed to Bind GridView: " + ex.Message + "');", true);
            }
        }
        //On Click Button Event to Show Question Repository GridView//

        //Method for Bind Question Repository GridView//
        void BindGridView(string FileName)
        {
            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter dataAdapter = new SqlDataAdapter("select * from QuestionRepository where FileName='" + FileName + "'", ConnectionString);
                dataAdapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    QuestionGrv.DataSource = dt;
                    QuestionGrv.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    QuestionGrv.DataSource = dt;
                    QuestionGrv.DataBind();
                    QuestionGrv.Rows[0].Cells.Clear();
                    QuestionGrv.Rows[0].Cells.Add(new TableCell());
                    QuestionGrv.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                    QuestionGrv.Rows[0].Cells[0].Text = "No Data Found";
                    QuestionGrv.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "failure", "alert('Failed to insert records: " + ex.Message + "');", true);
            }
        }
        //Method for Bind Question Repository GridView//
        //Method for Bind File Audit Upload Pop Modal GridView//
        void BindLogPopUpGridView()
        {
            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter dataAdapter = new SqlDataAdapter("select * from FileUploadAudit", ConnectionString);
                dataAdapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    LogGrv.DataSource = dt;
                    LogGrv.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    LogGrv.DataSource = dt;
                    LogGrv.DataBind();
                    LogGrv.Rows[0].Cells.Clear();
                    LogGrv.Rows[0].Cells.Add(new TableCell());
                    LogGrv.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                    LogGrv.Rows[0].Cells[0].Text = "No Data Found";
                    LogGrv.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "failure", "alert('Failed to insert records: " + ex.Message + "');", true);
            }
        }
        //Method for Bind File Audit Upload Pop Modal GridView//
        //Method for Bind File Audit Upload Pop Modal GridView According to Course//
        void BindLogPopUpGridViewByCourse(int TopicId)
        {
            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter dataAdapter = new SqlDataAdapter("select * from FileUploadAudit where TopicId = '" + TopicId + "'", ConnectionString);
                dataAdapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    LogGrv.DataSource = dt;
                    LogGrv.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    LogGrv.DataSource = dt;
                    LogGrv.DataBind();
                    LogGrv.Rows[0].Cells.Clear();
                    LogGrv.Rows[0].Cells.Add(new TableCell());
                    LogGrv.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                    LogGrv.Rows[0].Cells[0].Text = "No Data Found";
                    LogGrv.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "failure", "alert('Failed to insert records: " + ex.Message + "');", true);
            }
        }
        //Method for Bind File Audit Upload Pop Modal GridView According to Course//

        //QuestionGridView PageIndexChanging Method//
        protected void QuestionGrv_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                string FileName = FileDrp.SelectedValue;
                if (QuestionGrv.PageIndex == 0 && e.NewPageIndex < 0)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showWarning", "alert('You are already on the first page.');", true);
                    e.Cancel = true;
                }
                else
                {
                    QuestionGrv.PageIndex = e.NewPageIndex;
                    BindGridView(FileName);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "failure", "alert('No Data In Previous Page: " + ex.Message + "');", true);
            }
        }
        //QuestionGridView PageIndexChanging Method//

        //Delete Questions//
        protected void QuestionGrv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string FileName = FileDrp.SelectedValue;
                int questionId = Convert.ToInt32(QuestionGrv.DataKeys[e.RowIndex].Value);
                using (SqlConnection con = new SqlConnection(ConnectionString))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM QuestionRepository WHERE QuestionID = @QuestionID", con))
                    {
                        cmd.Parameters.AddWithValue("@QuestionID", questionId);
                        cmd.ExecuteNonQuery();
                        ScriptManager.RegisterStartupScript(this, GetType(), "success", "alert('Record Deleted successfully');", true);
                        BindGridView(FileName);
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "failure", "alert('Failed to Delete Record: " + ex.Message + "');", true);
            }
        }
        //Delete Questions//
        //Log Topic DropDown Selected Index Change Method//
        protected void LogTopicDrp_SelectedIndexChanged(object sender, EventArgs e)
        {
            int TopicId = Convert.ToInt32(LogTopicDrp.SelectedValue);
            BindLogPopUpGridViewByCourse(TopicId);
        }
        //Log Topic DropDown Selected Index Change Method//
        protected void LogGrv_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                int TopicId = Convert.ToInt32(LogTopicDrp.SelectedValue);
                string FileName = FileDrp.SelectedValue;
                if (LogGrv.PageIndex == 0 && e.NewPageIndex < 0)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showWarning", "alert('You are already on the first page.');", true);
                    e.Cancel = true;
                }
                else
                {
                    LogGrv.PageIndex = e.NewPageIndex;
                    BindLogPopUpGridViewByCourse(TopicId);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "failure", "alert('No Data In Previous Page: " + ex.Message + "');", true);
            }
        }
    }
}