<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ENOSISLEARNING.Login" %>

<!DOCTYPE html>
<!DOCTYPE html
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Enosis Learning Login</title>
    <link href="css/login.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet"/>
    <style>
        @media (min-width : 1025px) {
            .passwordspn {
                color: white;
                font-weight: bold;
            }

            
        .left  h1 {
            font-size: 4rem;
            letter-spacing: 0.125rem;
            opacity: 0;
            transform: translateY(30px);
            animation-fill-mode: forwards;
            animation: fadeInUp 1s ease-out 0.3s forwards;
        }

        .left h2 {
            font-size: 1.2rem;
            letter-spacing: 2px;
            line-height: 2.8rem;
            opacity: 0;
            transform: translateY(30px);
            animation-fill-mode: forwards;
            animation: fadeInUp 1s ease-out 0.3s forwards;
        }

        .left > h6 {
            font-size: 0.9125rem;
            color: #ddd;
            letter-spacing: 0.125rem;
            padding-top: -10px;
            position: relative;
            bottom: 5px;
            line-height: 1.5rem;
            opacity: 0;
            transform: translateY(30px);
            animation-fill-mode: forwards;
            animation: fadeInUp 1s ease-out 0.8s forwards;
            text-align: center;
        }

    @keyframes fadeInUp {
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
        }
        @media (min-width : 768px) and (max-width : 1024px) {
            .passwordspn {
                color: white;
                font-weight: bold;
            }

            .container {
                max-width: 100%;
                height: 100%;
                background: transparent;
                display: grid;
                margin: auto;
                place-content: center;
                position: relative;
                top: 4rem;
            }

            .card {
                background-color: aliceblue;
                padding: 20px;
                text-align: center;
                border-radius: 20px;
                width: 100%;
                height: 100%;
                background: url("/images/BG.png");
                background-position: right;
                background-size: cover;
            }

            .left {
                display: none;
            }

            .right {
                grid-area: right;
                padding: 20px;
                width: 100%;
            }

            .login-section {
                flex: 1;
                padding: 2px;
                display: flex;
                flex-direction: column;
                justify-content: center;
            }

                .login-section h2 {
                    margin-bottom: 10px;
                    color: #333;
                }

            .input-group {
                margin-bottom: 4px;
                position: relative;
            }

                .input-group input {
                    width: 100%;
                    padding: 6px 40px 6px 40px;
                    border: 1px solid #ccc;
                    border-radius: 8px;
                }

                .input-group i {
                    position: absolute;
                    left: 15px;
                    top: 50%;
                    transform: translateY(-50%);
                    color: #0072ff;
                }

                .input-group span {
                    position: absolute;
                    top: 50%;
                    right: 15px;
                    transform: translateY(-50%);
                    font-size: 12px;
                    color: #0072ff;
                    cursor: pointer;
                }

            .options {
                display: flex;
                justify-content: space-between;
                align-items: center;
                font-size: 3px;
                margin-bottom: 10px;
            }

                .options input {
                    position: relative;
                    top: 0.1rem;
                }

            .btn-primary, .btn-secondary {
                padding: 6px;
                width: 100%;
                border-radius: 4px;
                font-weight: bold;
                cursor: pointer;
                margin-bottom: 5px;
            }

            .btn-primary {
                background-color: #003c80;
                color: white;
                border: none;
            }

            .btn-secondary {
                background-color: white;
                border: 1px solid #ccc;
                color: #333;
            }

            .signup {
                text-align: center;
                font-size: 6px;
            }

                .signup a {
                    color: #0072ff;
                    text-decoration: none;
                }

            .signup2 {
                text-align: center;
                font-size: 12px;
                color: white;
                font-weight: lighter;
            }

            .input-group i {
                color: black;
            }

            input[type="text"] {
                border: 1px solid #ccc;
                border-radius: 5px;
                outline: none;
                transition: border-color 0.3s ease;
            }

            input[type="placeholder"] {
                font-size: 2px;
            }

            input[type="text"]:focus {
                border-color: #004b93; /* Blue border when focused */
            }

            input[type="password"] {
                border: 1px solid #ccc;
                border-radius: 5px;
                outline: none;
                transition: border-color 0.3s ease;
            }

                input[type="password"]:focus {
                    border-color: #004b93; /* Blue border when focused */
                }
            /* Modal Background */
            .modal {
                display: none; /* hidden by default */
                position: fixed;
                z-index: 999;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0,0,0,0.5); /* Black with opacity */
            }

            /* Modal Content Box */
            .modal-content {
                background: rgba(255, 255, 255, 0.1); /* Transparent white */
                backdrop-filter: blur(10px); /* Blur the background */
                -webkit-backdrop-filter: blur(10px); /* For Safari */
                border: 1px solid rgba(255, 255, 255, 0.2); /* Thin white border */
                border-radius: 10px;
                box-shadow: 0 8px 32px rgba(0, 0, 0, 0.37);
                margin: auto;
                padding: 20px;
                width: 45%;
                position: relative;
                top: 18%;
                color: white; /* Optional: white text for dark background behind */
                z-index: 1001;
                box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
                animation: fadeIn 0.5s ease-in-out;
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: scale(0.9);
                }

                to {
                    opacity: 1;
                    transform: scale(1);
                }
            }

            @media (min-width: 481px) and (max-width: 767px) {
                .passwordspn {
                    color: white;
                    font-weight: bold;
                }
            }
        }

            @media (max-width: 480px) {
                .passwordspn {
                    color: white;
                    font-weight: bold;
                }
                 .container {
     max-width: 100%;
     height: 100%;
     background: transparent;
     display: grid;
     margin: auto;
     place-content: center;
     position: relative;
     top: 3rem;
 }

 .card {
     background-color: aliceblue;
     padding: 20px;
     text-align: center;
     border-radius: 20px;
     width: 100%;
     height: 100%;
     background: url("/images/BG.png");
     background-position: right;
     background-size: cover;
 }

 .left {
     display: none;
 }

 .right {
     grid-area: right;
     padding: 20px;
     width: 100%;
 }

 .login-section {
     flex: 1;
     padding: 2px;
     display: flex;
     flex-direction: column;
     justify-content: center;
 }

     .login-section h2 {
         margin-bottom: 10px;
         color: #333;
     }

 .input-group {
     margin-bottom: 4px;
     position: relative;
 }

     .input-group input {
         width: 100%;
         padding: 6px 40px 6px 40px;
         border: 1px solid #ccc;
         border-radius: 8px;
     }

     .input-group i {
         position: absolute;
         left: 15px;
         top: 50%;
         transform: translateY(-50%);
         color: #0072ff;
     }

     .input-group span {
         position: absolute;
         top: 50%;
         right: 15px;
         transform: translateY(-50%);
         font-size: 12px;
         color: #0072ff;
         cursor: pointer;
     }

 .options {
     display: flex;
     justify-content: space-between;
     align-items: center;
     font-size: 10px;
     margin-bottom: 10px;
 }
     .options input {
         position: relative;
         top: 0.1rem;
     }

 .btn-primary, .btn-secondary {
     padding: 6px;
     width: 100%;
     border-radius: 4px;
     font-weight: bold;
     cursor: pointer;
     margin-bottom: 5px;
 }

 .btn-primary {
     background-color: #003c80;
     color: white;
     border: none;
 }

 .btn-secondary {
     background-color: white;
     border: 1px solid #ccc;
     color: #333;
 }

 .signup {
     text-align: center;
     font-size: 6px;
 }

     .signup a {
         color: #0072ff;
         text-decoration: none;
     }

 .signup2 {
     text-align: center;
     font-size: 12px;
     color: white;
     font-weight: lighter;
 }

 .input-group i {
     color: black;
 }

 input[type="text"] {
     border: 1px solid #ccc;
     border-radius: 5px;
     outline: none;
     transition: border-color 0.3s ease;
 }

 input[type="placeholder"] {
     font-size: 2px;
 }

 input[type="text"]:focus {
     border-color: #004b93; /* Blue border when focused */
 }

 input[type="password"] {
     border: 1px solid #ccc;
     border-radius: 5px;
     outline: none;
     transition: border-color 0.3s ease;
 }

     input[type="password"]:focus {
         border-color: #004b93; /* Blue border when focused */
     }
 /* Modal Background */
 .modal {
     display: none; /* hidden by default */
     position: fixed;
     z-index: 999;
     left: 0;
     top: 0;
     width: 100%;
     height: 100%;
     overflow: auto;
     background-color: rgba(0,0,0,0.5); /* Black with opacity */
 }

 /* Modal Content Box */
 .modal-content {
     background: rgba(255, 255, 255, 0.1); /* Transparent white */
     backdrop-filter: blur(10px); /* Blur the background */
     -webkit-backdrop-filter: blur(10px); /* For Safari */
     border: 1px solid rgba(255, 255, 255, 0.2); /* Thin white border */
     border-radius: 10px;
     box-shadow: 0 8px 32px rgba(0, 0, 0, 0.37);
     margin: auto;
     padding: 20px;
     width: 60%;
     position: relative;
     top: 20%;
     color: white; /* Optional: white text for dark background behind */
     z-index: 1001;
     box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
     animation: fadeIn 0.5s ease-in-out;
 }

 @keyframes fadeIn {
     from {
         opacity: 0;
         transform: scale(0.9);
     }

     to {
         opacity: 1;
         transform: scale(1);
     }
            }
        }
    </style>
