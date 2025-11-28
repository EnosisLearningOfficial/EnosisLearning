using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ENOSISLEARNING
{
    public partial class CourseWebControl : System.Web.UI.UserControl
    {
        public int CourseId { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            //string courseId = Request.QueryString["courseId"];
            var courseId = Session["CourseId"];
            CourseId = Convert.ToInt32(courseId);
            if (!IsPostBack && CourseId > 0)
            {
                BindChaptersGrid(CourseId);
            }
        }
        //Bind Chapter Gridview//
        private void BindChaptersGrid(int courseId)
        {
            try
            {
                string query = "SELECT Chapter_Id, Chapter_Number FROM enosis.COURSE_CHAPTER_DETAIL WHERE Course_Id = @CourseID";

                DataTable dt = new DataTable();
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@CourseID", courseId);
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        da.Fill(dt);
                    }
                }

                gvChapters.DataSource = dt;
                gvChapters.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }


        protected void gvChapters_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    // Get the Chapter_Id for the current row
                    int chapterId = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "Chapter_Id"));

                    // Find the nested GridView in the current row
                    GridView gvTopics = (GridView)e.Row.FindControl("gvTopics");

                    // Bind the nested GridView with topics for the current Chapter_Id
                    BindTopicsGrid(gvTopics, chapterId);
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        private void BindTopicsGrid(GridView gvTopics, int chapterId)
        {
            try
            {
                string query = "SELECT Topic_Id, Topic_Name, Days FROM enosis.COURSE_TOPIC_DETAIL WHERE Chapter_Id = @Chapter_Id";
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Chapter_Id", chapterId);
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        gvTopics.DataSource = dt;
                        gvTopics.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}