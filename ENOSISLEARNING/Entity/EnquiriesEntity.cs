using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ENOSISLEARNING
{


    enum ENQCOURSES
    {
        NET,
        JAVA,
        SQLSERVER,
        POWERBI,
        OTHERS

    }
    public class EnquiriesEntity
    {
        public int EnquiryId { get; set; }
        public string Name { get; set; }

        public string Email { get; set; }

        public string Mobile { get; set; }

        public string Course { get; set; }

        public string Status { get; set; }

        public string NextEnqDate { get; set; }

        public string TrainingMode { get; set; }

        public string AssignedTo { get; set; }

        public string Comments { get; set; }

        public string Source { get; set; }

        public string UserName { get; set; }

        public void DeleteEnquiry()
        {
            string query = "UPDATE ENQUIRIES SET STATUS = 'INACTIVE' WHERE ENQUIRYID = " + EnquiryId;

              //string query = "DELETE FROM ENQUIRIES WHERE ENQUIRYID=" + EnquiryId;
            dbconnect.ExecuteQuery(query);

            //string query = "UPDATE ENQUIRIES SET CONTACTEMAIL='" + Email + "',[CONTACTMOBILENO]='" + Mobile + "',[COURSENAME]='" + Course + "' ,[COMMENTS]='" + Comments + "',[STATUS]='" + Status + "',[NEXTENQDATE]='" + NextEnqDate + "',[MODE]='" + TrainingMode + "' ,[ASSIGNEDTO]='" + AssignedTo + "',SOURCE='" + Source + "',UPDATE_DATE=GETDATE(),UPDATEDBY='" + UserName + "' WHERE ENQUIRYID=" + EnquiryId;
            //bconnect.ExecuteQuery(query);

        }

        public void UpdateEnquiry()
        {
            string query = "UPDATE ENQUIRIES SET CONTACTEMAIL='" + Email + "',[CONTACTMOBILENO]='" + Mobile + "',[COURSENAME]='" + Course + "' ,[COMMENTS]='" + Comments + "',[STATUS]='" + Status + "',[NEXTENQDATE]='" + NextEnqDate + "',[MODE]='" + TrainingMode + "' ,[ASSIGNEDTO]='" + AssignedTo + "',SOURCE='" + Source + "',UPDATE_DATE=GETDATE(),UPDATEDBY='" + UserName + "' WHERE ENQUIRYID=" + EnquiryId;
            dbconnect.ExecuteQuery(query);

        }
        public void InsertEnquiry()
        {
            try
            {
                if (Mobile.Trim().Length > 0 && Email.Trim().Length > 0)
                {
                    string query = "INSERT INTO [ENQUIRIES] ([NAME],[CONTACTEMAIL],[CONTACTMOBILENO],[COURSENAME],[COMMENTS],[STATUS],[MODE],[ASSIGNEDTO],[SOURCE],[NEXTENQDATE],[CREATED_DATE],UPDATE_DATE,CREATEDBY,UPDATEDBY)";
                    query = query + " VALUES('" + Name + "','" + Email + "','" + Mobile + "','" + Course + "','" + Comments + "','" + Status + "','" + TrainingMode + "','" + AssignedTo + "','" + Source + "','" + NextEnqDate + "',GETDATE(),GETDATE(),'" + UserName + "','" + UserName + "')";

                    dbconnect.ExecuteQuery(query);

                    //commented on 25th Aug 2023
                    /*string Body = "ENQUIRY FOR " + Course + "\r\n ASSIGNED TO " + AssignedTo + " \r\n EMAIL = " + Email + "\r\n MOBILE=" + Mobile;
                    string ToEmail = "";
                    if (AssignedTo == USERS.DIPALI.ToString())
                        ToEmail = "hr@enosislearning.com";
                    else if (AssignedTo == USERS.MANJU.ToString())
                        ToEmail = "learning@enosislearning.com";
                    else if (AssignedTo == USERS.DILLIP.ToString())
                        ToEmail = "courses@enosislearning.com";
                    else
                        ToEmail = "courses@enosislearning.com;learning@enosislearning.com;hr@enosislearning.com";

                    try
                    {
                        
                        SENDEMAIL s1 = new SENDEMAIL();

                        try
                        {
                            s1.SendMail(ToEmail, "COURSEENQUIRY", Body);
                        }
                        catch(Exception ex)
                        {
                          
                            dbconnect.LogError("Enquiry.aspx", ex.Message);
                        }
                        try
                        {
                            s1.SendCourseContents(Email, Course);
                        }
                        catch(Exception ex)
                        {
                            dbconnect.LogError("Enquiry.aspx", ex.Message);
                        }

                    }
                    catch (Exception ex1)
                    {

                    }*/
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }




        }


    }
}