</head>
<body>
  <form id="form1" runat="server">
      <br />
  <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      <!-- The Modal For New Password Request-->
      <div id="myModal" class="modal">
        <div class="modal-content">
              <span class="close" id="closeModal">&times;</span>
            <div class="main">
                <div class="login-section">
                        <asp:Panel ID="pnlSetPassword" runat="server" Visible="true">
                              <h1 class="loginTxt">Create Password</h1>
                            <div class="input-group">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="StudEmail"
                                    ErrorMessage="Required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="StudEmail" TextMode="Email" runat="server" placeholder="Enter Your Email" CssClass="form-control"/>
                            </div> 
                            <div class="input-group">
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NewPassword" ErrorMessage="Required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="NewPassword" TextMode="Password" runat="server" placeholder="Set New Password" CssClass="form-control"/>
                            </div> 
                            <div class="input-group">                              
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="ConfirmPassword" TextMode="Password" runat="server" placeholder="Confirm New Password" CssClass="form-control" />
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Not Matched" ControlToValidate="ConfirmPassword" ControlToCompare="NewPassword"></asp:CompareValidator>
                            </div>
                            <asp:Button ID="SavePassword" CssClass="btn btn-primary mt-2" runat="server" Text="Save Password"
                                 CausesValidation="false" OnClick="SavePassword_Click"/>
                           <div class="signup2">Don't have an account? <a href="EnosisJobs.aspx">Sign up</a></div>
                        </asp:Panel>
                </div>
             </div>
          </div>
      </div>
      <!-- The Modal For OTP Request-->
      <!-- Forgot Password Modal -->
     <%-- <div id="forgotPasswordModal" class="modal">
    <div class="modal-content">
        <span class="close" id="closeForgotModal">&times;</span>
        <div class="main">
            <div class="login-section">
                <asp:UpdatePanel ID="UpdatePanelForgot" runat="server">
                     <ContentTemplate>
                <!-- 1. EMAIL INPUT PANEL -->
                <asp:Panel ID="pnlForgotEmail" runat="server" Visible="true">
                    <h1 class="loginTxt">Forgot Password</h1>
                    <div class="input-group">
                        <i class="fas fa-envelope"></i>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" SetFocusOnError="true" runat="server" ControlToValidate="txtForgotEmail" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ErrorMessage="Invalid Email" ControlToValidate="txtForgotEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="txtForgotEmail" runat="server" placeholder="Enter your Email" CssClass="form-control" />
                    </div>
                    <asp:Button ID="ForgotbtnSendOTP" runat="server" Text="Send OTP" CausesValidation="false" CssClass="btn btn-primary mt-2" OnClick="ForgotbtnSendOTP_Click"/>
                </asp:Panel>

                <!-- 2. OTP INPUT PANEL -->
                <asp:Panel ID="pnlForgotOTP" runat="server" Visible="false">
                    <h1 class="loginTxt">Verify OTP</h1>
                    <div class="input-group">
                        <i class="fas fa-lock"></i>
                        <asp:TextBox ID="txtForgotOTP" runat="server" placeholder="Enter OTP" CssClass="form-control" />
                    </div>
                    <asp:Button ID="btnVerifyForgotOTP" runat="server" Text="Verify OTP" CausesValidation="false" CssClass="btn btn-primary mt-2" OnClick="btnVerifyForgotOTP_Click"/>
                </asp:Panel>

                <!-- 3. RESET PASSWORD PANEL -->
                <asp:Panel ID="pnlResetPassword" runat="server" Visible="false">
                    <h1 class="loginTxt">Reset Password</h1>
                    <div class="input-group">
                        <i class="fas fa-key"></i>
                        <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" placeholder="New Password" CssClass="form-control" />
                    </div>
                    <div class="input-group">
                        <i class="fas fa-key"></i>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm Password" CssClass="form-control" />
                    </div>
                    <!-- Error message label -->
                    <div id="errorMessage"></div>
                    <asp:Button ID="btnResetPassword" runat="server" Text="Reset Password" CssClass="btn btn-primary mt-2" OnClick="btnResetPassword_Click" CausesValidation="false" OnClientClick="return validatePassword();"/>
                </asp:Panel>
            </ContentTemplate>
                    </asp:UpdatePanel>
                <div class="signup2">
                    Remembered? <a href="Login.aspx">Go back to Login</a>
                </div>
            </div>
        </div>
    </div>
