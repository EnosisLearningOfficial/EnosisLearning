using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI;


namespace ENOSISLEARNING
{
    public class dbconnect
    {
        public static SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString());

        String strCon = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString();

        public static bool ExecuteQuery(string QUERY)
        {

            try
            {
                SqlCommand scomm = new SqlCommand(QUERY, con);
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }
                scomm.ExecuteNonQuery();
                
                return true;
            }
            catch (Exception ex)
            {
                string Path = System.Web.HttpContext.Current.Request.Url.AbsolutePath;
                System.IO.FileInfo Info = new System.IO.FileInfo(Path);
                string pageName = Info.Name;
                LogError(pageName, ex.Message, QUERY);
                return false;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }
            }
        }
        public static bool ExecuteStoredProcedure(string procedurename, List<SqlParameter> lstparameters)
        {

            try
            {
                SqlCommand scomm = new SqlCommand(procedurename, con);
                scomm.CommandType = CommandType.StoredProcedure;
                foreach (SqlParameter _param in lstparameters)
                {
                    scomm.Parameters.Add(_param);
                }
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }
                scomm.ExecuteNonQuery();
                
                return true;
            }
            catch (Exception ex)
            {
                string Path = System.Web.HttpContext.Current.Request.Url.AbsolutePath;
                System.IO.FileInfo Info = new System.IO.FileInfo(Path);
                string pageName = Info.Name;
                LogError(pageName, ex.Message, procedurename);
                return false;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }

            }
        }
        public static DataTable GetDataSet(string QUERY)
        {
            DataTable dt = new DataTable();
            try
            {
                SqlDataAdapter adap = new SqlDataAdapter(QUERY, con);
                adap.Fill(dt);
            }
            catch(Exception ex)
            {
                string Path = System.Web.HttpContext.Current.Request.Url.AbsolutePath;
                System.IO.FileInfo Info = new System.IO.FileInfo(Path);
                string pageName = Info.Name;
                LogError(pageName, ex.Message, QUERY);

            }
            return dt;
        }

        public static int ExecuteScalerQuery(string QUERY)
        {
            int iValue = 0;
            try
            {
                SqlCommand scomm = new SqlCommand(QUERY, con);
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }
                //con.Open();
                iValue = Convert.ToInt32(scomm.ExecuteScalar().ToString());
               // scomm.ExecuteNonQuery();
               
                
                return iValue;
            }
            catch (Exception ex)
            {
                string Path = System.Web.HttpContext.Current.Request.Url.AbsolutePath;
                System.IO.FileInfo Info = new System.IO.FileInfo(Path);
                string pageName = Info.Name;
                LogError(pageName, ex.Message, QUERY);
                return iValue;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }
            }
        }


        public static void LogError(string pagename, Exception ex1)
        {

            try
            {
                var st = new System.Diagnostics.StackTrace(ex1, true);
                var frame = st.GetFrame(st.FrameCount - 1);
                var linenumber = frame.GetFileLineNumber();

                string msg = "LINE = " + linenumber + ex1.Message;

                string QUERY = "INSERT INTO EXCEPTIONLOGS(EXCEPTIONDATE,URLNAME,EXCEPTIONMESSAGE) VALUES(GETDATE(),'" + pagename + "','" + msg + "')";
                SqlCommand scomm = new SqlCommand(QUERY, con);
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }
                scomm.ExecuteNonQuery();
                //con.Close();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }
            }

        }
        public static void LogError(string pagename, string errormessage)
        {

            try
            {
                string QUERY = "INSERT INTO EXCEPTIONLOGS(EXCEPTIONDATE,URLNAME,EXCEPTIONMESSAGE) VALUES(GETDATE(),'" + pagename + "','" + errormessage + "')";
                SqlCommand scomm = new SqlCommand(QUERY, con);
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }
                scomm.ExecuteNonQuery();
                //con.Close();
            }
            catch(Exception ex)
            {

            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }
            }

        }
        public static void LogError(string pagename, string errormessage,string query)
        {
            try
            {
                string newquery = query.Replace("'", "''");


                string QUERY = "INSERT INTO EXCEPTIONLOGS(EXCEPTIONDATE,URLNAME,EXCEPTIONMESSAGE,QUERY_DATA) VALUES(GETDATE(),'" + pagename + "','" + errormessage + "','" + newquery + "')";
                SqlCommand scomm = new SqlCommand(QUERY, con);
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }
                scomm.ExecuteNonQuery();
               // con.Close();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }
            }


        }
        public int CheckEmail(string strEmail, string Type)
        {
            int Id = 0;
            try
            {

                string QUERY = "SELECT CANDIDATE_CODE FROM CANDIDATES WHERE CAN_TYPE='" + Type + "' AND EMAIL='" + strEmail + "'";
                SqlCommand scomm = new SqlCommand(QUERY, con);
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }
               // con.Open();
                object obj = scomm.ExecuteScalar();
                if (obj != null)
                {
                    Id = Convert.ToInt32(obj);
                }

            }
            catch (Exception ex)
            {
                throw ex;
                //lblError.Text = ex.Message.ToString();
            }
            finally
            {
                
                    if (con.State != System.Data.ConnectionState.Closed)
                    {
                        con.Close();
                    }
                
            }
            return Id;
        }
        public int CheckEmail(string strEmail)
        {
            int Id = 0;
            try
            {

                string QUERY = "SELECT CANDIDATE_CODE FROM CANDIDATES WHERE EMAIL='" + strEmail + "'";
                SqlCommand scomm = new SqlCommand(QUERY, con);
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }
                object obj = scomm.ExecuteScalar();
                if (obj != null)
                {
                    Id = Convert.ToInt32(obj);
                }

            }
            catch (Exception ex)
            {
                throw ex;
                //lblError.Text = ex.Message.ToString();
            }
            finally
            {

                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }
            }
            return Id;
        }
        public int GetCandidateId()
        {
            try
            {
                int Id = 0;
                string QUERY = "SELECT max(CANDIDATE_CODE) FROM CANDIDATES";
                SqlCommand scomm = new SqlCommand(QUERY, con);
                //con.Open();
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }
                Id = Convert.ToInt32(scomm.ExecuteScalar().ToString());
               // con.Close();
                Id = Id + 1;
                return Id;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }

            }
        }

        public DataTable coursedetails()
        {
            SqlCommand scmd = new SqlCommand("sp_coursedetails", con);
            scmd.CommandType = CommandType.StoredProcedure;
            scmd.Parameters.AddWithValue("@action", "quespaper");
            SqlDataAdapter sda = new SqlDataAdapter(scmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            return dt;
        }
        public bool sendmail(string strSMTP, string strUserName, string strPassword, string emailid, string subject, string body, FileUpload fattach)
        {
            bool result = false;

            using (MailMessage mm = new MailMessage())
            {

                // ToEmail.Text = Session["TOEMAIL"].ToString();
                //  mm.To.Add(new MailAddress(Session["TOEMAIL"].ToString()));
                mm.To.Add(emailid);
                mm.Subject = subject;
                mm.Body = body;
                if (fattach.HasFile)
                {
                    string FileName = Path.GetFileName(fattach.FileName);
                    mm.Attachments.Add(new Attachment(fattach.PostedFile.InputStream, FileName));
                }
                mm.IsBodyHtml = false;


                NetworkCredential loginInfo = new NetworkCredential(strUserName, strPassword);
                SmtpClient client = new SmtpClient(strSMTP);
                //client.Port = 587;
                //client.Port = 465;
                client.EnableSsl = true; //commented for thrifty
                client.UseDefaultCredentials = false;
                client.Credentials = loginInfo;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.Send(mm);
                //smtp.Send(mm);
                result = true;

            }
            return result;
        }

        public DataTable moderatorcoursedetails(string name)
        {
            SqlCommand scmd = new SqlCommand("sp_coursedetails", con);
            scmd.CommandType = CommandType.StoredProcedure;
            scmd.Parameters.AddWithValue("@action", "moderator");
            scmd.Parameters.AddWithValue("@mname", name);
            SqlDataAdapter sda = new SqlDataAdapter(scmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            return dt;
        }
        public int insertquestiondetails(string ques, string ans, string course, int questype)
        {
            try
            {
                SqlCommand scmd = new SqlCommand("sp_questiondetails", con);
                scmd.Parameters.AddWithValue("@ques", ques);
                scmd.Parameters.AddWithValue("@ans", ans);
                scmd.Parameters.AddWithValue("@course", course);
                scmd.Parameters.AddWithValue("@questype", questype);
                scmd.Parameters.AddWithValue("@action", "insert");
                scmd.CommandType = CommandType.StoredProcedure;
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }
                //con.Open();
                int c = scmd.ExecuteNonQuery();
               // con.Close();
                return c;
            }
            catch(Exception ex)
            {
                throw ex;

            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }

            }
        }
        public int updatestatus(int candid, string file, string course)
        {
            try
            {
                SqlCommand scmd = new SqlCommand("insert into certificate values(@candid,@certificate,@course,@creationtime) ", con);
                scmd.Parameters.AddWithValue("@certificate", file);
                scmd.Parameters.AddWithValue("@candid", candid);
                scmd.Parameters.AddWithValue("@course", course);
                scmd.Parameters.AddWithValue("@creationtime", DateTime.Now);
                scmd.CommandType = CommandType.Text;
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }

                int c = scmd.ExecuteNonQuery();
               // con.Close();
                return c;
            }
            catch(Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }
            }
        }
        public DataTable fetchdetails(int regid)
        {
            try
            {
                SqlCommand scmd = new SqlCommand("select c.candidate_code,c.Fullname,c.gender,c.dob,c.mobileno,c.email,cd.coursename,q.name,cd.fees,c.yearsexperience,c.monthsexperience,cd.courseid from candidates c inner join COURSES_DETAIL cd on c.courseid=cd.courseid inner join qualification q on q.id=c.qualification where c.candidate_code=@regid ", con);
                scmd.Parameters.AddWithValue("@regid", regid);

                scmd.CommandType = CommandType.Text;
                SqlDataAdapter sda = new SqlDataAdapter(scmd);
                DataTable dt = new DataTable();
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }
                sda.Fill(dt);
               // con.Close();
                return dt;
            }

            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }
            }
        }
        public DataTable feesdetails(int regid)
        {
            try
            {
                SqlCommand scmd = new SqlCommand("select * from CANDIDATE_FEESDETAIL where candidateid=@regid and status=@status", con);
                scmd.Parameters.AddWithValue("@regid", regid);
                scmd.Parameters.AddWithValue("@status", "PAID");
                scmd.CommandType = CommandType.Text;
                SqlDataAdapter sda = new SqlDataAdapter(scmd);
                DataTable dt = new DataTable();
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }
                sda.Fill(dt);
                //con.Close();
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }
            }
        }
        public int updateRegistrationStatus(string name, string file)
        {
            try
            {
                SqlCommand scmd = new SqlCommand("update Candidates set  Registration_status=@status where FullName=@name ", con);
                scmd.Parameters.AddWithValue("@status", file);
                scmd.Parameters.AddWithValue("@name", name);

                scmd.CommandType = CommandType.Text;
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }

                int c = scmd.ExecuteNonQuery();
             //   con.Close();
                return c;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }
            }
        }
        public DataTable selectcertificatestatus(int candid)
        {
            DataTable dt = new DataTable();
            try
            {
                SqlCommand scmd = null;
                if (candid.ToString() != "0")
                {
                    scmd = new SqlCommand("select cert_id,CANDIDATE_CODE,FULLNAME,GENDER,DOB,MOBILENO,EMAIL,certificate,course,creation_date from candidates c inner join certificate ct on c.CANDIDATE_CODE=ct.candidate_id where candidate_id=@candid ", con);
                    scmd.Parameters.AddWithValue("@candid", candid);
                }
                else
                {
                    scmd = new SqlCommand("select cert_id,CANDIDATE_CODE,FULLNAME,GENDER,DOB,MOBILENO,EMAIL,certificate,course,creation_date from candidates c inner join certificate ct on c.CANDIDATE_CODE=ct.candidate_id", con);
                }



                scmd.CommandType = CommandType.Text;
                SqlDataAdapter sda = new SqlDataAdapter(scmd);


                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }

                sda.Fill(dt);
                //con.Close();

            }
            catch (Exception)
            {

            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }

            }
            return dt;

        }
        public string selectRegistrationStatus(int candid)
        {
            try
            {
                SqlCommand scmd = new SqlCommand("Select Registration_status from  Candidates where CANDIDATE_CODE=@candid ", con);

                scmd.Parameters.AddWithValue("@candid", candid);

                scmd.CommandType = CommandType.Text;
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }

                string c = (string)scmd.ExecuteScalar();
             //   con.Close();
                return c;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }

            }
        }

        public DataTable getcount()
        {
            using (SqlCommand scmd = new SqlCommand("sp_dashboardcount", con))
            {
                scmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter sda = new SqlDataAdapter(scmd);
                DataTable dt = new DataTable();

                con.Open();
                sda.Fill(dt);
                con.Close();
                return dt;
            }
        }
        public int updatequestiondetails(string ques, string ans, string course, int id, string questype)
        {
            try
            {
                SqlCommand scmd = new SqlCommand("sp_questiondetails", con);
                scmd.Parameters.AddWithValue("@qid", id);
                scmd.Parameters.AddWithValue("@ques", ques);
                scmd.Parameters.AddWithValue("@ans", ans);
                scmd.Parameters.AddWithValue("@course", course);
                scmd.Parameters.AddWithValue("@questype", questype);
                scmd.Parameters.AddWithValue("@action", "Updatedetails");
                scmd.CommandType = CommandType.StoredProcedure;
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }

                int c = scmd.ExecuteNonQuery();
               // con.Close();
                return c;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }

            }
        }
        public int deletequestiondetails(int id)
        {
            try
            {
                SqlCommand scmd = new SqlCommand("sp_questiondetails", con);
                scmd.Parameters.AddWithValue("@qid", id);

                scmd.Parameters.AddWithValue("@action", "deletedetails");
                scmd.CommandType = CommandType.StoredProcedure;
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }

                int c = scmd.ExecuteNonQuery();
             //   con.Close();
                return c;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }

            }
        }
        public DataTable quesdetails(string action, string course)
        {
            SqlCommand scmd = new SqlCommand("sp_questiondetails", con);
            scmd.Parameters.AddWithValue("@action", action);
            scmd.Parameters.AddWithValue("@course", course);
            scmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sda = new SqlDataAdapter(scmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            return dt;
        }
        public int shiftintervieeques(string course)
        {
            try
            {
                SqlCommand scmd = new SqlCommand("sp_questiondetails", con);
                scmd.Parameters.AddWithValue("@action", "move");
                scmd.Parameters.AddWithValue("@course", course);
                scmd.CommandType = CommandType.StoredProcedure;
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }

                int i = scmd.ExecuteNonQuery();
             //   con.Close();
                return i;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }

            }
        }
        public int deleteintervieeques(string course)
        {
            try
            {
                SqlCommand scmd = new SqlCommand("sp_questiondetails", con);
                scmd.Parameters.AddWithValue("@action", "delete");
                scmd.Parameters.AddWithValue("@course", course);
                scmd.CommandType = CommandType.StoredProcedure;
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }

                int i = scmd.ExecuteNonQuery();
                //con.Close();
                return i;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }

            }
        }
        public int updateststatus(string ques, string ans, int status, string course)
        {
            try
            {
                SqlCommand scmd = new SqlCommand("sp_questiondetails", con);
                scmd.Parameters.AddWithValue("@ques", ques);
                scmd.Parameters.AddWithValue("@ans", ans);
                scmd.Parameters.AddWithValue("@status", status);
                scmd.Parameters.AddWithValue("@course", course);
                scmd.Parameters.AddWithValue("@action", "Updatestatus");
                scmd.CommandType = CommandType.StoredProcedure;
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }

                int c = scmd.ExecuteNonQuery();
             //   con.Close();
                return c;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }

            }
        }
        public int updateallstatus(int status, string course)
        {
            try
            {
                SqlCommand scmd = new SqlCommand("sp_questiondetails", con);

                scmd.Parameters.AddWithValue("@status", status);
                scmd.Parameters.AddWithValue("@course", course);
                scmd.Parameters.AddWithValue("@action", "Updateallstatus");
                scmd.CommandType = CommandType.StoredProcedure;
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                };
                int c = scmd.ExecuteNonQuery();
                //con.Close();
                return c;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }

            }


        }
        public DataTable getmoderatordetails(string uname, string pass)
        {
            try
            {
                SqlCommand scmd = new SqlCommand("sp_getmoderatordetails", con);
                scmd.Parameters.AddWithValue("@uname", uname);
                scmd.Parameters.AddWithValue("@pass", pass);
                scmd.Parameters.AddWithValue("@action", "getdetails");
                scmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter sda = new SqlDataAdapter(scmd);
                DataTable dt = new DataTable();
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }

                sda.Fill(dt);
              //  con.Close();

                return dt;

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }

            }

        }
        public DataTable getQuestionPageWise(int pageIndex, int PageSize, out int recordCount, string course)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("GetQuestionPageWise", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PageIndex", pageIndex);
                cmd.Parameters.AddWithValue("@PageSize", PageSize);
                cmd.Parameters.AddWithValue("@course", course);
                cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
                cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }
                sda.Fill(dt);
                recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
             //   con.Close();
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }

            }
        }
        public int postques(string ques, string course, string email, int questype)
        {
            try
            {
                SqlCommand scmd = new SqlCommand("sp_PostQuestion", con);
                scmd.Parameters.AddWithValue("@ques", ques);

                scmd.Parameters.AddWithValue("@course", course);
                scmd.Parameters.AddWithValue("@email", email);
                scmd.Parameters.AddWithValue("@questype", questype);
                scmd.Parameters.AddWithValue("@action", "insert");
                scmd.CommandType = CommandType.StoredProcedure;
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }

                int c = scmd.ExecuteNonQuery();
                con.Close();
                return c;
            }

            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }

            }

        }
        public DataTable postedquesdetail(int pageIndex, int PageSize, string course, out int recordCount)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("[GetPostQuestionPageWise]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PageIndex", pageIndex);
                cmd.Parameters.AddWithValue("@PageSize", PageSize);
                cmd.Parameters.AddWithValue("@course", course);
                cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
                cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }
              //  con.Open();
                sda.Fill(dt);
                recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
            //   con.Close();
                return dt;
            }
            catch(Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }

            }

        }
        public DataTable postedquesdetails(string course)
        {
            try
            {
                SqlCommand scmd = new SqlCommand("sp_PostQuestion", con);
                scmd.Parameters.AddWithValue("@course", course);
                scmd.Parameters.AddWithValue("@action", "select");
                scmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter sda = new SqlDataAdapter(scmd);
                DataTable dt = new DataTable();
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }

                sda.Fill(dt);
             //   con.Close();
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }

            }
        }
        public DataTable getmoderatoremail(string course)
        {
            try
            {
                SqlCommand scmd = new SqlCommand("sp_PostQuestion", con);
                scmd.Parameters.AddWithValue("@course", course);
                scmd.Parameters.AddWithValue("@action", "email");
                scmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter sda = new SqlDataAdapter(scmd);
                DataTable dt = new DataTable();
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }

                sda.Fill(dt);
             //   con.Close();
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }

            }

        }
        public DataTable getemail(string course, string ques)
        {
            try
            {
                SqlCommand scmd = new SqlCommand("sp_PostQuestion", con);
                scmd.Parameters.AddWithValue("@course", course);
                scmd.Parameters.AddWithValue("@ques", ques);
                scmd.Parameters.AddWithValue("@action", "postemail");
                scmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter sda = new SqlDataAdapter(scmd);
                DataTable dt = new DataTable();
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }

                sda.Fill(dt);
             //   con.Close();
                return dt;
            }

            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }

            }

        }
        public int insertpostedquesdetails(string ques, string ans, string course, int postid, int questype)
        {
            try
            {


                SqlCommand scmd = new SqlCommand("sp_PostQuestion", con);
                scmd.Parameters.AddWithValue("@ques", ques);
                scmd.Parameters.AddWithValue("@ans", ans);
                scmd.Parameters.AddWithValue("@course", course);
                scmd.Parameters.AddWithValue("@postid", postid);
                scmd.Parameters.AddWithValue("@questype", questype);
                scmd.Parameters.AddWithValue("@action", "postans");
                scmd.CommandType = CommandType.StoredProcedure;
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }

                int c = scmd.ExecuteNonQuery();
             //   con.Close();
                return c;
            }

            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }

            }
        }
        public int deletepostedquesdetails(int postid)
        {
            try
            { 
            SqlCommand scmd = new SqlCommand("sp_PostQuestion", con);

            scmd.Parameters.AddWithValue("@postid", postid);

            scmd.Parameters.AddWithValue("@action", "delete");
            scmd.CommandType = CommandType.StoredProcedure;
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }

                int c = scmd.ExecuteNonQuery();
            //con.Close();
            return c;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }

            }

        }

        public DataTable questypedetails()
        {
            try
            {
                SqlCommand scmd = new SqlCommand("sp_Question_Type_Master_details", con);
                scmd.Parameters.AddWithValue("@action", "select");
                scmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter sda = new SqlDataAdapter(scmd);
                DataTable dt = new DataTable();
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }

                sda.Fill(dt);
             //   con.Close();
                return dt;
            }

            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }

            }
        }

        //added by maya
        public bool FnSaveData(SqlCommand cmd)
        {

            using (SqlConnection sqlcon = new SqlConnection(strCon))
            {
                SqlTransaction sqlTran = null;
                try
                {
                    if (sqlcon.State == ConnectionState.Closed) sqlcon.Open();
                    sqlTran = sqlcon.BeginTransaction();
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Transaction = sqlTran;
                    cmd.Connection = sqlcon;
                    cmd.ExecuteNonQuery();
                    cmd.Transaction.Commit();
                    return true;
                }
                catch (Exception ex)
                {
                    string strFlagValue = string.Empty;
                    foreach (SqlParameter p in cmd.Parameters)
                    {
                        if (p.ParameterName == "@Flag" || p.ParameterName == "@flag")
                        {
                            strFlagValue = Convert.ToString(p.Value);
                            ex.Data.Add("flag", strFlagValue);
                        }
                    }
                    cmd.Transaction.Rollback();
                    throw ex;
                }
                finally
                {
                    if (sqlcon.State == ConnectionState.Open)
                    {
                        sqlcon.Close();
                        sqlcon.Dispose();
                    }
                }
            }
        }
        public DataTable FnReturnDataTable(SqlCommand cmd)
        {
            DataTable dt = null;
            SqlDataAdapter sda = null;
            using (SqlConnection sqlcon = new SqlConnection(strCon))
            {
                try
                {
                    dt = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandTimeout = 120;
                    cmd.Connection = sqlcon;
                    sda = new SqlDataAdapter(cmd);
                    //sda = new SqlDataAdapter("SELECT * FROM tbl_CategoryManager", strCon);
                    sda.Fill(dt);
                }
                catch (Exception ex)
                {
                    string strFlagValue = string.Empty;
                    foreach (SqlParameter p in cmd.Parameters)
                    {
                        if (p.ParameterName == "@Flag" || p.ParameterName == "@flag")
                        {
                            strFlagValue = Convert.ToString(p.Value);
                            ex.Data.Add("Flag", strFlagValue);
                        }
                    }
                    throw ex;
                }
            }
            return dt;
        }
        public bool FnRetTrueFalse(SqlCommand cmd)
        {
            using (SqlConnection sqlcon = new SqlConnection(strCon))
            {
                if (sqlcon.State == ConnectionState.Closed) sqlcon.Open();
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Connection = sqlcon;
                int IsExist = (int)cmd.ExecuteScalar();
                if (IsExist > 0)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
        }
        public bool FnCheckIsUsed(SqlCommand cmd)
        {
            bool output = false;
            using (SqlConnection sqlcon = new SqlConnection(strCon))
            {
                SqlTransaction sqlTran = null;
                try
                {
                    if (sqlcon.State == ConnectionState.Closed) sqlcon.Open();
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Transaction = sqlTran;
                    cmd.Connection = sqlcon;
                    int recordCount = cmd.ExecuteNonQuery();
                    if (recordCount > 0)
                    {
                        output = true;
                    }
                }
                catch (Exception ex)
                {
                    string strFlagValue = string.Empty;
                    foreach (SqlParameter p in cmd.Parameters)
                    {
                        if (p.ParameterName == "@Flag" || p.ParameterName == "@flag")
                        {
                            strFlagValue = Convert.ToString(p.Value);
                            ex.Data.Add("Flag", strFlagValue);
                        }
                    }
                    throw ex;
                }
                finally
                {
                    if (sqlcon.State == ConnectionState.Open)
                    {
                        sqlcon.Close();
                        sqlcon.Dispose();
                    }
                }
            }
            return output;
        }


    }
}