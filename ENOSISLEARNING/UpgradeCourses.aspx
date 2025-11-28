<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="UpgradeCourses.aspx.cs" Inherits="ENOSISLEARNING.UpgradeCourses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<script type="text/javascript">
$(document).ready(function () {
$('[id*=ContentPlaceHolder1_drpCourses]').multiselect({
includeSelectAllOption: true
});

});
</script>

<style>
     *
 {
     font-family: 'Montserrat', sans-serif;
 } 
    .container
    {
        width:95%;
        margin-top:10px;
    }
.hide-div {
display: none;
}
.auto-style1 {
height: 17px;
}
    .upgradediv
    {
        padding:20px 10px;
        line-height:5em;
       
    }
    .divheading
    {
        font-size:35px;
         font-family:'Colonna MT';
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container jumbotron text-center border border-info rounded upgradediv"  >
        <h1 class="divheading lead">REGISTRATION COMPLETED</h1>
    <hr />

<h4 class="upld-resume"> Registration is confirmed.Your Registration Id is <asp:Label ID="lblRegNo" runat="server" style="position:relative;left:0px;color:red;font-size:14px;"/> Which you can use for further communication if any.</h4>
<h4 class="upld-resume"> If you want to change any information, you can click on the url :<br /><br />
     <asp:HyperLink ID="hykRegUrl" CssClass="btn btn-danger"  runat="server" /></h4>  
          
<div id="divcourses" runat="server" >
<h4 >Already Enrolled Courses :  <asp:Label ID="lblEnrolledCourses"  Text="" runat="server" Visible="true" style="position:relative;left:0px;color:black;font-size:18px;"/>&nbsp;|
                       <asp:Label ID="lblOldFees" Text="Total Fees"  runat="server" Visible="false" style="position:relative;left:0px;color:black;font-size:18px;"/></h4>
                          
<h4 >Upgrading Course Name: 
<asp:ListBox ID="drpCourses" Height="100px"  runat="server" OnSelectedIndexChanged="drpCourses_SelectedIndexChanged"  AutoPostBack="true" SelectionMode="Multiple">
</asp:ListBox></h4> 
<asp:Label ID="lblFees"  Text="Total Fees" runat="server" Visible="false" />
<asp:TextBox ID="txtNewCourseFees" CssClass="txtbox"  runat="server" Width="100px" Visible="false" />

<asp:Button   CssClass="btn btn-info btn-lg"   ID="btnNewCourses" Text="Click To Confirm The Upgration & Add The Fees Details" runat="server" OnClick="btnNewCourses_Click"   />


    </div>
</div>
       <script src="Scripts/jquery-1.8.2.js"></script>
</asp:Content>
