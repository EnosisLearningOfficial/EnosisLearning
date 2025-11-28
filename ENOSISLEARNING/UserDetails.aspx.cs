using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace ENOSISLEARNING
{
    public partial class Users_Details : System.Web.UI.Page
    {
 
     
        protected void Page_Load(object sender, EventArgs e)
        {
         
            if (!IsPostBack)
            {
                BindEmployeeDetails(drpStatus.SelectedItem.Text);
            }
        }

        protected void BindEmployeeDetails(string STATUS)
        {
            string query = "Select * from USERDETAILS WHERE STATUS='" + STATUS + "'";

            //con.Open();
            //SqlCommand cmd = new SqlCommand("Select * from USERDETAILS WHERE STATUS='" + STATUS.ACTIVE.ToString() + "'", con);
            //SqlDataAdapter da = new SqlDataAdapter(cmd);
            //DataSet ds = new DataSet();
            //da.Fill(ds);
            //con.Close();
            DataTable dt = dbconnect.GetDataSet(query);

            if (dt.Rows.Count > 0)
            {
                gvDetails.DataSource = dt;
                gvDetails.DataBind();

            }
            else
            {
                //adding a row to the datatable and displaying no records found
                dt.Rows.Add(dt.NewRow());
                gvDetails.DataSource = dt;
                gvDetails.DataBind();
                int columncount = gvDetails.Rows[0].Cells.Count;
                gvDetails.Rows[0].Cells.Clear();
                gvDetails.Rows[0].Cells.Add(new TableCell());
                gvDetails.Rows[0].Cells[0].ColumnSpan = columncount;
                gvDetails.Rows[0].Cells[0].Text = "No Records Found";
            }

        }


        protected void gvDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
         {
                    int userid = Convert.ToInt32(gvDetails.DataKeys[e.RowIndex].Values["USERID"].ToString());
        string username = gvDetails.DataKeys[e.RowIndex].Values["USERNAME"].ToString();
        string query = "UPDATE USERDETAILS SET STATUS ='INACTIVE' where USERID=" + userid;
        /*con.Open();
        SqlCommand cmd = new SqlCommand("UPDATE USERDETAILS SET STATUS ='" + STATUS.INACTIVE.ToString() + "' where USERID=" + userid, con);

//            SqlCommand cmd = new SqlCommand("delete from Enosislearning.USERDETAILS where USERID=" + userid, con);
        int result = cmd.ExecuteNonQuery();
        con.Close();*/

        bool result = dbconnect.ExecuteQuery(query);

                    if (result == true)
                    {
                        BindEmployeeDetails(drpStatus.SelectedItem.Text);
                        //lblresult.ForeColor = System.Drawing.Color.Red;
                        //lblresult.Text = username + " details deleted successfully";
                    }
}



        protected void gvDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {





            //    }
        }



        protected void gvDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {        
            if (gvDetails.PageIndex == 0 && e.NewPageIndex < 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showWarning", "alert('You are already on the first page.');", true);
                e.Cancel = true;
            }
            else
            {
                gvDetails.PageIndex = e.NewPageIndex;
                BindEmployeeDetails(drpStatus.SelectedItem.Text);
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddUser.aspx");
        }

        protected void imgbtnEdit_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton lbtn = (ImageButton)sender;
            GridViewRow row = (GridViewRow)lbtn.NamingContainer;
            if (row != null)
            {
                Session["Id"] = gvDetails.DataKeys[row.RowIndex].Values[0];
                Session["Name"] = gvDetails.DataKeys[row.RowIndex].Values[1];
                Session["Password1"] = gvDetails.DataKeys[row.RowIndex].Values[2];
                Session["FullName"] = gvDetails.DataKeys[row.RowIndex].Values[3];
                Session["DOB"] = gvDetails.DataKeys[row.RowIndex].Values[4];

                Session["EmailId"] = gvDetails.DataKeys[row.RowIndex].Values[5];
                Session["MobileNo"] = gvDetails.DataKeys[row.RowIndex].Values[6];
                Session["DOJ"] = gvDetails.DataKeys[row.RowIndex].Values[7];
                Session["Designation"] = gvDetails.DataKeys[row.RowIndex].Values[8];
                Session["Skills"] = gvDetails.DataKeys[row.RowIndex].Values[9];

                Response.Redirect("AddUser.aspx?MODE=" + OPERATION.EDIT.ToString());
                // Response.Redirect("EditUser.aspx");
            }
        }

        protected void drpStatus_SelectedIndexChanged(object sender, EventArgs e)
        {

            BindEmployeeDetails(drpStatus.SelectedItem.Text);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string STATUS = drpStatus.SelectedItem.Text;
            BindEmployeeDetails(STATUS);
        }

        /*   protected void btnDelete_Click(object sender, EventArgs e)
           {
               Button lbtn = (Button)sender;
               GridViewRow row = (GridViewRow)lbtn.NamingContainer;
               int userid = Convert.ToInt32(gvDetails.DataKeys[row.RowIndex].Values[0].ToString());
               string username = gvDetails.DataKeys[row.RowIndex].Values["USERNAME"].ToString();
               con.Open();
               SqlCommand cmd = new SqlCommand("UPDATE from Enosislearning.USERDETAILS SET STATUS ='" + STATUS.INACTIVE.ToString() + "' where USERID=" + userid, con);
               int result = cmd.ExecuteNonQuery();
               con.Close();
               if (result == 1)
               {
                   BindEmployeeDetails();
                   lblresult.ForeColor = System.Drawing.Color.Red;
                   lblresult.Text = username + " details deleted successfully";
               }
           }*/


    }
}