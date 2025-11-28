using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ENOSISLEARNING
{
    public partial class ProfileGoals : System.Web.UI.Page
    {
        private static string MODE = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
                   
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["CODE"] != null)
                {
                     int RegCode = Convert.ToInt32(Request.QueryString["CODE"].ToString());

                    Session["REGNO"] = RegCode;
                    ShowDetails(RegCode);

                }
            }

                /*   if (ViewState["FULLNAME"] != null)
                {
                    txtTFullName.Text = ViewState["FULLNAME"].ToString();
                }
                if (ViewState["EXPERIENCE"] != null)
                {
                    txtTExp.Text = ViewState["EXPERIENCE"].ToString();
                }
                if (ViewState["EXPSAL"] != null)
                {
                    txtTExpSal.Text = ViewState["EXPSAL"].ToString();
                }
                if (ViewState["POSITION"] != null)
                {
                    txtTPosition.Text = ViewState["POSITION"].ToString();

                }*/
            }

        private void ShowDetails(int RegNo)
        {
            if (RegNo > 0)
            {
                string QUERY = "SELECT * FROM CANDIDATES WHERE CANDIDATE_CODE=" + RegNo;
                DataTable dt = dbconnect.GetDataSet(QUERY);
                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["FULLNAME"].ToString() != null && dt.Rows[0]["FULLNAME"].ToString() != "")
                    {
                        txtTFullName.Text = dt.Rows[0]["FULLNAME"].ToString();
                        txtTExp.Text = dt.Rows[0]["YEARSEXPERIENCE"].ToString() + "." + dt.Rows[0]["MONTHSEXPERIENCE"].ToString();

                        LabelT1.Text = "Dear " + txtTFullName.Text + " , " + LabelT1.Text;

                        if (dt.Rows[0]["TOTALFEES"] != null && dt.Rows[0]["TOTALFEES"].ToString() != "")
                            txtTExpSal.Text = dt.Rows[0]["TOTALFEES"].ToString();

                        if (dt.Rows[0]["POSITION_APPLIED"] != null && dt.Rows[0]["POSITION_APPLIED"].ToString().Length > 0)
                            txtTPosition.Text = dt.Rows[0]["POSITION_APPLIED"].ToString();




                    }
                }
                string QUERYNew = "SELECT * FROM candidate_personaldetails WHERE REGISTRATIONID=" + RegNo;
                DataTable dtGoals = dbconnect.GetDataSet(QUERYNew);
                if (dtGoals.Rows.Count > 0)
                {
                    //condition? consequent : alternative
                    MODE = OPERATION.EDIT.ToString();
                    //txtTFullName.Text = dtGoals.Rows[0]["FULLNAME"].ToString();
                    txtTPosition.Text = dtGoals.Rows[0]["POSITION"] != null ? dtGoals.Rows[0]["POSITION"].ToString() : "";
                    txtTCompany.Text = dtGoals.Rows[0]["CURRENTCOMPANYNAME"] != null ? dtGoals.Rows[0]["CURRENTCOMPANYNAME"].ToString() : "";
                    txtTExp.Text = dtGoals.Rows[0]["EXPERIENCE"].ToString();
                    txtTCurSal.Text = dtGoals.Rows[0]["CURRENTPACKAGE"].ToString();
                    txtTExpSal.Text = dtGoals.Rows[0]["EXPECTEDPACKAGE"].ToString();
                    txtTFatherDetails.Text = dtGoals.Rows[0]["FATHERDETAILS"].ToString();
                    txtTMotherDetails.Text = dtGoals.Rows[0]["MOTHERDETAILS"].ToString();
                    txtTBrothers.Text = dtGoals.Rows[0]["NOOFBORTHERS"].ToString();
                    txtTSisters.Text = dtGoals.Rows[0]["NOOFSISTERS"].ToString();
                    txtTGoals.Text = dtGoals.Rows[0]["GOALS"].ToString();
                    txtTSocietyValue.Text = dtGoals.Rows[0]["SOCIETY"].ToString();
                    txtTRoleModel.Text = dtGoals.Rows[0]["ROLEMODEL"].ToString();
                    txtTNext5Years.Text = dtGoals.Rows[0]["NEXT5YEARS"].ToString();
                    txtTQuestions.Text = dtGoals.Rows[0]["QUESTIONS"].ToString();
                    txtTAchievements.Text = dtGoals.Rows[0]["PARENTSHAPPINESS"].ToString();

                    //    txtTAddress

                    //                                           txtTCompanyVision

                }
                else
                {
                    MODE = OPERATION.ADD.ToString();
                }
            }


        }
        protected void btnTSubmit_Click1(object sender, EventArgs e)
        {
            if (Session["REGNO"] != null && Session["REGNO"].ToString().Length > 0)
            {
                int CandId = Convert.ToInt32(Session["REGNO"].ToString());

                //COMPANY VISION IS MISSING
                string query = "";
                if (MODE == OPERATION.ADD.ToString())
                {
                    query = "INSERT INTO CANDIDATE_PERSONALDETAILS VALUES(" + CandId + ",'" + txtTPosition.Text + "','" + txtTExp.Text + "','" + txtTCompany.Text + "','" + txtTCurSal.Text + "','" + txtTExpSal.Text + "','" + txtTFatherDetails.Text + "','" + txtTMotherDetails.Text + "','" + txtTBrothers.Text + "','" + txtTSisters.Text + "','" + txtTGoals.Text + "','" + txtTSocietyValue.Text + "','" + txtTRoleModel.Text + "','" + txtTNext5Years.Text + "','" + txtTAchievements.Text + "','" + txtTQuestions.Text + "',GETDATE(),'DILLIP',GETDATE(),'DILLIP')";
                    dbconnect.ExecuteQuery(query);

                }
                else
                {

                    query = "UPDATE CANDIDATE_PERSONALDETAILS SET POSITION='" + txtTPosition.Text + "',EXPERIENCE='" + txtTExp.Text + "',CURRENTCOMPANYNAME='" + txtTCompany.Text + "',CURRENTPACKAGE='" + txtTCurSal.Text + "',EXPECTEDPACKAGE='" + txtTExpSal.Text + "',FATHERDETAILS='" + txtTFatherDetails.Text + "',MOTHERDETAILS='" + txtTMotherDetails.Text + "',NOOFBORTHERS='" + txtTBrothers.Text + "',NOOFSISTERS='" + txtTSisters.Text + "',GOALS='" + txtTGoals.Text + "',SOCIETY='" + txtTSocietyValue.Text + "',ROLEMODEL='" + txtTRoleModel.Text + "',NEXT5YEARS='" + txtTNext5Years.Text + "',PARENTSHAPPINESS='" + txtTAchievements.Text + "',QUESTIONS='" + txtTQuestions.Text + "' WHERE REGISTRATIONID=" + CandId;
                    dbconnect.ExecuteQuery(query);

                }
                string message = "You have submitted you personal detais successfully.Recruitment Team will shortly contact you for interview";
                string msg = "<script language=javascript>alert('" + message + "')</script>";
                Response.Write(msg);
            }
        }
    }
}