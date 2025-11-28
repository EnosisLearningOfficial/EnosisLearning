<%@ Page Title="" Language="C#" MasterPageFile="~/LEARNING.Master" AutoEventWireup="true" CodeBehind="PowerBI.aspx.cs" Inherits="ENOSISLEARNING.PowerBI" %>
<%@ Register Src="~/CourseWebControl.ascx" TagPrefix="uc" TagName="CGridView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
        body
        {
            margin:0px;
            padding:0px;
        }
        .container
        {
            width:100%;
            background-color:transparent;
            margin-top:-25px;
        }
        .grv
        {
            width:65%;
            height:99%;
            background-color:transparent;
        }
        .right-section
        {
            width:35%;
            height:575px;
            background-color:transparent;
            float:right;
        }


         #colorbox #cboxClose {
     top: 0;
     right: 0;
 }

 #cboxLoadedContent {
     margin-top: 28px;
     margin-bottom: 0;
 }

 .myul li {
     padding: 5px;
     line-height: 40px;
     margin: 28px;
     border-radius: 3px;
     list-style: none;
     display: inline;
     background-color: #006495;
     border-color: #006495;
     color: white;
 }

 @media screen and (min-width: 768px) {
     .myul li {
         margin: 16px;
     }
 }

 .myul li a {
     color: white;
     outline: none;
     text-decoration: none;
 }

     .myul li a:hover {
         font-style: oblique;
         color: #ff6a00;
     }


 .close {
     float: right;
     font-size: 21px;
     line-height: 1;
     color: white;
     opacity: 1;
 }

 .modal-content {
     position: relative;
     background-color: #fff;
     background-clip: padding-box;
     border: 1px solid rgba(0, 0, 0, .2);
     outline: 0;
 }




 .my-form-control {
     font-size: 15px;
     font-family: 'Montserrat', sans-serif;
     border: 1px solid #999;
     padding: 0px 0px 0px 9px;
     box-shadow: none;
     width: 100%;
 }

 .modal-body {
     position: relative;
     padding: 15px;
     float: left;
     width: 100%;
     background: #f0efef;
 }

 .modal-footer {
     padding: 15px;
     text-align: right;
     border-top: 1px solid #e5e5e5;
     float: left;
     width: 100%;
     background: #f0efef;
 }

 .modal-header {
     min-height: 16.42857143px;
     padding: 15px;
     border-bottom: 1px solid #e5e5e5;
     float: left;
     width: 100%;
     background: #006495;
     color: white;
 }




 @media screen and (max-width: 750px) {

     .myul li {
         margin: 16px;
     }
 }
 .upside
 {
     width:100%;
     height:60%;
     background-color:transparent;
 }
 .bottomside
 {
    width:100%;
    height:40%;
    background-color:transparent;
 }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h1 style="margin-left:44px;position:relative;top:10px;font-weight:900;font-size:20px">Microsoft Power BI Training Modules</h1>
    <div class="container">
         <div class="right-section">
             <div class="upside">
                     <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" style="width:85%;margin-top:11.5%;">
    <div class="frm mar-bt1" style="float: left; box-shadow: 0 9px 50px hsla(20, 67%, 75%, 0.31); border: 1px solid rgba(147, 184, 189,0.8);
    border-radius: 5px;width: 100%;">
    <p>Enquiry Form</p>
    <div class="enquiry-form-wrppr1">
                    
    <asp:Label ID="lblRes" runat="server"  />   
    <asp:RegularExpressionValidator ID="regEmail" ControlToValidate="txtEEmailId" Text="Please Enter Valid EmailID" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server" CssClass="valid" />
    <asp:RequiredFieldValidator ID="rMobile" ControlToValidate="txtEUserContactNo" ErrorMessage="Please enter Contact No" runat="server" CssClass="valid" Display="Dynamic" />
    <asp:RequiredFieldValidator ID="rEmail" ControlToValidate="txtEEmailId" ErrorMessage="Please enter Email" runat="server" CssClass="valid" Display="Dynamic" />
    <asp:RegularExpressionValidator ID="rM1" ControlToValidate="txtEUserContactNo" Text="Please Enter Valid ContactNo" Display="Dynamic" ValidationExpression="^[0-9\-\(\)\/\.\+]{0,15}$" runat="server" CssClass="valid" />
     

    <div class="form-group">   <asp:TextBox ID="txtEUserName" runat="server" PlaceHolder="Enter User Name" CssClass="form-control" ToolTip="Enter User Name" ></asp:TextBox></div>
    <div class="form-group">   <asp:TextBox ID="txtEUserContactNo" runat="server" PlaceHolder="User Contact Number" CssClass="form-control" ToolTip="Enter User Number" ></asp:TextBox></div>
    <div class="form-group">   <asp:TextBox ID="txtEEmailId" runat="server" PlaceHolder="User Email Id" CssClass="form-control" ToolTip="User E-mail Address" ></asp:TextBox>
      
    </div>
    <div class="form-group">  
        <asp:DropDownList CssClass="form-control my-form-control" ID="drpDCourse" AutoPostBack="true"  runat="server">
