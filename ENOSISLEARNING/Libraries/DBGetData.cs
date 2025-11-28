using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace ENOSISLEARNING
{
    public static class DBGetData
    {
        public static string GetBatchCourseName(string Course)
        {
            string BatchCourse = "";
            if (Course == "C" || Course == "C++" || Course == "C & C++")
            {
                BatchCourse = COURSES.CCPP.ToString();
            }
            else if (Course.Contains("JAVA") || Course == "ADVANCE-JAVA" || Course == "COMPLETE JAVA(BASIC-ADV-FRAMEWORKS)")
            {
                BatchCourse = COURSES.JAVA.ToString();
            }
            else if (Course.Contains("CSHARP.NET") || Course == "ASP.NET" || Course.Contains("ASP.NET MVC") || Course.Contains("COMPLETE.NET(.NET,ASP.NET,SQL,DESIGNING,MVC)"))
            {
                BatchCourse = COURSES.NET.ToString();
            }
            else if (Course.Contains("Web Designing"))
            {
                BatchCourse = COURSES.DESIGNING.ToString();
            }  //SSIS SSRS SSAS MSBI
            else if (Course.Contains("SSIS") || Course.Contains("SSRS") || Course.Contains("SSAS") || Course.Contains("MSBI") || Course.Contains("POWER-BI"))
            {
                BatchCourse = COURSES.MSBI.ToString();
            }
            else if (Course.Contains("SQL SERVER"))
            {
                BatchCourse = COURSES.SQL.ToString();
            }
            return BatchCourse;
        }
        public static List<string> GetYears()
        {
            List<string> YearsList = new List<string>();
            int endyear = DateTime.Today.Year;
            for (int y = endyear; y > 1992; y=y - 1)
            {
                YearsList.Add(y.ToString());
            }
            return YearsList;
        }
    public static DataTable GetCourses()
        {
            string QUERY = "SELECT COURSEID,COURSENAME FROM COURSES_DETAIL";
            return dbconnect.GetDataSet(QUERY);
       
        }

        public static DataTable GetCoordinator()
        {
            string QUERY = "select USERID,UPPER(USERNAME) AS USERNAME from userdetails WHERE DESIGNATION IN ('MANAGER','COUNSELLOR') AND STATUS = 'ACTIVE'";
            return dbconnect.GetDataSet(QUERY);

        }

        public static DataTable GetJobStatus()
        {
            string QUERY = "SELECT STATUSID,STATUS FROM JOBSTATUS";
            return dbconnect.GetDataSet(QUERY);

        }
        public static DataTable GetCandidatesCourses(int Id)
        {
            string QUERY = "SELECT COURSEID,COURSENAME FROM COURSES_DETAIL  WHERE STATUS='A' and courseid not in(7,24,26)";
           return dbconnect.GetDataSet(QUERY);
         
        }

        public static DataTable GetEducation()
        {
            string QUERY = "select ID,NAME from qualification";
           return dbconnect.GetDataSet(QUERY);
         
        }

        public static DataTable GetPassingYear()
        {
            string QUERY = "select distinct passingyear from candidates order by passingyear desc";
            return dbconnect.GetDataSet(QUERY);
         
        }
        public static DataTable GetExpYear()
        {
            string QUERY = "select distinct yearsexperience from candidates where isfresher!=1";

            return dbconnect.GetDataSet(QUERY);
       
        }

    }
}