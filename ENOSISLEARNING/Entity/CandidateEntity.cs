using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

namespace ENOSISLEARNING
{
    public class CandidateEntity
    {
        public int CandidateId = 0;
        public string Name, Gender, dob, semail, smobile, Skills, City;
        public int Qualification;

        public int PassingYears;
        public double ExpYears;

        public int iExpYears;

        public int iExpMonths;
        public double dExpSalary;
        public int iNoticePeriod;
        public string strPosition;
        public string Comments;
        public string message;
        public string filename;

        public string dobdate;
        public string dobpass;

        public int CourseId;
         public string Address;
        public string Location;
        public string PinCode;
        public double percentage;
          public int IsFresher;
       public string CompanyName;
        public int ReqPlacement;
       public string strcoordinator;
       public string BatchName;
        public double totalfees;
        public int AddStudent()
        {
            string query = "INSERT INTO CANDIDATES(FULLNAME,GENDER,DOB,MOBILENO,EMAIL,COURSEID,SKILLS,ADDRESS,LOCATION,CITY,PINCODE,STATE,COUNTRY,QUALIFICATION,PERCENTAGE,PASSINGYEAR,ISFRESHER,YEARSEXPERIENCE,MONTHSEXPERIENCE,COMPANYNAME,RESUME,DateofRegistration,CREATEDDATE,UPDATEDDATE,RESUMEDATE,ReqPlacement,CAN_TYPE,COUNSELLORNAME,REFEREDBY,BATCHNAME,TOTALFEES,STATUS,Certificate_Status) VALUES('" + Name + "','" + Gender + "','" + dobdate + "','" + smobile + "','" + semail + "'," + CourseId + ",'" + Skills + "','" + Address + "','" + Location + "','" + City + "', '" + PinCode + "',NULL,NULL," + Qualification + "," + percentage + ",'" + PassingYears + "'," + IsFresher + "," + iExpYears + "," + iExpMonths + ",'" + CompanyName + "','" + filename + "',GETDATE(),GETDATE(),GETDATE(),GETDATE()," + ReqPlacement + ",'I','" + strcoordinator + "','OTHERS','" + BatchName + "'," + totalfees + ",'A',0)";
            dbconnect.ExecuteQuery(query);


           int CandidateId = dbconnect.ExecuteScalerQuery("select ident_current('CANDIDATES')");// Convert.ToInt32(scomm2.ExecuteScalar());
            string query1 = "INSERT INTO CANDIDATE_FEESDETAIL([CANDIDATEID],[FEESTYPE],[FEESAMOUNT],[STATUS]) VALUES(" + CandidateId + ",'REGISTRATION FEES',500,'PENDING')";

            dbconnect.ExecuteQuery(query1);

            try
            {
              //  SENDEMAIL objm = new SENDEMAIL();
                //objm.SendWelcomeEmail(Name, semail, CandidateId, dobpass);
            }
            catch (Exception ex)
            {

            }

            return CandidateId;
        }
        public void UpdateStudent()
        {
            string query1 = "UPDATE CANDIDATES SET  [FULLNAME]='" + Name + "',[GENDER]='" + Gender + "',[DOB] ='" + dobdate + "',MOBILENO='" + smobile + "',EMAIL='" + semail + "',[COURSEID]=" + CourseId + ",[SKILLS]='" + Skills + "',[ADDRESS]='" + Address + "',[LOCATION]='" + Location + "',[PINCODE]='" + PinCode + "',[CITY]='" + City + "',[QUALIFICATION]=" + Qualification + ",[PERCENTAGE]=" + percentage + ",[PASSINGYEAR]='" + PassingYears + "',[ISFRESHER]=" + IsFresher + ",[YEARSEXPERIENCE]=" + ExpYears + ",[MONTHSEXPERIENCE]=" + iExpMonths + ",[COMPANYNAME]='" + CompanyName + "',[RESUME]='" + filename + "',[UPDATEDDATE]=GETDATE(),[RESUMEDATE]=GETDATE(),ReqPlacement=" + ReqPlacement + ",COUNSELLORNAME='" + strcoordinator + "'  WHERE CANDIDATE_CODE=" + CandidateId;
            dbconnect.ExecuteQuery(query1);


        }


        //  public dob;

