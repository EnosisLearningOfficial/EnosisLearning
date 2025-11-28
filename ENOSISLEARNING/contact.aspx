<%@ Page Title="" Language="C#" MasterPageFile="~/LEARNING.Master"  AutoEventWireup="true" Async="true" CodeBehind="contact.aspx.cs" Inherits="ENOSISLEARNING.contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <script src="scripts/modernizr.js" type="text/javascript" lang="javascript" ></script>
   <link rel="stylesheet" href="./Online/mbr-additional.css" type="text/css" />
   <style type="text/css">
      .office-section {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
  justify-content: space-between;
  align-items: stretch;
  width: 100%;
}

.info-box {
  background: linear-gradient(135deg, #173151, #1f3a6e);
  border-radius: 10px;
  padding: 25px;
  flex: 1 1 calc(33.33% - 20px);
  display: flex;
  align-items: flex-start;
  color: #fff;
  box-shadow: 0 6px 15px rgba(0,0,0,0.15);
  transition: transform 0.4s ease, box-shadow 0.4s ease, background 0.4s ease;
  min-width: 280px; /* important for small screen wrapping */
  height:200px;
}

.info-box .icon {
  font-size: 35px;
  color: #ffd700;
  margin-right: 20px;
  transition: transform 0.3s ease, color 0.3s ease;
}

.info-box h5 {
  margin-bottom: 8px;
  font-weight: 700;
  font-size: 1.66789rem;
  color: #fff;
}

.info-box p {
  margin: 0;
  font-size: 1.43456rem;
  color: #f0f0f0;
  line-height: 1.5;
}

/* Hover Animation */
.info-box:hover {
  transform: translateY(-8px) scale(1.03);
  box-shadow: 0 15px 30px rgba(23, 49, 81, 0.6);
  background: linear-gradient(135deg, #1f3a6e, #173151);
}

.info-box:hover .icon {
  color: #00d4ff;
  transform: rotate(10deg) scale(1.1);
}

/* Responsive Adjustments */
@media (max-width: 992px) {
  .info-box {
    flex: 1 1 calc(50% - 20px);
  }
}

@media (max-width: 576px) {
  .info-box {
    flex: 1 1 100%;
  }
}

  .page-title .a:hover
  {
      color:white;
  }
  .Interview-Questions {
    width: 100%;
    height: 40%;
    background-color: transparent;
    padding: 10px;
}
.Interview-Questions > h3 {
    padding: 10px;
    font-size: 2rem;
    color: #333;
}

.frm .fa {
    position: relative;
    left: 18.5rem;
}
.frm > h3
{
 font-size: 2rem;
 color: #333;
  font-weight:100;
}
.myul {
    display: flex;
    flex-wrap: wrap;
    list-style-type: none;
    padding: 0;
    margin-top: 10px;
    justify-content: center;
    gap: 4px;
}

    .myul li {
        flex: 1 1 calc(20% - 25px); /* 4 buttons per row with gap */
        min-width: 100px;
        text-align: center;
        border-radius: 8px;
        box-shadow: 2px 2px 10px 1px gray;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

        .myul li:hover {
            transform: scale(1.03);
            box-shadow: 3px 3px 15px 2px #888;
        }

        .myul li a {
            display: block;
            padding: 10px 5px;
            color: #fff;
            font-weight: bold;
            font-family: Arial, sans-serif;
            text-decoration: none;
            border-radius: 8px;
        }
.lgmodal
{
    margin-top:-30px;
    height:100%;
}
.IQ
{
    height:300px;
}
 @media only screen and (min-width:286px) and (max-width: 494px) {
     .IQ
       {
           height:460px;
       }
 }
 @media only screen and (max-width: 285px) {
     .IQ
       {
           height:690px;
       }
 }
@media only screen and (min-width: 992px) and (max-width: 1169px) {
.IQ
{
    height:420px;
}
}
@media only screen and (min-width: 1170px) {
.IQ
{
    height:350px;
}
}
   .h3 i {
  font-size: 1.5em; 

}

  @media (max-width: 768px) {
  .h3 i {
    font-size: 1em;
  }
}
  .map
  {
      width:100%;
      height:540px;
      margin-top:10px;
      border-radius:10px;
  }
  /*Alert Box Styling*/
    .custom-alert-box {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        justify-content: center;
        align-items: center;
        z-index: 1000;
    }
    .alert-content {
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        width: 300px;
        text-align: center;
        position: relative;
    }

    .close-btn {
        position: absolute;
        top: 10px;
        right: 10px;
        font-size: 18px;
        font-weight: bold;
        color: #333;
        cursor: pointer;
    }

    .alert-content p {
        font-size: 16px;
        color: #333;
        margin: 20px 0;
    }

    .alert-content button {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 14px;
    }

    .alert-content button:hover {
        background-color: #0056b3;
    }
      /* Hover animation */
.training-program h3 i:hover {
  transform: scale(1.2) rotate(8deg);
  color: #4fd1c5; /* soft cyan on hover */
}
@keyframes pulse {
  0%, 100% { transform: scale(1); opacity: 1; }
  50% { transform: scale(1.2); opacity: 0.7; }
}
   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1"  runat="server">
   <div class="container-fluid py-5">
        <div class="row">
            <!-- LEFT SIDE -->
            <div class="col-lg-12 col-sm-12">
                <div class="training-program"><h3><i class="fa-solid fa-phone-volume me-2" style="color:salmon;animation: pulse 1.5s infinite;font-size:2.5rem"></i>
<span style="color:#FFA521;"> &nbsp;Get In Touch</span></h3></div>
            </div>
        </div>
       <div class="row">
                 <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
    <div class="pe-lg-4 border-end border-3" style="border-color:#173151;">

        <!-- ADDRESS & INFO SECTION -->
        <div class="office-section">

            <!-- BOX 1 - Our Office -->
            <div class="info-box">
                <div class="icon"><i class="fa-solid fa-building"></i></div>
                <div>
                    <h5>Our Office</h5>
                    <p>
                        Office No 205, 2nd Floor, Shoppers Orbit,<br/>
                        Beside Bhavna Dance Studio, Vishrantwadi,<br/>
                        Pune – 411015
                    </p>
                </div>
            </div>

            <!-- BOX 2 - Contact -->
            <div class="info-box">
                <div class="icon"><i class="fa-solid fa-phone"></i></div>
                <div>
                    <h5>Contact</h5>
                    <a href="tel:+91 7757012051"> <p>+91 7757012051  +91 7757012054</p></a>
                </div>
            </div>

            <!-- BOX 3 - Email -->
            <div class="info-box">
                <div class="icon"><i class="fa-solid fa-envelope"></i></div>
                <div>
                    <h5>Email</h5>
                    <p>training@enosislearning.com</p>
                </div>
            </div>
        </div>

        <!-- GOOGLE MAP -->
        <div class="bg-white rounded-4 shadow-sm p-3 mt-4"  map>
            <iframe src="https://maps.google.co.in/maps/ms?hl=en&amp;gl=in&amp;ie=UTF8&amp;oe=UTF8&amp;msa=0&amp;msid=209726770010496360628.0004c2070968a4c89e805&amp;ll=18.571328,73.875225&amp;spn=0.007527,0.00633&amp;t=m&amp;iwloc=0004c207100a33c88f8d5&amp;output=embed"
                frameborder="0" allowfullscreen class="map"></iframe>
        </div>

    </div>
</div>

                   <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
  <div class="frm mar-bt1" style="width:100%; border-radius:8px; box-shadow:0 6px 25px rgba(0,0,0,0.1); border:1px solid #cbd8db; background:#fff; padding:20px;">
    <h3 class="h3" style="margin-bottom:20px; color:#403633; font-weight:bold;text-decoration:underline;">
         <i class="fa-solid fa-headset me-2" style="margin-right:8px; color:#173151;"></i> 
        Contact Us</h3>

    <asp:Label ID="Label1" runat="server" />

    <%--<asp:RequiredFieldValidator ID="rMobile" ControlToValidate="txtMobile" ErrorMessage="Please enter Contact No" runat="server" CssClass="text-danger" Display="Dynamic" />
    <asp:RequiredFieldValidator ID="rEmail" ControlToValidate="txtEmail" ErrorMessage="Please enter Email" runat="server" CssClass="text-danger" Display="Dynamic" />--%>

    <div class="form-group">
      <input id="txtName" type="text" class="form-control" placeholder="Enter Name"/>
    </div>

      <div class="form-group">
   <input id="txtEmail" type="email" class="form-control" placeholder="Enter Email"/>
</div>

    <div class="form-group">
     <input id="txtMobile" type="text" class="form-control" placeholder="Enter Contact No"/>
    </div>

    <div class="form-group">
      <input id="txtSubject" type="text" class="form-control" placeholder="Enter Subject"/>
    </div>

    <div class="form-group">
     <input id="txtDescription" type="text" class="form-control" placeholder="Enter Description"/>
    </div>

    <div class="text-center">
     <input type="button" value="SUBMIT" class="btn btn-primary" onclick="SaveRecord();"  style="width:100%; font-weight:bold; background:linear-gradient(135deg, #173151, #1f3a6e);color:white;"/>
    </div>
  </div>
             <%-- Interview Section --%> 
     <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 IQ" style="width:100%; border-radius:8px; box-shadow:0 6px 25px rgba(0,0,0,0.1); border:1px solid #cbd8db; background:#fff;margin-bottom:10px;margin-top:10px;">
        <div class="Interview-Questions">
     <h3 class="h3" style="margin-bottom:10px; color:#403633; font-weight:bold;text-decoration:underline;">
            <i class="fa-solid fa-user-tie" style="margin-right:8px; color:#173151;"></i>
         Interview Questions</h3> 
     <ul class="myul" >
        <li style=" box-shadow:2px 2px 10px 1px gray;background-color:#ffffff;border:1px solid #1D3867"><a href="Interview_Questions.aspx?lag=JAVA" style="color:#1D3867;"> <i class="fa-brands fa-java icon-sm" style="font-size:2.5em;margin-right:8px;"></i> Java</a></li>
        <li style="background-color:#ffffff;border:1px solid #1D3867; box-shadow:2px 2px 10px 1px gray"><a href="Interview_Questions.aspx?lag=ManualTesting" style="color:#1D3867;"><i class="fa-solid fa-vial-circle-check" style="font-size:14px; margin-right:8px;"></i>Software Testing</a></li>
        <li  style="background-color:#ffffff;border:1px solid #1D3867;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=WebDesigning" style="color:#1D3867;"><i class="fa-solid fa-code" style="font-size:14px; margin-right:8px;"></i>Web Designing</a></li>     
        <li style="background-color:#ffffff;border:1px solid #1D3867;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=C" style="color:#1D3867;"> <i class="fa-solid fa-c" style="font-size:14px;margin-right:8px;"></i>C Language</a></li>
        <li  style="background-color:#ffffff;border:1px solid #1D3867;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=SQLServer" style="color:#1D3867;"><i class="fa-solid fa-database" style="font-size:14px;margin-right:8px;"></i>SQL SERVER </a></li>
        <li style="background-color:#ffffff;border:1px solid #1D3867;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=POWERBI" style="color:#1D3867;"><i class="fa-solid fa-chart-pie" style="font-size:14px;margin-right:8px;"></i>POWERBI</a></li>
        <li  style="background-color:#ffffff;border:1px solid #1D3867;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=Csharp" style="color:#1D3867;"><i class="fa-solid fa-code" style="font-size:14px;margin-right:8px;"></i>C#.Net</a></li> 
        <li style="background-color:#ffffff;border:1px solid #1D3867;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=ASP.NET" style="color:#1D3867;"><i class="fa-brands fa-microsoft" style="font-size:14px;margin-right:8px;"></i>ASP.Net</a></li>
        <li  style="background-color:#ffffff;border:1px solid #1D3867;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=Selenium" style="color:#1D3867;"><i class="fa-solid fa-robot" style="font-size:14px;margin-right:8px;"></i>Selenium</a></li>                               
        <li style="background-color:#ffffff;border:1px solid #1D3867;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=SSIS" style="color:#1D3867;"><i class="fa-solid fa-arrows-spin" style="font-size:14px;margin-right:8px;"></i>SSIS</a></li>
        <li  style="background-color:#ffffff;border:1px solid #1D3867;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=SSRS" style="color:#1D3867;"><i class="fa-solid fa-chart-bar" style="font-size:14px;margin-right:8px;"></i>SSRS</a></li>
        <li style="background-color:#ffffff;border:1px solid #1D3867;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=SSAS" style="color:#1D3867;"><i class="fa-solid fa-cubes" style="font-size:14px;margin-right:8px;"></i>SSAS</a></li>                        
        <li  style="background-color:#ffffff;border:1px solid #1D3867;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=MVC" style="color:#1D3867"><i class="fa-solid fa-layer-group" style="font-size:14px;margin-right:8px;"></i>ASP.NET MVC</a></li>
    </ul>
</div>
   </div>
</div>
            <!-- RIGHT SIDE (FORM) -->
       </div>
        <div id="customAlertBox" class="custom-alert-box">
                <div class="alert-content">
                    <span class="close-btn" onclick="closeAlertBox()">&times;</span>
                    <p id="alertMessage"></p>
                    <button type="button" onclick="closeAlertBox()">OK</button>
                </div>
            </div>
  </div>
    <script src="Scripts/jquery-1.11.3.min.js"></script>
   <script type="text/javascript">
       //Alert Box Method//
       function showAlertBox(message) {
           document.getElementById("alertMessage").innerText = message;
           document.getElementById("customAlertBox").style.display = "flex"; // Show the alert box
       }
       //Close Alert Box Method//
       function closeAlertBox() {
           document.getElementById("customAlertBox").style.display = "none"; // Hide the alert box
       }

       // Method For SaveRecord function//
       function SaveRecord() {
           var name = $('#txtName').val().trim();
           var email = $('#txtEmail').val().trim();
           var contact = $('#txtMobile').val().trim();
           var subject = $('#txtSubject').val().trim();
           var remark = $('#txtDescription').val().trim();

           if (name === "" || email === "" || contact === "" || subject === "" || remark === "") {
               showAlertBox("Please fill in all fields before submitting.");
               return;
           }

           $.ajax({
               type: 'POST',
               url: 'contact.aspx/SaveRecord',
               data: JSON.stringify({
                   Name: name,
                   Email: email,
                   Contact: contact,
                   Subject: subject,
                   Remark: remark
               }),
               contentType: 'application/json; charset=utf-8',
               dataType: 'json',
               success: function (response) {
                   showAlertBox('WE HAVE RECEIVED YOUR DETAILS. WILL CONTACT YOU AS SOON AS POSSIBLE');
                   $('#txtName').val('');
                   $('#txtEmail').val('');
                   $('#txtMobile').val('');
                   $('#txtSubject').val('');
                   $('#txtDescription').val('');
               },
               error: function (xhr, status, error) {
                   showAlertBox("Error: " + error);
               }
           });
       }
   </script>
</asp:Content>