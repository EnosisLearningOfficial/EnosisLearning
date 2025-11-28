using iTextSharp.text;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ENOSISLEARNING
{
    public partial class FinalBatchSheet : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString());
        string ConnectionString = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCourseDDL();
                if (ChapterGrv != null)
                {
                    foreach (GridViewRow row in ChapterGrv.Rows)
                    {
                        System.Web.UI.WebControls.Label Chapter_Id = (System.Web.UI.WebControls.Label)row.FindControl("LblChpId");
                        if (Chapter_Id != null)
                        {
                            string chapterIdValue = Chapter_Id.Text;
                            ExpandNestedGridView(chapterIdValue);
                        }
                    }
                }
            }
        }
        // Method to expand the nested GridView
        protected void ExpandNestedGridView(string chapterId)
        {
            foreach (GridViewRow row in ChapterGrv.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    System.Web.UI.WebControls.Label lblChapterId = (System.Web.UI.WebControls.Label)row.FindControl("LblChpId");
                    if (lblChapterId != null && lblChapterId.Text == chapterId)
                    {
                        GridView TopicGrv = (GridView)row.FindControl("TopicGrv");
                        if (TopicGrv != null)
                        {
                            TopicGrv.Visible = true;
                        }
                        break;
                    }
                }
            }
        }
        // Method to expand the nested GridView
        //Bind Dropdown// 
        void BindCourseDDL()
        {
            try
            {
                string Query = "SELECT COURSEID, COURSENAME FROM COURSES_DETAIL";

                using (SqlConnection Connection = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand command = new SqlCommand(Query, Connection))
                    {
                        Connection.Open();
                        SqlDataAdapter sda = new SqlDataAdapter(command);
                        DataTable data = new DataTable();
                        sda.Fill(data);
                        drpCourses.DataSource = data;
                        drpCourses.DataTextField = "COURSENAME";
                        drpCourses.DataValueField = "COURSEID";
                        drpCourses.DataBind();
                    }
                }
                System.Web.UI.WebControls.ListItem selectitem = new System.Web.UI.WebControls.ListItem("Select Course", "");
                drpCourses.Items.Insert(0, selectitem);
            }
            catch (SqlException ex)
            {
                LogError(ex);
                ShowError("An error occurred while fetching course data.");
            }
            catch (Exception ex)
            {
                LogError(ex);
                ShowError("An unexpected error occurred.");
            }
        }
        //Method For Log Error//
        void LogError(Exception ex)
        {
            Errorlbl.ForeColor = System.Drawing.Color.Red;
            Errorlbl.Text = ex.Message;
        }
        //Method For Log Error//
        //Method For Show Error Messages//
        void ShowError(string message)
        {
            Errorlbl.Text = message;
            Errorlbl.ForeColor = System.Drawing.Color.Red;
        }
        //Method For Show Error Messages//
        //Dropdown SelectedIndexChanged//
        protected void drpCourses_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (drpCourses.SelectedIndex != 0)
                {
                    int Course_Id = Convert.ToInt32(drpCourses.SelectedValue);
                    ViewChapterGridView(Course_Id);
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Please select Course.')</script>");
                    drpCourses.SelectedIndex = 0;
                }
            }
            catch (Exception ex)
            {
                LogError(ex);
                ShowError("An error occurred while fetching course data.");
            }
        }
        //Dropdown SelectedIndexChanged//
        // Bind Chapter GridView// 
        void ViewChapterGridView(int Course_Id)
        {
            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter dataAdapter = new SqlDataAdapter("SELECT * FROM enosis.COURSE_CHAPTER_DETAIL where Course_Id='" + Course_Id + "'", con);
                dataAdapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    ChapterGrv.DataSource = dt;
                    ChapterGrv.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    ChapterGrv.DataSource = dt;
                    ChapterGrv.DataBind();
                    ChapterGrv.Rows[0].Cells.Clear();
                    ChapterGrv.Rows[0].Cells.Add(new TableCell());
                    ChapterGrv.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                    ChapterGrv.Rows[0].Cells[0].Text = "No Data Found";
                    ChapterGrv.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                    ChapterGrv.Rows[0].Cells[0].BorderStyle = BorderStyle.None;
                }
            }
            catch (Exception ex)
            {
                LogError(ex);
                ShowError("An error occurred while fetching Chapter data.");
            }
        }
        // Bind Chapter GridView// 
        //CRUD In Chapter GridView//
        protected void ChapterGrv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //Add Chapter//
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    int courseId = Convert.ToInt32(drpCourses.SelectedValue);
                    TextBox txtNewChapterNumber = ChapterGrv.FooterRow.FindControl("txtNewChapterNumber") as TextBox;

                    if (txtNewChapterNumber != null)
                    {
                        // Retrieve the chapter number entered in the TextBox
                        string newChapterNumber = txtNewChapterNumber.Text.Trim();
                        if (!string.IsNullOrEmpty(newChapterNumber))
                        {
                            using (SqlConnection connection = new SqlConnection(ConnectionString))
                            {
                                connection.Open();
                                string query = "INSERT INTO enosis.COURSE_CHAPTER_DETAIL (Chapter_Number, Course_Id) VALUES (@Chapter_Number, @Course_Id)";
                                using (SqlCommand cmd = new SqlCommand(query, connection))
                                {
                                    cmd.Parameters.AddWithValue("@Chapter_Number", newChapterNumber);
                                    cmd.Parameters.AddWithValue("@Course_Id", courseId);
                                    int rowsAffected = cmd.ExecuteNonQuery();
                                    if (rowsAffected > 0)
                                    {
                                        ViewChapterGridView(courseId);
                                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Chapter Added.')</script>");
                                    }
                                    else
                                    {
                                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Failed to add chapter.')</script>");
                                    }
                                }
                            }
                        }
                        else
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Chapter number cannot be empty.')</script>");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                LogError(ex);
                ShowError("An error occurred while Adding Chapter data.");
            }
            //Add Chapter//
        }
        //CRUD In Chapter GridView//
        // Method to bind Topic Gridview inside Chapter GridView//
        protected void BindTopicGridView(string chapterId, GridView topicGridView)
        {
            try
            {
                DataTable dt = new DataTable();
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
                {
                    SqlDataAdapter dataAdapter = new SqlDataAdapter("SELECT Topic_Id, Topic_Name, Days FROM enosis.COURSE_TOPIC_DETAIL WHERE Chapter_Id = @Chapter_Id", con);
                    dataAdapter.SelectCommand.Parameters.AddWithValue("@Chapter_Id", chapterId);
                    dataAdapter.Fill(dt);
                }

                if (dt.Rows.Count > 0)
                {
                    topicGridView.DataSource = dt;
                    topicGridView.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    topicGridView.DataSource = dt;
                    topicGridView.DataBind();
                    topicGridView.Rows[0].Cells.Clear();
                    topicGridView.Rows[0].Cells.Add(new TableCell());
                    topicGridView.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                    topicGridView.Rows[0].Cells[0].Text = "No Data Found";
                    topicGridView.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                    topicGridView.Rows[0].Cells[0].BorderStyle = BorderStyle.None;
                }
            }
            catch (Exception ex)
            {
            }
        }
        // Method to bind Topic Gridview inside Chapter GridView//
        //Edit Chapter//
        protected void ChapterGrv_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                ChapterGrv.EditIndex = e.NewEditIndex;
                int courseId = Convert.ToInt32(drpCourses.SelectedValue);
                ViewChapterGridView(courseId);
            }
            catch (Exception ex)
            {
                LogError(ex);
                ShowError("An error occurred while editing the Chapter.");
            }
        }
        protected void Chaptergv_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            int Course_Id = Convert.ToInt32(drpCourses.SelectedValue);
            ChapterGrv.EditIndex = -1;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Chapter Editing Aborted.')</script>");
            ViewChapterGridView(Course_Id);
        }
        //Edit Chapter//
        //Delete Chapter//
        protected void Chaptergv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int Course_Id = Convert.ToInt32(drpCourses.SelectedValue);
            try
            {
                con.Open();
                string query = " delete enosis.COURSE_CHAPTER_DETAIL where Chapter_Id=@Chapter_Id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("Chapter_Id", Convert.ToInt32(ChapterGrv.DataKeys[e.RowIndex].Value.ToString()));
                cmd.ExecuteNonQuery();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Chapter Deleted.')</script>");
                con.Close();
                ViewChapterGridView(Course_Id);
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Please Delete Topics First.!')</script>");
                LogError(ex);
                ShowError("An error occurred while editing the Chapter.");
                ViewChapterGridView(Course_Id);
            }
        }
        //Delete Chapter//
        protected void Chaptergv_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int Course_Id = Convert.ToInt32(drpCourses.SelectedValue);
            try
            {
                con.Open();
                string query = "UPDATE enosis.COURSE_CHAPTER_DETAIL SET Chapter_Number=@Chapter_NumberTxt WHERE Chapter_Id=@Chapter_Id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Chapter_NumberTxt", (ChapterGrv.Rows[e.RowIndex].FindControl("Chapter_NumberTxt") as TextBox).Text.Trim());
                cmd.Parameters.AddWithValue("@Chapter_Id", Convert.ToInt32(ChapterGrv.DataKeys[e.RowIndex].Value.ToString()));
                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    ChapterGrv.EditIndex = -1;
                    ViewChapterGridView(Course_Id);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Chapter Updated.')</script>");
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('No rows were updated.')</script>");
                }
            }
            catch (Exception ex)
            {
                LogError(ex);
                ShowError("An error occurred while Updating Chapter.");
            }
            finally
            {
                con.Close();
            }
        }

        //Method of Keep Topic GridView Expanded With Panel//
        protected void ToggleNestedGridView(object sender, EventArgs e)
        {
            try
            {
                GridViewRow row = (GridViewRow)((ImageButton)sender).NamingContainer;
                Panel pnlNestedGridView = (Panel)row.FindControl("pnlNestedGridView");
                pnlNestedGridView.Visible = !pnlNestedGridView.Visible;
            }
            catch (Exception ex)
            {
                LogError(ex);
                ShowError("An error occurred while Expand Topic GridView.");
            }
        }
        //Method of Keep Topic GridView Expanded With Panel//
        //Bind Topic GridView//
        protected void ChapterGrv_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                GridView TopicGrv = e.Row.FindControl("TopicGrv") as GridView;
                string Chapter_Id = DataBinder.Eval(e.Row.DataItem, "Chapter_Id").ToString();
                int Course_Id = Convert.ToInt32(drpCourses.SelectedValue);
                BindTopicGridView(Chapter_Id, TopicGrv);
            }
        }
        //Bind Topic GridView//
        //CRUD In Topic GridView//
        protected void TopicGrv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Expand")
            {
                try
                {
                    // Get the row index from the CommandArgument
                    int rowIndex = Convert.ToInt32(e.CommandArgument);

                    // Check if the index is within the valid range
                    if (rowIndex >= 0 && rowIndex < ChapterGrv.Rows.Count)
                    {
                        GridViewRow row = ChapterGrv.Rows[rowIndex];

                        // Find the Panel that contains the nested GridView
                        Panel pnlNestedGridView = (Panel)row.FindControl("pnlNestedGridView");
                        ImageButton btnExpand = (ImageButton)row.FindControl("btnExpand");

                        if (pnlNestedGridView != null && btnExpand != null)
                        {
                            // Toggle visibility
                            bool isVisible = !pnlNestedGridView.Visible;
                            pnlNestedGridView.Visible = isVisible;

                            // Update the button image based on the new visibility state
                            btnExpand.ImageUrl = isVisible ? "~/Images/plus.png" : "~/Images/plus.png";

                            // If expanded, bind the nested GridView
                            if (isVisible)
                            {
                                string chapterId = ((System.Web.UI.WebControls.Label)row.FindControl("LblChpId")).Text;
                                GridView topicGridView = (GridView)row.FindControl("TopicGrv");
                                BindTopicGridView(chapterId, topicGridView);
                            }
                        }
                        else
                        {
                            // Log or handle the case where controls are not found
                            System.Diagnostics.Debug.WriteLine("Panel or Button not found.");
                        }
                    }
                    else
                    {
                        // Log or handle invalid row index
                        System.Diagnostics.Debug.WriteLine("Invalid row index.");
                    }
                }
                catch (Exception ex)
                {
                    // Log the exception
                    LogError(ex);
                    ShowError("An error occurred while processing the command.");
                }
            }
            // Add Topic//
            if (e.CommandName == "AddTopicGrv")
            {
                try
                {
                    int Course_Id = Convert.ToInt32(drpCourses.SelectedValue);
                    GridView Topicgrv = (GridView)sender;
                    GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
                    int rowIndex = ((((ImageButton)e.CommandSource).NamingContainer.Parent.Parent.Parent.Parent.Parent) as GridViewRow).RowIndex;
                    string Chapter_Id = ChapterGrv.DataKeys[rowIndex].Value.ToString();
                    using (SqlConnection con = new SqlConnection(ConnectionString))
                    {
                        con.Open();
                        string query = "INSERT INTO enosis.COURSE_TOPIC_DETAIL (Topic_Name, Days, Chapter_Id) VALUES (@Topic_Name, @Days, @Chapter_Id)";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@Topic_Name", (Topicgrv.FooterRow.FindControl("FooterTopic_NameTxt") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@Days", (Topicgrv.FooterRow.FindControl("FooterTopic_DaysTxt") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@Chapter_Id", Chapter_Id);
                        cmd.ExecuteNonQuery();
                    }
                    (Topicgrv.FooterRow.FindControl("FooterTopic_NameTxt") as TextBox).Text = string.Empty;
                    (Topicgrv.FooterRow.FindControl("FooterTopic_DaysTxt") as TextBox).Text = string.Empty;
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "AddTopicSuccess", "alert('Topic Added.');", true);
                    BindTopicGridView(Chapter_Id, Topicgrv);
                    ExpandNestedGridView(Chapter_Id);
                }
                catch (Exception ex)
                {
                    LogError(ex);
                    ShowError("An error occurred while Adding the Topic.");
                }
            }
            // Add Topic//
            // Delete Topic//
            else if (e.CommandName == "DeleteTopic")
            {
                try
                {
                    GridView Topicgrv = (GridView)sender;
                    int rowIndex = ((((ImageButton)e.CommandSource).NamingContainer.Parent.Parent.Parent.Parent.Parent) as GridViewRow).RowIndex;
                    string Chapter_Id = ChapterGrv.DataKeys[rowIndex].Value.ToString();
                    int Course_Id = Convert.ToInt32(drpCourses.SelectedValue);
                    GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
                    int RowIndex = row.RowIndex;
                    string Topic_Id = (row.FindControl("HdnTopicId") as HiddenField).Value;
                    string query = "DELETE FROM enosis.COURSE_TOPIC_DETAIL WHERE Topic_Id = @Topic_Id";
                    using (SqlConnection con = new SqlConnection(ConnectionString))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@Topic_Id", Topic_Id);
                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Topic Deleted.')</script>");
                        }
                        else
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Failed to delete topic.')</script>");
                        }
                    }
                    BindTopicGridView(Chapter_Id, Topicgrv);
                    ExpandNestedGridView(Chapter_Id);
                }
                catch (Exception ex)
                {
                    LogError(ex);
                    ShowError("An error occurred while deleting the topic.");
                }
            }
            // Delete Topic//
            // Update Topic//
            if (e.CommandName == "Update")
            {
                try
                {
                    // Get the index of the row being updated
                    int rowIndex = Convert.ToInt32(e.CommandArgument);

                    // Get the GridView
                    GridView topicGrv = (GridView)sender;

                    // Retrieve the Topic_Id
                    int topicId = Convert.ToInt32(topicGrv.DataKeys[rowIndex].Value);

                    // Retrieve and trim the updated values
                    string topicName = ((TextBox)topicGrv.Rows[rowIndex].FindControl("Topic_NameTxt")).Text.Trim();
                    string daysText = ((TextBox)topicGrv.Rows[rowIndex].FindControl("DaysTxt")).Text.Trim();

                    // Validate the days input (single integer)
                    if (!int.TryParse(daysText, out int days))
                    {
                        ShowError($"Days must be a valid number. Invalid input: {daysText}");
                        return;
                    }

                    // Find the parent GridViewRow
                    GridViewRow parentRow = (GridViewRow)topicGrv.NamingContainer;

                    // Find the ChapterId associated with the parent row
                    string chapterId = ((System.Web.UI.WebControls.Label)parentRow.FindControl("LblChpId")).Text;

                    // Update the topic in the database
                    string connectionString = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        string query = "UPDATE enosis.COURSE_TOPIC_DETAIL SET Topic_Name = @TopicName, Days = @Days WHERE Topic_Id = @TopicId";
                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@TopicName", topicName);
                            cmd.Parameters.AddWithValue("@Days", days);
                            cmd.Parameters.AddWithValue("@TopicId", topicId);
                            conn.Open();
                            cmd.ExecuteNonQuery();
                            conn.Close();
                        }
                    }

                    // Reset the EditIndex
                    topicGrv.EditIndex = -1;

                    // Rebind the nested GridView
                    BindTopicGridView(chapterId, topicGrv);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Topic Updated.')</script>");
                }
                catch (Exception ex)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Error Occured. ')</script>");
                }
            }
            // Update Topic//
        }

        protected void btnExpand_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                // Get the GridViewRow containing the clicked ImageButton
                GridViewRow row = (GridViewRow)((ImageButton)sender).NamingContainer;

                // Find the Panel within the row
                Panel pnlNestedGridView = (Panel)row.FindControl("pnlNestedGridView");

                if (pnlNestedGridView != null)
                {
                    // Toggle the visibility of the Panel
                    pnlNestedGridView.Visible = !pnlNestedGridView.Visible;

                    // Optionally, change the ImageButton's image based on visibility
                    ImageButton btnExpand = (ImageButton)row.FindControl("btnExpand");
                    if (btnExpand != null)
                    {
                        btnExpand.ImageUrl = pnlNestedGridView.Visible ? "~/Images/col2.png" : "~/Images/col11.png";
                    }
                }
                else
                {
                    ShowError("Panel 'pnlNestedGridView' not found.");
                }
            }
            catch (Exception ex)
            {
                LogError(ex);
                ShowError("An error occurred while expanding the topic GridView.");
            }
        }

        // CRUD In Topic GridView//
        // Topic GridView Editing//
        protected void TopicGrv_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView TopicGrv = (GridView)sender;

            try
            {
                if (e.NewEditIndex >= 0 && e.NewEditIndex < TopicGrv.Rows.Count)
                {
                    GridViewRow parentRow = (GridViewRow)TopicGrv.NamingContainer;
                    string chapterId = ((System.Web.UI.WebControls.Label)parentRow.FindControl("LblChpId")).Text;

                    TopicGrv.EditIndex = e.NewEditIndex;
                    BindTopicGridView(chapterId, TopicGrv);
                }
                else
                {
                    ShowError("Invalid row index.");
                }
            }
            catch (Exception ex)
            {
                LogError(ex);
                ShowError("An error occurred while retrieving the Chapter_Id.");
            }
        }
        // Topic GridView Editing//
        // Topic GridView Cancel Editing//
        protected void TopicGrv_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            try
            {
                GridView TopicGrv = (GridView)sender;
                TopicGrv.EditIndex = -1;

                // Find the parent GridViewRow
                GridViewRow parentRow = (GridViewRow)TopicGrv.NamingContainer;

                // Find the ChapterId associated with the parent row
                string chapterId = ((System.Web.UI.WebControls.Label)parentRow.FindControl("LblChpId")).Text;
                // Rebind the nested GridView
                BindTopicGridView(chapterId, TopicGrv);
                ExpandNestedGridView(chapterId);
            }
            catch (Exception ex)
            {
                LogError(ex);
                ShowError("An error occurred while canceling the edit.");
            }
        }
        // Topic GridView Cancel Editing//
        protected void TopicGrv_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }
    }
}