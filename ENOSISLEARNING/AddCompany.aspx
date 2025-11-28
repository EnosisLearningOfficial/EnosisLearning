<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="AddCompany.aspx.cs" Inherits="ENOSISLEARNING.AddCompany1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Font-->
<link rel="stylesheet" type="text/css" href="company/css/montserrat-font.css" />
<link rel="stylesheet" type="text/css" href="company/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css" />
<!-- Main Style Css -->
<!-- Main Style Css -->
<link rel="stylesheet" href="company/css/style.css"/>
<!-- Mobile Specific Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- Font-->
<link rel="stylesheet" type="text/css" href="company/css/roboto-font.css">
<link rel="stylesheet" type="text/css" href="company/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
<!-- datepicker -->
<link rel="stylesheet" type="text/css" href="company/css/jquery-ui.min.css">


    <style>
	* {
	font-family: 'Montserrat', sans-serif;
}
     .container
{
   width:900px;
   height:100%;
   margin-top :5px;
   margin:auto;
}  
	.back-btn {
    background-color: #ccc;
    color: #333;
    padding: 10px 20px;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    height: 48px;
}

.back-btn:hover {
    background-color: #aaa;
}

.register{
    background-color: #ccc;
color: #333;
padding: 10px 20px;
border: none;
border-radius: 5px;
cursor: pointer;
}
.register:hover {
    background-color: #aaa;
}
	.next-btn {
    background-color: #ccc;
    color: #333;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.next-btn:hover {
    background-color: #aaa;
}

  .form-register .steps {
     margin-bottom: 0px;
   }
.form-register .content {
    margin: 0 40px 0 40px;
   -webkit-box-shadow: 0px 3px 10px 0px rgba(0, 0, 0, 0.15);
    -webkit-border-radius: 5px;
    padding: 10px 55px 13px;
}
.actions ul {
    list-style: none;
    padding-left: 0;
    padding: 0 20px;
    margin: 10px 0;
    display: flex;
    display: -webkit-flex;
    justify-content: space-between;
    -o-justify-content: space-between;
    -ms-justify-content: space-between;
    -moz-justify-content: space-between;
    -webkit-justify-content: space-between;
}


