<%@ Page Title="" Language="C#" MasterPageFile="~/LEARNING.Master" AutoEventWireup="true" CodeBehind="SampleResumes.aspx.cs" Inherits="ENOSISLEARNING.SampleResumes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       @media screen and (max-width: 980px)
          {
            .container
            {
                width: 100%;
            }
            .row
            {

       margin-left: -2px;
    margin-right: 0px;
}
            table
            {
               width:100px;
            }
            .panel-body
            {
               
                    margin-left: -28px;
            }
            td
            {
                font-size:8px;
            }
            table td a
            {
font-size:8px;
            }
          }

      </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:Label ID="lblInfo" runat="server" ForeColor="Red" Font-Bold="true"  />
<div class="container">
<div class="row">
<div class="row">
<div class="panel-group" id="accordion">

<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseC"><span class="fa fa-plus myicon"></span>.NET Sample Resumes</a>
</h4>
</div>
<div id="collapseC" class="panel-collapse collapse collapse">


<div class="panel-body">

<div class="container">
<div class="row">
<div class="col-lg-12">
<asp:GridView DataKeyNames="Name"  ID="grv_Net" 
HeaderStyle-BackColor="#e4eef2" AutoGenerateColumns="false" Width="480px" Height="60px" runat="server"  OnSelectedIndexChanged="grv_Net_SelectedIndexChanged" >
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/SampleCV/DB/{0}" 
ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="300px"  
ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true" DataTextField="Name" 
HeaderText="DownLoads"  />

<asp:CommandField ShowSelectButton="True" ControlStyle-Height="25px" 
ItemStyle-Height="30px"  ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center"
ControlStyle-Width="100px"  SelectText="Download" ControlStyle-CssClass="btn-accordion" />
</Columns>
</asp:GridView>
</div>
</div>
</div>

                                    
</div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseJava"><span class="fa fa-plus myicon"></span>Java Sample Resume</a>
</h4>
</div>
<div id="collapseJava" class="panel-collapse collapse collapse">
<div class="panel-body">
<div class="col-lg-12">
                                       
<asp:GridView DataKeyNames="Name"  ID="grvJava" HeaderStyle-BackColor="#e4eef2" AutoGenerateColumns="false" Width="480px" Height="60px" runat="server"  OnSelectedIndexChanged="grvJava_SelectedIndexChanged" >
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/SampleCV/Java/{0}"  ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="300px"  ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true" DataTextField="Name" HeaderText="DownLoads"  />

<asp:CommandField ShowSelectButton="True" ControlStyle-Height="25px"  ItemStyle-Height="30px"  ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ControlStyle-Width="100px"  SelectText="Download" ControlStyle-CssClass="btn-accordion" />
</Columns>
</asp:GridView>

                                       
</div>
</div>
</div>
</div>


<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseDB"><span class="fa fa-plus myicon"></span>DataAnalytics Sample Resume</a>
</h4>
</div>
<div id="collapseDB" class="panel-collapse collapse collapse">
<div class="panel-body">
<div class="col-lg-12">
                                       
<asp:GridView DataKeyNames="Name"  ID="grvDB" HeaderStyle-BackColor="#e4eef2" AutoGenerateColumns="false" Width="480px" Height="60px" runat="server"  OnSelectedIndexChanged="grvDB_SelectedIndexChanged" >
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/SampleCV/DB/{0}"  ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="300px"  ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true" DataTextField="Name" HeaderText="DownLoads"  />

<asp:CommandField ShowSelectButton="True" ControlStyle-Height="25px"  ItemStyle-Height="30px"  ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ControlStyle-Width="100px"  SelectText="Download" ControlStyle-CssClass="btn-accordion" />
</Columns>
</asp:GridView>

                                       
</div>
</div>
</div>
</div>



                      
</div>
</div>
               
</div><!--row end-->
</div><!--container end-->
        <script src="Scripts/jquery-1.8.2.js"></script>
</asp:Content>