        public void SaveJobProfile()
        {
            string cONNSTRING = System.Configuration.ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ToString();
            SqlConnection sconn = new SqlConnection(cONNSTRING);

            try
            {
                dbconnect objDB = new dbconnect();
                string MODE = OPERATION.ADD.ToString();

                int code = objDB.CheckEmail(semail);
                if (code > 0)
                {
                    MODE = OPERATION.EDIT.ToString();
                    HttpContext.Current.Session["REGNO"] = code;
                }
                if (MODE == OPERATION.ADD.ToString())
                {
                    SqlCommand scomm = null;

                    string query = "";
                    query = "INSERT INTO CANDIDATES([FULLNAME],[GENDER],[DOB],[MOBILENO],[EMAIL],[SKILLS],[CITY],[QUALIFICATION],[PASSINGYEAR],[RESUME],[DateofRegistration],[CREATEDDATE] ,[UPDATEDDATE],[RESUMEDATE],CAN_TYPE,YEARSEXPERIENCE,MONTHSEXPERIENCE,TOTALFEES,POSITION_APPLIED,NOTICEPERIOD,ReqPlacement,STATUS,COMMENTS) " +
                            "VALUES(@Name,@Gender,@DOB,@MOBILE,@EMAIL,@SKILLS,@CITY,@Qualification,@PASSINGYEARS,@FILENAME,GETDATE(),GETDATE(),GETDATE(),GETDATE(),'O','" + iExpYears + "','" + iExpMonths + "'," + dExpSalary + ",'" + strPosition + "'," + iNoticePeriod + ",1,'A',@COMMENTS)";

                    scomm = new SqlCommand(query, sconn);
                    SqlParameter[] param = new SqlParameter[11];
                    param[0] = new SqlParameter("@Name", Name);
                    param[1] = new SqlParameter("@Gender", Gender);
                    param[2] = new SqlParameter("@DOB", dob);
                    param[3] = new SqlParameter("@MOBILE", smobile);
                    param[4] = new SqlParameter("@EMAIL", semail);
                    param[5] = new SqlParameter("@SKILLS", Skills);
                    param[6] = new SqlParameter("@CITY", City);
                    param[7] = new SqlParameter("@Qualification", Qualification);
                    param[8] = new SqlParameter("@PASSINGYEARS", PassingYears);
                    param[9] = new SqlParameter("@FILENAME", filename);
                    param[10] = new SqlParameter("@COMMENTS", Comments);
                    for (int i = 0; i < 11; i = i + 1)
                    {
                        scomm.Parameters.Add(param[i]);
                    }

                    if (sconn.State != System.Data.ConnectionState.Open)
                    {
                        sconn.Open();
                    }

                    //scomm.ExecuteNonQuery();
                    CandidateId = Convert.ToInt32(scomm.ExecuteScalar());

                    //Session["REGNO"] = CandidateId;



                    if (sconn.State != System.Data.ConnectionState.Closed)
                    {
                        sconn.Close();
                    }


                  
                    CandidateId = dbconnect.ExecuteScalerQuery("select ident_current('CANDIDATES')");

                    string query1 = "INSERT INTO profile_jobstatus(CANDIDATEID, STATUSID) VALUES(" + CandidateId + ", 1)";

                    dbconnect.ExecuteQuery(query1);

                    HttpContext.Current.Session["REGNO"] = CandidateId;

                    //commented on 4th May 2022
                    /* try
                     {
                         SENDEMAIL obj = new SENDEMAIL();
                         obj.SendJobApplicationEmail(Name, semail, CandidateId, strPosition);
                     }
                     catch (Exception ex)
                     {
                         message = "You have submitted you resume successfully.You can contact courses@enosislearning.com for further details";
                     }*/
                    message = "You have submitted you resume successfully.You can contact courses@enosislearning.com for further details";
                }
                else
                {
                    CandidateId = Convert.ToInt32(HttpContext.Current.Session["REGNO"].ToString());

                    string query = "UPDATE CANDIDATES SET  [FULLNAME]='" + Name + "',DOB='" + dob + "',POSITION_APPLIED='" + strPosition + "',TOTALFEES=" + dExpSalary + ",[GENDER]='" + Gender + "',MOBILENO='" + smobile + "',EMAIL='" + semail + "',[SKILLS]='" + Skills + "',[CITY]='" + City + "',[QUALIFICATION]=" + Qualification + ",[PASSINGYEAR]='" + PassingYears + "',[RESUME]='" + filename + "',[UPDATEDDATE]=GETDATE(),[RESUMEDATE]=GETDATE(),NOTICEPERIOD=" + iNoticePeriod + ",COMMENTS='" + Comments + "',YEARSEXPERIENCE=" + iExpYears + ",MONTHSEXPERIENCE=" + iExpMonths + ",ReqPlacement=1,STATUS='A'  WHERE CANDIDATE_CODE=" + CandidateId;
                    dbconnect.ExecuteQuery(query);
                    message = "You have Updated you resume successfully.You can contact courses@enosislearning.com for further details";
                }
            }
            catch(Exception ex)
            {

                throw ex;
            }
            finally
            {
                if (sconn.State != System.Data.ConnectionState.Closed)
                {
                    sconn.Close();
                }
            }
        }
    }
}