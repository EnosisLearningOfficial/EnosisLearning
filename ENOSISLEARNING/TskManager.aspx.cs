using System;
using System.IO;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Xml.Linq;
using System.Web.Configuration;
using DocumentFormat.OpenXml.Office2021.DocumentTasks;
using System.Net.PeerToPeer;
using Org.BouncyCastle.Ocsp;

namespace ENOSISLEARNING
{
    public partial class TskManager : System.Web.UI.Page
    {
        //SqlConnection//
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString());
        string ConnectionString = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["USERNAME"] != null)
                {
                    txtUsername.Text = Session["USERNAME"].ToString();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
                txtUsername.Enabled = false;
                BindEmpDrp();
                BindEmpDrp1();
                GetAllData();
                BindEmpStatus();
                //BindAuditHistory(int empId);
                //BindAuditHistory(88);
                
                //if (Request.Form["empId"] != null)
                //{
                //    int empId = Convert.ToInt32(Request.Form["empId"]);
                //    BindAuditHistory(empId);
                //}
            }
        }
       
        protected void btnSelect_Click(object sender, EventArgs e)
        {


            // Get the EmpId from the CommandArgument of the clicked button
            ImageButton btn = (ImageButton)sender;
            int empId = Convert.ToInt32(btn.CommandArgument);

            // Fetch related records from AuditTaskManager for this EmpId
            BindAuditHistory(empId);

        }

        private void BindAuditHistory(int empId)
        {

            // Connection string (use your own connection string)
            string connString = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

            // SQL query to fetch data for the clicked EmpId
            string query = "SELECT * FROM [dbo].[AuditTaskManager] WHERE EmployeeID = @EmployeeID";

            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@EmployeeID", empId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                // Bind the data to the AuditGrv GridView
                AuditGrv.DataSource = dt;
                AuditGrv.DataBind();

                // Optionally, display the EmpId in the modal header or label
                idlbl.Text = "Audit History for Employee ID: " + empId;
            }
        }

        


        //Bind GridView Table Data//
        public void GetAllData()
        {
            //con.Open();
            SqlCommand cmd = new SqlCommand("select * from TaskManager", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            try
            {
                if (dt.Rows.Count > 0)
                {
                    TaskGrv.DataSource = dt;
                    TaskGrv.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    TaskGrv.DataSource = dt;
                    TaskGrv.DataBind();
                    TaskGrv.Rows[0].Cells.Clear();
                    TaskGrv.Rows[0].Cells.Add(new TableCell());
                    TaskGrv.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                    TaskGrv.Rows[0].Cells[0].Text = "No record found";
                    TaskGrv.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                }
            }
            catch (Exception ex)
            {


            }
        }
        //Bind GridView Table Data//

        //Employee DropDownListBind//
        void BindEmpDrp()
        {
            try
            {
                EmpDrp.DataSource = dbconnect.GetDataSet("select USERNAME from USERDETAILS");
                string query = "select USERNAME from USERDETAILS";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable data = new DataTable();
                sda.Fill(data);
                EmpDrp.DataSource = data;
                EmpDrp.DataTextField = "USERNAME";
                EmpDrp.DataValueField = "USERNAME";
                EmpDrp.DataBind();
                ListItem selectitem = new ListItem("Select  Employee", "Select Employee");
                selectitem.Selected = true;
                EmpDrp.Items.Insert(0, selectitem);
            }
            catch (Exception ex)
            {

                //lblmsg.Text = ex.Message;
            }
        }
        void BindEmpDrp1()
        {
            try
            {
                EmpDrp1.DataSource = dbconnect.GetDataSet("select USERNAME from USERDETAILS");
                string query = "select USERNAME from USERDETAILS";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable data = new DataTable();
                sda.Fill(data);
                EmpDrp1.DataSource = data;
                EmpDrp1.DataTextField = "USERNAME";
                EmpDrp1.DataValueField = "USERNAME";
                EmpDrp1.DataBind();
                ListItem selectitem = new ListItem("Select  Employee", "Select Employee");
                selectitem.Selected = true;
                EmpDrp1.Items.Insert(0, selectitem);
            }
            catch (Exception ex)
            {

                //lblmsg.Text = ex.Message;
            }
        }
        //Employee DropDownListBind//

        //ADD TASK//

        void BindEmpStatus()
        {
            try
            {
                StatusAdd.DataSource = dbconnect.GetDataSet("select STATUSNAME from TaskStatus");
                string query = "select STATUSNAME from TaskStatus";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable data = new DataTable();
                sda.Fill(data);
                StatusAdd.DataSource = data;
                StatusAdd.DataTextField = "STATUSNAME";
                StatusAdd.DataValueField = "STATUSNAME";
                StatusAdd.DataBind();
                ListItem selectitem = new ListItem("Select  Employee", "Select Employee");
                selectitem.Selected = true;
                StatusAdd.Items.Insert(0, selectitem);
            }
            catch (Exception ex)
            {

                //lblmsg.Text = ex.Message;
            }
        }



        protected void InsertTask()
        {

            string FileName = string.Empty;
            FileName = File.PostedFile.FileName;

            try
            {

                con.Open();
                //using (SqlCommand cmd = new SqlCommand("INSERT INTO TaskManager (EName, TaskName, StartDate, EndDate, Status, Comment, FileDetails, @Details) VALUES (@EName, @TaskName, @StartDate, @EndDate, @Status, @Comment, @FileDetails, @Details)", con))
                using (SqlCommand cmd = new SqlCommand("INSERT INTO TaskManager (EName, TaskName, StartDate, EndDate, Status, Comment, FileDetails, Details, USERNAME) VALUES (@EName, @TaskName, @StartDate, @EndDate, @Status, @Comment, @FileDetails, @Details, @USERNAME)", con))
                {
                    // Add parameters
                    cmd.Parameters.AddWithValue("@EName", EmpDrp.SelectedValue);
                    cmd.Parameters.AddWithValue("@TaskName", TaskName.Text);

                    DateTime startDate;
                    DateTime endDate;

                    if (DateTime.TryParse(StartDate.Text, out startDate))
                    {
                        cmd.Parameters.AddWithValue("@StartDate", startDate);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Invalid Start Date format');", true);
                        return;
                    }

                    if (DateTime.TryParse(EndDate.Text, out endDate))
                    {
                        cmd.Parameters.AddWithValue("@EndDate", endDate);
                    }
                    else
                    {

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Invalid End Date format');", true);
                        return;
                    }

                    cmd.Parameters.AddWithValue("@Status", Status.Text);
                    cmd.Parameters.AddWithValue("@Comment", Comment.Text);
                    cmd.Parameters.AddWithValue("@FileDetails", FileName);
                    cmd.Parameters.AddWithValue("@Details", Details.Text);

                    cmd.ExecuteNonQuery();

                }


                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Record Inserted Successfully');", true);

                // Clear the form fields
                TaskName.Text = string.Empty;
                StartDate.Text = string.Empty;
                EndDate.Text = string.Empty;
                Status.Text = string.Empty;
                Comment.Text = string.Empty;
            }
            catch (Exception ex)
            {
                // Handle the exception
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Error: " + ex.Message + "');", true);
            }

        }

        protected void btn_Click(object sender, EventArgs e)
        {
            InsertTask();
            BindEmpDrp();
            GetAllData();
            string FileName = string.Empty;
            FileName = File.PostedFile.FileName;
            if (File.HasFile)
            {
                FileName = File.PostedFile.FileName;
                //File.PostedFile.SaveAs(Server.MapPath(@"~/Application/FileNew/" + FileName.Trim()));
                File.PostedFile.SaveAs(Server.MapPath(@"~/FileNew/" + FileName.Trim()));
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Please Upload The File.!')</script>");
                return;
            }
        }
        //ADD TASK//

        //Edit Task//     
        protected void TaskGrv_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                TaskGrv.EditIndex = e.NewEditIndex;
                //DataBind(); // Rebind the grid
                GetAllData();
                DropDownList ddl = (DropDownList)TaskGrv.Rows[e.NewEditIndex].FindControl("StatusAdd1");
                if (ddl != null)
                {
                    BindDropDown(ddl);
                    
                }
                
            }
            catch (Exception ex)
            {
                // lblError.Text = ex.Message;
                throw;
            }
            
        }
       
        //Cancel Edit Task//
        protected void TaskGrv_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            TaskGrv.EditIndex = -1;
            GetAllData();
        }
        //Cancel Edit Task//

        //Update Task//
        protected void TaskGrv_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string Id = TaskGrv.DataKeys[e.RowIndex].Value.ToString();
            try
            {
                TextBox EnameText = (TextBox)TaskGrv.Rows[e.RowIndex].FindControl("EmpnameText");
                TextBox TaskNameText = (TextBox)TaskGrv.Rows[e.RowIndex].FindControl("TaskNameText");
                TextBox StartdateText = (TextBox)TaskGrv.Rows[e.RowIndex].FindControl("StartDateText");
                TextBox EnddateText = (TextBox)TaskGrv.Rows[e.RowIndex].FindControl("EndDateText");
                DropDownList TaskstatusText = (DropDownList)TaskGrv.Rows[e.RowIndex].FindControl("StatusAdd1");
                string SName = TaskstatusText.SelectedValue;
                TextBox CommentText = (TextBox)TaskGrv.Rows[e.RowIndex].FindControl("CommentText");
                FileUpload file = (FileUpload)TaskGrv.Rows[e.RowIndex].FindControl("FileEdit");

                Label lblEditFile = (Label)TaskGrv.Rows[e.RowIndex].FindControl("lblEditFile");

                string FileName = lblEditFile.Text;
                if (file.HasFile)
                {
                    FileName = file.FileName;
                    file.PostedFile.SaveAs(Server.MapPath(@"~/FileNew/" + FileName.Trim()));

                }
                TextBox EDetails = (TextBox)TaskGrv.Rows[e.RowIndex].FindControl("EDetails");

                DateTime startDate;
                DateTime endDate;

                if (!DateTime.TryParse(StartdateText.Text, out startDate))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Invalid Start Date format.')</script>");
                    return;
                }

                if (!DateTime.TryParse(EnddateText.Text, out endDate))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Invalid End Date format.')</script>");
                    return;
                }

                string username = string.Empty;
                if (Session["USERNAME"] != null)
                {
                    username = Session["USERNAME"].ToString();
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('No USERNAME found in session.')</script>");
                    return;
                }

                con.Open();
                using (SqlCommand cmd = new SqlCommand("UPDATE TaskManager SET EName = @EName, TaskName = @TaskName, StartDate = @StartDate, EndDate = @EndDate, Status = @Status, Comment = @Comment, FileDetails = @FileDetails, Details= @Details, Username=@Username WHERE Id = @Id", con))
                {
                    cmd.Parameters.AddWithValue("@EName", EnameText.Text.Trim());
                    cmd.Parameters.AddWithValue("@TaskName", TaskNameText.Text.Trim());
                    cmd.Parameters.AddWithValue("@StartDate", startDate);
                    cmd.Parameters.AddWithValue("@EndDate", endDate);
                    cmd.Parameters.AddWithValue("@Status", SName);
                    cmd.Parameters.AddWithValue("@Comment", CommentText.Text.Trim());
                    cmd.Parameters.AddWithValue("@FileDetails", FileName);
                    cmd.Parameters.AddWithValue("@Details", EDetails.Text.Trim());
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Id", Id);

                    cmd.ExecuteNonQuery();
                }

                TaskGrv.EditIndex = -1;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Updated Successfully.')</script>");
                con.Close();
                GetAllData();
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Error Occurred: " + ex.Message + "')</script>");
            }
        }
       

        protected void TaskGrv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string Task_Id = TaskGrv.DataKeys[e.RowIndex].Value.ToString();
                string username = string.Empty;

                if (Session["USERNAME"] != null)
                {
                    username = Session["USERNAME"].ToString();
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('No USERNAME found in session.')</script>");
                    return;
                }

                con.Open();
                string query = " delete TaskManager where Id=" + Task_Id;
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();

                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Task Deleted.')</script>");
                GetAllData();

                GridViewRow row = TaskGrv.Rows[e.RowIndex];

                // Safely check for lblFile control
                Label lblFile = row.FindControl("lblFile") as Label;
                if (lblFile != null && !string.IsNullOrEmpty(lblFile.Text)) // Check if lblFile exists and has text
                {
                    string FileName = lblFile.Text;
                    string file = Server.MapPath(@"~/Application/FileNew/" + FileName.Trim());

                    // Check if file exists in directory before deleting
                    string directoryPath = Server.MapPath(@"~/FileNew/");
                    if (System.IO.Directory.Exists(directoryPath))
                    {
                        foreach (string Ufile in System.IO.Directory.GetFiles(directoryPath))
                        {
                            if (System.IO.File.Exists(Ufile))
                            {
                                System.IO.File.Delete(Ufile);
                            }
                        }
                    }
                }
                else
                {
                    // Handle case where lblFile is null or empty
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('No file associated with the task.')</script>");
                }

                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Task Deleted.')</script>");
                GetAllData();
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Error Occurred: " + ex.Message + "')</script>");
            }
        }


        //Search GridView by Employee name//
        public void SearchByName()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from TaskManager where EName='" + txtSearch.Text + "'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            try
            {
                if (dt.Rows.Count > 0)
                {
                    TaskGrv.DataSource = dt;
                    TaskGrv.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    TaskGrv.DataSource = dt;
                    TaskGrv.DataBind();
                    TaskGrv.Rows[0].Cells.Clear();
                    TaskGrv.Rows[0].Cells.Add(new TableCell());
                    TaskGrv.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                    TaskGrv.Rows[0].Cells[0].Text = "No record found";
                    TaskGrv.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                }
            }
            catch (Exception ex)
            {

                //ErrorMessage.Text = ex.Message;
            }

        }
        //Search GridView by Employee name//

        //Search GridView by Task name//
        public void SearchByTask()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from TaskManager where TaskName='" + txtSearch.Text + "'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            try
            {
                if (dt.Rows.Count > 0)
                {
                    TaskGrv.DataSource = dt;
                    TaskGrv.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    TaskGrv.DataSource = dt;
                    TaskGrv.DataBind();
                    TaskGrv.Rows[0].Cells.Clear();
                    TaskGrv.Rows[0].Cells.Add(new TableCell());
                    TaskGrv.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                    TaskGrv.Rows[0].Cells[0].Text = "No record found";
                    TaskGrv.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                }
            }
            catch (Exception ex)
            {

                //ErrorMessage.Text = ex.Message;
            }
        }
        //Search GridView by Task name//

        //Search GridView by Status name//
        public void SearchByStatus()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from TaskManager where Status='" + txtSearch.Text + "'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            try
            {
                if (dt.Rows.Count > 0)
                {
                    TaskGrv.DataSource = dt;
                    TaskGrv.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    TaskGrv.DataSource = dt;
                    TaskGrv.DataBind();
                    TaskGrv.Rows[0].Cells.Clear();
                    TaskGrv.Rows[0].Cells.Add(new TableCell());
                    TaskGrv.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                    TaskGrv.Rows[0].Cells[0].Text = "No record found";
                    TaskGrv.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                }
            }
            catch (Exception ex)
            {

                //ErrorMessage.Text = ex.Message;
            }
        }
        //Search GridView by Status name//

        //View Task//
        protected void ViewGrid_Click(object sender, EventArgs e)
        {
            GetAllData();
            txtSearch.Text = string.Empty;

        }
        //View Task//

        //Search Task//
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {

                if (ddlSearchBy.SelectedValue == "All")
                {
                    GetAllData();
                }
                if (ddlSearchBy.SelectedValue == "EmployeeName")
                {
                    string Name = Convert.ToString(txtSearch.Text);
                    SearchByName();
                }
                if (ddlSearchBy.SelectedValue == "TaskName")
                {
                    string Name = Convert.ToString(txtSearch.Text);
                    SearchByTask();
                }
                if (ddlSearchBy.SelectedValue == "Status")
                {
                    string Name = Convert.ToString(txtSearch.Text);
                    SearchByStatus();
                }
                txtSearch.Text = string.Empty;
            }
            catch (Exception ex)
            {

                //ErrorMessage.Text = ex.Message;
            }
        }
        //Search Task//

        //Download File//
        protected void TaskGrv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                Response.Clear();
                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("Content-Disposition", "filename=" + e.CommandArgument);
                Response.TransmitFile(Server.MapPath("~/FileNew/") + e.CommandArgument);
                Response.End();
            }
            if (e.CommandName == "AuditDetails")
            {
                // Get the Job ID from the CommandArgument
                string id = e.CommandArgument.ToString();

                // Redirect to the VacancyDetails.aspx page with the job code as a query string
                Response.Redirect("TskAuditDetails.aspx?Id=" + id);
            }

        }

        protected void TaskGrv_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (TaskGrv.PageIndex == 0 && e.NewPageIndex < 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showWarning", "alert('You are already on the first page.');", true);
                e.Cancel = true;
            }
            else
            {
                TaskGrv.PageIndex = e.NewPageIndex;
                DataBind();
            }

           // TaskGrv.PageIndex = e.NewPageIndex;
            GetAllData();
        }
        
        protected void Search_Click(object sender, EventArgs e)
        {
            try
            {

                if (ddlSearchBy.SelectedValue == "All")
                {
                    GetAllData();
                }
                if (ddlSearchBy.SelectedValue == "EmployeeName")
                {
                    string Name = Convert.ToString(txtSearch.Text);
                    SearchByName();
                }
                if (ddlSearchBy.SelectedValue == "TaskName")
                {
                    string Name = Convert.ToString(txtSearch.Text);
                    SearchByTask();
                }
                if (ddlSearchBy.SelectedValue == "Status")
                {
                    string Name = Convert.ToString(txtSearch.Text);
                    SearchByStatus();
                }
            }
            catch (Exception ex)
            {

                //ErrorMessage.Text = ex.Message;
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            InsertTaskAdd();
            BindEmpDrp1();
            GetAllData();
            BindEmpStatus();


        }


        protected void InsertTaskAdd()
        {
            string FileName = string.Empty;
            if (FileAdd.HasFile)
            {
                FileName = Path.GetFileName(FileAdd.PostedFile.FileName);
                string savePath = Server.MapPath("~/FileNew/") + FileName;
                FileAdd.PostedFile.SaveAs(savePath);
            }

            try
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("INSERT INTO TaskManager (EName, TaskName, StartDate, EndDate, Status, Comment, FileDetails, Details, USERNAME) VALUES (@EName, @TaskName, @StartDate, @EndDate, @Status, @Comment, @FileDetails, @Details, @USERNAME)", con))
                {
                    cmd.Parameters.AddWithValue("@EName", EmpDrp1.SelectedValue);

                    cmd.Parameters.AddWithValue("@TaskName", TskNameAdd.Text);

                    DateTime startDate;
                    DateTime endDate;

                    if (DateTime.TryParse(StartDateAdd.Text, out startDate))
                    {
                        cmd.Parameters.AddWithValue("@StartDate", startDate);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Invalid Start Date format');", true);
                        return;
                    }

                    if (DateTime.TryParse(EndDateAdd.Text, out endDate))
                    {
                        cmd.Parameters.AddWithValue("@EndDate", endDate);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Invalid End Date format');", true);
                        return;
                    }

                    cmd.Parameters.AddWithValue("@Status", StatusAdd.SelectedValue);
                    cmd.Parameters.AddWithValue("@Comment", CommentAdd.Text);
                    cmd.Parameters.AddWithValue("@FileDetails", FileName);
                    cmd.Parameters.AddWithValue("@Details", TextTaskDetails.Text);

                    if (Session["USERNAME"] != null)
                    {
                        cmd.Parameters.AddWithValue("@Username", Session["USERNAME"].ToString());
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('No USERNAME found in session');", true);
                        return;
                    }

                    cmd.ExecuteNonQuery();
                }

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Record Inserted Successfully');", true);

                // Clear the form fields
                TskNameAdd.Text = string.Empty;
                StartDateAdd.Text = string.Empty;
                EndDateAdd.Text = string.Empty;
                StatusAdd.Text = string.Empty;
                CommentAdd.Text = string.Empty;
                TextTaskDetails.Text= string.Empty;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Error: " + ex.Message + "');", true);
            }
            finally
            {
                con.Close();
            }
        }

        private void BindDropDown(DropDownList ddl)
        {
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT STATUSNAME FROM TaskStatus", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                ddl.DataSource = dt;
                ddl.DataTextField = "STATUSNAME";
                ddl.DataValueField = "STATUSNAME";
                ddl.DataBind();
            }

        }

    }
}