using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Configuration;
using System.IO;
using System.Net;
using System.Text;

namespace ENOSISLEARNING
{
    public class SENDEMAIL
    {
        public static void SendNewMail(string strbody)
        {
            try
            {
               // "smtp.gmail.com"
                string strSMTP = ConfigurationManager.AppSettings["NETSMTP"];
                string strUserName = ConfigurationManager.AppSettings["NETUSERNAME"];
                string strPassword = ConfigurationManager.AppSettings["NETPASSWORD"];

                MailMessage message = new MailMessage();
                message.From = new MailAddress(strUserName, "enosislearning");

                message.To.Add("courses@enosislearning.com");
                //     message.CC.Add(txtcc.Text.Trim());

                message.Subject = "enquiry";

                if (strbody.Length > 0)
                {
                    message.Body = strbody;
                }

                message.Priority = MailPriority.High;
                //////string fullPath = "";


                //message.Attachments.Add(new Attachment(files));
                message.IsBodyHtml = true;
                //SmtpClient smtp = new SmtpClient();
                //smtp.Host = "smtp.gmail.com";
                //smtp.Port = 587;
                //smtp.Credentials = new System.Net.NetworkCredential("dillipparhi@gmail.com", "dillip24");
                //smtp.EnableSsl = true;
                //smtp.Send(message);
                //NetworkCredential loginInfo = new NetworkCredential("dillipparhi@gmail.com", "dillip24");
                NetworkCredential loginInfo = new NetworkCredential(strUserName, strPassword);
                SmtpClient client = new SmtpClient(strSMTP);
                client.Port = 587;
                //client.Port = 465;
                client.EnableSsl = true; //commented for thrifty
                client.UseDefaultCredentials = false;
                client.Credentials = loginInfo;
                client.Send(message);

                message.Dispose();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        public void SendWelcomeEmail(string name, string strEmail, int iCandidateId,string dobpass)
        {
            try
            {

                string body = this.PopulateWelcomeBody(iCandidateId, name,strEmail,dobpass);
                this.SendMail(strEmail, "EnosisLearning-Admission-Confirmation", body);
            }
            catch (Exception ex)
            {
                throw ex;

            }

        }

        public void SendWelcomeEmailToEmployee(string fullname, string strOEmail,string eopass,string username,string pass,string peremail,string offerletter)
        {
            try
            {

                string body = this.PopulateEmployeeBody(fullname, strOEmail, eopass,username,pass);
                this.SendMailWithAttachment(peremail, "Enosis-OfferLetter", body,offerletter);
            }
            catch (Exception ex)
            {
                throw ex;

            }

        }
        private string PopulateEmployeeBody(string FirstName, string offemail, string offemailpass,string username,string password)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("~/Templates/EmployeeWelcome.html")))
            {
                body = reader.ReadToEnd();
            }

            body = body.Replace("{FirstName}", FirstName);

            body = body.Replace("{EMAIL_ID}", offemail);
            body = body.Replace("{EMAIL_PASSWORD}", offemailpass);

            //            body = body.Replace("{RegNo}", iRegNo.ToString());
            body = body.Replace("{USER_NAME}", username);
            body = body.Replace("{PASS_WORD}", password);


