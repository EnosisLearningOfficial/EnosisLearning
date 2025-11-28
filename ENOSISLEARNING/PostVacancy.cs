using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace ENOSISLEARNING
{
    public class Vacancy
    {
        public static string CONNSTRING = System.Configuration.ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ToString();
        SqlConnection scon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ToString());

        //SqlConnection scon = new SqlConnection(@"Data Source=RAHUL-VAIO-PC;Initial Catalog=NISHA_DB;Integrated Security=true");


        public string Save(String PositionName, String JobLocation, string JobTitle, String JobDescription, String Experience, String Qualification, String Salary, String LastDateToApply, String CompanyName, String Address, String ContactPerson, String PhoneNo, String EmailId, String Website)
        {

            string query = "INSERT INTO VacancyDetails values('" + PositionName + "', '" + JobLocation + "','" + JobTitle + "','" + JobDescription + "','" + Experience + "','" + Qualification + "','" + Salary + "','" + LastDateToApply + "','" + CompanyName + "','" + Address + "','" + ContactPerson + "','" + PhoneNo + "','" + EmailId + "','" + Website + "','Inactive',GETDATE())";
            return query;
        }

        public string Search(string JobCode, string PositionName, string Experience)
        {
            int JC = 0;
            int PN = 0;
            //int JE = 0;
            string connstring1 = "";
            string connstring2 = "";
            string connstring3 = "";
            string finalConnstring = "";
            string whereCond = "";
            string connstring = "";

            //string connstring = "select * from vacancydetails where ";

            if (JobCode != "" || PositionName != "" || Experience != "")
            {
                connstring = "select * from vacancydetails Where ";
            }
            else
            {
                connstring = "select * from vacancydetails ";
            }

            if (JobCode != "")
            {
                whereCond = "jobcode like '%" + JobCode + "%' ";
                connstring1 = connstring + whereCond;
                JC = 1;
                finalConnstring = connstring1;
            }

            if (PositionName != "")
            {
                whereCond = " positionname like '%" + PositionName + "%'";
                if (JC == 1)
                {
                    connstring2 = connstring1 + " and " + whereCond;
                }
                else
                {
                    connstring2 = connstring + whereCond;
                }
                PN = 1;
                finalConnstring = connstring2;
            }

            if (Experience != "")
            {
                whereCond = " experience like '%" + Experience + "%'";
                if (JC == 1 && PN == 1)
                {
                    connstring3 = connstring2 + " and " + whereCond;
                }
                if (JC == 1 && PN == 0)
                {
                    connstring3 = connstring1 + " and " + whereCond;
                }
                if (JC == 0 && PN == 1)
                {
                    connstring3 = connstring2 + " and " + whereCond;
                }
                if (JC == 0 && PN == 0)
                {
                    connstring3 = connstring + whereCond;
                }
                // JE = 1;
                finalConnstring = connstring3;
            }
            return finalConnstring;

        }


        public string UserSearch(string PrimarySkills, string JobLocation, string from, string to, string qualification)
        {
            int and = 0;

            string ConString = "";
            string PScond = " JobTitle like '%" + PrimarySkills + "%'";
            string JLcond = " Joblocation like '%" + JobLocation + "%' ";
            string EXPcond = " experience Between '" + from + "' and '" + to + "'";
            string QUAcond = " qualification like '%" + qualification + "%'";

            if (PrimarySkills != "-1" || JobLocation != "-1" || qualification != "-1" || from != "-1" || to != "-1")
            {
                ConString = "select * from vacancydetails Where ";
            }
            else
            {
                ConString = "select * from vacancydetails ";
            }

            if (PrimarySkills != "-1")
            {
                ConString = ConString + PScond;
                and = 1;
            }

            if (JobLocation != "-1")
            {
                if (and == 0)
                {
                    ConString = ConString + JLcond;
                }
                else
                {
                    ConString = ConString + " and " + JLcond;
                }
                and = 1;
            }

            if (from != "-1" && to != "-1")
            {
                if (and == 0)
                {
                    ConString = ConString + EXPcond;
                }
                else
                {
                    ConString = ConString + " and " + EXPcond;
                }
                and = 1;
            }

            if (qualification != "-1")
            {
                if (and == 0)
                {
                    ConString = ConString + QUAcond;
                }
                else
                {
                    ConString = ConString + " and " + QUAcond;
                }
                and = 1;
            }

            return ConString;
        }

    }
}