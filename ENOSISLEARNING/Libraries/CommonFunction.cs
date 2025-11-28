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
using System.Collections.Generic;

namespace ENOSISLEARNING
{
    
  
    public class CommonFunction
    {
        public static string DMSDirectoryPath = ConfigurationManager.AppSettings["DMSDirectoryPath"];
        public static string InsertMsg = ConfigurationManager.AppSettings["dataSaved"];
        public static string UpdateMsg = ConfigurationManager.AppSettings["dataUpdated"];
        public static string DeleteMsg = ConfigurationManager.AppSettings["deleteData"];
        public static string AlreadyExistMsg = ConfigurationManager.AppSettings["redundantData"];
        public static string InvalidUsiMsg = ConfigurationManager.AppSettings["invalidUSI"];
        public static string EmptyDisplayMsg = ConfigurationManager.AppSettings["emptyDisplay"];
        public static string UnavailableDocNoMsg = ConfigurationManager.AppSettings["unavailableDocNo"];
        public static string AmendmentNomsg = ConfigurationManager.AppSettings["AmendmentNo"];
        public static string EmptyFields = ConfigurationManager.AppSettings["emptyFields"];
        //Constants 

        //http://www.xiirus.net/articles/article-_net-convert-datetime-from-one-timezone-to-another-7e44y.aspx
        public static DateTime GetSADateTime()
        {
            TimeZoneInfo timeZoneInfo;
            DateTime dtSATime;
            //Set the time zone information to US Mountain Standard Time 
            timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("South Africa Standard Time");
            //Get date and time in US Mountain Standard Time 
            dtSATime = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);
            return dtSATime;
        }

