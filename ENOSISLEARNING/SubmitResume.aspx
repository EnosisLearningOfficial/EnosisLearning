<%@ Page Title="" Language="C#" MasterPageFile="~/LEARNING.Master" AutoEventWireup="true" CodeBehind="SubmitResume.aspx.cs" Inherits="ENOSISLEARNING.SubmitResume" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
body {
background-color:#fff;
}
.hide-div {
display: none;
}




 @media screen and (max-width: 980px)
        {
            

           .menu-btn
                {
                         margin-right: 155px;
    width: 100%;
                }
        }
           
       
</style>
<script src="js/jquery-ui.min.js" type="text/javascript"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="Stylesheet" type="text/css" />
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container"style="min-height:500px;">
<div class="col-lg-12">
<div class="col-lg-8 register" style="border: 1px solid #006495">
<div><asp:Label ID="lblError" runat="server" BackColor="Maroon" Font-Bold="true" ></asp:Label></div>
<table  id="form1" class="col-lg-12"  border="0">

<tr> 
<td><label class="label" style="color:black; font-size: small;">Email :</label></td>
<td>
<asp:TextBox ID="txtEmail" runat="server"  CssClass="txtbox" required="true" /> 
<asp:RegularExpressionValidator id="regEmail" ControlToValidate="txtEmail" Text="Please insert valid email ID" Display="Dynamic"
ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
Runat="server" CssClass="valid" />  
</td>
</tr>
<tr>
<td><label class="label" style="color:black; font-size:small;">Resume :</label></td>
<td>
<asp:FileUpload  ID="fResume" runat="server" CssClass="file-upl" style="margin-left:2px;"  />
<asp:HyperLink ID="hykResume" runat="server" CssClass="file-upl" />
</td>
</tr>
<tr>
<td></td>
<td>
        
<asp:Button ID="Button1" Text="Upload Resume" runat="server"    CssClass="upld-resume" Width="125px" OnClick="btnUpload_Click"  style="margin-left:2px; color:white" />&nbsp;&nbsp;
        
                            
</td>
       
</tr>
</table>
<center>
<table height="250" id="trInfo" runat="server" style="font-size:14px;">
<tr>
<td>
<h4> Your Resume have been submitted successfully. <%--Thanks for doing Registration at Enosis Learning. Your Registration is confirmed.--%></h4>
<br /> Your Registration Id is <asp:Label ID="lblRegNo" runat="server" /> Which you can use for further communication if any.
<br /> If you want to change any information, you can click on the url below :
<br /> <asp:HyperLink ID="hykRegUrl" ForeColor="Black" runat="server" />


<br />
</td>
</tr>
</table>
</center>
</div>
</div>
</div>
</asp:Content>
