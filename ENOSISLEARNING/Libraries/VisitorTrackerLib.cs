using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System;
using System.Globalization;
using System.Web.UI.WebControls;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Configuration;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Text;
using System.Collections;
using System.Linq;
using System.Data.SqlClient; 
using System.Net;
using System.Net.Mail;

namespace ENOSISLEARNING
{
    public class VISITOR
    {

    }
    public class VisitorTrackerLib
    {
        public VISITOR GetVisitorDetails()
        {

            VISITOR v1 = new VISITOR();
            return v1;
        }

        public static void InsertVisitordetails(string pagename, string ipaddress)
        {
            string QUERY = "INSERT INTO WEB_VISITORS_DETAILS(PAGE_NAME,IPADDRESS,VISITEDDATE) VALUES('" + pagename + "', '" + ipaddress + "',GETDATE())";

            dbconnect.ExecuteQuery(QUERY);
          /*  string CONNSTRING = System.Configuration.ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ToString();
            SqlConnection sconn = null;
            sconn = new SqlConnection(CONNSTRING);
            SqlCommand comm1 = new SqlCommand(QUERY, sconn);
            sconn.Open();
            comm1.ExecuteNonQuery();
            sconn.Close();*/

        }
        public static void InsertVisitordetailsIPAPIFREE(string ipaddress, string pageName)
        {
            string ip = "http://ip-api.com/json/" + ipaddress;
            WebClient client = new WebClient();
            client.Headers["Content-type"] = "application/json";
            client.Encoding = System.Text.Encoding.UTF8;
            string json = client.UploadString(ip, "");
            string[] data = json.Split(':');
            int lenghth = data[2].IndexOf(',');
            string countryname = data[2].Substring(0, lenghth).Replace("\"", "");
            lenghth = data[3].IndexOf(',');
            string countrycode = data[3].Substring(0, lenghth).Replace("\"", "");
            lenghth = data[4].IndexOf(',');
            string regioncode = data[4].Substring(0, lenghth).Replace("\"", "");
            lenghth = data[5].IndexOf(',');
            string regionname = data[5].Substring(0, lenghth).Replace("\"", "");
            lenghth = data[6].IndexOf(',');
            string cityname = data[6].Substring(0, lenghth).Replace("\"", "");

            lenghth = data[7].IndexOf(',');
            string zipcode = data[7].Substring(0, lenghth).Replace("\"", "");

            /*  [0]: "{\"status\""
  [1]: "\"success\",\"country\""
  [2]: "\"Canada\",\"countryCode\""
  [3]: "\"CA\",\"region\""
  [4]: "\"QC\",\"regionName\""
  [5]: "\"Quebec\",\"city\""
  [6]: "\"Montreal\",\"zip\""
  [7]: "\"H1K\",\"lat\""
  [8]: "45.6085,\"lon\""
  [9]: "-73.5493,\"timezone\""
  [10]: "\"America/Toronto\",\"isp\""
  [11]: "\"Le Groupe Videotron Ltee\",\"org\""
  [12]: "\"Videotron Ltee\",\"as\""
  [13]: "\"AS5769 Videotron Telecom Ltee\",\"query\""
  [14]: "\"24.48.0.1\"}" */

            string QUERY = "INSERT INTO  WEB_VISITORS_DETAILS(IPADDRESS,VISITEDDATE,PAGE_NAME,COUNTRYCODE,COUNTRY,REGIONCODE,REGIONNAME,CITY,PINCODE,LOCATION) VALUES('" + ipaddress + "',GETDATE(),'" + pageName + "','" + countrycode + "','" + countryname + "','" + regioncode + "','" + regionname + "','" + cityname + "','" + zipcode + "','" + cityname + "')";

            dbconnect.ExecuteQuery(QUERY);







        }
        public static void InsertVisitordetailsIPSTACK(string ipaddress, string pageName)
        {
            string ip = "http://api.ipstack.com/" + ipaddress + "?access_key=eaad8311af6593bd7227878205404ae1";

            // http://api.ipstack.com/134.201.250.155?access_key=eaad8311af6593bd7227878205404ae1


            // string apiUrl = "http://localhost:26404/api/CustomerAPI";

            //string inputJson = (new JavaScriptSerializer()).Serialize(input);
            WebClient client = new WebClient();
            client.Headers["Content-type"] = "application/json";
            client.Encoding = System.Text.Encoding.UTF8;
            string json = client.UploadString(ip, "");
            string[] data = json.Split(':');

            int lenghth = data[5].IndexOf(',');
            string countrycode = data[5].Substring(0, lenghth);
            string newcountrycode = countrycode.Replace("\"", "");

            lenghth = data[6].IndexOf(',');
            string countryname = data[6].Substring(0, lenghth);
            string newcountryname = countryname.Replace("\"", "");

            lenghth = data[7].IndexOf(',');
            string regioncode = data[7].Substring(0, lenghth);
            string newregioncode = regioncode.Replace("\"", "");

            lenghth = data[8].IndexOf(',');
            string regionname = data[8].Substring(0, lenghth);
            string newregionname = regionname.Replace("\"", "");

            lenghth = data[9].IndexOf(',');
            string cityname = data[9].Substring(0, lenghth);
            string newcityname = cityname.Replace("\"", "");

            lenghth = data[10].IndexOf(',');
            string zipcode = data[10].Substring(0, lenghth);
            string newzipcode = zipcode.Replace("\"", "");

            //lenghth = data[13].IndexOf(',');
            string location = data[13].ToString();
            // string newlocation = location.Replace("\"", "");

            string QUERY = "INSERT INTO  WEB_VISITORS_DETAILS(IPADDRESS,VISITEDDATE,PAGE_NAME,COUNTRYCODE,COUNTRY,REGIONCODE,REGIONNAME,CITY,PINCODE,LOCATION) VALUES('" + ipaddress + "',GETDATE(),'" + pageName + "','" + countrycode + "','" + countryname + "','" + regioncode + "','" + regionname + "','" + cityname + "','" + zipcode + "','" + location + "')";

            dbconnect.ExecuteQuery(QUERY);
            /*string CONNSTRING = System.Configuration.ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ToString();
            SqlConnection sconn = null;
            sconn = new SqlConnection(CONNSTRING);
            SqlCommand comm1 = new SqlCommand(QUERY, sconn);
            sconn.Open();
            comm1.ExecuteNonQuery();
            sconn.Close();*/

        }
    }
}