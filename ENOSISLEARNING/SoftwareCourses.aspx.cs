using ClosedXML.Excel;
using DocumentFormat.OpenXml.Office2019.Word.Cid;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

// Maya  23-07-2025 SoftwareCourses Page
namespace ENOSISLEARNING
{
    public partial class SoftwareCourses : System.Web.UI.Page
    {
        DataTable dt = new DataTable();

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString());
        string ConnectionString = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindCoures();
            }
        }
        private void BindCoures()
        {
            string query = "";
            if (drpCourses.SelectedItem.Text == STATUS.ALL.ToString())
            {
                query = "select * from COURSES_DETAIL";
            }
            else
            {
                query = "select * from COURSES_DETAIL where STATUS='" + drpCourses.SelectedItem.Value + "'";
            }
            dt = dbconnect.GetDataSet(query);
            if (dt.Rows.Count > 0)
            {
                grvSoftwareCourses.DataSource = dt;
                grvSoftwareCourses.DataBind();
            }
            else
            {
                grvSoftwareCourses.DataSource = null;
                grvSoftwareCourses.DataBind();
            }

        }

        private DataTable GetDataTableFromQuery(string query)
        {
            string connStr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        return dt;
                    }
                }
            }
        }

        protected void btnExportToExcel_Click(object sender, EventArgs e)
        {
            string dropdownValue = drpCourses.SelectedValue; 
            string statusCode = ""; 
            string query = "";

            if (dropdownValue == "ALL")
            {
                query = "SELECT COURSEID, COURSENAME, COURSEDESC, FEES, COURSEDURATION, COURSEHOURS FROM COURSES_DETAIL";
            }
            else
            {
                if (dropdownValue == "ACTIVE")
                    statusCode = "A";
                else if (dropdownValue == "INACTIVE")
                    statusCode = "X";

                query = "SELECT COURSEID, COURSENAME, COURSEDESC, FEES, COURSEDURATION, COURSEHOURS FROM COURSES_DETAIL WHERE STATUS = @Status";
            }

            DataTable dt;

            if (dropdownValue == "ALL")
            {
                dt = GetDataTableFromQuery(query);
            }
            else
            {
                dt = GetDataTableFromQueryWithParameter(query, statusCode);
            }

            if (dt.Rows.Count > 0)
            {
                using (XLWorkbook wb = new XLWorkbook())
                {
                    wb.Worksheets.Add(dt, "Courses");

                    Response.Clear();
                    Response.Buffer = true;
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment;filename=SoftwareCourses.xlsx");

                    using (MemoryStream ms = new MemoryStream())
                    {
                        wb.SaveAs(ms);
                        ms.WriteTo(Response.OutputStream);
                        Response.Flush();
                        Response.End();
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('No records found to export.');</script>");
            }
        }


        private DataTable GetDataTableFromQueryWithParameter(string query, string status)
        {
            string connStr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Status", status);

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        return dt;
                    }
                }
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            // Required for Export to Excel to work
        }

        protected void grvSoftwareCourses_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grvSoftwareCourses.EditIndex = -1;
            BindCoures();
        }

        protected void grvSoftwareCourses_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grvSoftwareCourses.EditIndex = e.NewEditIndex;
            BindCoures();
        }

        protected void grvSoftwareCourses_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = grvSoftwareCourses.Rows[e.RowIndex];
            int courseid = Convert.ToInt32(grvSoftwareCourses.DataKeys[e.RowIndex].Values[0]);
            string query = "UPDATE COURSES_DETAIL SET STATUS='X' where courseid='" + courseid + "'";
            dbconnect.ExecuteQuery(query);
            grvSoftwareCourses.EditIndex = -1;
            BindCoures();
        }

        protected void grvSoftwareCourses_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = grvSoftwareCourses.Rows[e.RowIndex];
            int courseid = Convert.ToInt32(grvSoftwareCourses.DataKeys[e.RowIndex].Values[0]);
            TextBox coursename = (TextBox)grvSoftwareCourses.Rows[e.RowIndex].FindControl("lbleditname");
            TextBox coursedesc = (TextBox)grvSoftwareCourses.Rows[e.RowIndex].FindControl("lbleditdesc");
            TextBox fees = (TextBox)grvSoftwareCourses.Rows[e.RowIndex].FindControl("lbleditfees");
            TextBox courseduration = (TextBox)grvSoftwareCourses.Rows[e.RowIndex].FindControl("lbleditduration");
            TextBox coursehours = (TextBox)grvSoftwareCourses.Rows[e.RowIndex].FindControl("lbledithours");
            FileUpload fContents = (FileUpload)grvSoftwareCourses.Rows[e.RowIndex].FindControl("fContents");
            LinkButton lnkEDownload = (LinkButton)grvSoftwareCourses.Rows[e.RowIndex].FindControl("lnkEDownload");
            string filename = "";
            if (fContents.FileName != null && fContents.FileName != "")
            {
                filename = fContents.FileName;
                fContents.SaveAs(Server.MapPath(@"~\courses\") + fContents.FileName);
            }
            else
            {
                filename = lnkEDownload.Text;

            }
            string query = "update COURSES_DETAIL set coursename='" + coursename.Text + "', coursedesc='" + coursedesc.Text + "' ,fees='" + fees.Text + "',courseduration='" + courseduration.Text + "',coursehours='" + coursehours.Text + "',CONTENTS_FILENAME='" + filename + "' where courseid='" + courseid + "'";
            dbconnect.ExecuteQuery(query);
            grvSoftwareCourses.EditIndex = -1;
            BindCoures();
        }

        protected void grvSoftwareCourses_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("AddNew"))
            {

                TextBox coursename = (TextBox)grvSoftwareCourses.FooterRow.FindControl("txtcoursename");
                TextBox coursedesc = (TextBox)grvSoftwareCourses.FooterRow.FindControl("txtcoursedesc");
                TextBox fees = (TextBox)grvSoftwareCourses.FooterRow.FindControl("txtcoursefees");
                TextBox courseduration = (TextBox)grvSoftwareCourses.FooterRow.FindControl("txtcourseduration");
                TextBox coursehours = (TextBox)grvSoftwareCourses.FooterRow.FindControl("txtcoursehours");
                FileUpload fContents = (FileUpload)grvSoftwareCourses.FooterRow.FindControl("fContents");
                if (fContents.FileName != null && fContents.FileName != "")
                {
                    fContents.SaveAs(Server.MapPath(@"~\courses\") + fContents.FileName);
                }
                string query = "insert into COURSES_DETAIL (coursename,coursedesc,fees,courseduration,coursehours,CONTENTS_FILENAME) values('" + coursename.Text + "','" + coursedesc.Text + "','" + fees.Text + "','" + courseduration.Text + "','" + coursehours.Text + "','" + fContents.FileName + "',)";
                dbconnect.ExecuteQuery(query);
                BindCoures();
            }
        }
        protected void lnkDownload_Click(object sender, EventArgs e)
        {
            string filename = (sender as LinkButton).CommandArgument;
            string path = Server.MapPath("~/courses/");
            string filepath = path + "" + filename;
            if (File.Exists(filepath))
            {

                Response.Clear();
                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("Content-Disposition", "filename=" + Path.GetFileName(filepath));
                Response.TransmitFile(Server.MapPath("~/courses/") + Path.GetFileName(filepath));
                Response.End();
            }
        }

        protected void grvSoftwareCourses_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (grvSoftwareCourses.PageIndex == 0 && e.NewPageIndex < 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showWarning", "alert('You are already on the first page.');", true);
                e.Cancel = true;
            }
            else
            {
                grvSoftwareCourses.PageIndex = e.NewPageIndex;
                BindCoures();
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindCoures();
        }
        protected void btnhistory_Click1(object sender, EventArgs e)
        {
            LinkButton btnhistory = sender as LinkButton;
            int courseid = Convert.ToInt32(btnhistory.CommandArgument);
            Session["COURSEID"] = courseid;
            Response.Redirect("CoursesHistory.aspx?courseid=" + courseid);
        }

        protected void btnAddCourse_Click(object sender, EventArgs e)
        {
            Response.Redirect("AllCourseContent.aspx");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            InsertTaskAdd();
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
                using (SqlCommand cmd = new SqlCommand("INSERT INTO COURSES_DETAIL (COURSENAME, COURSEDESC, FEES, COURSEDURATION, COURSEHOURS, STATUS,CONTENTS_FILENAME) VALUES (@COURSENAME, @COURSEDESC, @FEES, @COURSEDURATION, @COURSEHOURS,@STATUS, @CONTENTS_FILENAME)", con))
                {
                    cmd.Parameters.AddWithValue("@COURSENAME", TxtCourseName.Text);
                    cmd.Parameters.AddWithValue("@COURSEDESC", TxtCourseDesc.Text);
                    cmd.Parameters.AddWithValue("@FEES", TexCourseFees.Text);
                    cmd.Parameters.AddWithValue("@COURSEDURATION", TexCourseDuration.Text);
                    cmd.Parameters.AddWithValue("@COURSEHOURS", TxtCourseHours.Text);
                    cmd.Parameters.AddWithValue("@STATUS", TxtStatus.Text);
                    cmd.Parameters.AddWithValue("@CONTENTS_FILENAME", FileName);
                    cmd.ExecuteNonQuery();
                }

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Record Inserted Successfully');", true);

                // Clear the form fields
                TxtCourseName.Text = string.Empty;
                TxtCourseDesc.Text = string.Empty;
                TexCourseFees.Text = string.Empty;
                TexCourseDuration.Text = string.Empty;
                TxtCourseHours.Text = string.Empty;
               
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
    }
}