</div>--%>
       <div id="forgotPasswordModal" class="modal">
        <div class="modal-content">
        <span class="close" id="closeForgotModal">&times;</span>
        <div class="main">
            <div class="login-section">
                <asp:UpdatePanel ID="UpdatePanelForgot" runat="server">
                     <ContentTemplate>
                <!-- 1. EMAIL INPUT PANEL -->
                <asp:Panel ID="pnlForgotEmail" runat="server" Visible="true">
                     <h1 class="loginTxt">Login</h1>
                    <div class="input-group">
                        <i class="fas fa-envelope"></i>
                              <asp:TextBox ID="ForgotEmail" runat="server" placeholder="Enter your Email" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" SetFocusOnError="true" runat="server" ControlToValidate="ForgotEmail" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div> 
                    <div class="input-group">
                        <i class="fas fa-key"></i>
                        <asp:TextBox ID="RandomPassText" runat="server" placeholder="Enter Password" CssClass="form-control" />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Display="Dynamic" SetFocusOnError="true" runat="server" ControlToValidate="RandomPassText" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                   <span id="generatedPassword" class="passwordspn"></span>
                    <asp:Button ID="RandomPasswordLogin" runat="server" Text="Log in" CausesValidation="false" CssClass="btn btn-primary mt-2" OnClick="RandomPasswordLogin_Click"/>
                </asp:Panel>
            </ContentTemplate>
                    </asp:UpdatePanel>
                <div class="signup2">
                    <asp:Label ID="PasswordLbl" runat="server" />
                     <div class="signup">Don't have an account? <a href="EnosisJobs.aspx"><u>Sign up</u></a></div>
                </div>
            </div>
        </div>
    </div>
