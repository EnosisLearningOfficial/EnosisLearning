using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace ENOSISLEARNING
{
    public partial class Question_Status : System.Web.UI.Page
    {
        dbconnect db = new dbconnect();
        string course = "";
        private string uname = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USERNAME"] != null)
            {
                uname = Convert.ToString(Session["USERNAME"]);
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
            if (!IsPostBack)
            {
                
                bindcourse();
                //course = ddlcourse.SelectedItem.Text;
                bind_deactivatequesdetails(course);
                //bind_activatequesdetails(course);
                bindpostedques(course);
                bind_questypedetails();
            }


        }

        public void bind_questypedetails()
        {
            
         
        }
        public void bind_deactivatequesdetails(string course)
        {
            DataTable dt = db.quesdetails("Deactive",course);
            if (dt.Rows.Count > 0)
            {
                
                grddeactive.DataSource = dt;
                grddeactive.DataBind();
            }
            else
            {
                grddeactive.DataSource = null;
                grddeactive.DataBind();
            
            }
        }
        //public void bind_activatequesdetails(string course)
        //{
           
        //    DataTable dt = db.quesdetails("Active",course);
        //    if (dt.Rows.Count > 0)
        //    {
        //        grdactive.DataSource = dt;
        //        grdactive.DataBind();
        //    }
        //    else
        //    {
        //        grdactive.DataSource = null;
        //        grdactive.DataBind();
        //    }
        //}

        
        protected void grddeactive_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grddeactive.PageIndex = e.NewPageIndex;
            bind_deactivatequesdetails(ddlcourse.SelectedItem.Text);
        }
        //protected void grdactive_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    grdactive.PageIndex = e.NewPageIndex;
        //    bind_activatequesdetails(ddlcourse.SelectedItem.Text);
        //}
    //    protected void btndeactive_Click(object sender, EventArgs e)
    //    {
    //        foreach (GridViewRow gvrow in grddeactive.Rows)  
    //    {
    //        var checkbox = gvrow.FindControl("chkRow") as CheckBox;  
    //        if (checkbox.Checked)  
    //        {  
                
    //             string ques = gvrow.Cells[1].Text;
    //            string ans = gvrow.Cells[2].Text;
               
    //         int c=db.updateststatus(ques,ans,0,ddlcourse.SelectedItem.Text);
  

    //        }
           
              
    //    }
    //       //  bind_activatequesdetails(ddlcourse.SelectedItem.Text);
    //         bind_deactivatequesdetails(ddlcourse.SelectedItem.Text);
    //}
        protected void btnactive_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gvrow in grddeactive.Rows)
            {
                var checkbox = gvrow.FindControl("chkRow") as CheckBox;
                if (checkbox.Checked)
                {
                    Label ques = gvrow.FindControl("lblquestion") as Label;
                    Label ans = gvrow.FindControl("lblanswer") as Label;

                    int c = db.updateststatus(ques.Text, ans.Text, 1, ddlcourse.SelectedItem.Text);




                }
                else
                {
                    Label ques = gvrow.FindControl("lblquestion") as Label;
                    Label ans = gvrow.FindControl("lblanswer") as Label;

                    int c = db.updateststatus(ques.Text, ans.Text, 0, ddlcourse.SelectedItem.Text);
                }

            }
          //  bind_activatequesdetails(ddlcourse.SelectedItem.Text);
            bind_deactivatequesdetails(ddlcourse.SelectedItem.Text);

        }
        protected void bindcourse()
        {
            //DataTable dt = db.moderatorcoursedetails(uname);
            string con = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString();
            string query = "select * from COURSES_DETAIL WHERE STATUS = 'A'";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataTable data = new DataTable();
            sda.Fill(data);
            ddlcourse.DataSource = data;
            ddlcourse.DataTextField = "COURSENAME";
            ddlcourse.DataValueField = "COURSEID";
            ddlcourse.DataBind();
            //if (dt.Rows.Count > 0)
            //{
            //    ddlcourse.DataSource = dt;
            //    ddlcourse.DataValueField = "course_id";
            //    ddlcourse.DataTextField = "Course_name";
            //    ddlcourse.DataBind();
            //}

        }
     

       
        protected void grddeactive_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grddeactive.EditIndex = e.NewEditIndex;
            bind_deactivatequesdetails(ddlcourse.SelectedItem.Text);
        }
        protected void grddeactive_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grddeactive.EditIndex = -1;
            bind_deactivatequesdetails(ddlcourse.SelectedItem.Text);
        }
        protected void grddeactive_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = grddeactive.Rows[e.RowIndex];
            int id = Convert.ToInt32(grddeactive.DataKeys[e.RowIndex].Values[0]);
           

            int c = db.deletequestiondetails(id);
            grddeactive.EditIndex = -1;
            bind_deactivatequesdetails(ddlcourse.SelectedItem.Text);

        }
        protected void grddeactive_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = grddeactive.Rows[e.RowIndex];
            int id = Convert.ToInt32(grddeactive.DataKeys[e.RowIndex].Values[0]);
            string ques = (row.FindControl("txtques") as TextBox).Text;
            string ans = (row.FindControl("txtans") as TextBox).Text;
            string questype = (row.FindControl("drpquestype") as DropDownList).SelectedItem.Value;
            int c = db.updatequestiondetails(ques, ans,ddlcourse.SelectedItem.Text, id,questype);
            grddeactive.EditIndex = -1;
            bind_deactivatequesdetails(ddlcourse.SelectedItem.Text);
        }
        protected void grddeactive_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName.Equals("Add"))
            {
                string ques = (grddeactive.FooterRow.FindControl("txtques1") as TextBox).Text.Trim();
                string ans = (grddeactive.FooterRow.FindControl("txtans1") as TextBox).Text.Trim();
                int questype =Convert.ToInt32((grddeactive.FooterRow.FindControl("drpquestypee") as DropDownList).SelectedItem.Value.Trim());
                int c = db.insertquestiondetails(ques, ans,ddlcourse.SelectedItem.Text,questype);
                if (c != 0)
                {
                    bind_deactivatequesdetails(ddlcourse.SelectedItem.Text);
                }
            }
           

        }
        protected void bindpostedques(string course)
        {
            DataTable dt = db.postedquesdetails(course);
            if (dt.Rows.Count > 0)
            {
                rppostedquesdetails.DataSource = dt;
                rppostedquesdetails.DataBind();

            }
            else
            {
              
                rppostedquesdetails.DataSource = null;
                rppostedquesdetails.DataBind();
            }
          
        }
        protected void btnpost_Click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as Button).Parent as RepeaterItem;
            int id = int.Parse((item.FindControl("lblpostid") as Label).Text.Trim());
            string ques=(item.FindControl("lblques") as Label).Text.Trim();
            string ans=(item.FindControl("txtans") as TextBox).Text.Trim();
            int questype =Convert.ToInt32((item.FindControl("drpquestype1") as DropDownList).SelectedItem.Value.Trim());
            int result = db.insertpostedquesdetails(ques, ans, ddlcourse.SelectedItem.Text, id,questype);
            if (result != 0)
            {
                sendmail(ques, ans);
                Response.Write("<script language=javascript>alert('Answer Posted Sucessfully')</script>");
                bindpostedques(ddlcourse.SelectedItem.Text);
              //  bind_activatequesdetails(ddlcourse.SelectedItem.Text);
                bind_deactivatequesdetails(ddlcourse.SelectedItem.Text);
            }
            else
            {
                Response.Write("<script language=javascript>alert('Something Went Wrong!!!')</script>");
                bindpostedques(ddlcourse.SelectedItem.Text);
               // bind_activatequesdetails(ddlcourse.SelectedItem.Text);
                bind_deactivatequesdetails(ddlcourse.SelectedItem.Text);
            }

        }
        protected void sendmail(string ques,string ans)
        {
            string email = "";
            DataTable dt = db.getemail(ddlcourse.SelectedItem.Text,ques);
            if (dt.Rows.Count > 0)
            {
                email = dt.Rows[0][0].ToString();
            }
            if (email != "")
            { 
            string to = email; //To address    
           // NETUSERNAME
             //   NETPASSWORD
            string from =System.Configuration.ConfigurationManager.AppSettings["NETUSERNAME"].ToString(); //From address 
            string pass = System.Configuration.ConfigurationManager.AppSettings["NETPASSWORD"].ToString();
           
            string body= "<html> <body Style='background:navy;color:white;padding:10px 5px;border:1px solid transparent;border-radius:5px;font-size:20px;opacity:0.8;'><p style='text-align:right;'>enosis <span style='color:orange;'>learning</span><br/> <span style='font-size:13px;'>Creating Software Professionals</span><br/><p>Hi,<br/><br/>"+ddlcourse.SelectedItem.Text+" Question Posted on enosis Learning Website.<br/> <br/> <b>Ques."+ ques +"</b> <br/> Ans. "+ans+".<br/><br/> Thanks,<br/> Enosis Learning Pvt. Ltd. <br/> enosislearning.com </p></body></html>";
            using (MailMessage mm = new MailMessage(from, email))
            {
                mm.Subject = ddlcourse.SelectedItem.Text + " Posted Question on Enosis Learning Website";
                mm.Body =body;
               
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential(from,pass);
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mm);
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email sent.');", true);
            }
            }

        }
        protected void ddlcourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlcourse.SelectedValue.ToString() != "0")
            {
                course = ddlcourse.SelectedItem.Text;
                bind_deactivatequesdetails(course);
               // bind_activatequesdetails(course);
                bindpostedques(course);
            }

        }
        protected void rppostedquesdetails_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //Find the DropDownList in the Repeater Item.
                DropDownList drpquestype1 = (e.Item.FindControl("drpquestype1") as DropDownList);
                DataTable dt = db.questypedetails();
                if (dt.Rows.Count > 0)
                {

                    drpquestype1.DataSource = dt;
                    drpquestype1.DataValueField = "Ques_type_id";
                    drpquestype1.DataTextField = "Question_Type";
                    drpquestype1.DataBind();
                }
            }
            if (rppostedquesdetails.Items.Count < 1)
            {
                if (e.Item.ItemType == ListItemType.Footer)
                {
                    HtmlGenericControl dvNoRec = e.Item.FindControl("dvNoRecords") as HtmlGenericControl;
                    if (dvNoRec != null)
                    {
                        dvNoRec.Visible = true;
                    }
                }
            }  
        }
        protected void btnactiveall_Click(object sender, EventArgs e)
        {
            int c = db.updateallstatus(1, ddlcourse.SelectedItem.Text);
            //bind_activatequesdetails(ddlcourse.SelectedItem.Text);
            bind_deactivatequesdetails(ddlcourse.SelectedItem.Text);
        }
        protected void btndeactiveall_Click(object sender, EventArgs e)
        {
            int c = db.updateallstatus(0, ddlcourse.SelectedItem.Text);
           // bind_activatequesdetails(ddlcourse.SelectedItem.Text);
            bind_deactivatequesdetails(ddlcourse.SelectedItem.Text);

        }
        protected void grddeactive_RowDataBound(object sender, GridViewRowEventArgs e)
        {
 

             if (e.Row.RowType == DataControlRowType.DataRow && grddeactive.EditIndex == e.Row.RowIndex)
            {
                DropDownList drpquestype = (e.Row.FindControl("drpquestype") as DropDownList);

                DataTable dt2 = db.questypedetails();
                if (dt2.Rows.Count > 0)
                {

                    drpquestype.DataSource = dt2;
                    drpquestype.DataValueField = "Ques_type_id";
                    drpquestype.DataTextField = "Question_Type";
                    drpquestype.DataBind();
                }

               
            }

               
              
              
        }
        protected void grddeactive_DataBound(object sender, EventArgs e)
        {
            if (grddeactive.DataSource != null)
            {
                DropDownList drpquestypee = grddeactive.FooterRow.FindControl("drpquestypee") as DropDownList;
                DataTable dt2 = db.questypedetails();
                if (dt2.Rows.Count > 0)
                {

                    drpquestypee.DataSource = dt2;
                    drpquestypee.DataValueField = "Ques_type_id";
                    drpquestypee.DataTextField = "Question_Type";
                    drpquestypee.DataBind();
                }

            }
        }
        protected void btnaddnewques_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Add_Questions.aspx");
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {

            RepeaterItem item = (sender as Button).Parent as RepeaterItem;
            int id = int.Parse((item.FindControl("lblpostid") as Label).Text.Trim());

            int result = db.deletepostedquesdetails(id);
            if (result != 0)
            {
             
                Response.Write("<script language=javascript>alert('Posted Question Deleted Sucessfully')</script>");
                bindpostedques(ddlcourse.SelectedItem.Text);
                
                bind_deactivatequesdetails(ddlcourse.SelectedItem.Text);
            }
            else
            {
                Response.Write("<script language=javascript>alert('Something Went Wrong!!!')</script>");
                bindpostedques(ddlcourse.SelectedItem.Text);
            
                bind_deactivatequesdetails(ddlcourse.SelectedItem.Text);
            }

        }
}
}
