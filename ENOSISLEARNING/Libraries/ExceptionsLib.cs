using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ENOSISLEARNING
{

    public class EnosisException : Exception
    {
        public EnosisException()
        {


        }
        public void LogError()
        {
            string query = "INSERT INTO ERRORLOGS VALUES('" + Message + "','" + Source.ToString() + "','" + TargetSite.ToString() + "','" + StackTrace.ToString() + "','" + System.DateTime.Today.ToShortDateString() + "')";
            // dbconnect.Execute(query);

        }


    }
    public class ExceptionsLib
    {
    }
}