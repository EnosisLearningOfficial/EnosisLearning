using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ENOSISLEARNING
{
    public partial class power_bi_training_in_pune : System.Web.UI.Page
    {
        EnquiriesEntity obj = new EnquiriesEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve the CourseId from the session
                var courseId = Session["CourseId"];
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
                //lblRes.Text = "We Have Received Your Enquiry, Will Soon Give You Details!";
                //lblRes.ForeColor = System.Drawing.Color.Green;
                Response.Write("<script language=javascript>alert('We Have Received Your Enquiry, Will Soon Give You Details')</script>");



                clearAll();
            }
            catch (Exception ex)
            {
                //lblRes.Text = ex.Message.ToString();
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }
        }
        public void clearAll()
        {
            try
            {
                txtEUserName.Text = "";
                txtEEmailId.Text = "";
                txtEUserContactNo.Text = "";
                drpDCourse.SelectedIndex = 0;
                //lblRes.Text = "";

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }

}