<asp:ListItem Value="0" Text="Please Select Course" />
  <asp:ListItem Text=".NET" />
                    <asp:ListItem Text="JAVA" />
                    <asp:ListItem Text="SQLSERVER" />
                    <asp:ListItem Text="POWERBI" />
                         <asp:ListItem Text="C" />
                          <asp:ListItem Text="C++" />
                          <asp:ListItem Text="DESIGNING" />
                
                    <asp:ListItem Text="OTHERS" />
              


</asp:DropDownList>


        <%--<asp:TextBox ID="txtECourseName" runat="server" PlaceHolder="Course Name" CssClass="form-control" ToolTip="Course Name" ></asp:TextBox>--%>

    </div>
    <div class="btn-wrpr">
    <asp:Button ID="btnSubmit" runat="server" Width="85px" height="25px" Text="SUBMIT"  onclick="btnSubmit_Click" CssClass="btn-frm-bt1" style="color: #fff;"/>
    </div>                               
    </div>
    </div>
    </div>
             </div>
             <div class="bottomside">
                  <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" style="margin-top:10px;padding:10px;width:85%;margin-top:-5px;">
 <div class="frm mar-bt1" style="box-shadow: 0 9px 50px hsla(20, 67%, 75%, 0.31); border: 1px solid rgba(147, 184, 189,0.8);
 border-radius: 5px;">
 <p>Interview Questions</p>
 <ul class="myul" >
 <li style=" box-shadow:2px 2px 10px 1px gray"><a href="Interview_Questions.aspx?lag=MVC">ASP.NET MVC</a></li>
 <li style="background-color:#d93a32; box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=ManualTesting">Software Testing</a></li>
 <li  style="background-color:#e68f0e;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=WebDesigning">Web Designing</a></li>     
 <li style="background-color:#43b828;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=C">C Language</a></li>
 <li  style="background-color:#1e5257;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=SQLServer">SQL SERVER </a></li>
 <li style="background-color:#cf7e8b;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=POWERBI">POWERBI</a></li>
 <li  style="background-color:#a13875;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=Csharp">C#.Net</a></li> 
 <li style="background-color:#5638a1;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=ASP.NET">ASP.Net</a></li>
 <li  style="background-color:#0c549c;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=Selenium">Selenium</a></li>                                                                  
 <li style="background-color:#0e97a1;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=SSIS">SSIS</a></li>
 <li  style="background-color:#0ea166;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=SSRS">SSRS</a></li>
 <li style="background-color:#0a5909;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=SSAS">SSAS</a></li>                                                   
 <li  style="background-color:#dbbf1d;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=JAVA">Java</a></li>
 </ul>
 </div>
 </div>
             </div>
         </div>     
        <div class="grv">
             <uc:CGridView ID="MyCourseGridView" runat="server"/>
        </div>
   </div>
</asp:Content>