            return body;
        }
        public void SendJobApplicationEmail(string name, string strEmail, int iCandidateId, string Position)
        {
            try
            {

                string body = this.PopulateJobsBody(iCandidateId, name, Position);
                this.SendMail(strEmail, "Successfully-Applied", body);
            }
            catch (Exception ex)
            {
                throw ex;

            }

        }
        private string PopulateJobsBody(int iRegNo, string FirstName, string Position)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("~/Templates/EmailJobsApplicants.html")))
            {
                body = reader.ReadToEnd();
            }


            body = body.Replace("{FirstName}", FirstName);

            body = body.Replace("{RegNo}", iRegNo.ToString());
            body = body.Replace("{Position}", Position);

            /*string sub = "Hello {Name}";
            sub.Replace("{ Name}", "Amit");
            txtPreview.Text = sub;*/


            return body;
        }

        public void SendRegistrationEmail(string name, string strEmail, int iCandidateId, string url)
        {
            try
            {

                string baseurl = CommonFunction.GetSiteRootUrl();
                string loginurl = baseurl + "//" + url;

                string body = "";
                if (url.Contains("Intern.aspx") || url.Contains("EnosisJobs.aspx"))
                {
                    body = this.PopulateJobsBody("EnosisLearning-Registration", loginurl, iCandidateId, name);//this.PopulateBody();
                }
                else
                {
                    body = this.PopulateBody("EnosisLearning-Registration", loginurl, iCandidateId, name);//this.PopulateBody();
                }

                this.SendMail(strEmail, "EnosisLearning-Registration", body);


            }
            catch (Exception ex)
            {
                throw ex;

            }

        }

        private string PopulateWelcomeBody(int iRegNo, string FirstName,string email,string pass)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("~/Templates/EmailWelcome.html")))
            {
                body = reader.ReadToEnd();
            }

            body = body.Replace("{FirstName}", FirstName);

            body = body.Replace("{RegNo}", iRegNo.ToString());
            body = body.Replace("{USER_NAME}", email);
            body = body.Replace("{PASS_WORD}", pass);


            return body;
        }
        private string PopulateBody(string title, string url, int iRegNo, string FirstName)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("~/Templates/EmailTemplate.html")))
            {
                body = reader.ReadToEnd();
            }

            body = body.Replace("{FirstName}", FirstName);
            body = body.Replace("{Url}", url);
            body = body.Replace("{RegNo}", iRegNo.ToString());
            return body;
        }
        public string PopulateScoreBody(string StudName, double score, double outof, string TestType, string Course, int CANDIDATEID, string InterviewerName, string feedback)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("~/Templates/EmailScores.html")))
            {
                body = reader.ReadToEnd();
            }



            body = body.Replace("{CANDIDATENAME}", StudName);
            body = body.Replace("{COURSENAME}", Course);
            body = body.Replace("{TESTTYPE}", TestType);
            body = body.Replace("{TAKENBY}", InterviewerName);
            body = body.Replace("{DATE}", DateTime.Today.ToShortDateString());
            body = body.Replace("{FEEDBACK}", feedback);
            body = body.Replace("{SCORE}", score.ToString());
            body = body.Replace("{OUTOF}", outof.ToString());
            body = body.Replace("{OUTOF}", outof.ToString());

            body = body.Replace("{CANDID}", CANDIDATEID.ToString());
            body = body.Replace("{C_NAME}", StudName);








            return body;
        }
        public string PopulateScore(string StudName, double score, double outof, string TestType, string Course, int CANDIDATEID, string InterviewerName, string feedback)
        {
            //string body = string.Empty;
            StringBuilder sb = new StringBuilder();
            sb.Append("Dear ");
            sb.Append(StudName).Append("<p />");
            sb.Append("Test Results, ");
            sb.Append("Please find the results of the Assessments Given By You at enosislearning <p />");

            sb.Append("<table cellpadding='5' cellspacing='0' style='border: 1px solid #ccc;font-size: 9pt;font-family:Arial'>");

            //Adding HeaderRow.
            sb.Append("<tr>");

            sb.Append("<th style='background-color: #B8DBFD;border: 1px solid #ccc'>" + "CANDIDATENAME" + "</th>");
            sb.Append("<th style='background-color: #B8DBFD;border: 1px solid #ccc'>" + "COURSENAME" + "</th>");
            sb.Append("<th style='background-color: #B8DBFD;border: 1px solid #ccc'>" + "SCORE" + "</th>");
            sb.Append("<th style='background-color: #B8DBFD;border: 1px solid #ccc'>" + "OUTOF" + "</th>");
            sb.Append("<th style='background-color: #B8DBFD;border: 1px solid #ccc'>" + "TESTTYPE" + "</th>");
            sb.Append("<th style='background-color: #B8DBFD;border: 1px solid #ccc'>" + "TAKENBY" + "</th>");

            sb.Append("<th style='background-color: #B8DBFD;border: 1px solid #ccc'>" + "DATE" + "</th>");

            sb.Append("<th style='background-color: #B8DBFD;border: 1px solid #ccc'>" + "FEEDBACK" + "</th>");

            sb.Append("</tr>");



            sb.Append("<tr>");

            sb.Append("<td style='width:100px;border: 1px solid #ccc'>" + StudName.ToString() + "</td>");
            sb.Append("<td style='width:100px;border: 1px solid #ccc'>" + Course + "</td>");
            sb.Append("<td style='width:100px;border: 1px solid #ccc'>" + score + "</td>");
            sb.Append("<td style='width:100px;border: 1px solid #ccc'>" + outof + "</td>");
            sb.Append("<td style='width:100px;border: 1px solid #ccc'>" + TestType + "</td>");
            sb.Append("<td style='width:100px;border: 1px solid #ccc'>" + InterviewerName + "</td>");
            sb.Append("<td style='width:100px;border: 1px solid #ccc'>" + DateTime.Today.ToShortDateString() + "</td>");
            sb.Append("<td style='width:100px;border: 1px solid #ccc'>" + feedback + "</td>");

            sb.Append("</tr>");


            //Table end.
            sb.Append("</table>");
            sb.Append("<p/>");
            sb.Append("You can also view the results by visiting the url : https://www.enosislearning.com/login.aspx");
            sb.Append("<p/>");

            sb.Append("Warm Regards <br/>");
            sb.Append("Enosis Assessment Team <br/>");
            sb.Append("www.enosislearning.com");
            return sb.ToString();
            //return body;
        }

        private string PopulateJobsBody(string title, string url, int iRegNo, string FirstName)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("~/InternTemplate.html")))
            {
                body = reader.ReadToEnd();
            }

            body = body.Replace("{FirstName}", FirstName);
            body = body.Replace("{Url}", url);
            body = body.Replace("{RegNo}", iRegNo.ToString());
            return body;
        }
        public void SendEnquiries(string subject, string body)
        {
            try
            {
                string strSMTP = ConfigurationManager.AppSettings["NETSMTP"];
                string strUserName = ConfigurationManager.AppSettings["NETUSERNAME"];
                string strPassword = ConfigurationManager.AppSettings["NETPASSWORD"];

                using (MailMessage mailMessage = new MailMessage())
                {
                    mailMessage.From = new MailAddress(strUserName);
                    mailMessage.Subject = subject;
                    mailMessage.Body = body;
                    mailMessage.IsBodyHtml = true;
                  
                    mailMessage.To.Add(new MailAddress("courses@enosislearning.com;learning@enosislearning.com;hr@enosislearning.com"));
                    // mailMessage.CC.Add(new MailAddress("dillip.parhi@enosislearning.com"));

                    mailMessage.Priority = MailPriority.High;

                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = strSMTP;// ConfigurationManager.AppSettings["Host"];
                    smtp.EnableSsl = true;
                    System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
                    NetworkCred.UserName = strUserName;
                    NetworkCred.Password = strPassword;
                    smtp.EnableSsl = true; //commented for thrifty
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = NetworkCred;
                    smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
                    smtp.Send(mailMessage);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //working fine
        public void SendMail(string recepientEmail, string subject, string body)
        {
            try
            {
                string strSMTP = "mail.enosislearning.com";
                string strUserName = "courses@enosislearning.com";
                string strPassword = "Np1u2z#2RZudhuak";

                using (MailMessage mailMessage = new MailMessage())
                {
                    mailMessage.From = new MailAddress(strUserName);
                    mailMessage.Subject = subject;
                    mailMessage.Body = body;
                    mailMessage.IsBodyHtml = true;
                    mailMessage.To.Add(new MailAddress(recepientEmail));
                    mailMessage.CC.Add(new MailAddress("dillip.parhi@enosissolutions.com"));
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = strSMTP;// ConfigurationManager.AppSettings["Host"];
                    smtp.EnableSsl = true;
                    System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
                    NetworkCred.UserName = strUserName;
                    NetworkCred.Password = strPassword;
                    smtp.EnableSsl = true; //commented for thrifty
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = NetworkCred;
                    smtp.Port = 25;
                    smtp.Send(mailMessage);
                    //   lblMsg.Text = "MAIL SEND SUCCESSFULLY";
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            /*  try
              {
                  string strSMTP = ConfigurationManager.AppSettings["NETSMTP"];
                  string strUserName = ConfigurationManager.AppSettings["NETUSERNAME"];
                  string strPassword = ConfigurationManager.AppSettings["NETPASSWORD"];

                  using (MailMessage mailMessage = new MailMessage())
                  {
                      mailMessage.From = new MailAddress(strUserName);
                      mailMessage.Subject = subject;
                      mailMessage.Body = body;
                      mailMessage.IsBodyHtml = true;
                      mailMessage.To.Add(new MailAddress(recepientEmail));
                      mailMessage.CC.Add(new MailAddress("dillip.parhi@enosissolutions.com;courses@enosislearning.com"));

                     // mailMessage.CC.Add(new MailAddress("dillip.parhi@enosislearning.com"));

                      SmtpClient smtp = new SmtpClient();
                      smtp.Host = strSMTP;// ConfigurationManager.AppSettings["Host"];
                      smtp.EnableSsl = true;
                      System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
                      NetworkCred.UserName = strUserName;
                      NetworkCred.Password = strPassword;
                      smtp.EnableSsl = true; //commented for thrifty
                      smtp.UseDefaultCredentials = false;
                      smtp.Credentials = NetworkCred;
                      smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
                      smtp.Send(mailMessage);
                  }
              }
              catch (Exception ex)
              {
                  throw ex;
              }*/
        }
        public void SendMailWithAttachment(string recepientEmail, string subject, string body,string attachmentpath)
        {
            try
            {
                string strSMTP = ConfigurationManager.AppSettings["NETSMTP"];
                string strUserName = ConfigurationManager.AppSettings["NETUSERNAME"];
                string strPassword = ConfigurationManager.AppSettings["NETPASSWORD"];

                using (MailMessage mailMessage = new MailMessage())
                {
                    mailMessage.From = new MailAddress(strUserName);
                    mailMessage.Subject = subject;
                    mailMessage.Body = body;
                    mailMessage.IsBodyHtml = true;
                    mailMessage.To.Add(new MailAddress(recepientEmail));
                    mailMessage.CC.Add(new MailAddress("courses@enosislearning.com"));
                    mailMessage.CC.Add(new MailAddress("dillip.parhi@enosissolutions.com"));

                    Attachment ath = new Attachment(attachmentpath);

                    mailMessage.Attachments.Add(ath);

                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = strSMTP;// ConfigurationManager.AppSettings["Host"];
                    smtp.EnableSsl = true;
                    System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
                    NetworkCred.UserName = strUserName;
                    NetworkCred.Password = strPassword;
                    smtp.EnableSsl = true; //commented for thrifty
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = NetworkCred;
                    smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
                    smtp.Send(mailMessage);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void SendCourseContents(string email,string coursename)
        {
            //C,C++,FullStack.Net,Java,SQLServer,POWERBI,MSBI,WebDesigning
            string filepath = "";
            if (coursename.ToUpper().ToString() == "JAVA")
            {
                filepath = HttpContext.Current.Server.MapPath(@"/courses/Img/") + "3.Java.pdf";

            }
            if (coursename.ToUpper().ToString() == "POWERBI")
            {
                filepath = HttpContext.Current.Server.MapPath(@"/courses/Img/") + "25.POWERBI.pdf";

            }
            else if(coursename.ToUpper().ToString() == "SQLSERVER")
            {
                filepath = HttpContext.Current.Server.MapPath(@"/courses/Img/") + "5.SqlServer.pdf";
            }
            SendAttachment(email, "COURSECONTENTS", "COURSE-CONTENTS ATTACHED", filepath);
        }

        public void SendAttachment(string email, string subject, string body, string filepath)
        {
            try
            {
                string strSMTP = ConfigurationManager.AppSettings["NETSMTP"];
                string strUserName = ConfigurationManager.AppSettings["NETUSERNAME"];
                string strPassword = ConfigurationManager.AppSettings["NETPASSWORD"];

                using (MailMessage mailMessage = new MailMessage())
                {
                    mailMessage.From = new MailAddress(strUserName);
                    mailMessage.Subject = subject;
                    mailMessage.Body = body;
                    mailMessage.IsBodyHtml = true;
                    if (email.Length > 0)
                    {
                        mailMessage.To.Add(new MailAddress(email));
                    }
                    else
                    {
                        //mailMessage.To.Add(new MailAddress("hr@enosissolutions.com"));
                        mailMessage.To.Add(new MailAddress("courses@enosislearning.com"));
                    }
                    if (filepath.Length > 0)
                    {
                        Attachment ath = new Attachment(filepath);

                        mailMessage.Attachments.Add(ath);
                    }
                    // mailMessage.CC.Add(new MailAddress("courses@enosislearning.com"));
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = strSMTP;// ConfigurationManager.AppSettings["Host"];
                    smtp.EnableSsl = true;
                    System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
                    NetworkCred.UserName = strUserName;
                    NetworkCred.Password = strPassword;
                    smtp.EnableSsl = true; //commented for thrifty
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = NetworkCred;

                    smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
                    smtp.Send(mailMessage);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void SendResume(string email,string subject, string body, string filepath)
        {
            try
            {
                string strSMTP = ConfigurationManager.AppSettings["NETSMTP"];
                string strUserName = ConfigurationManager.AppSettings["NETUSERNAME"];
                string strPassword = ConfigurationManager.AppSettings["NETPASSWORD"];

                using (MailMessage mailMessage = new MailMessage())
                {
                    mailMessage.From = new MailAddress(strUserName);
                    mailMessage.Subject = subject;
                    mailMessage.Body = body;
                    mailMessage.IsBodyHtml = true;
                    if (email.Length > 0)
                    {
                        mailMessage.To.Add(new MailAddress(email));
                    }
                    else
                    {
                        //mailMessage.To.Add(new MailAddress("hr@enosissolutions.com"));
                        mailMessage.To.Add(new MailAddress("courses@enosislearning.com"));
                    }
                    Attachment ath = new Attachment(filepath);

                    mailMessage.Attachments.Add(ath);
                    // mailMessage.CC.Add(new MailAddress("courses@enosislearning.com"));
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = strSMTP;// ConfigurationManager.AppSettings["Host"];
                    smtp.EnableSsl = true;
                    System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
                    NetworkCred.UserName = strUserName;
                    NetworkCred.Password = strPassword;
                    smtp.EnableSsl = true; //commented for thrifty
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = NetworkCred;

                    smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
                    smtp.Send(mailMessage);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

      
    
       
       

        



      
    }
}