</div>
      <!-- Forgot Password Modal -->
      <!-- Main Container -->
      <div class="container">
        <div class="card" style="border-bottom-left-radius:20px;border-bottom-right-radius:20px;">
            <div class="left" id="particleContainer">
                <h1>Welcome</h1>
                <h2>To Enosis Learning</h2>
                <h6>"Education is not the learning of facts, but the training of the mind to think."</h6>
            </div>
            <div class="right">
                <a href="index.aspx"><img src="/images/enosislogo.PNG" alt=""/></a>
                <div class="login-section">
                    <div class="input-group">
                        <i class="fas fa-user"></i>
                            <asp:RequiredFieldValidator ID="Required" runat="server" ControlToValidate="txtUserName" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                             <asp:TextBox ID="txtUserName" runat="server" placeholder="Username or Email"/>
                    </div>
                <div class="input-group">
                    <i class="fas fa-lock"></i>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"  placeholder="Password"/>
                            <span class="show" onclick="togglePassword()">Show</span>
                </div>
                <div class="options">
                    <label><asp:CheckBox ID="chkRemember" runat="server" Checked="true" />&nbsp;Remember me</label>
                       <asp:LinkButton ID="lnkForgotPassword" CssClass="test" runat="server" Text="Problem? Click here" OnClientClick="openForgotPasswordModal(); return false;"></asp:LinkButton>
                </div>
                <asp:Button ID="btnlogin" CssClass="btn btn-block py-2 btn-primary" runat="server"  Text="Sign In" OnClick="btnlogin_Click1" CausesValidation="false"/>
               <%-- <asp:Button ID="btnSendOTP" class="btn-secondary" OnClientClick="showModal(); return false;" Text="Sign in with AutoPassword" runat="server"/>--%>
                <asp:Button ID="btnSendOTP" class="btn-secondary" Text="Create New Password" runat="server"  OnClientClick="showModal(); return false;"/>
                <div class="signup">Don't have an account? <a href="EnosisJobs.aspx"><u>Sign up</u></a></div>
                </div>
            </div>
        </div>
    </div>
       <!-- Main Container -->
