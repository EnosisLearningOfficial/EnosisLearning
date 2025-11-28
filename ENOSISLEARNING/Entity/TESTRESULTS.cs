using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Org.BouncyCastle.Asn1.Ocsp;

namespace ENOSISLEARNING
{
   

    public class CountryList
    {
        public int CountryId { get; set; }
        public string CountryName { get; set; }
    }
    public class StatusList
    {
        public int StatusCode { get; set; }
        public string StatusName { get; set; }
    }

    public class JOBRRESULTS
    {

        public int CANDIDATEID;
        public  string USERNAME;
        public string EVALUATIONDATE;
        public double SCORE;
        public string FEEDBACK;
        public int STATUSID;
        public string STATUS;
        public string FILENAME;

        public void AddJobStatus()
        {
            try
            {
                string query = "INSERT INTO PROFILE_JOBSTATUS VALUES(" + CANDIDATEID + ",GETDATE(),'" + USERNAME + "'," + STATUSID + "," + SCORE + ",'" + FEEDBACK + "','" + FILENAME + "',GETDATE(),'" + USERNAME + "')";

                dbconnect.ExecuteQuery(query);


            }
            catch (Exception ex)
            {
                dbconnect.LogError("Job", ex.Message);
                throw ex;
            }
        }

    }
    public class TESTRESULTS
    {
        public static int CANDIDATEID;
        public static string USERNAME;
        public string testdate;
        public double Score;
        public double OutOf;
        public string feedback;
        public string TestType;
        public int CourseId;
        public string CourseName;
        public string TestFileName;

      
        public TESTRESULTS()
        {
            
        }
        public void InsertTestResults(string TYPE)
        {

            try
            {
                string query = "INSERT INTO [dbo].[CANDIDATE_TESTRESULTS] VALUES(" + CANDIDATEID + ",GETDATE(),'" + TestType + "'," + CourseId + "," + Score + "," + OutOf + ",GETDATE(),'" + USERNAME + "','" + feedback + "','" + TYPE + "','" + TestFileName + "')";

                dbconnect.ExecuteQuery(query);
        
                try
                {
                    SENDEMAIL obj = new SENDEMAIL();
                    if (HttpContext.Current.Session["STUDEMAIL"] != null)
                    {
                        string StudName = HttpContext.Current.Session["STUDNAME"].ToString();

                        string ToEmailAddress = HttpContext.Current.Session["STUDEMAIL"].ToString();

                        string body = obj.PopulateScoreBody(StudName, Score, OutOf, TestType, CourseName, CANDIDATEID, USERNAME, feedback);

                        obj.SendMail(ToEmailAddress, "EnosisLearning-Assessment-Results", body);

                    }
                }
                catch(Exception ex)
                {
                    //string pageName = System.IO.Path.GetFileName(Request.Path);
                    dbconnect.LogError("Assessment", ex.Message);
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }


        }
        public void DeleteTestResults(int TestId)
        {
            string query = "DELETE FROM [dbo].[CANDIDATE_TESTRESULTS] WHERE TESTID=" + TestId;

            dbconnect.ExecuteQuery(query);
          
        }
        public void DeleteInterviewResults(int InterviewId)
        {
            string query = "DELETE FROM [dbo].[CANDIDATE_INTERVIEWRESULTS] WHERE INTERVIEWID=" + InterviewId;
            dbconnect.ExecuteQuery(query);


          
        }

        public void InsertInterviewResults(string TYPE)
        {
            try
            {

                string query = "INSERT INTO [dbo].[CANDIDATE_INTERVIEWRESULTS] VALUES(" + CANDIDATEID + ",GETDATE(),'" + TestType + "'," + CourseId + "," + Score + "," + OutOf + ",GETDATE(),'" + USERNAME + "','" + feedback + "','" + TYPE + "','" + TestFileName + "')";

                dbconnect.ExecuteQuery(query);
               
                //commented on 11th Feb 2020

                try
                {

                    SENDEMAIL obj = new SENDEMAIL();
                    if (HttpContext.Current.Session["STUDEMAIL"] != null)
                    {
                        string StudName = HttpContext.Current.Session["STUDNAME"].ToString();

                        string ToEmailAddress = HttpContext.Current.Session["STUDEMAIL"].ToString();

                        string body = obj.PopulateScoreBody(StudName, Score, OutOf, TestType, CourseName, CANDIDATEID, USERNAME, feedback);
                        obj.SendMail(ToEmailAddress, "EnosisLearning-Interview-Results", body);

                    }
                }
                catch
                {

                }
            }
            catch(Exception ex)
            {
                throw ex;
            }

        }



    }
    
}