        public static string GetSiteRootUrl()
        {
            string protocol;

            if (HttpContext.Current.Request.IsSecureConnection)
                protocol = "https";
            else
                protocol = "http";

            StringBuilder uri = new StringBuilder(protocol + "://");

            string hostname = HttpContext.Current.Request.Url.Host;

            uri.Append(hostname);

            int port = HttpContext.Current.Request.Url.Port;

            if (port != 80 && port != 443)
            {
                uri.Append(":");
                uri.Append(port.ToString());
            }

            return uri.ToString();
        }
        public static string SplitString(string strPoNo)
        {
            try
            {
                var strBuildPoNo = new StringBuilder();
                var words = strPoNo.Split('/', '-');
                foreach (var word in words)
                {
                    strBuildPoNo.Append(word);
                }

                return Convert.ToString(strBuildPoNo);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static string GetOperatorDate(int dataOperator)
        {
            string returnoperator = null;
            if (dataOperator == 1)
            { returnoperator = "> "; }
            else if (dataOperator == 2)
            { returnoperator = "< "; }
            else if (dataOperator == 3)
            { returnoperator = "= "; }
            else if (dataOperator == 4)
            { returnoperator = "BETWEEN"; }
            return returnoperator;
        }


     
        //Function will return Directory of Perticular Document Type
        public static string GetDirectory(String mouduleName)
        {
            var docDirectory = new StringBuilder(DMSDirectoryPath);

            return docDirectory.Append(mouduleName).Append("\\\\").ToString();
        }


        //Function returns Operator Symbol for comparisons in SearchQuery
        public static string GetOperator(int dataOperator)
        {
            string returnoperator = null;
            if (dataOperator == 1)
            { returnoperator = "LIKE "; }
            else if (dataOperator == 2)
            { returnoperator = "> "; }
            else if (dataOperator == 3)
            { returnoperator = "< "; }
            else if (dataOperator == 4)
            { returnoperator = "= "; }
            return returnoperator;
        }


        public static string invokeMsgBox(string bodyMsg)           //returns the string for drawing the popup message box
        {

            const string msgButtonClass = "btn-info";
            var msgbox = new MessageBox(HttpContext.Current.Server.MapPath("~/Css/msgbox.tpl"));
            msgbox.SetTitle("DMS - Alert");

            msgbox.SetIcon("msg_icon_1.png");
            msgbox.SetMessage(bodyMsg);
            msgbox.SetOKButton(msgButtonClass);
            return msgbox.ReturnObject();
        }

        public static string getErrorMsgString(string moduleName, string action)        // returns the string containing the given ModuleName and action performed to be set at bodyMsg of the popup MessageBox
        {


            var errorMsgString = new StringBuilder(moduleName);
            errorMsgString.Append(" ").Append(action);
            return errorMsgString.ToString();
        }





        public static void printSearch(DataTable dt)
        {
            try
            {

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }





        public static HtmlTable getSearchTable(DataTable dt, HtmlTable table)
        {
            try
            {
                var rowHeader = new HtmlTableRow();
                rowHeader.Style.Add("font-weight", "bold");
                for (var i = 0; i < dt.Columns.Count; i++)
                {
                    var cell = new HtmlTableCell { InnerText = dt.Columns[i].ColumnName };
                    rowHeader.Cells.Add(cell);
                }
                table.Rows.Add(rowHeader);
                table.Style.Add("font-size", "x-small");
                for (var i = 0; i < dt.Rows.Count; i++)
                {
                    var rowData = new HtmlTableRow();
                    for (var j = 0; j < dt.Columns.Count; j++)
                    {
                        var cell = new HtmlTableCell { InnerText = dt.Rows[i][j].ToString() };
                        rowData.Cells.Add(cell);
                    }
                    table.Rows.Add(rowData);
                }
                return table;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        //-----------  Function Cryptography Passsword----------
        public static string Encryptdata(string password)
        {
            var encode = Encoding.UTF8.GetBytes(password);
            var strmsg = Convert.ToBase64String(encode);
            return strmsg;
        }


        public static string Decryptdata(string encryptpwd)
        {
            string decryptpwd;
            try
            {
                var encodepwd = new UTF8Encoding();
                var decode = encodepwd.GetDecoder();
                var todecodeByte = Convert.FromBase64String(encryptpwd);
                var charCount = decode.GetCharCount(todecodeByte, 0, todecodeByte.Length);
                var decodedChar = new char[charCount];
                decode.GetChars(todecodeByte, 0, todecodeByte.Length, decodedChar, 0);
                decryptpwd = new String(decodedChar);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return decryptpwd;
        }
        // Export Data into(csv) exel Sheet

     





    }
 
    public class CommonValidationsNew
    {

        public static string droplist = "Select";

        public static string BLACKCOLOR = "#000000";

        public static string Percenttage = "100%";

        public static string ADDMODE = "ADD";



        public static bool IsvalidDate(string Date)
        {
            DateTime tempDate;

            return DateTime.TryParse(Date, out tempDate) ? true : false;
        }







        public static string RemoveSpecialChars(string str)
        {
            if (str != "")
            {
                string[] chars = new string[] { ",", ".", "/", "!", "@", "#", "$", "%", "^", "&", "*", "'", "\"", ";", "_", "(", ")", ":", "|", "[", "]", "-", " - " };
                for (int i = 0; i < chars.Length; i++)
                {
                    if (str.Contains(chars[i]))
                    {
                        str = str.Replace(chars[i], "");
                    }
                }
                return str;
            }
            else
            {
                return "";
            }
        }






        public static string RemoveNonLettersAndNonDigitsAndWhiteSpacesFromString(string s)
        {

            string newresult = "";
            string finalstring = "";

            try
            {
                string d = s;

                string count = d;

                int l = count.IndexOf("-");

                if (l > 0)
                {

                    finalstring = count.Remove(l);


                }
                else
                {
                    finalstring = d;
                }


                foreach (char c in finalstring)
                {

                    if (char.IsLetterOrDigit(c) && (!char.IsWhiteSpace(c)))
                    {

                        newresult += c.ToString();

                    }

                }

            }

            catch { }

            return newresult;

        }

        public static string removedash(string s)
        {
            try
            {
                string d = RemoveNonLettersAndNonDigitsAndWhiteSpacesFromString(s);

                string count = d;

                int l = count.IndexOf("-");

                if (l > 0)
                {

                    string finalstring = count.Remove(l);

                    return finalstring;
                }
                else
                {
                    return d;
                }


            }
            catch (Exception ex)
            {
                throw ex;
            }

        }



        public static string convertdate(string snationalid)
        {
            try
            {
                string nid = RemoveNonLettersAndNonDigitsAndWhiteSpacesFromString(snationalid);


                if (nid != "")
                {

                    string month = nid.Substring(2, 2);
                    string day = nid.Substring(4, 2);
                    string year = nid.Remove(2);

                    string myDate = day + "/" + month + "/" + "19" + year;
                    return myDate;
                }
                else
                {
                    return "0";

                }


            }
            catch (Exception ex)
            {
                throw ex;
            }

        }








        public static DateTime GetSelectedDate(string drpdate)
        {
            DateTime Startdate = DateTime.Today;
            if (drpdate == "2011")
            {
                Startdate = DateTime.Parse("01/01/2011");
            }

            if (drpdate == "2012")
            {
                Startdate = DateTime.Parse("01/01/2012");
            }
            if (drpdate == "2013")
            {
                Startdate = DateTime.Parse("01/01/2013");
            }
            if (drpdate == "2014")
            {
                Startdate = DateTime.Parse("01/01/2014");
            }
            if (drpdate == "2015")
            {
                Startdate = DateTime.Parse("01/01/2015");
            }
            if (drpdate == "2016")
            {
                Startdate = DateTime.Parse("01/01/2016");
            }
            if (drpdate == "2017")
            {
                Startdate = DateTime.Parse("01/01/2017");
            }
            return Startdate;
        }



        //----------------------------------Uplode comman function-----------------------









        public static bool CheckSpace(string str)
        {
            // Use ToCharArray to convert string to array.
            char[] arrvalues = str.ToCharArray();
            if (arrvalues[0].ToString() == " ")
            {
                return false;

            }
            else
            {
                return true;
            }
        }

        public static bool CheckCategory(string str)
        {
            string[] stringArray = new string[] { "P", "C", "F", "E", "T", "S", "L", "I" };
            if (stringArray.Contains(str))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public static bool CheckRace(string str)
        {
            //18/04/16 : Adding A for Asian
            string[] stringArray = new string[] { "B", "I", "C", "W", "A" };
            if (stringArray.Contains(str))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static bool IsInt(string strNumber)
        {
            if (strNumber.Trim() != "" && strNumber != "&nbsp;")
            {
                try
                {
                    int i = int.Parse(strNumber.ToString());

                    return true;
                }
                catch
                {
                    return false;
                }
            }
            else
            {
                return true;
            }
        }

        public static bool Isfloat(string strNumber)
        {
            if (strNumber.Trim() != "" && strNumber != "&nbsp;")
            {
                try
                {
                    float i = float.Parse(strNumber.ToString());
                    return true;
                }
                catch
                {
                    return false;
                }
            }
            else
            {
                return true;
            }
        }
        public static decimal CountDecimalPlaces(decimal dec)
        {
            int[] bits = Decimal.GetBits(dec);
            int exponent = bits[3] >> 16;
            int result = exponent;
            long lowDecimal = bits[0] | (bits[1] >> 8);
            if (lowDecimal > 0)
            {
                while ((lowDecimal % 10) == 0)
                {
                    result--;
                    lowDecimal /= 10;
                }
            }

            return result;
        }
        public static bool IsfloatWith3Number(string strNumber)
        {
            if (strNumber.Trim() != "" && strNumber != "&nbsp;")
            {
                try
                {
                    float i = float.Parse(strNumber.ToString());
                    if (i > 999.99)
                    {
                        return false;
                    }
                    if (CountDecimalPlaces(Convert.ToDecimal(i)) > 2)
                    {
                        return false;
                    }
                    return true;
                }
                catch
                {
                    return false;
                }
            }
            else
            {
                return true;
            }
        }
        public static bool IsfloatWithNumber(string strNumber)
        {
            if (strNumber.Trim() != "" && strNumber != "&nbsp;")
            {
                try
                {
                    float i = float.Parse(strNumber.ToString());
                    if (i > 99999999999.99)
                    {
                        return false;
                    }
                    if (CountDecimalPlaces(Convert.ToDecimal(i)) > 2)
                    {
                        return false;
                    }
                    return true;
                }
                catch
                {
                    return false;
                }
            }
            else
            {
                return true;
            }
        }


        public static bool IsGender(string strGender)
        {
            try
            {
                string Gender = strGender.ToUpper().Trim().ToString();
                if (Gender == "M" || Gender == "F")
                    return true;
                else
                    return false;
            }
            catch
            {
                return false;
            }
        }

        public static bool IsYesNo(string letter)
        {
            try
            {
                string strletter = letter.ToUpper().Trim().ToString();
                if (strletter == "" || strletter == "YES" || strletter == "NO" || strletter == "Y" || strletter == "N")
                    return true;
                else
                    return false;
            }
            catch
            {
                return false;
            }
        }

        public static bool IsSupport(string strGender)
        {
            try
            {
                string Gender = strGender.ToUpper().Trim().ToString();
                if (Gender == "SUPPORT" || Gender == "CORE")
                    return true;
                else
                    return false;
            }
            catch
            {
                return false;
            }
        }



        public static bool IsRace(string strRace)
        {
            try
            {
                //Indian, White, Black, Coloured and Asian
                string Race = strRace.ToUpper().Trim().ToString();
                if (Race == "INDIAN" || Race == "WHITE" || Race == "BLACK" || Race == "COLOURED" || Race == "ASIAN" || Race == "AFRICAN")
                    return true;
                else
                    return false;
            }
            catch
            {
                return false;
            }
        }





        public static int CalculateAge(DateTime birthDate)
        {
            try
            {
                DateTime now = DateTime.Today;
                int years = now.Year - birthDate.Year;
                if
                (now.Month < birthDate.Month || (now.Month == birthDate.Month && now.Day < birthDate.Day))

                    --years;

                return years;

            }
            catch (Exception)
            {
                return 0;
            }
        }


        public static bool IsDate(string strNumber)
        {
            try
            {
                IFormatProvider culture = new CultureInfo("fr-FR", true);
                DateTime dt = DateTime.ParseExact(strNumber.ToString(), "dd/MM/yyyy", culture);

                return true;
            }
            catch
            {
                return false;
            }
        }
        public static bool IsUnionMember(string strGender)
        {
            try
            {

                if (strGender.ToUpper().Trim().ToString() == "YES" || strGender.ToUpper().Trim().ToString() == "NO")
                    return true;
                else
                    return false;
            }
            catch
            {
                return false;
            }
        }

        public static bool IsAlphabetic(string strToCheck)
        {


            strToCheck = strToCheck.Trim();
            foreach (int chr in strToCheck)
                if ((chr < 0x41 || chr > 0x5A && chr < 0x61 || chr > 0x7A) && chr != 32 && chr != 39) return false;

            return true;

        }



        public static bool IsAlphaNum(string str)
        {
            if (string.IsNullOrEmpty(str))
                return false;

            for (int i = 0; i < str.Length; i++)
            {
                if ((char.IsLetter(str[i])))
                    return false;
            }

            return true;
        }


        public static bool IsAlphaNum2(string str)
        {


            for (int i = 0; i < str.Length; i++)
            {
                if ((char.IsLetter(str[i])))
                    return false;
            }

            return true;
        }




        public static Boolean isAlphaNumeric(string strToCheck)
        {
            System.Text.RegularExpressions.Regex rg = new System.Text.RegularExpressions.Regex(@"^[a-zA-Z0-9\s,]*$");
            return rg.IsMatch(strToCheck);// == false ? true : false;
        }





        //---------------------------------------end-----------------------------------









        static bool ValidateDate(String date, String format)
        {
            try
            {
                System.Globalization.DateTimeFormatInfo dtfi = new System.Globalization.DateTimeFormatInfo();
                dtfi.ShortDatePattern = format;
                DateTime dt = DateTime.ParseExact(date, "d", dtfi);
            }
            catch (Exception)
            {
                Console.WriteLine("Ooops: Date entered [" + date + "] is in wrong format");
                return false;
            }
            return true;
        }

        internal static void sum(string p, string p_2, string p_3, string p_4, string p_5, string p_6, string p_7)
        {
            throw new NotImplementedException();
        }



        public static string GetEmployeeNos(int iCompanyId)
        {
            string sEmployeeNo;
            sEmployeeNo = "SELECT * FROM [UploadEmployeeNoDetails] WHERE CompanyId=" + iCompanyId.ToString();

            DataTable dt = new DataTable();
            string sRecords = string.Empty;

            if ((dt != null) && (dt.Rows.Count > 0))
            {
                sRecords = dt.Rows[0]["EmployeeNo"].ToString();
            }

            return sRecords;


        }

        public static DataTable RemoveDuplicateRows(DataTable dTable, string colName)
        {
            Hashtable hTable = new Hashtable();
            ArrayList duplicateList = new ArrayList();

            foreach (DataRow drow in dTable.Rows)
            {
                if (hTable.Contains(drow[colName]))
                    duplicateList.Add(drow);
                else
                    hTable.Add(drow[colName], string.Empty);
            }

            foreach (DataRow dRow in duplicateList)
                dTable.Rows.Remove(dRow);

            return dTable;
        }
        //-------------------Cryptography function--------------




        //----------- Sir Function Cryptography----------














        public class CommonFunction
        {
            public static string DMSDirectoryPath = ConfigurationManager.AppSettings["DMSDirectoryPath"];
            public static string InsertMsg = ConfigurationManager.AppSettings["dataSaved"];
            public static string UpdateMsg = ConfigurationManager.AppSettings["dataUpdated"];
            public static string DeleteMsg = ConfigurationManager.AppSettings["deleteData"];
            public static string AlreadyExistMsg = ConfigurationManager.AppSettings["redundantData"];
            public static string InvalidUsiMsg = ConfigurationManager.AppSettings["invalidUSI"];
            public static string EmptyDisplayMsg = ConfigurationManager.AppSettings["emptyDisplay"];
            public static string UnavailableDocNoMsg = ConfigurationManager.AppSettings["unavailableDocNo"];
            public static string AmendmentNomsg = ConfigurationManager.AppSettings["AmendmentNo"];
            public static string EmptyFields = ConfigurationManager.AppSettings["emptyFields"];
            //Constants 

            //http://www.xiirus.net/articles/article-_net-convert-datetime-from-one-timezone-to-another-7e44y.aspx
            public static DateTime GetSADateTime()
            {
                TimeZoneInfo timeZoneInfo;
                DateTime dtSATime;
                //Set the time zone information to US Mountain Standard Time 
                timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("South Africa Standard Time");
                //Get date and time in US Mountain Standard Time 
                dtSATime = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);
                return dtSATime;
            }

            public static string GetSiteRootUrl()
            {
                string protocol;

                if (HttpContext.Current.Request.IsSecureConnection)
                    protocol = "https";
                else
                    protocol = "http";

                StringBuilder uri = new StringBuilder(protocol + "://");

                string hostname = HttpContext.Current.Request.Url.Host;

                uri.Append(hostname);

                int port = HttpContext.Current.Request.Url.Port;

                if (port != 80 && port != 443)
                {
                    uri.Append(":");
                    uri.Append(port.ToString());
                }

                return uri.ToString();
            }
            public static string SplitString(string strPoNo)
            {
                try
                {
                    var strBuildPoNo = new StringBuilder();
                    var words = strPoNo.Split('/', '-');
                    foreach (var word in words)
                    {
                        strBuildPoNo.Append(word);
                    }

                    return Convert.ToString(strBuildPoNo);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

            public static string GetOperatorDate(int dataOperator)
            {
                string returnoperator = null;
                if (dataOperator == 1)
                { returnoperator = "> "; }
                else if (dataOperator == 2)
                { returnoperator = "< "; }
                else if (dataOperator == 3)
                { returnoperator = "= "; }
                else if (dataOperator == 4)
                { returnoperator = "BETWEEN"; }
                return returnoperator;
            }


            public static string GetDocFullNo(string projectCode, int usiNo, string docType, int docNo)
            {
                const string fmt = "0000.##";
                var docFullNo = new StringBuilder(projectCode);
                docFullNo.Append("/").Append(usiNo.ToString(CultureInfo.InvariantCulture)).Append("/").Append(docType).Append("/").Append(docNo.ToString(fmt));
                return docFullNo.ToString();
            }

            //Function will return Directory of Perticular Document Type
            public static string GetDirectory(String mouduleName)
            {
                var docDirectory = new StringBuilder(DMSDirectoryPath);

                return docDirectory.Append(mouduleName).Append("\\\\").ToString();
            }


            //Function returns Operator Symbol for comparisons in SearchQuery
            public static string GetOperator(int dataOperator)
            {
                string returnoperator = null;
                if (dataOperator == 1)
                { returnoperator = "LIKE "; }
                else if (dataOperator == 2)
                { returnoperator = "> "; }
                else if (dataOperator == 3)
                { returnoperator = "< "; }
                else if (dataOperator == 4)
                { returnoperator = "= "; }
                return returnoperator;
            }

            //Function will return GridView Object 

            public static string invokeMsgBox(string bodyMsg)           //returns the string for drawing the popup message box
            {

                const string msgButtonClass = "btn-info";
                var msgbox = new MessageBox(HttpContext.Current.Server.MapPath("~/Css/msgbox.tpl"));

                msgbox.SetTitle("DMS - Alert");

                msgbox.SetIcon("msg_icon_1.png");
                msgbox.SetMessage(bodyMsg);
                msgbox.SetOKButton(msgButtonClass);
                return msgbox.ReturnObject();
            }

            public static string getErrorMsgString(string moduleName, string action)        // returns the string containing the given ModuleName and action performed to be set at bodyMsg of the popup MessageBox
            {




                var errorMsgString = new StringBuilder(moduleName);
                errorMsgString.Append(" ").Append(action);
                return errorMsgString.ToString();
            }




            public static void printSearch(DataTable dt)
            {
                try
                {

                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }





            public static HtmlTable getSearchTable(DataTable dt, HtmlTable table)
            {
                try
                {
                    var rowHeader = new HtmlTableRow();
                    rowHeader.Style.Add("font-weight", "bold");
                    for (var i = 0; i < dt.Columns.Count; i++)
                    {
                        var cell = new HtmlTableCell { InnerText = dt.Columns[i].ColumnName };
                        rowHeader.Cells.Add(cell);
                    }
                    table.Rows.Add(rowHeader);
                    table.Style.Add("font-size", "x-small");
                    for (var i = 0; i < dt.Rows.Count; i++)
                    {
                        var rowData = new HtmlTableRow();
                        for (var j = 0; j < dt.Columns.Count; j++)
                        {
                            var cell = new HtmlTableCell { InnerText = dt.Rows[i][j].ToString() };
                            rowData.Cells.Add(cell);
                        }
                        table.Rows.Add(rowData);
                    }
                    return table;
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
            //-----------  Function Cryptography Passsword----------
            public static string Encryptdata(string password)
            {
                var encode = Encoding.UTF8.GetBytes(password);
                var strmsg = Convert.ToBase64String(encode);
                return strmsg;
            }


            public static string Decryptdata(string encryptpwd)
            {
                string decryptpwd;
                try
                {
                    var encodepwd = new UTF8Encoding();
                    var decode = encodepwd.GetDecoder();
                    var todecodeByte = Convert.FromBase64String(encryptpwd);
                    var charCount = decode.GetCharCount(todecodeByte, 0, todecodeByte.Length);
                    var decodedChar = new char[charCount];
                    decode.GetChars(todecodeByte, 0, todecodeByte.Length, decodedChar, 0);
                    decryptpwd = new String(decodedChar);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                return decryptpwd;
            }
            // Export Data into(csv) exel Sheet

            public static void ExportToCSVFile(string filename, DataTable dt)
            {
                HttpContext context = HttpContext.Current;
                context.Response.Clear();
                foreach (DataColumn column in dt.Columns)
                {
                    context.Response.Write(column.ColumnName + ",");
                }
                context.Response.Write(Environment.NewLine);
                foreach (DataRow row in dt.Rows)
                {
                    for (var i = 0; i < dt.Columns.Count; i++)
                    {
                        context.Response.Write(row[i].ToString().Replace(",", string.Empty) + ",");
                    }
                    context.Response.Write(Environment.NewLine);
                }
                context.Response.ContentType = "text/csv";
                context.Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename + ".csv");
                context.Response.End();
            }





        }





    }



    public static class CONVERT
    {
        public static string ToComma(string s)
        {
            double d = Convert.ToDouble(s);
            string str ="";
            str= d.ToString("#,#", CultureInfo.InvariantCulture);
            return str;
            //string str = String.Format("{0:0,0}", s);
            //return str;
            /*double d = Convert.ToDouble(s);
            string str = d.ToString("N", new CultureInfo("af-ZA"));
            int c = str.IndexOf('.');
            string ss = str.Remove(c, 3);
            return ss;*/

        }
        
    }
   
  



    
   

   


    
}
