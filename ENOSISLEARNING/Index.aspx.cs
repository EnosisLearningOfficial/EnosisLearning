using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using ENOSISLEARNING_Entity;
using ENOSISLEARNING_BAL;
using System.Net.Mail;
using System.Configuration;
using System.Net;
using ENOSISLEARNING.Libraries;

namespace ENOSISLEARNING
{
    public partial class Index : System.Web.UI.Page
    {
       // EnquiryFormEntity obj_EnquiryFormEntity = new EnquiryFormEntity();
        //LearningMasterBAL obj_LearningMasterBAL = new LearningMasterBAL();

        EnquiriesEntity obj = new EnquiriesEntity();


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            { 
                if (!Page.IsPostBack)
                {
                    //string userip = Request.UserHostAddress;
                    //CommonFunctions.InsertVisitordetails(userip);
                    BindCourses();
                }
            }
            catch (Exception ex)
            {
                lblRes.Text = ex.Message;
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);

            }
        }
        private void BindCourses()
        {
            string[] enumNames = Enum.GetNames(typeof(ENQCOURSES));
            foreach (string item in enumNames)
            {
                //get the enum item value
                int value = (int)Enum.Parse(typeof(ENQCOURSES), item);
                ListItem listItem = new ListItem(item, value.ToString());
                drpDCourse.Items.Add(listItem);
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
                obj.Status = "NEW";
                obj.Source = "WEBSITE";
                obj.Source = "DILLIP";

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
                txtEUserName.Text = "";
                txtEEmailId.Text = "";
                txtEUserContactNo.Text = "";
                drpDCourse.SelectedIndex = 0;
                lblRes.Text = "";

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
       

   
    }
}