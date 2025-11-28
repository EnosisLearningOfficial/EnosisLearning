<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="PostVacancy.aspx.cs" Inherits="ENOSISLEARNING.PostVacancy" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
     *
 {
     font-family: 'Montserrat', sans-serif !important;
 }
/* Large devices (desktops) */
@media (min-width: 1200px) {
    *
    {
        margin:0;
        padding:0;
        box-sizing:border-box;
    }
    html,body
    {
        width:100%;
        height:100%;
    }
 .MainDiv{
    /* width:1000px;*/
    width:95%;
     height:100%;
     margin-top :5px;
     margin:auto;
     background-color:white;
     border-radius:15px;
     border-style:solid;border-color:#1d96b2;
     align-content:center;
     border-width:3px;
     margin-top: 2px;
     padding:0px 7px 0px 7px;
 }
 .custom-combo input {
    border-radius: 15px !important;
    height: 30px !important;
    width: 300px !important;
    text-align: center;
}

  .TxtStyle{
   border-radius: 15px;
   text-align:center;
 }
 .CompanyInfo
 {
    padding: 20px 0;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 15px;
    border: 1px solid #1d96b2;
    margin: 5px;
    margin-bottom: 0px;
    padding: 15px;
    padding-top: 2px;
    padding-bottom: 1px;
    height: 170px;
 }
 .Save
 {
     border-style:Solid;
     border-radius: 15px;
     text-align:center;
     background-color: #1d96b2;
     margin-top: -15px;
 }
   .buttons
{
    display:flex;
    margin:5px 0px 0px 0px;
}
    .btn:hover
  {
 background-color:tomato;
  transform: scale(1.1);
  color:white;
  }
   .btn-custom {
    
    height: 35px;
    display: inline-block;
    padding: 5px 5px;
    text-decoration: none;
    color: #fff;
    background-color: #1d96b2;
    border-radius: 15px;
    transition: all 0.3s ease;
}
   .form-group
   {
       position:relative;
   }
      .btn-custom2 {
    
    height: 30px;
    display: inline-block;
    padding: 5px 5px;
    text-decoration: none;
    color: #fff;
    background-color: #1d96b2;
    border-radius: 15px;
    transition: all 0.3s ease;
    position:absolute;
    right:65px;
    top:325px;
}
   span {
    position: relative;
    top: 8%;
    left: 5%;
    column-gap: 10px;
    font-size: 20px;
    font-family: 'Montserrat', sans-serif;
    font-weight: 600;
    color: white;
}
   .span{
    top: 8%;
    left: 5%;
    font-size: 12px;
    font-family: 'Montserrat', sans-serif;
   }
    .reqMessage {
     color: red;
    visibility: visible;
    font-size: small;
       }
}
@media (min-width: 992px) and (max-width: 1199.98px) {
    *
    {
        margin:0;
        padding:0;
        box-sizing:border-box;
    }
    html,body
    {
        width:100%;
        height:100%;
    }
 .MainDiv{
    /* width:1000px;*/
    width:95%;
     height:100%;
     margin-top :5px;
     margin:auto;
     background-color:white;
     border-radius:15px;
     border-style:solid;border-color:#1d96b2;
     align-content:center;
     border-width:3px;
     margin-top: 2px;
     padding:0px 7px 0px 7px;
 }
 .custom-combo input {
    border-radius: 15px !important;
    height: 30px !important;
    width: 300px !important;
    text-align: center;
}

  .TxtStyle{
   border-radius: 15px;
   text-align:center;
 }
 .CompanyInfo
 {
    padding: 20px 0;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 15px;
    border: 1px solid #1d96b2;
    margin: 5px;
    margin-bottom: 0px;
    padding: 15px;
    padding-top: 2px;
    padding-bottom: 1px;
    height: 170px;
 }
 .Save
 {
     border-style:Solid;
     border-radius: 15px;
     text-align:center;
     background-color: #1d96b2;
     margin-top: -15px;
 }
   .buttons
{
    display:flex;
    margin:5px 0px 0px 0px;
}
    .btn:hover
  {
 background-color:tomato;
  transform: scale(1.1);
  color:white;
  }
   .btn-custom {
    
    height: 35px;
    display: inline-block;
    padding: 5px 5px;
    text-decoration: none;
    color: #fff;
    background-color: #1d96b2;
    border-radius: 15px;
    transition: all 0.3s ease;
}
   .btn-custom2 {
    
    height: 30px;
    display: inline-block;
    padding: 5px 5px;
    text-decoration: none;
    color: #fff;
    background-color: #1d96b2;
    border-radius: 15px;
    transition: all 0.3s ease;
    position:absolute;
    right:65px;
    top:325px;
}
   span {
    position: relative;
    top: 8%;
    left: 5%;
    column-gap: 10px;
    font-size: 20px;
    font-family: 'Montserrat', sans-serif;
    font-weight: 600;
    color: white;
}
   .span{
    top: 8%;
    left: 5%;
    font-size: 12px;
    font-family: 'Montserrat', sans-serif;
   }
    .reqMessage {
     color: red;
    visibility: visible;
    font-size: small;
       }
}
@media (min-width: 768px) and (max-width: 991.98px) {
    *
    {
        margin:0;
        padding:0;
        box-sizing:border-box;
    }
    html,body
    {
        width:100%;
        height:100%;
    }
 .MainDiv{
    /* width:1000px;*/
    width:95%;
     height:100%;
     margin-top :5px;
     margin:auto;
     background-color:white;
     border-radius:15px;
     border-style:solid;border-color:#1d96b2;
     align-content:center;
     border-width:3px;
     margin-top: 2px;
     padding:0px 7px 0px 7px;
 }
 .custom-combo input {
    border-radius: 15px !important;
    height: 30px !important;
    width: 300px !important;
    text-align: center;
}

  .TxtStyle{
   border-radius: 15px;
   text-align:center;
 }
 .CompanyInfo
 {
    padding: 20px 0;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 15px;
    border: 1px solid #1d96b2;
    margin: 5px;
    margin-bottom: 0px;
    padding: 15px;
    padding-top: 2px;
    padding-bottom: 1px;
    height: 170px;
 }
 .Save
 {
     border-style:Solid;
     border-radius: 15px;
     text-align:center;
     background-color: #1d96b2;
     margin-top: -15px;
 }
   .buttons
{
    display:flex;
    margin:5px 0px 0px 0px;
}
    .btn:hover
  {
 background-color:tomato;
  transform: scale(1.1);
  color:white;
  }
   .btn-custom {
    
    height: 35px;
    display: inline-block;
    padding: 5px 5px;
    text-decoration: none;
    color: #fff;
    background-color: #1d96b2;
    border-radius: 15px;
    transition: all 0.3s ease;
}
         .btn-custom2 {
    
    height: 30px;
    display: inline-block;
    padding: 5px 5px;
    text-decoration: none;
    color: #fff;
    background-color: #1d96b2;
    border-radius: 15px;
    transition: all 0.3s ease;
    position:absolute;
    right:65px;
    top:325px;
}
   span {
    position: relative;
    top: 8%;
    left: 5%;
    column-gap: 10px;
    font-size: 20px;
    font-family: 'Montserrat', sans-serif;
    font-weight: 600;
    color: white;
}
   .span{
    top: 8%;
    left: 5%;
    font-size: 12px;
    font-family: 'Montserrat', sans-serif;
   }
    .reqMessage {
     color: red;
    visibility: visible;
    font-size: small;
       }
}
@media (min-width: 576px) and (max-width: 767.98px) {
    *
    {
        margin:0;
        padding:0;
        box-sizing:border-box;
    }
    html,body
    {
        width:100%;
        height:100%;
    }
 .MainDiv{
    /* width:1000px;*/
    width:95%;
     height:100%;
     margin-top :5px;
     margin:auto;
     background-color:white;
     border-radius:15px;
     border-style:solid;border-color:#1d96b2;
     align-content:center;
     border-width:3px;
     margin-top: 2px;
     padding:0px 7px 0px 7px;
 }
 .custom-combo input {
    border-radius: 15px !important;
    height: 30px !important;
    width: 300px !important;
    text-align: center;
}

  .TxtStyle{
   border-radius: 15px;
   text-align:center;
 }
 .CompanyInfo
 {
    padding: 20px 0;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 15px;
    border: 1px solid #1d96b2;
    margin: 5px;
    margin-bottom: 0px;
    padding: 15px;
    padding-top: 2px;
    padding-bottom: 1px;
    height: 170px;
 }
 .Save
 {
     border-style:Solid;
     border-radius: 15px;
     text-align:center;
     background-color: #1d96b2;
     margin-top: -15px;
 }
   .buttons
{
    display:flex;
    margin:5px 0px 0px 0px;
}
    .btn:hover
  {
 background-color:tomato;
  transform: scale(1.1);
  color:white;
  }
   .btn-custom {
    
    height: 35px;
    display: inline-block;
    padding: 5px 5px;
    text-decoration: none;
    color: #fff;
    background-color: #1d96b2;
    border-radius: 15px;
    transition: all 0.3s ease;
}
       .btn-custom2 {
    
    height: 30px;
    display: inline-block;
    padding: 5px 5px;
    text-decoration: none;
    color: #fff;
    background-color: #1d96b2;
    border-radius: 15px;
    transition: all 0.3s ease;
    position:absolute;
    right:65px;
    top:325px;
}
   span {
    position: relative;
    top: 8%;
    left: 5%;
    column-gap: 10px;
    font-size: 20px;
    font-family: 'Montserrat', sans-serif;
    font-weight: 600;
    color: white;
}
   .span{
    top: 8%;
    left: 5%;
    font-size: 12px;
    font-family: 'Montserrat', sans-serif;
   }
    .reqMessage {
     color: red;
    visibility: visible;
    font-size: small;
       }
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
  <div class="MainDiv" >

    <div class="modal-header" style="border-style:none;padding-top: 3px;">
      
        <center><h5 class="modal-title" ><b style="color: #1d96b2;font-weight: 500;">Post Vacancy Details </b></h5></center> </div><br /><br />
   <div class="form-horizontal" runat="server">


  <div id="BtnDive">

  <div class="form-group" style="margin-bottom:0px">     

  <!-- DrpCompany Name -->
    <label class="col-xs-10 col-sm-2 col-md-2 col-lg-2" for="CompanyName"><dive style="color:Red;">*</dive>Company Name:</label>
     
<div class="col-xs-10 col-sm-4 col-md-4 col-lg-4">
  
<ajaxToolkit:ComboBox 
    ID="CompanyName" 
    runat="server" 
    CssClass="custom-combo"
    AutoPostBack="true"  
    OnSelectedIndexChanged="CompanyName_SelectedIndexChanged"   
    AutoCompleteMode="SuggestAppend" 
    ValidationGroup="test" />

<asp:CustomValidator 
    ID="cvCompanyName" 
    runat="server" 
    ControlToValidate="CompanyName" 
    ErrorMessage="Please select a company." 
    Display="Dynamic" 
    ForeColor="Red"
    ClientValidationFunction="validateCompanyName" 
    OnServerValidate="cvCompanyName_ServerValidate"
    ValidationGroup="test" />
    </div>

      <button runat="server" id="btnAddCompany" class="btn btn-custom"  onserverclick="btnAddCompany_ServerClick" style="margin-left: 40px;"> 
     <i style="font-size: 20px; float:right;">
         <img src="img/candidate.png" height="30" style="width: 42px" /></i><span style="font-size: 15px;font:normal;"> Add Company</span>
     </button>&nbsp;&nbsp;
     <button runat="server" id="btnViewCompany" class="btn btn-custom" onserverclick="btnViewCompany_ServerClick">
       <i style="font-size: 20px; float:right;">
     <img src="img/candidate.png" height="30" style="width: 42px" /></i><span style="font-size: 15px;font:normal;"> View Company</span>
     </button>
 </div>
  </div> 

<div id="CompanyInformation" name="CompanyInfo" class="CompanyInfo" runat="server">
 <div class="form-group">
 <!-- Company Code -->  
    <label class="col-xs-10 col-sm-2 col-md-2 col-lg-2" for="CompanyCode">Company Code:</label>
      <div class="requiredstar col-xs-10 col-sm-4 col-md-4 col-lg-4">
        <asp:TextBox ID="TxtCompanyCode" CssClass="form-control form-control-lg TxtStyle" MaxLength="120" runat="server"  placeholder="Enter_CompanyCode"  />
         
      </div>
     <!-- Address --> 
    <label class="col-xs-10 col-sm-2 col-md-2 col-lg-2c" for="Address">Address:</label>
      <div class="col-xs-10 col-sm-4 col-md-4 col-lg-4">
          <div class="side-by-side clearfix">
            <asp:TextBox ID="TextAddress" CssClass="form-control form-control-lg TxtStyle" MaxLength="120" runat="server"  placeholder="Enter_Address"  />
           
          </div>
      </div>
  </div>   
            
 <div class="form-group">

 <!-- Contact Person -->  
   <label class="col-xs-10 col-sm-2 col-md-2 col-lg-2" for="ContactPerson">Contact Person:</label>
      <div class="requiredstar col-xs-10 col-sm-4 col-md-4 col-lg-4">
         <asp:TextBox ID="TextContactPerson" CssClass="form-control form-control-lg TxtStyle" MaxLength="120" runat="server"  placeholder="Enter_Contact_Person"  />
         
      </div>

    <!-- Phone No -->
   <label class="col-xs-10 col-sm-2 col-md-2 col-lg-2" for="PhoneNo">Phone No:</label>
      <div class="col-xs-10 col-sm-4 col-md-4 col-lg-4">
          <div class="side-by-side clearfix">
            <asp:TextBox ID="TextPhoneNo" CssClass="form-control form-control-lg TxtStyle" runat="server"  placeholder="Enter_PhoneNo"  MaxLength="15" inputmode="numeric" pattern="[0-9]*" />                     
          </div>
      </div>
  </div> 
           
 <div class="form-group">

  <!-- Email -->  
    <label class="col-xs-10 col-sm-2 col-md-2 col-lg-2" for="Email">Email:</label>
      <div class="requiredstar col-xs-10 col-sm-4 col-md-4 col-lg-4">
          <asp:TextBox ID="TextEmail" CssClass="form-control form-control-lg TxtStyle" MaxLength="120" runat="server"  placeholder="Enter_Email"  />
         
      </div>

     <!-- DrpWebsite --> 
   <label class="col-xs-10 col-sm-2 col-md-2 col-lg-2" for="Website">Website:</label>
      <div class="col-xs-10 col-sm-4 col-md-4 col-lg-4">
          <div class="side-by-side clearfix">
            <asp:TextBox ID="TextWebsite" CssClass="form-control form-control-lg TxtStyle" MaxLength="120" runat="server"  placeholder="Enter_Website"  />
           
          </div>
        
      </div>
  </div> 

 <asp:Button ID="HideBtn" Text="Hide" runat="server" OnClick="HideBtn_Click"  class="btn btn-primary br Save btn-custom2 " CausesValidation="false"/>
 
</div>
<div style="border-color:#1d96b2; border-style:solid; align-content:center; border-width:1px; margin-bottom: 10px;"></div>
          
  <div class="form-group">
    <!--Position Name/Job Title -->
       <label class="col-xs-10 col-sm-2 col-md-2 col-lg-2" for="PositionName"><dive style="color:Red;">*</dive>  Position Name/Job Title:</label>
      <div class="col-xs-10 col-sm-4 col-md-4 col-lg-4">
          <div class="side-by-side clearfix" style="height: 1px;">
              
               <asp:TextBox ID="TxtPositionName" CssClass="form-control form-control-lg TxtStyle TxtStyle" MaxLength="120" runat="server"  placeholder="Position Name/Job Title"  />

               <asp:RequiredFieldValidator ID="rfvPName" ValidationGroup="test" ControlToValidate="TxtPositionName" ErrorMessage="Position Name  is required." ForeColor="Red" runat="server" CssClass="reqMessage float-right"></asp:RequiredFieldValidator>

              

          </div>
      </div>

        <!-- Job Location -->
        <label class="col-xs-10 col-sm-2 col-md-2 col-lg-2" for="JobLocation"><dive style="color:Red;">*</dive>  Job Location:</label>
      <div class="requiredstar col-xs-10 col-sm-4 col-md-4 col-lg-4">
            <asp:TextBox ID="TxtJobLocation" CssClass="form-control form-control-lg TxtStyle TxtStyle" MaxLength="120" runat="server"  placeholder="Enter_Job_Location"  />

          <asp:RequiredFieldValidator ID="rfvTxtJobLocation" ValidationGroup="test" ControlToValidate="TxtJobLocation" ErrorMessage="JobLocation is required." Display="Dynamic" SetFocusOnError="true"  ForeColor="Red" runat="server" CssClass="reqMessage float-right"></asp:RequiredFieldValidator>

      </div>
  </div>


 <div class="form-group">
        <!-- Job Description -->
        <label class="col-xs-10 col-sm-2 col-md-2 col-lg-2" for="JobDescription"><dive style="color:Red;">*</dive>  Job Description:</label>
      <div class="col-xs-10 col-sm-4 col-md-4 col-lg-4">
          <div class="side-by-side clearfix" style="height: 1px;">
            <asp:TextBox ID="TxtJobDescription" CssClass="form-control form-control-lg TxtStyle" MaxLength="820" runat="server"  placeholder="Enter_Job_Description"  />

                <asp:RequiredFieldValidator ID="rfvTxtJobDescription" ValidationGroup="test" Display="Dynamic" SetFocusOnError="true" ControlToValidate="TxtJobDescription" ErrorMessage=" Job Description  is required." ForeColor="Red" runat="server" CssClass="reqMessage float-right span"></asp:RequiredFieldValidator>
        
            
          </div>
      </div>
    <!-- Primary Skills -->
         <label class="col-xs-10 col-sm-2 col-md-2 col-lg-2 " for="PrimarySkills"><dive style="color:Red;">*</dive>  Primary Skills:</label>
      <div class="requiredstar col-xs-10 col-sm-4 col-md-4 col-lg-4">
             <asp:TextBox ID="TxtPrimarySkills" CssClass="form-control form-control-lg TxtStyle" MaxLength="120" runat="server"  placeholder="Enter_Primary_Skills"  />

            <asp:RequiredFieldValidator ID="rfvTxtPrimarySkills" ValidationGroup="test" Display="Dynamic" SetFocusOnError="true" ControlToValidate="TxtPrimarySkills" ErrorMessage=" Primary_Skills  is required." ForeColor="Red" runat="server" CssClass="reqMessage float-right span"></asp:RequiredFieldValidator>
       
      </div>
  </div> 

 <div class="form-group">
  <!-- Secondary Skills -->
    <label class="col-xs-10 col-sm-2 col-md-2 col-lg-2" for="SecondarySkills"><dive style="color:Red;">*</dive>  Secondary Skills:</label>
      <div class="col-xs-10 col-sm-4 col-md-4 col-lg-4">
          <div class="side-by-side clearfix">
           <asp:TextBox ID="TxtSecondarySkills" CssClass="form-control form-control-lg TxtStyle" MaxLength="120" runat="server"  placeholder="Enter_Secondary_Skills"  />

              <asp:RequiredFieldValidator ID="rfvTxtSecondarySkills" ValidationGroup="test" Display="Dynamic" SetFocusOnError="true" ControlToValidate="TxtSecondarySkills" ErrorMessage="Secondary Skills is required." ForeColor="Red" runat="server" CssClass="reqMessage float-right span"></asp:RequiredFieldValidator>
          </div>
      </div>
  <!-- Experience -->
         <label class="col-xs-10 col-sm-2 col-md-2 col-lg-2 " for="Experience"><dive style="color:Red;">*</dive>  Experience:</label>
      <div class="requiredstar col-xs-10 col-sm-4 col-md-4 col-lg-4">
             <asp:TextBox ID="TxtExperience" CssClass="form-control form-control-lg TxtStyle" MaxLength="120" runat="server"  placeholder="Enter_Experience"  /><%--<span style='color:Red;'>*</span>--%>

          <asp:RequiredFieldValidator ID="rfvTxtExperience" ValidationGroup="test" Display="Dynamic" SetFocusOnError="true" ControlToValidate="TxtExperience" ErrorMessage=" Experience  is required." ForeColor="Red" runat="server" CssClass="reqMessage float-right span"></asp:RequiredFieldValidator>
      
         
      </div>
  </div> 

 <div class="form-group">
<!-- Qualification -->
    <label class="col-xs-10 col-sm-2 col-md-2 col-lg-2" for="Qualification"><dive style="color:Red;">*</dive>Qualification:</label>
      <div class="col-xs-10 col-sm-4 col-md-4 col-lg-4">
          <div class="side-by-side clearfix">
           <asp:TextBox ID="TxtQualification" CssClass="form-control form-control-lg TxtStyle" MaxLength="120" runat="server"  placeholder="Enter_Qualification"  />

              <asp:RequiredFieldValidator ID="rfvTxtQualification" ValidationGroup="test" Display="Dynamic" SetFocusOnError="true" ControlToValidate="TxtQualification" ErrorMessage=" Qualification  is required." ForeColor="Red" runat="server" CssClass="reqMessage float-right span"></asp:RequiredFieldValidator>
         
            
          </div>
      </div>
  <!-- Salary -->
     <label class="col-xs-10 col-sm-2 col-md-2 col-lg-2 " for="Salary"><dive style="color:Red;">*</dive>  Salary:</label>
      <div class="requiredstar col-xs-10 col-sm-4 col-md-4 col-lg-4">
         <asp:TextBox ID="TxtSalary" CssClass="form-control form-control-lg TxtStyle" MaxLength="120" runat="server"  placeholder="Enter_Salary"  />

          <asp:RequiredFieldValidator ID="rfvTxtSalary" ValidationGroup="test" Display="Dynamic" SetFocusOnError="true" ControlToValidate="TxtSalary" ErrorMessage=" Salary  is required." ForeColor="Red" runat="server" CssClass="reqMessage float-right span"></asp:RequiredFieldValidator>
     
      </div>
  </div>

 
  <div class="form-group">
 <%--Vacancy End Date/Last Date To Apply--%>
     <label for="lblDate" class="col-xs-10 col-sm-2 col-md-2 col-lg-2"><dive style="color:Red;">*</dive>Last Date To Apply</label>
      <div class="col-xs-10 col-sm-4 col-md-4 col-lg-4">
          <div class="side-by-side clearfix">
        
    <asp:TextBox ID="txtDate" runat="server" 
    CssClass="form-control popovers TxtStyle" 
    placeholder="Date(dd/mm/yyyy)" 
    TextMode="Date" 
    data-trigger="focus" 
    data-placement="right" 
    data-content="Select Your Vacancy End Date/Last Date To Apply in dd/mm/yyyy" 
    data-container="body" 
    aria-describedby="basic-addond" />

          </div>
      </div>
<!-- ContactName -->
    <label class="col-xs-10 col-sm-2 col-md-2 col-lg-2" for="ContactName"><dive style="color:Red;">*</dive>  Contact Name:</label>
      <div class="requiredstar col-xs-10 col-sm-4 col-md-4 col-lg-4">
          <asp:TextBox ID="TxtContactName" CssClass="form-control form-control-lg TxtStyle" MaxLength="120" runat="server"  placeholder="Enter_ContactName"  /><%--<span style='color:Red;'>*</span>--%>

          <asp:RequiredFieldValidator ID="rfvTxtContactName" ValidationGroup="test" Display="Dynamic" SetFocusOnError="true" ControlToValidate="TxtContactName" ErrorMessage=" ContactName is required." ForeColor="Red" runat="server" CssClass="reqMessage float-right span"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revTxtContactName" ValidationGroup="test" ControlToValidate="TxtContactName" ErrorMessage="Invalid ContactName format." runat="server" CssClass="reqMessage" ValidationExpression="^[a-zA-Z\s]+$"></asp:RegularExpressionValidator>
          
      </div>
  </div>      
      
   <div class="form-group">
 <%--ContactEmailId --%>
     <label for="lblContactEmailId" class="col-xs-10 col-sm-2 col-md-2 col-lg-2"><dive style="color:Red;">*</dive>  Contact Email Id:</label>
      <div class="col-xs-10 col-sm-4 col-md-4 col-lg-4">
          <div class="side-by-side clearfix">
           <asp:TextBox ID="TextContactEmailId" CssClass="form-control form-control-lg TxtStyle" MaxLength="120" runat="server"  placeholder="Enter_ContactEmailId"  />
            <asp:RequiredFieldValidator ID="rfvTextContactEmailId" ValidationGroup="test" Display="Dynamic" SetFocusOnError="true"  ControlToValidate="TextContactEmailId"  ErrorMessage="EmailId is required." ForeColor="Red" runat="server" CssClass="reqMessage float-right span" />

            <asp:RegularExpressionValidator ID="revTextContactEmailId" ValidationGroup="test" Display="Dynamic" SetFocusOnError="true" ControlToValidate="TextContactEmailId" ErrorMessage="Invalid email format." ForeColor="Red" runat="server"  CssClass="reqMessage float-right span"  ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" />
           
          </div>
      </div>
<!-- ContactMobileNo -->
    <label class="col-xs-10 col-sm-2 col-md-2 col-lg-2" for="ContactMobileNo"><dive style="color:Red;">*</dive>  Contact No:</label>
      <div class="requiredstar col-xs-10 col-sm-4 col-md-4 col-lg-4">
           <asp:TextBox ID="TextContactMobileNo" CssClass="form-control form-control-lg TxtStyle" runat="server"  placeholder="Enter_ContactMobileNo"  MaxLength="15" inputmode="numeric" pattern="[0-9]*" />

          <asp:RequiredFieldValidator ID="rfvTextContactMobileNo" ValidationGroup="test" Display="Dynamic" SetFocusOnError="true" ControlToValidate="TextContactMobileNo" ErrorMessage="ContactMobileNo is required." ForeColor="Red" runat="server" CssClass="reqMessage float-right span"></asp:RequiredFieldValidator>

      </div>
  </div> 

    <asp:Button 
    ID="BtnSave" 
    runat="server" 
    Text="Save" 
    OnClick="BtnSave_Click" 
    ValidationGroup="test" 
    CausesValidation="true" 
    CssClass="col-sm-6 col-sm-offset-1 btn btn-primary br Save btn-custom" 
    Style="font-size: large; margin-top: 1px; margin-left: 300px;" />


<%-- </div>--%>
<br />
     </div>
   </div>
   
       <%-- </ContentTemplate>
    </asp:UpdatePanel>--%>
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 

     <script>
     document.getElementById('<%= TextContactMobileNo.ClientID %>').addEventListener('input', function (e) {
         this.value = this.value.replace(/\D/g, '');
     });
     </script>

     <script>
         document.getElementById('<%= TextPhoneNo.ClientID %>').addEventListener('input', function (e) {
             this.value = this.value.replace(/\D/g, '');
         });
     </script>
    <script type="text/javascript">
        function validateCompanyName(sender, args) {
            var combo = document.getElementById('<%= CompanyName.ClientID %>');
            // Check if value is not empty or "0"
            args.IsValid = combo && combo.value.trim() !== "" && combo.value !== "0";
        }
    </script>

  <asp:Label ID="lblError" runat="server"></asp:Label>
</asp:Content>
