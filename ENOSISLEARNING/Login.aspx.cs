using System;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using ENOSISLEARNING.Libraries;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Globalization;
using System.Net.Mail;
using System.Net;
using System.Linq;

namespace ENOSISLEARNING
{
    
    public partial class Login : System.Web.UI.Page
    {
        string CONNSTRING = System.Configuration.ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ToString();
        SqlConnection sconn = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            //New Code
            sconn = new SqlConnection(CONNSTRING);
            if (!Page.IsPostBack)
            {
                txtUserName.Text = "";
                txtPassword.Text = "";
            }
        }
        //Main Login Method//
        protected void btnlogin_Click1(object sender, EventArgs e)
        {
            try
            {
                string username = txtUserName.Text.Trim();
                string password = txtPassword.Text.Trim();
                string formattedDOB = "";

                // parse DOB (for student login)
                DateTime dob;
                if (DateTime.TryParseExact(password, "dd/MM/yyyy",
                    CultureInfo.InvariantCulture, DateTimeStyles.None, out dob))
                {
                    //Convert DOB to SQL format
                    formattedDOB = dob.ToString("yyyy-MM-dd");
                }

                //Combined query for Faculty and Student
                string query = @"
        SELECT 'Faculty' AS Role, USERID AS ID, FULLNAME 
        FROM USERDETAILS 
        WHERE USERNAME = @username AND PASSWORD = @password

        UNION ALL

        SELECT 'Student' AS Role, CANDIDATE_CODE AS ID, FULLNAME 
        FROM CANDIDATES 
        WHERE EMAIL = @username AND DOB = @studentDOB;
    ";

                using (SqlConnection sconn = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
                {
                    SqlCommand scmd = new SqlCommand(query, sconn);
                    scmd.Parameters.AddWithValue("@username", username);
                    scmd.Parameters.AddWithValue("@password", password);
                    scmd.Parameters.AddWithValue("@studentDOB", formattedDOB);

                    sconn.Open();
                    SqlDataReader reader = scmd.ExecuteReader();

                    if (reader.Read())
                    {
                        string role = reader["Role"].ToString();
                        string id = reader["ID"].ToString();
                        string name = reader["FULLNAME"].ToString();

                        //Save cookies
                        Response.Cookies["USERNAME"].Value = username;
                        Response.Cookies["FULLNAME"].Value = name;
                        Response.Cookies["ROLE"].Value = role;
                        Response.Cookies["USERNAME"].Expires = DateTime.Now.AddDays(15);
                        Response.Cookies["FULLNAME"].Expires = DateTime.Now.AddDays(15);
                        Response.Cookies["ROLE"].Expires = DateTime.Now.AddDays(15);

                        //Save sessions
                        Session["USERNAME"] = username;
                        Session["FULLNAME"] = name;
                        Session["ROLE"] = role;

                        if (role == "Student")
                        {
                            Session["CANDID"] = id;
                            Session["PASSWORD"] = password;
                            Response.Redirect("~/Attendence.aspx");
                        }
                        else if (role == "Faculty")
                        {
                            Session["FACULTYID"] = id;
                            Session["DESIGNATION"] = "FACULTY";
                            Response.Redirect("SearchCandidate.aspx");
                        }
                    }
                    else
                    {
                        // ✅ Invalid login - clear cookies
                        Response.Cookies["USERNAME"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["FULLNAME"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["ROLE"].Expires = DateTime.Now.AddDays(-1);

                        Response.Write("<script>alert('Invalid Login Details!')</script>");
                        txtUserName.Text = "";
                        txtPassword.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Login Error: " + ex.Message + "')</script>");
            }
        }
        //Main Login Method//
        //OTP Verification Method//
        protected void btnVerifyOTP_Click(object sender, EventArgs e)
        {
            
        }
        //OTP Verification Method//
        //OTP Request Method//
        protected void ReqOtpBtn_Click(object sender, EventArgs e)
        {
            // Generate 6-digit OTP
            string otp = new Random().Next(100000, 999999).ToString();
            // Save OTP in session to verify later
            Session["OTP"] = otp;
            Session["OTPTime"] = DateTime.Now;
            // Prepare the email
            MailMessage mail = new MailMessage();
            //mail.To.Add(email); // User ke email pe OTP bhejna
            mail.From = new MailAddress("013roy@gmail.com", "Enosis Learning");
            mail.Subject = "OTP Code Request";
            mail.Body = "Your OTP Code Is: " + otp + "\nThis OTP is valid for 1 minute.";
            mail.IsBodyHtml = false;

            // Setup SMTP
            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.Credentials = new NetworkCredential("013roy@gmail.com", "xnbn rkvs jxte mvld");
            smtp.EnableSsl = true;
            try
            {
                //OtpMsg.Text = "OTP sent to " + email;
                smtp.Send(mail);
               // pnlEmail.Visible = false;
                //pnlOTP.Visible = true;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", "document.getElementById('myModal').style.display='block';", true);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error sending OTP: " + ex.Message + "');</script>");
            }
        }
        //OTP Request Method//
        //Get User Role By Email Method//
        private string GetUserRoleByEmail(string email)
        {
            string role = string.Empty;

            // Check in CANDIDATES table for Student role
            using (SqlConnection sconn = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
            {
                string query = "SELECT 'Student' FROM CANDIDATES WHERE EMAIL = @Email"; // Check if email exists in CANDIDATES table
                SqlCommand cmd = new SqlCommand(query, sconn);
                cmd.Parameters.AddWithValue("@Email", email);

                sconn.Open();
                var result = cmd.ExecuteScalar();
                if (result != null)
                {
                    role = "Student";  // If email found in CANDIDATES, assign Student role
                }
            }

            // If email is not found in CANDIDATES table, check in USERDETAILS table for Faculty role
            if (string.IsNullOrEmpty(role))
            {
                using (SqlConnection sconn = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
                {
                    string query = "SELECT 'Faculty' FROM USERDETAILS WHERE EMAILID = @Email"; // Check if email exists in USERDETAILS table
                    SqlCommand cmd = new SqlCommand(query, sconn);
                    cmd.Parameters.AddWithValue("@Email", email);

                    sconn.Open();
                    var result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        role = "Faculty";  // If email found in USERDETAILS, assign Faculty role
                    }
                }
            }

            return role; // This will return "Student", "Faculty" or empty if the email doesn't match either role
        }
        
        //Email Validation//
        private bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }
        //Email Validation//
        //OTP Generator Method//
        private string GenerateOTP()
        {
            Random rand = new Random();
            return rand.Next(100000, 999999).ToString();  // Generates a 6-digit OTP
        }
        //OTP Generator Method//
        //Send OTP to Email Method//
        private void SendOTPToEmail(string email, string otp)
        {
            try
            {
                // Set up SMTP client (use your own email provider's SMTP settings)
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587) // Replace with your SMTP server address
                {
                    Port = 587, // For SSL use port 465, for TLS use 587 (typical for most email providers)
                    Credentials = new NetworkCredential("013roy@gmail.com", "xnbn rkvs jxte mvld"),
                    EnableSsl = true, // Make sure SSL is enabled for secure email sending
                };

                // Create the email message
                MailMessage message = new MailMessage
                {
                    From = new MailAddress("013roy@gmail.com", "Enosis Learning"), // Your email address
                    Subject = "Your OTP for Password Reset",
                    Body = $"Your OTP is: {otp}",
                    IsBodyHtml = false, // Plain text email
                };

                message.To.Add(email); // Recipient's email address

                // Send the email
                smtpClient.Send(message);

                // Optional: Log the email sent event (for troubleshooting)
                //Console.WriteLine($"OTP sent to {email}");

            }
            catch (Exception ex)
            {
                // Handle errors, such as connection issues
                Response.Write($"<script>alert('Error while sending OTP: {ex.Message}');</script>");
            }
        }
        //Send OTP to Email Method//
        
        //Password Reset Method For Student//
        private void UpdateStudentPassword(string email, string newPassword)
        {
            using (SqlConnection sconn = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
            {
                string query = "UPDATE CANDIDATES SET PASSWORD = @Password, IS_PASSWORD_CHANGED = 1 WHERE EMAIL = @Email";
                SqlCommand cmd = new SqlCommand(query, sconn);
                cmd.Parameters.AddWithValue("@Password", newPassword);
                cmd.Parameters.AddWithValue("@Email", email);

                sconn.Open();
                cmd.ExecuteNonQuery();
            }
        }
        //Password Reset Method For Student//
        //Password Reset Method For Faculty//
        private void UpdateFacultyPassword(string email, string newPassword)
        {
            using (SqlConnection sconn = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
            {
                string query = "UPDATE USERDETAILS SET PASSWORD = @Password, IS_PASSWORD_CHANGED = 1 WHERE EMAILID = @Email";
                SqlCommand cmd = new SqlCommand(query, sconn);
                cmd.Parameters.AddWithValue("@Password", newPassword);
                cmd.Parameters.AddWithValue("@Email", email);

                sconn.Open();
                cmd.ExecuteNonQuery();
            }
        }
        //Password Reset Method For Faculty//
        //Password Reset Method For Students//
        protected void SavePassword_Click(object sender, EventArgs e)
        {
            string email = StudEmail.Text.Trim();
            string newPassword = NewPassword.Text.Trim();
            string confirmPassword = ConfirmPassword.Text.Trim();

            if (newPassword != confirmPassword)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Password not Matched!');", true);
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "UPDATE CANDIDATES SET PASSWORD = @Password, IS_PASSWORD_CHANGED = 1 WHERE EMAIL = @Email";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Password", newPassword);
                    cmd.Parameters.AddWithValue("@Email", email);

                    try
                    {
                        conn.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            // Success message or redirect
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Password updated successfully!');", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Email not found.');", true);
                        }
                    }
                    catch (Exception ex)
                    {
                        // Log exception or show error
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
                    }
                }
            }
        }
        //Password Reset Method For Students//
        //Method for Random Password Generator//
        private string GenerateRandomPassword(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            Random random = new Random();
            return new string(Enumerable.Repeat(chars, length)
                              .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        //Method for Random Password Generator//
        //Random Password Reset Method For Students//
        protected void RandomPasswordLogin_Click(object sender, EventArgs e)
        {
            string email = ForgotEmail.Text.Trim();
            string password = RandomPassText.Text.Trim();
            string randomPassword = GenerateRandomPassword(6);

            string connStr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "UPDATE CANDIDATES SET PASSWORD = @Password, IS_PASSWORD_CHANGED = 1 WHERE EMAIL = @Email";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Parameters.AddWithValue("@Email", email);

                    try
                    {
                        conn.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            //Direct Login: Fetch Candidate Info
                            string fetchQuery = "SELECT CANDIDATE_CODE, FULLNAME FROM CANDIDATES WHERE EMAIL = @Email";
                            SqlCommand fetchCmd = new SqlCommand(fetchQuery, conn);
                            fetchCmd.Parameters.AddWithValue("@Email", email);

                            SqlDataReader reader = fetchCmd.ExecuteReader();
                            if (reader.Read())
                            {
                                string candidateId = reader["CANDIDATE_CODE"].ToString();
                                string fullName = reader["FULLNAME"].ToString();

                                // Set Session and Cookies
                                Session["USERNAME"] = email;
                                Session["FULLNAME"] = fullName;
                                Session["ROLE"] = "Student";
                                Session["CANDID"] = candidateId;
                                Session["PASSWORD"] = randomPassword;

                                Response.Cookies["USERNAME"].Value = email;
                                Response.Cookies["FULLNAME"].Value = fullName;
                                Response.Cookies["ROLE"].Value = "Student";

                                Response.Cookies["USERNAME"].Expires = DateTime.Now.AddDays(15);
                                Response.Cookies["FULLNAME"].Expires = DateTime.Now.AddDays(15);
                                Response.Cookies["ROLE"].Expires = DateTime.Now.AddDays(15);
                                string script = @"alert('Password Updated. Click OK to continue.');window.location='Attendence.aspx';";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectWithAlert", script, true);
                            }
                        }
                        else
                        {
                            PasswordLbl.Text = "No user found with this email.";
                            PasswordLbl.ForeColor = System.Drawing.Color.Red;
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "showModal", "openForgotPasswordModal();", true);
                        }
                    }
                    catch (Exception ex)
                    {
                        PasswordLbl.Text = "Error: " + ex.Message;
                        PasswordLbl.ForeColor = System.Drawing.Color.Red;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "showModal", "openForgotPasswordModal();", true);
                    }
                }
            }
        }
        //Random Password Reset Method For Students//
    }
}