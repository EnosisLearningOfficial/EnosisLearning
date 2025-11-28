<%@ Page Title="" Language="C#" MasterPageFile="~/LEARNING.Master" AutoEventWireup="true" CodeBehind="DownLoads.aspx.cs" Inherits="ENOSISLEARNING.DownLoads" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
     <style>
      .panel-group .panel {
    border-radius: 5px;
    overflow: hidden;
    margin-bottom: 10px;
    border: none;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  }

  .panel-heading th {
    background: linear-gradient(135deg, #173151, #1f3a6e);
    color: white;
    padding: 15px 20px;
    cursor: pointer;
    position: relative;
    transition: background 0.3s;
  }

 /* .panel-heading:hover {
    background: #2980b9;
  }*/

  .panel-title {
    font-size: 16px;
    margin: 0;
  }

  .panel-heading .toggle-icon {
    position: absolute;
    right: 20px;
    top: 50%;
    transform: translateY(-50%);
    font-size: 18px;
    transition: transform 0.3s;
  }

  .panel-body {
    padding: 15px 20px;
    background: #fff;
    font-size: 14px;
    line-height: 1.5;
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
  .grid
  {
      width:100%;
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
.gradient-header {
    background: linear-gradient(135deg, #173151, #1f3a6e) !important;
    color: white !important;
    font-weight: bold;
    text-align: center;
    border-color:#173151;
}

  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                   <div class="container-fluid">
           <div class="row">
            <div class="col-lg-12 col-sm-12">
                <div class="training-program"><h3><i class="fa-solid fa-download me-2 text-primary" style="color:darkgreen;animation: pulse 1.5s infinite;font-size:2.5rem"></i>
<span style="color:#FFA521;"> &nbsp;Downloads</span></h3></div>
            </div>
        </div>
<div class="row">
                 <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                      <asp:GridView DataKeyNames="Name"  ID="grvFiles" AutoGenerateColumns="false" runat="server" OnSelectedIndexChanged="grvFiles_SelectedIndexChanged" HeaderStyle-CssClass="gradient-header" Width="100%" style="margin-top:0px;">
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/Downloads/{0}" DataTextField="Name" HeaderText="DownLoads" HeaderStyle-CssClass="panel-heading" />

<asp:CommandField ShowSelectButton="True"  SelectText="Download" ControlStyle-CssClass="btn-accordion" HeaderStyle-BackColor="#1E396D" />
</Columns>
</asp:GridView>
                 </div>
       <%-- Form --%> 
   <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
  <div class="frm mar-bt1" style="width:100%; border-radius:8px; box-shadow:0 6px 25px rgba(0,0,0,0.1); border:1px solid #cbd8db; background:#fff; padding:20px;">
    <h3 class="h3" style="margin-bottom:20px; color:#403633; font-weight:bold;text-decoration:underline;">
         <i class="fa-solid fa-pen-to-square" style="margin-right:8px; color:#173151;"></i> 
        Enquiry Form</h3>

    <asp:Label ID="Label1" runat="server" />

    <asp:RequiredFieldValidator ID="rMobile" ControlToValidate="txtEUserContactNo" ErrorMessage="Please enter Contact No" runat="server" CssClass="text-danger" Display="Dynamic" />
    <asp:RequiredFieldValidator ID="rEmail" ControlToValidate="txtEEmailId" ErrorMessage="Please enter Email" runat="server" CssClass="text-danger" Display="Dynamic" />

    <div class="form-group">
      <asp:TextBox ID="txtEUserName" runat="server" CssClass="form-control" PlaceHolder="Enter User Name"></asp:TextBox>
    </div>

    <div class="form-group">
      <asp:TextBox ID="txtEUserContactNo" runat="server" CssClass="form-control" PlaceHolder="User Contact Number"></asp:TextBox>
    </div>

    <div class="form-group">
      <asp:TextBox ID="txtEEmailId" runat="server" CssClass="form-control" PlaceHolder="User Email Id"></asp:TextBox>
    </div>

    <div class="form-group">
      <asp:DropDownList CssClass="form-control" ID="drpDCourse" AutoPostBack="true" runat="server">
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
    </div>

   <div class="text-center">
  <asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" CssClass="btn btn-primary" style="width:100%; font-weight:bold; background:linear-gradient(135deg, #173151, #1f3a6e);color:white;" OnClick="btnSubmit_Click"/>
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
       <%-- Form --%> 
        </div>
    </div>
</asp:Content>
