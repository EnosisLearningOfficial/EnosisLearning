using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ENOSISLEARNING
{
    public partial class PowerBI : System.Web.UI.Page
    {
        EnquiriesEntity obj = new EnquiriesEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve the CourseId from the session
                var courseId = Session["CourseId"];

                // Check if courseId exists in the session
                //if (courseId != null)
                //{
                //    // Optionally, pass the courseId programmatically
                //    MyCourseGridView.CourseId = Convert.ToInt32(courseId); // Setting the CourseId to the UserControl
                //}
                //else
                //{
                //    // Handle the case where CourseId is not found in session (optional)
                //    // For example, you can display a message or redirect the user
                //    Response.Redirect("SelectCourse.aspx"); // Or any page to prompt course selection
                //}
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                obj.Name = txtEUserName.Text;
                obj.Email = txtEEmailId.Text;
                obj.Mobile = txtEUserContactNo.Text;
                obj.Course = drpDCourse.SelectedItem.Text;
                obj.InsertEnquiry();
                lblRes.Text = "We Have Received Your Enquiry, Will Soon Give You Details";
                Response.Write("<script language=javascript>alert('We Have Received Your Enquiry, Will Soon Give You Details')</script>");



                clearAll();
            }
            catch (Exception ex)
            {
                lblRes.Text = ex.Message.ToString();
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }
        }
        public void clearAll()
        {
            try
            {
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}