<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="SearchVacancy.aspx.cs" Inherits="ENOSISLEARNING.SearchVacancy" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

   <%-- #1d96b2--%>
<style>

    @media (min-width: 1200px) {
    *
    {
        margin:0;
        padding:0;
        box-sizing:border-box;
         font-family: 'Montserrat', sans-serif;
    }
    html,body
    {
        width:100%;
        height:100%;
    }
      .container
     {
        width:95%; 
        height:100%;
        margin-top :5px;
        margin:auto;
     }
    .gridview-area
{
 max-width: 100%;
 margin-top:5px;
 overflow-x: auto;
 border-radius: 10px;
 box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
 background-color: #f8f9fa;
}
    .table
{
     border-collapse: collapse;
     border-color:white;
     background-color :white;
}
.gridview-item
{
    padding:-10px;
    transition: background-color 0.3s ease;
    text-align:center;
    font-size:10px;
    font-family: 'Montserrat', sans-serif;
    font-weight:500;
    color:black;
    background-color :white;
}
.search-container 
{
 padding: 20px 0;
 border-radius:15px;
 }
.ban-tit {
    text-align: center;
    margin-bottom: 20px;
    color: #fff;
    font-size: 36px;
    font-weight: bold;
}
.ban-search
{
      text-align: center;
}
 .TxtSearch
 {
    border: none;
    Height: 50px;
    Width: 160px;
    text-size-adjust: 50%;
    margin: 7px;
    text-align: center;
 }
 .Tab
 {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 40px;
/*    width: 1450px;*/
    text-align: center;
    margin: auto;
    height: 60px;
    background-color:white;
 }

 .gridview-header {
 text-align:center;
 background-color: #1d96b2;
 color: #fff;
 font-size:10px;
 font-weight: bold;
 font-family: 'Montserrat', sans-serif;
}
 .gridview-header th {  
 text-align: center;
 border: none;
 }
 
   .containerSearch {
    border-radius: 20px;
    width: 95%;
    height: 470px;
    margin: 20px 50px 20px 50px; /* Adjust margin as needed */
    display: flex;
    justify-content: space-between; /* Distribute space between columns */
    align-items: stretch; /* Make sure all columns have the same height */
    
}

  .gridview-header {
 text-align:center;
 background-color: #1d96b2;
 color: #fff;
 font-size:10px;
 font-weight: bold;
 font-family: 'Montserrat', sans-serif;
}

.child
{
     box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
 border-radius: 20px;
 height: 100%; /* Full height of container */   
/* margin-right:20px;*/
 margin-left:20px;
   height:90%;
   margin-bottom:20px;
    background-color:white;
}
.row1 {
    width: calc(100% - 80px);
}
.ni-job-tuple-icon ni-job-tuple-icon-srp-location loc{
    display: inline-block;
    color: var(--N600);
    font-size: 16px;
    padding-right: 0;
    margin-right: 8px;
    width: 16px;
    height: 16px;
    position: relative;
    top: -4px;
}
.input-group-addon{
    border: none;
    background-color: transparent;
}
.input-group {
    position: relative;
    display: flex;
    align-items: center;
}
.input-group .input-group-text {
    position: absolute;
    right: 0;
    z-index: 2;
    background-color: transparent;
    border: none;
    padding: 0;
}
.input-group .input-group-text i {
    color: #1d96b2; /* Icon color */
}
.fa-tags:before {
    content: "\f02c";
    color: #1d96b2;
    font-size: 20px;
}
.fa-map-marker-alt:before {
    content: "\f3c5";
    color: #1d96b2;
    font-size: 20px;
}
.fa-graduation-cap:before {
    content: "\f19d";
    color: #1d96b2;
    font-size: 20px;
}
.fa-briefcase:before {
    content: "\f0b1";
    color: #1d96b2;
    font-size: 20px;
}
.fa-dollar-sign:before {
    content: "\24";
    color: #1d96b2;
    font-size: 20px;
}
.fa-star:before {
    content: "\f005";
    color: #1d96b2;
    font-size: 20px;
  
}
   .pager {
    text-align: right;
    margin-top: 20px;
    border-color:white;
}

.pager .pagination-group {
    display: inline-block;
}
.pager a,
.pager span {
    padding: 9px 14px;
    margin: 2px;
    border-radius: 8px; /* Change border-radius to make squares */
    background-color: #007bff;
    color: #fff;
    text-decoration: none;
    transition: background-color 0.3s, color 0.3s;
    font-weight: 500;
}
/* Styling for previous and next buttons */

.pager a:last-child {
    padding: 9px 14px;
    background-color: #d9534f;
    border-color: #d9534f;
    color: white;
    margin-top:-1px;
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
      .container
     {
        width:95%; 
        height:100%;
        margin-top :5px;
        margin:auto;
     }
    .gridview-area
{
 max-width: 100%;
 margin-top:5px;
 overflow-x: auto;
 border-radius: 10px;
 box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
 background-color: #f8f9fa;
}
    .table
{
     border-collapse: collapse;
     border-color:white;
     background-color :white;
}
.gridview-item
{
    padding:-10px;
    transition: background-color 0.3s ease;
    text-align:center;
    font-size:10px;
    font-family: 'Montserrat', sans-serif;
    font-weight:500;
    color:black;
    background-color :white;
}
.search-container 
{
 padding: 20px 0;
 border-radius:15px;
 }
.ban-tit {
    text-align: center;
    margin-bottom: 20px;
    color: #fff;
    font-size: 36px;
    font-weight: bold;
}
.ban-search
{
      text-align: center;
}
 .TxtSearch
 {
    border: none;
    Height: 50px;
    Width: 160px;
    text-size-adjust: 50%;
    margin: 7px;
    text-align: center;
 }
 .Tab
 {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 40px;
/*    width: 1450px;*/
    text-align: center;
    margin: auto;
    height: 60px;
    background-color:white;
 }

 .gridview-header {
 text-align:center;
 background-color: #1d96b2;
 color: #fff;
 font-size:10px;
 font-weight: bold;
 font-family: 'Montserrat', sans-serif;
}
 .gridview-header th {  
 text-align: center;
 border: none;
 }
 
   .containerSearch {
    border-radius: 20px;
    width: 95%;
    height: 470px;
    margin: 20px 50px 20px 50px; /* Adjust margin as needed */
    display: flex;
    justify-content: space-between; /* Distribute space between columns */
    align-items: stretch; /* Make sure all columns have the same height */
    
}

  .gridview-header {
 text-align:center;
 background-color: #1d96b2;
 color: #fff;
 font-size:10px;
 font-weight: bold;
 font-family: 'Montserrat', sans-serif;
}

.child
{
     box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
 border-radius: 20px;
 height: 100%; /* Full height of container */   
/* margin-right:20px;*/
 margin-left:20px;
   height:90%;
   margin-bottom:20px;
    background-color:white;
}
.row1 {
    width: calc(100% - 80px);
}
.ni-job-tuple-icon ni-job-tuple-icon-srp-location loc{
    display: inline-block;
    color: var(--N600);
    font-size: 16px;
    padding-right: 0;
    margin-right: 8px;
    width: 16px;
    height: 16px;
    position: relative;
    top: -4px;
}
.input-group-addon{
    border: none;
    background-color: transparent;
}
.input-group {
    position: relative;
    display: flex;
    align-items: center;
}
.input-group .input-group-text {
    position: absolute;
    right: 0;
    z-index: 2;
    background-color: transparent;
    border: none;
    padding: 0;
}
.input-group .input-group-text i {
    color: #1d96b2; /* Icon color */
}
.fa-tags:before {
    content: "\f02c";
    color: #1d96b2;
    font-size: 20px;
}
.fa-map-marker-alt:before {
    content: "\f3c5";
    color: #1d96b2;
    font-size: 20px;
}
.fa-graduation-cap:before {
    content: "\f19d";
    color: #1d96b2;
    font-size: 20px;
}
.fa-briefcase:before {
    content: "\f0b1";
    color: #1d96b2;
    font-size: 20px;
}
.fa-dollar-sign:before {
    content: "\24";
    color: #1d96b2;
    font-size: 20px;
}
.fa-star:before {
    content: "\f005";
    color: #1d96b2;
    font-size: 20px;
  
}
   .pager {
    text-align: right;
    margin-top: 20px;
    border-color:white;
}

.pager .pagination-group {
    display: inline-block;
}
.pager a,
.pager span {
    padding: 9px 14px;
    margin: 2px;
    border-radius: 8px; /* Change border-radius to make squares */
    background-color: #007bff;
    color: #fff;
    text-decoration: none;
    transition: background-color 0.3s, color 0.3s;
    font-weight: 500;
}
/* Styling for previous and next buttons */

.pager a:last-child {
    padding: 9px 14px;
    background-color: #d9534f;
    border-color: #d9534f;
    color: white;
    margin-top:-1px;
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
      .container
     {
        width:95%; 
        height:100%;
        margin-top :5px;
        margin:auto;
     }
    .gridview-area
{
 max-width: 100%;
 margin-top:5px;
 overflow-x: auto;
 border-radius: 10px;
 box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
 background-color: #f8f9fa;
}
    .table
{
     border-collapse: collapse;
     border-color:white;
     background-color :white;
}
.gridview-item
{
    padding:-10px;
    transition: background-color 0.3s ease;
    text-align:center;
    font-size:10px;
    font-family: 'Montserrat', sans-serif;
    font-weight:500;
    color:black;
    background-color :white;
}
.search-container 
{
 padding: 20px 0;
 border-radius:15px;
 }
.ban-tit {
    text-align: center;
    margin-bottom: 20px;
    color: #fff;
    font-size: 36px;
    font-weight: bold;
}
.ban-search
{
      text-align: center;
}
 .TxtSearch
 {
    border: none;
    Height: 50px;
    Width: 160px;
    text-size-adjust: 50%;
    margin: 7px;
    text-align: center;
 }
 .Tab
 {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 40px;
/*    width: 1450px;*/
    text-align: center;
    margin: auto;
    height: 60px;
    background-color:white;
 }

 .gridview-header {
 text-align:center;
 background-color: #1d96b2;
 color: #fff;
 font-size:10px;
 font-weight: bold;
 font-family: 'Montserrat', sans-serif;
}
 .gridview-header th {  
 text-align: center;
 border: none;
 }
 
   .containerSearch {
    border-radius: 20px;
    width: 95%;
    height: 470px;
    margin: 20px 50px 20px 50px; /* Adjust margin as needed */
    display: flex;
    justify-content: space-between; /* Distribute space between columns */
    align-items: stretch; /* Make sure all columns have the same height */
    
}

  .gridview-header {
 text-align:center;
 background-color: #1d96b2;
 color: #fff;
 font-size:10px;
 font-weight: bold;
 font-family: 'Montserrat', sans-serif;
}

.child
{
     box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
 border-radius: 20px;
 height: 100%; /* Full height of container */   
/* margin-right:20px;*/
 margin-left:20px;
   height:90%;
   margin-bottom:20px;
    background-color:white;
}
.row1 {
    width: calc(100% - 80px);
}
.ni-job-tuple-icon ni-job-tuple-icon-srp-location loc{
    display: inline-block;
    color: var(--N600);
    font-size: 16px;
    padding-right: 0;
    margin-right: 8px;
    width: 16px;
    height: 16px;
    position: relative;
    top: -4px;
}
.input-group-addon{
    border: none;
    background-color: transparent;
}
.input-group {
    position: relative;
    display: flex;
    align-items: center;
}
.input-group .input-group-text {
    position: absolute;
    right: 0;
    z-index: 2;
    background-color: transparent;
    border: none;
    padding: 0;
}
.input-group .input-group-text i {
    color: #1d96b2; /* Icon color */
}
.fa-tags:before {
    content: "\f02c";
    color: #1d96b2;
    font-size: 20px;
}
.fa-map-marker-alt:before {
    content: "\f3c5";
    color: #1d96b2;
    font-size: 20px;
}
.fa-graduation-cap:before {
    content: "\f19d";
    color: #1d96b2;
    font-size: 20px;
}
.fa-briefcase:before {
    content: "\f0b1";
    color: #1d96b2;
    font-size: 20px;
}
.fa-dollar-sign:before {
    content: "\24";
    color: #1d96b2;
    font-size: 20px;
}
.fa-star:before {
    content: "\f005";
    color: #1d96b2;
    font-size: 20px;
  
}
   .pager {
    text-align: right;
    margin-top: 20px;
    border-color:white;
}

.pager .pagination-group {
    display: inline-block;
}
.pager a,
.pager span {
    padding: 9px 14px;
    margin: 2px;
    border-radius: 8px; /* Change border-radius to make squares */
    background-color: #007bff;
    color: #fff;
    text-decoration: none;
    transition: background-color 0.3s, color 0.3s;
    font-weight: 500;
}
/* Styling for previous and next buttons */

.pager a:last-child {
    padding: 9px 14px;
    background-color: #d9534f;
    border-color: #d9534f;
    color: white;
    margin-top:-1px;
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
      .container
     {
        width:95%; 
        height:100%;
        margin-top :5px;
        margin:auto;
     }
    .gridview-area
{
 max-width: 100%;
 margin-top:5px;
 overflow-x: auto;
 border-radius: 10px;
 box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
 background-color: #f8f9fa;
}
    .table
{
     border-collapse: collapse;
     border-color:white;
     background-color :white;
}
.gridview-item
{
    padding:-10px;
    transition: background-color 0.3s ease;
    text-align:center;
    font-size:10px;
    font-family: 'Montserrat', sans-serif;
    font-weight:500;
    color:black;
    background-color :white;
}
.search-container 
{
 padding: 20px 0;
 border-radius:15px;
 }
.ban-tit {
    text-align: center;
    margin-bottom: 20px;
    color: #fff;
    font-size: 36px;
    font-weight: bold;
}
.ban-search
{
      text-align: center;
}
 .TxtSearch
 {
    border: none;
    Height: 50px;
    Width: 160px;
    text-size-adjust: 50%;
    margin: 7px;
    text-align: center;
 }
 .Tab
 {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 40px;
/*    width: 1450px;*/
    text-align: center;
    margin: auto;
    height: 60px;
    background-color:white;
 }

 .gridview-header {
 text-align:center;
 background-color: #1d96b2;
 color: #fff;
 font-size:10px;
 font-weight: bold;
 font-family: 'Montserrat', sans-serif;
}
 .gridview-header th {  
 text-align: center;
 border: none;
 }
 
   .containerSearch {
    border-radius: 20px;
    width: 95%;
    height: 470px;
    margin: 20px 50px 20px 50px; /* Adjust margin as needed */
    display: flex;
    justify-content: space-between; /* Distribute space between columns */
    align-items: stretch; /* Make sure all columns have the same height */
    
}

  .gridview-header {
 text-align:center;
 background-color: #1d96b2;
 color: #fff;
 font-size:10px;
 font-weight: bold;
 font-family: 'Montserrat', sans-serif;
}

.child
{
     box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
 border-radius: 20px;
 height: 100%; /* Full height of container */   
/* margin-right:20px;*/
 margin-left:20px;
   height:90%;
   margin-bottom:20px;
    background-color:white;
}
.row1 {
    width: calc(100% - 80px);
}
.ni-job-tuple-icon ni-job-tuple-icon-srp-location loc{
    display: inline-block;
    color: var(--N600);
    font-size: 16px;
    padding-right: 0;
    margin-right: 8px;
    width: 16px;
    height: 16px;
    position: relative;
    top: -4px;
}
.input-group-addon{
    border: none;
    background-color: transparent;
}
.input-group {
    position: relative;
    display: flex;
    align-items: center;
}
.input-group .input-group-text {
    position: absolute;
    right: 0;
    z-index: 2;
    background-color: transparent;
    border: none;
    padding: 0;
}
.input-group .input-group-text i {
    color: #1d96b2; /* Icon color */
}
.fa-tags:before {
    content: "\f02c";
    color: #1d96b2;
    font-size: 20px;
}
.fa-map-marker-alt:before {
    content: "\f3c5";
    color: #1d96b2;
    font-size: 20px;
}
.fa-graduation-cap:before {
    content: "\f19d";
    color: #1d96b2;
    font-size: 20px;
}
.fa-briefcase:before {
    content: "\f0b1";
    color: #1d96b2;
    font-size: 20px;
}
.fa-dollar-sign:before {
    content: "\24";
    color: #1d96b2;
    font-size: 20px;
}
.fa-star:before {
    content: "\f005";
    color: #1d96b2;
    font-size: 20px;
  
}
   .pager {
    text-align: right;
    margin-top: 20px;
    border-color:white;
}

.pager .pagination-group {
    display: inline-block;
}
.pager a,
.pager span {
    padding: 9px 14px;
    margin: 2px;
    border-radius: 8px; /* Change border-radius to make squares */
    background-color: #007bff;
    color: #fff;
    text-decoration: none;
    transition: background-color 0.3s, color 0.3s;
    font-weight: 500;
}
/* Styling for previous and next buttons */

.pager a:last-child {
    padding: 9px 14px;
    background-color: #d9534f;
    border-color: #d9534f;
    color: white;
    margin-top:-1px;
}
}
    
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
  <asp:UpdatePanel runat="server">
      <ContentTemplate>
        <div class="container" >

         <div class="search-container">
            <div class="ban-tit">
                <h2 style="color: #1d96b2;margin: 0px;font-weight: 500;">Find Your Dream Job</h2>
            </div>
              <div class="ban-search">
         <div class="Tab">
             <asp:TextBox ID="TextLocation" runat="server" CssClass="TxtSearch" Placeholder="//Search_Location"  />
          <asp:TextBox ID="TxtSkills" runat="server" CssClass="TxtSearch" Placeholder="//Search_Skills"  />        
           <asp:TextBox ID="TextExperience" runat="server" CssClass="TxtSearch" Placeholder="//Search_Experience"  />
           <%--<asp:TextBox ID="TextFrom" runat="server" CssClass="TxtSearch" Placeholder="//Search_From"  />
           <asp:TextBox ID="TextTo" runat="server" CssClass="TxtSearch" Placeholder="//Search_To"  />--%>
           <asp:TextBox ID="TextSalary" runat="server" CssClass="TxtSearch" Placeholder="//Search_Salary"  />
           <asp:TextBox ID="TextQualificaTion" runat="server" CssClass="TxtSearch" Placeholder="//Search_QualificaTion" />
          
         <asp:LinkButton ID="LinkSearch"  Width="35px" Height="35px" onclick="LinkSearch_Click" style="background-color:white; border-radius:15px" runat="server">
         <img src="../img/View.png" title="Search" height="25" width="25" style="margin-left: 5px;"  /><span class="hidden-xs"></span></asp:LinkButton>

             <asp:LinkButton ID="AllVacancys"  Width="35px" Height="35px" onclick="AllVacancys_Click" style="background-color:white; border-radius:15px" runat="server">
            <img src="../img/Assessent.png" title="AllVacancys" height="25" width="25" style="margin-left: 5px;"  /><span class="hidden-xs"></span></asp:LinkButton>

              <a id="btnRDemoTwo" href="PostVacancy.aspx" class="btn btn-primary br" style="border-radius: 15px; width:180px;box-shadow: 1px 1px 3px 1px gray"" data- title="ADD VACANCY"><%--<span>  <img src="../img/Add4.png"  title="Add" height="25" width="25" /></span> --%>&nbsp;ADD NEW VACANCY</a> 

             <span id="Span1" runat="server" style="display:none;">
                        <i class="fas fa-tags"></i>
                    </span>
       <%--  <asp:Button ID="btnclear" CssClass="filter-clear" Text="Clear" runat="server" Height="30px" Width="100px"/>--%>
            
        </div>
     </div>

    <div class="gridview-area">
   <asp:GridView ID="gvVacancies" runat="server" AutoGenerateColumns="false" CssClass="table table-borderless gridview-table"
    EmptyDataText="No records found" Width="100%" ShowHeaderWhenEmpty="true" OnPageIndexChanging="gvVacancies_PageIndexChanging" 
    PageSize="10" PagerStyle-CssClass="pager" AllowPaging="True" OnRowCommand="gvVacancies_RowCommand">

    <Columns>
       
        <asp:TemplateField HeaderText="JOB CODE" HeaderStyle-Font-Size="small" SortExpression="JOBCODE" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="8%">
            <ItemTemplate>
                <asp:Label ID="lblJobCode" runat="server" Text='<%# Eval("JOBCODE") %>' CssClass="gridview-item" 
                    Style="display: block; border-radius: 15px; text-align:center; border-style: none; font-size: smaller; width: 50px; height: 17px; overflow: hidden;" />
            </ItemTemplate>
        </asp:TemplateField>


         <asp:TemplateField HeaderText="JobPostedDate" HeaderStyle-Font-Size="small" SortExpression="JOBCODE" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="10%">
     <ItemTemplate>
         <asp:Label ID="lblLastDateToApply" runat="server" Text='<%# Eval("CREATEDDATE") %>' CssClass="gridview-item" 
             Style="display: block; border-radius: 15px; text-align:center; border-style: none; font-size: smaller; width: 70px; height: 17px; overflow: hidden;" />
     </ItemTemplate>
 </asp:TemplateField>

        
        <asp:TemplateField HeaderText="Position Name" HeaderStyle-Font-Size="small" SortExpression="POSITIONNAME" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="20%" ItemStyle-Font-Size="Smaller">
            <ItemTemplate>
                <asp:LinkButton ID="lnkPositionName" runat="server" CommandName="SelectPosition" 
                                CommandArgument='<%# Eval("JOBCODE") %>' Text='<%# Eval("POSITIONNAME") %>' Style="display: block; border-radius: 15px; text-align:center; border-style: none; width: 150px; color: blue; height: 17px; overflow: hidden;" />
            </ItemTemplate>
        </asp:TemplateField>

       
        <asp:TemplateField HeaderText="Company Name" HeaderStyle-Font-Size="small" SortExpression="COMPANYNAME" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="10%">
            <ItemTemplate>
                <asp:Label ID="lblCompanyName" runat="server" Text='<%# Eval("COMPANYNAME") %>' ToolTip='<%# Bind("COMPANYNAME")%>' CssClass="gridview-item" 
                    Style="display: block; border-radius: 15px; text-align:center; font-size: smaller; border-style: none; width: 150px; color: black; height: 17px; overflow: hidden;" />
            </ItemTemplate>
        </asp:TemplateField>

       
        <asp:TemplateField HeaderText="Skills" HeaderStyle-Font-Size="small" SortExpression="PRIMARYSKILLS" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="10%">
            <ItemTemplate>
                <asp:Label ID="lblSkills" runat="server" Text='<%# Eval("PRIMARYSKILLS") %>' ToolTip='<%# Bind("PRIMARYSKILLS")%>' CssClass="gridview-item" 
                    Style="display: block; border-radius: 15px; text-align:center; font-size: smaller; border-style: none; width: 150px; height: 17px; overflow: hidden;" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Location" HeaderStyle-Font-Size="small" SortExpression="JOBLOCATION" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="10%">
            <ItemTemplate>
                <asp:Label ID="lblLocation" runat="server" Text='<%# Eval("JOBLOCATION") %>' ToolTip='<%# Bind("JOBLOCATION")%>'  CssClass="gridview-item" 
                    Style="display: block; border-radius: 15px; text-align:center; font-size: smaller; border-style: none; width: 150px; height: 17px; overflow: hidden;" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Experience" HeaderStyle-Font-Size="small" SortExpression="EXPERIENCE" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="5%">
            <ItemTemplate>
                <asp:Label ID="lblExperience" runat="server" Text='<%# Eval("EXPERIENCE") %>' ToolTip='<%# Bind("EXPERIENCE")%>' CssClass="gridview-item" 
                    Style="display: block; border-radius: 15px; text-align:center; font-size: smaller; border-style: none; width: 50px; height: 17px; overflow: hidden;" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Salary" HeaderStyle-Font-Size="small" SortExpression="SALARY" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="5%">
            <ItemTemplate>
                <asp:Label ID="lblSalary" runat="server" Text='<%# Eval("SALARY") %>' ToolTip='<%# Bind("SALARY")%>' CssClass="gridview-item" 
                    Style="display: block; border-radius: 15px; font-size: smaller; text-align:center; border-style: none; width: 50px; height: 17px; overflow: hidden;" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Qualification" HeaderStyle-Font-Size="small" SortExpression="QUALIFICATION" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="10%">
            <ItemTemplate>
                <asp:Label ID="lblQualification" runat="server" Text='<%# Eval("QUALIFICATION") %>' ToolTip='<%# Bind("QUALIFICATION")%>' CssClass="gridview-item" 
                    Style="display: block; border-radius: 15px; font-size: smaller; text-align:center; border-style: none; width: 150px; height: 17px; overflow: hidden;" />
            </ItemTemplate>
        </asp:TemplateField>

    </Columns>
<HeaderStyle Font-Bold="True" BackColor="#1D96B2" ForeColor="White"></HeaderStyle>
<PagerStyle ForeColor="White" HorizontalAlign="Center" /> 
<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
<SortedAscendingCellStyle BackColor="#E9E7E2" />
<SortedAscendingHeaderStyle BackColor="#506C8C" />
<SortedDescendingCellStyle BackColor="#FFFDF8" />
<SortedDescendingHeaderStyle BackColor="#6F8DAE" />
<PagerTemplate>
       <asp:LinkButton ID="lbtnFirst" runat="server" CommandName="Page" CommandArgument="First">First</asp:LinkButton>
       <asp:LinkButton ID="lbtnprev" runat="server" CommandName="Page" CommandArgument="Prev">Prev</asp:LinkButton>
       <asp:LinkButton ID="lbtnnext" runat="server" CommandName="Page" CommandArgument="Next">Next</asp:LinkButton>
       <asp:LinkButton ID="lbtnlast" runat="server" CommandName="Page" CommandArgument="Last">Last</asp:LinkButton>
</PagerTemplate>   
</asp:GridView>

  
</div>



   
     
        </div>
        
        </div>

  
       
        </script>
          <script type="text/javascript">
        function showTagIcon() {
            document.getElementById('tagIcon').style.display = 'inline-block';
        }
          </script>
          

    </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>