<%-- Toogle Password --%>
<script>
    function togglePassword() {
        const passwordInput = document.getElementById('txtPassword');
        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
        } else {
            passwordInput.type = 'password';
        }
    }
</script>
<%-- Floating Bubles Effect --%>
<script>
       const container = document.getElementById('particleContainer');
       for (let i = 0; i < 5; i++) {
           const particle = document.createElement('div');
           particle.className = 'particle';
           const size = Math.random() * 30 + 15;
           particle.style.width = size + 'px';
           particle.style.height = size + 'px';
           particle.style.left = Math.random() * 100 + '%';
           particle.style.top = Math.random() * 100 + '%';
           particle.style.animationDuration = (Math.random() * 5 + 5) + 's';
           particle.style.animationDelay = Math.random() * 5 + 's';
           container.appendChild(particle);
       }
   </script>
<%-- Login By OTP Modal --%>
<script>
    const modal = document.getElementById('myModal');
    const openBtn = document.getElementById('btnSendOTP');
    const closeBtn = document.getElementById('closeModal');
    openBtn.onclick = (event) => {
        event.preventDefault(); 
        modal.style.display = 'block';
    };

    closeBtn.onclick = () => {
        modal.style.display = 'none';
    };

    window.onclick = (event) => {
        if (event.target === modal) {
            modal.style.display = 'none';
        }
    };
</script>
<%-- Countdown Timer for OTP --%>
<script>
    let countdown = 60; // in seconds
    const timerSpan = document.getElementById("timer");
    const resendText = document.getElementById("resendText");

    const interval = setInterval(() => {
        countdown--;

        let minutes = Math.floor(countdown / 60);
        let seconds = countdown % 60;

        // Format MM:SS
        let formattedTime =
            (minutes < 10 ? "0" + minutes : minutes) + ":" +
            (seconds < 10 ? "0" + seconds : seconds);

        timerSpan.textContent = formattedTime;

        if (countdown === 0) {
            clearInterval(interval);
            resendText.innerHTML = "Resend code";
            resendText.style.color = "red"; // clickable color
            resendText.style.cursor = "pointer";
            resendText.style.pointerEvents = "auto";
            resendText.addEventListener("click", () => {
                location.reload();
            });
        }
    }, 1000);
</script>
<%-- Forgot Password Modal --%>
<%--<script type="text/javascript">
    function openForgotPasswordModal() {
        var modal = document.getElementById("forgotPasswordModal");
        modal.style.display = "block";
    }

    window.onload = function () {
        // OTP Modal ke Close Button
        var otpModal = document.getElementById("myModal");
        var otpClose = document.getElementById("closeModal");

        if (otpClose) {
            otpClose.onclick = function () {
                otpModal.style.display = "none";
            };
        }

        var forgotModal = document.getElementById("forgotPasswordModal");
        var forgotClose = document.getElementById("closeForgotModal");

        if (forgotClose) {
            forgotClose.onclick = function () {
                forgotModal.style.display = "none";
            };
        }

        window.onclick = function (event) {
            if (event.target == otpModal) {
                otpModal.style.display = "none";
            }
            if (event.target == forgotModal) {
                forgotModal.style.display = "none";
            }
        };
    };
</script>--%>
<%-- Password Expression Check --%>
<script>
    // Open modal function (already done)
    function openForgotPasswordModal() {
        document.getElementById("forgotPasswordModal").style.display = "block";

        // Generate random password
        let password = generateRandomPassword(6);
        document.getElementById("generatedPassword").innerText = "Your new password is: " + password;
    }

    // Close modal function
    document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("closeForgotModal").addEventListener("click", function () {
            document.getElementById("forgotPasswordModal").style.display = "none";
        });

        // Optional: Close if user clicks outside the modal
        window.onclick = function (event) {
            var modal = document.getElementById("forgotPasswordModal");
            if (event.target == modal) {
                modal.style.display = "none";
            }
        };
    });

    // Password generator
    function generateRandomPassword(length) {
        const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        let result = '';
        for (let i = 0; i < length; i++) {
            result += chars.charAt(Math.floor(Math.random() * chars.length));
        }
        return result;
    }
</script>
</form>
</body>
</html>

