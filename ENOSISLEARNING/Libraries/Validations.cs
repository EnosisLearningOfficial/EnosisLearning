using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.Data;
using System.Web.UI.WebControls;
using System.Globalization;

namespace ENOSISLEARNING.Libraries
{

    public class CommonValidations
    {
        // public static string sConnStr = System.Configuration.ConfigurationManager.ConnectionStrings["Employment_SQL"].ToString();

        public static string droplist = "Select";

        public static string BLACKCOLOR = "#000000";

        public static string Percenttage = "100%";

        public static string ADDMODE = "ADD";



        public static bool IsvalidDate(string Date)
        {
            DateTime tempDate;

            return DateTime.TryParse(Date, out tempDate) ? true : false;
        }



        //public static string Racecolor()
        //{
        //    foreach (Series charts in Chart2.Series)
        //    {
        //        foreach (DataPoint point in charts.Points)
        //        {
        //            switch (point.AxisLabel)
        //            {
        //                case "AFRICAN": point.Color = Color.Red; break;
        //                case "COLOURED": point.Color = Color.Green; break;
        //                case "INDIAN": point.Color = Color.Orange; break;
        //                case "WHITE": point.Color = Color.Blue; break;
        //            }
        //            point.Label = string.Format("{0:0} - {1}", point.YValues[0], point.AxisLabel);

        //        }
        //    }  

        //}




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



        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2200:RethrowToPreserveStackDetails")]
        public static string convertdate(string snationalid)
        {
            try
            {
                string nid = RemoveNonLettersAndNonDigitsAndWhiteSpacesFromString(snationalid);


                if (nid != "")
                {
                    //string nid = snationalid.Remove(6).Trim();

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
                //if (strNumber.Trim() != "" && strNumber != "&nbsp;")
                //{
                DateTime now = DateTime.Today;
                int years = now.Year - birthDate.Year;
                if
                (now.Month < birthDate.Month || (now.Month == birthDate.Month && now.Day < birthDate.Day))

                    --years;

                return years;
                //}
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

                //DateTime dt = DateTime.Parse(strNumber.ToString(),"dd/mm/yyyy");
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


        //public static bool isAlphaNumeric(string strToCheck)
        //{
        //    Regex rg = new Regex("[^a-zA-Z0-9@$#&*]");


        //    if (rg.IsMatch(strToCheck))
        //    {
        //        return false;
        //    }
        //    else
        //    {
        //        return true;
        //    }
        //}


        public static Boolean isAlphaNumeric(string strToCheck)
        {
            //Regex rg = new Regex("[^a-zA-Z0-9]");
            System.Text.RegularExpressions.Regex rg = new System.Text.RegularExpressions.Regex(@"^[a-zA-Z0-9\s,]*$");
            //    //if has non AlpahNumeric char, return false, else return true.
            return rg.IsMatch(strToCheck);// == false ? true : false;
        }

        //public static Boolean isAlphaNumeric(string strToCheck)
        //{
        //    Regex rg = new Regex(@"^[a-zA-Z0-9\s,]*$");
        //    return rg.IsMatch(strToCheck);
        //}

        /*public static Boolean isAlphaNumeric(string strToCheck)
        {
            //Regex rg = new Regex("[^a-zA-Z0-9]");
            System.Text.RegularExpressions.Regex rg = new System.Text.RegularExpressions.Regex(@"^[a-zA-Z0-9\s,]*$");
        //    //if has non AlpahNumeric char, return false, else return true.
            return rg.IsMatch(strToCheck) == false ? true : false;
        }*/



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

            // DataUploadBL objBL = new DataUploadBL();
            DataTable dt = new DataTable();
            //dt = objBL.GetEmployeeNos(sEmployeeNo.ToString());
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


        //public static string Encrypt1(string sData)
        //{
        //    try
        //    {
        //        byte[] encData_byte = new byte[sData.Length];

        //        encData_byte = System.Text.Encoding.UTF8.GetBytes(sData);

        //        string encodedData = Convert.ToBase64String(encData_byte);

        //        return encodedData;

        //    }
        //    catch (Exception ex)
        //    {
        //        throw new Exception("Error in base64Encode" + ex.Message);
        //    }
        //}


        //public static string Decrypt1(string sData)
        //{

        //    System.Text.UTF8Encoding encoder = new System.Text.UTF8Encoding();

        //    System.Text.Decoder utf8Decode = encoder.GetDecoder();

        //    byte[] todecode_byte = Convert.FromBase64String(sData);

        //    int charCount = utf8Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);

        //    char[] decoded_char = new char[charCount];

        //    utf8Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);

        //    string result = new String(decoded_char);

        //    return result;

        //}

        //----------- Sir Function Cryptography----------







        public class Ddl
        {

            public Ddl()
            {

            }

            public static void RemoveDuplicateItems(DropDownList ddl)
            {

                for (int i = 0; i < ddl.Items.Count; i++)
                {

                    ddl.SelectedIndex = i;

                    string year = ddl.SelectedItem.ToString();

                    for (int counter = i + 1; counter < ddl.Items.Count; counter++)
                    {

                        ddl.SelectedIndex = counter;

                        string compareYear = ddl.SelectedItem.ToString();

                        if (year == compareYear)
                        {

                            ddl.Items.RemoveAt(counter);

                            counter = counter - 1;

                        }
                    }

                }

            }


        }




    }
}