.form-register .steps li a .title .step-icon {
	width: 30px;
	height: 30px;
	font-size: 15px;
}
	.form-register .steps ul {
		display: flex;
		display: -webkit-flex;
		list-style: none;
		padding-left: 280px;
	}
   .actions ul li a {
   color: #fff;
   text-decoration: none;
   padding: 13px;
   }

    .inner .form-row .form-holder input {
     padding: 13px 0px 8px;
    border: none;
    border-bottom: 2px solid #e5e5e5;
    outline: none;
    font-family: 'Roboto', sans-serif;
    -webkit-box-sizing: border-box;
        }
    .inner .form-row .form-holder input, .inner .form-row .form-holder select {
    padding: 13px 0px 8px;
    border: none;
    border-bottom: 2px solid #e5e5e5;
    -webkit-appearance: unset;
    outline: none;
    font-family: 'Roboto', sans-serif;
    font-weight: 400;
    -webkit-box-sizing: border-box;
        }
    .actions ul li:first-child {
    background: orange;
    margin-left: 60.9%;
}
    
  </style>
	
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="container">
<%--     <div class="page-content" style="background-color:white">--%>
    
     <div class="wizard-v3-content" style="margin-top: 20px;margin-left: 20px;">
         <div class="wizard-form">
            <%-- <div class="wizard-header" style="padding-top: 1px;padding-bottom: 2px;">
                 <h3 class="heading">Your Company Details</h3>
                 <p>Fill all form field to go next step</p>
             </div>--%>

   <div id="form-total" class="form-register" action="#" method="post" >
   <!-- SECTION 1 -->
   <h2>
       <span class="step-icon"><i class="zmdi zmdi-account"></i></span>
       <span class="step-text" style="margin-left: -70px;">Company Details</span>
   </h2>
   <section>
       <div id="leftForm" class="form-left" runat="server" style="display:block;">
           <div class="inner">
               <h3 style="padding-bottom: 0px;">Company Information:</h3>
               <div class="form-row">
                   <div class="form-holder form-holder-2">

                       <input type="text" name="company" class="company" id="txt_companyname" style="width: 580px;" placeholder="Company Name" runat="server" required="required" /><span style='color:Red;'>*</span>

                   </div>
               </div>
               <div class="form-row">
                   <div class="form-holder form-holder-2">
                       <input type="text" name="p_web" id="txt_companywebsite" style="width: 580px; padding-top: 0px;" class="input-text" required="required" placeholder="Company Website" runat="server" /><span style='color:Red;'>*</span>
                   </div>
               </div>
               <div class="form-row" style="margin-left: 2px;">
				<div class="form-holder">
			     <div class="form-row form-row-1">
                   <select name="Technology" id="drp_Technology" style="width: 280px; padding-top: 0px;" runat="server">
                       <option value="Technology">Technology</option>
                       <option value=".NET">.NET</option>
                       <option value="JAVA">JAVA</option>
                       <option value="DB">Database</option>
                       <option value="TESTING">TESTING</option>
                       <%-- <option value="SAPT">SAP</option>
                        <option value="TRA">TRAINER</option>--%>
                   </select><span style='color:Red;'>*</span>
                   <span class="select-btn">
                       <i class="zmdi zmdi-chevron-down"></i>
                   </span>
                 </div>
				</div>
				<div class="form-holder">
			 <div class="form-row form-row-2">
                 <select name="Company Type" id="drp_CompanyType" style="width: 280px; padding-top: 0px; margin-left: 9px;" runat="server">
                     <option value="Company Type">Company Type</option>
                     <option value="IT Services">IT Services</option>
                     <option value="Recruitment">Consulting</option>
                 </select><span style='color:Red;margin-right: -24px;'>*</span>
                 <span class="select-btn">
                     <i class="zmdi zmdi-chevron-down"></i>
                 </span>
                 </div>
				</div>
            </div>
               <div class="form-row">
                   <div class="form-holder form-holder-2">
                       <input type="text" name="your_address" id="txtCompanyAddress" style="width: 580px; padding-top: 0px;" class="input-text" required="required" placeholder="Company Address" runat="server" /><span style='color:Red;'>*</span>
                   </div>
               </div>
               <div class="form-row">
                   <div class="form-holder form-holder-2">
                       <input type="text" name="your_address" id="txtCompanyContactNo" style="width: 580px; padding-top: 0px;" class="input-text" required="required" placeholder="Contact No" runat="server" /><span style='color:Red;'>*</span>
                   </div>
               </div>
               <div class="form-row">
                   <div class="form-holder form-holder-2">
                       <input type="text" name="your_address" id="txtcompanyemailid" style="width: 580px; padding-top: 0px;" class="input-text" required="required" placeholder="Contact EmailId" runat="server" /><span style='color:Red;'>*</span>
                   </div>
               </div>
               <div class="form-row">
                   <div class="form-holder form-holder-2">
                       <input type="text" name="your_comments" id="txtcomments" style="width: 580px; padding-bottom: 0px;" class="input-text" required="required" placeholder="Comments" runat="server" /><span style='color:Red;'>*</span>
                   </div>

               </div>
                <asp:Button ID="Registerbtn" name="register" OnClick="Registerbtn_Click" class="register" Text="Register" runat="server" Width="130px" style="background: #24c1e8;border-radius: 5px;height: 48px; color: white; margin-left: 240px;" /> 

           <%--    <div class="form-row">
                   <div class="form-row-last" style="text-align: center;">
                       <asp:Button ID="btnRegister" name="register" OnClick="btnRegister_Click" class="register" Text="Register" runat="server" Width="130px" style="background: #4835d4;color: white;border-radius: 10px;height: 48px;" /> 

                       <asp:Button id="btnNext" type="button" Width="130px" OnClick="btnNext_Click" Text="Next" runat="server" style="background: #4835d4;height: 48px;color: white;border-radius: 10px;" class="next-btn" />

                   </div>
               </div>--%>
           </div>
       </div>
   </section>
   <!-- SECTION 2 -->
   <h2>
       <span class="step-icon"><i class="zmdi zmdi-lock"></i></span>
       <span class="step-text" style="margin-left: -30px;">Contact Details</span>
   </h2>
   <section>
       <div id="rightForm" runat="server" class="form-right">
           <div class="inner">
               <h3 style="padding-bottom: 0px;">Contact Information:</h3>
               <div class="form-row">
                   <div class="form-holder form-holder-1">
                       <%--<input type="text" name="street" class="street" id="txtPContactName" placeholder="Primary Contact Name" required="required" runat="server" style="width: 480px;" /><span style='color:Red;'>*</span>--%>
                       <input type="text" name="street" class="street" id="txtPContactName" placeholder="Primary Contact Name"  runat="server" style="width: 480px;" />
                   </div>
               </div>
               <div class="form-row">
                   <div class="form-holder form-holder-1">
                       <input type="text" name="additional" class="additional" id="txtPContactEmail" placeholder="Primary Contact EmailId"  runat="server" style="width: 480px; padding-top: 0px;" />
                   </div>
               </div>
               <div class="form-row">
                   <div class="form-holder">
                       <input type="text" name="additional" class="additional" style="width: 260px; padding-top: 0px;" id="txtPDesignation" placeholder="Designation" runat="server" />
                   </div>
                   <div class="form-holder">
                       <input type="text" name="additional" class="additional" style="width: 260px; padding-top: 0px;" id="txtPContactNo" placeholder="Contact No"  runat="server" />
                   </div>
               </div>
               <div class="form-row">
                    <div class="form-holder form-holder-2">
                   <input type="text" name="street" class="street" style="width: 580px; padding-top: 0px;" id="txtSContactName" placeholder="Secondary Contact Name"  runat="server" />
                        </div>
               </div>
               <div class="form-row">
                   <div class="form-holder form-holder-2">
                       <input type="text" name="additional" class="additional" style="width: 580px; padding-top: 0px;" id="txtSContactEmail" placeholder="Secondary Contact EmailId"  runat="server" />
                   </div>
               </div>
               <div class="form-row">
                   <div class="form-holder">
                       <input type="text" name="additional" class="additional" style="width: 260px; padding-top: 0px;" id="txtSDesignation" placeholder="Designation" runat="server" />
                   </div>
                   <div class="form-holder">
                       <input type="text" name="additional" class="additional" style="width: 260px; padding-top: 0px;" id="Text1" placeholder="Contact No"  runat="server" />
                   </div>
               </div>
               <div class="form-row">
                   <div class="form-holder form-holder-1">
                       <input type="text" name="additional" class="additional" style="width: 480px; padding-bottom: 0px;" id="txtSContactNo" placeholder="Contact No"  runat="server" />
                   </div>
               </div>

               <!-- Back Button to go back to leftForm -->
               <div class="form-row-last" style="text-align: center;">
                    <%-- <asp:Button id="btnBack" type="button" Width="130px" OnClick="btnBack_Click" Text="Previous" runat="server" style="background: #CCCCCC;height: 48px;color:black;border-radius: 10px;" class="next-btn" />--%>

                  <%-- <asp:Button ID="Registerbtn" name="register" OnClick="Registerbtn_Click" class="register" Text="Register" runat="server" Width="130px" style="background: #24c1e8;border-radius: 5px;height: 48px; color: white;" /> --%>
               </div>
           </div>
       </div>
   </section>

  </div>

         </div>
      </div>
          
 <%--    </div>--%>
  </div>
	



	<script type="text/javascript">
      
        // Function to move from leftForm to rightForm (called when "Next" button is clicked)
        function moveToRightForm() {
            var leftForm = document.getElementById('leftForm');
            var rightForm = document.getElementById('rightForm');

            // Hide the left form and show the right form
            leftForm.style.display = 'none';
            rightForm.style.display = 'block';
        }

        // Function to go back from rightForm to leftForm (called when "Back" button is clicked)
        function goBackToLeftForm() {
            var leftForm = document.getElementById('leftForm');
            var rightForm = document.getElementById('rightForm');

            // Hide the right form and show the left form
            rightForm.style.display = 'none';
            leftForm.style.display = 'block';
        }
    

    </script>
<%--    <script src="CompanyStyles/js/jquery-3.3.1.min.js"></script>
<script src="CompanyStyles/js/jquery.steps.js"></script>
<script src="CompanyStyles/js/jquery-ui.min.js"></script>
<script src="CompanyStyles/js/main.js"></script>--%>
</asp:Content>
