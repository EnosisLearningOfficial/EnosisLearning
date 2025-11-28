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
    public partial class addPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                if ((Request.QueryString["MODE"] != null) && (Request.QueryString["MODE"].ToString() == OPERATION.EDIT.ToString()))
                {
                    txtuser.Text = Session["Name"].ToString();
                    txtpass.Text = Session["Password1"].ToString();
                    txtfullname2.Text = Session["FullName"].ToString();
                    txtdob.Text = string.Format("{0:dd/MM/yyyy}", Session["DOB"].ToString());
                    txtemail.Text = Session["EmailId"].ToString();
                    txtmobile.Text = Session["MobileNo"].ToString();
                    txtdoj.Text = Session["DOJ"].ToString();
                    drp.SelectedItem.Text = Session["Designation"].ToString();
                    txtskills.Text = Session["Skills"].ToString();
                }
                else
                {
                    txtuser.Text = "";
                    txtpass.Text = "";

                    txtdob.Text = "";
                    txtemail.Text = "";
                    txtmobile.Text = "";
                    txtdoj.Text = "";
                    txtskills.Text = "";
                }
                
            }
        }
        protected void btnAddUSer_Click(object sender, EventArgs e)
        {
            try
            {
                string offerletterpath = Server.MapPath(@"~\OfferLetter\") + fOfferLetter.FileName;

                fResume.SaveAs(Server.MapPath(@"~\EmpResume\") + fResume.FileName);
                fPhoto.SaveAs(Server.MapPath(@"~\Photo\") + fPhoto.FileName);
                fOfferLetter.SaveAs(offerletterpath);
                fID.SaveAs(Server.MapPath(@"~\IDPROOF\") + fOfferLetter.FileName);


                string degn = drp.SelectedItem.Text;
                string query = "";


                List<SqlParameter> parameters = new List<SqlParameter>();

                parameters.Add(new SqlParameter("@USERID", SqlDbType.VarChar));
                parameters[0].Value = (Session["Id"] != null && Session["Id"].ToString().Length > 0) ? Convert.ToInt32(Session["Id"].ToString()) : 0;

                parameters.Add(new SqlParameter("@USERNAME", SqlDbType.VarChar));
                parameters[1].Value = txtuser.Text;
                parameters.Add(new SqlParameter("@PASSWORD", SqlDbType.VarChar));
                parameters[2].Value = txtpass.Text;
                parameters.Add(new SqlParameter("@FULLNAME", SqlDbType.VarChar));
                parameters[3].Value = txtfullname2.Text;

                parameters.Add(new SqlParameter("@DOB", SqlDbType.DateTime));
                parameters[4].Value = txtdob.Text;

                parameters.Add(new SqlParameter("@EMAILID", SqlDbType.VarChar));
                parameters[5].Value = txtemail.Text;

                parameters.Add(new SqlParameter("@MOBILENO", SqlDbType.VarChar));
                parameters[6].Value = txtmobile.Text;

                parameters.Add(new SqlParameter("@DOJ", SqlDbType.DateTime));
                parameters[7].Value = txtdob.Text;

                parameters.Add(new SqlParameter("@DESIGNATION", SqlDbType.VarChar));
                parameters[8].Value = drp.SelectedItem.Value;

                parameters.Add(new SqlParameter("@SKILLS", SqlDbType.VarChar));
                parameters[9].Value = txtskills.Text;



                parameters.Add(new SqlParameter("@OFFICIALEMAILID", SqlDbType.VarChar));
                parameters[10].Value = txtOffEmail.Text;

                parameters.Add(new SqlParameter("@EMAILPASSWORD", SqlDbType.VarChar));
                parameters[11].Value = txtEmailPass.Text;

                parameters.Add(new SqlParameter("@RESUME", SqlDbType.VarChar));
                parameters[12].Value = fResume.FileName;

                parameters.Add(new SqlParameter("@PHOTO", SqlDbType.VarChar));
                parameters[13].Value = fPhoto.FileName;

                parameters.Add(new SqlParameter("@OFFERLETTER", SqlDbType.VarChar));
                parameters[14].Value = fOfferLetter.FileName;

                parameters.Add(new SqlParameter("@IDPROOF", SqlDbType.VarChar));
                parameters[15].Value = fID.FileName;



                if (Session["Id"] != null && Session["Id"].ToString().Length > 0)
                {
                    dbconnect.ExecuteStoredProcedure("SP_ADDUPDATEUSER", parameters);


                }
                else
                {
                    dbconnect.ExecuteStoredProcedure("SP_ADDUPDATEUSER", parameters);

                }

                Response.Write("<script>alert('Inserted successfully!')</script>"); //works great
         
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);

                Response.Write("<script>alert('" + ex.Message + "')</script>");


                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);

            }



        }

    }
}