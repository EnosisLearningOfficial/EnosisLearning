using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Configuration;
using System.Drawing.Drawing2D;
//using iTextSharp.text;

namespace ENOSISLEARNING
{
    public partial class PinCode : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindStateDDL();
            }
        }

        void BindStateDDL()
        {
            try
            {
                drpState.DataSource = dbconnect.GetDataSet("SELECT * FROM STATE_p");
                string query = "SELECT * FROM STATE_P";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable data = new DataTable();
                sda.Fill(data);
                drpState.DataSource = data;
                drpState.DataTextField = "STATENAME";
                drpState.DataValueField = "STATEID";
                drpState.DataBind();
                ListItem selectitem = new ListItem("Select  State", "Select State");
                selectitem.Selected = true;
                drpState.Items.Insert(0, selectitem);
            }
            catch (Exception ex)
            {

                lblmsg.Text=ex.Message;
            }
        }

        void BindCityDDL(int StateId)
        {
            //drpCity.DataSource = dbconnect.GetDataSet("SELECT * FROM CITY_P where CITYID = @State_Id");
                try
                {
                    string query = "SELECT * FROM CITY_P where STATEID= @StateId";
                    SqlDataAdapter sda = new SqlDataAdapter(query, con);
                    sda.SelectCommand.Parameters.AddWithValue("@StateId", StateId);
                    DataTable data = new DataTable();
                    sda.Fill(data);
                    drpCity.DataSource = data;
                    drpCity.DataTextField = "CITYNAME";
                    drpCity.DataValueField = "CITYID";
                    drpCity.DataBind();
                    ListItem selectitem = new ListItem("Select  City", "Select City");
                    selectitem.Selected = true;
                    drpCity.Items.Insert(0, selectitem);
                }
                catch (Exception ex)
                {

                    lblmsg.Text = ex.Message;
                }
                
        }
        private void BindPinCode_P(int Cityid)
        {
            try
            {
                string query = "SELECT ROW_NUMBER() over(order by PINCODE) as RowNumber,OFFICE,TALUKA,PINCODE,CITYID FROM PINCODE_P where CITYID=@CityId order by PINCODE";
                SqlDataAdapter sda= new SqlDataAdapter(query, con);
                sda.SelectCommand.Parameters.AddWithValue("CityId", Cityid);
                DataTable data = new DataTable();
                sda.Fill(data);
                if (data.Rows.Count > 0)
                {
                    grvpincode.DataSource = data;
                    grvpincode.DataBind();
                }
                else
                {
                    lblmsg.Text = "City(s) Pincode not Found.";
                }
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }
        protected void drpState_SelectedIndexChanged(object sender, EventArgs e)
        {
                if (drpState.SelectedIndex != 0)
                {
                    int stateid = Convert.ToInt32(drpState.SelectedValue);
                    BindCityDDL(stateid);
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Please select State.')</script>");
                    drpCity.SelectedIndex = 0;
                }
        }
        protected void drpCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drpCity.SelectedIndex != 0)
            {
                int CityId = Convert.ToInt32(drpCity.SelectedValue);
                grvpincode.DataSource = dbconnect.GetDataSet("SELECT * FROM PINCODE_P where CityId=" + CityId);
                grvpincode.DataBind();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Please select City.')</script>");
                drpCity.SelectedIndex = 0;
            }
        }

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            int Cityid = Convert.ToInt32(drpCity.SelectedValue);
            grvpincode.PageIndex = e.NewPageIndex;
            BindPinCode_P(Cityid);
        }

        protected void Search(object sender, EventArgs e)
        {
            if (drpState.SelectedIndex == 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Please select State First.')</script>");
            }
            else if(drpCity.SelectedIndex == 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Please select City First.')</script>");
            }
            else
            {
                int Cityid = Convert.ToInt32(drpCity.SelectedValue);
                BindPinCode_P(Cityid);
            }
        }
    }
}






