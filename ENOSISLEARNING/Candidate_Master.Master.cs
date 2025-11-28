using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ENOSISLEARNING
{
    public partial class Candidate_Master : System.Web.UI.MasterPage
    {
        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    if (Session["USERNAME"] == null)
        //    {
        //        hyklogoff.Visible = false;
        //        login.Text = "Login";
        //        hyperlogin.HRef = "~/Login.aspx";
        //    }
        //    else
        //    {
        //        hyklogoff.Visible = true;
        //        lblusername.Text = "Welcome " + Session["USERNAME"];
        //        login.Text = "Logout";
        //        hyperlogin.HRef = "~/Login.aspx";
        //    }

        //    string pageName = this.Request.Url.Segments.Last().ToLower();

        //    if (!Page.IsPostBack)
        //    {
        //        string userip = Request.UserHostAddress;
        //       // CommonFunctions.InsertVisitordetails(userip, pageName);
        //    }
        //}
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is logged in
            if (Session["USERNAME"] == null)
            {
                hyklogoff.Visible = false; // Hide logoff hyperlink
                login.Text = "Login";      // Update login button text
                hyperlogin.HRef = "~/Login.aspx"; // Redirect to login page
            }
            else
            {
                hyklogoff.Visible = true; // Show logoff hyperlink
                lblusername.Text = "Welcome " + Session["USERNAME"]; // Display username
                login.Text = " Logout";    // Update login button text
                hyperlogin.HRef = "~/Login.aspx"; // Redirect to logout page
            }

            // Get the current page name
            string pageName = this.Request.Url.Segments.Last().ToLower();

            // Log visitor details only on initial load
            if (!IsPostBack)
            {
                string userIp = Request.UserHostAddress;

                // Log visitor details (uncomment once the method is implemented)
                // CommonFunctions.InsertVisitordetails(userIp, pageName);
            }
        }

    }
}