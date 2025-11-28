<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="EnquiryAnalysis.aspx.cs" Inherits="ENOSISLEARNING.EnquiryAnalysis" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
    <style>
         *
 {
     font-family: 'Montserrat', sans-serif;
 }
        body {
        background-color:#fff;
        }
        .container-fluid
        {
            width:95%;
        }
        .hide-div {
            display: none;
        }
               .table-striped tbody th {
     background-color: #1d96b2 !important;
    color:white;
    text-align:center;
    border:none;


}
                .table-striped tbody td
                {
                    text-align:center;
                     border:none;
                }
        .table-striped tbody tr {
    background: white;
    
   
}
                       .table td, .table th {
    padding: 3px;
    vertical-align: top;
    border-top: 1px solid #dee2e6;
}
        .crousel-bg {
        padding:0px;
        }
        .add-candidate {
            height: 34px;
            margin: 0 auto;
            background: url(images/employee-details-main-h.png) repeat-x;
            line-height: 32px;
            padding-left: 20px;
            font-family: arial;
            font-size: 14px;
            font-weight: bold;
            color: #368aff;       
         }
        .add-candidate h5{
          padding:10px;
          color:#1C71BB;
          font-weight:bold;
          font-family:15px!important;  
        }
        .baccolor {
            color:blue;
            
        }
        .registration_tabl h5 {
          padding:0px 0px;
          color:#1C71BB;
          font-weight:bold;
          font-family:17px;  
        }
        .myhr {
        margin-top: 20px!important;
        margin-bottom:0px!important;
        border: 0;
        border-top: 2px solid #069;
        }
        input[type="radio"], input[type="checkbox"] {
        margin: 7px 0 0 0;
        line-height: normal;
        }
       
        .css3-shadow

        {
  	        position:relative;
	        -webkit-box-shadow:0 1px 4px rgba(0, 0, 0, 0.3);
                    box-shadow:0 1px 4px rgba(0, 0, 0, 0.3);
        }

        .css3-shadow:after
        {
	        content:"";
            position:absolute;
            z-index:-1;
            -webkit-box-shadow:0 0 40px rgba(0,0,0,0.8);
    		        box-shadow:0 0 40px rgba(0,0,0,0.8);
            bottom:0px;
	        width:80%;
	        height:50%;
            -moz-border-radius:100%;
            border-radius:100%;
	        left:10%;
	        right:10%;
        }

    </style>
     <script type="text/javascript">

         function popup() {

             $("#EmailModal").modal('show');
         }


    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container-fluid">
<center>
<h4 class="upld-resume" >ASSESSMENTS TAKEN BY EACH EMPLOYEES</h4>
</center>
</div>
<div class="col-md-12">
<center>
Start Date <asp:TextBox ID="sdate" class="btn" Type="Date" DataFormatString = "{0:dd/MM/yyyy}" runat="server"></asp:TextBox>
End Date <asp:TextBox ID="edate" class="btn" Type="Date" DataFormatString = "{0:dd/MM/yyyy}" runat="server"></asp:TextBox>
<asp:Button ID="btnShow" Text="ShowAssessments" BackColor="#0398D2"   BorderColor="#ffffff" runat="server" OnClick="btnShow_Click" />
</center>
</div>
<div class="container-fluid">
<asp:GridView ID="grvEnquiryAnalysis"  AutoGenerateColumns="true" runat="server"
EmptyDataText="No Enquiries Found"   
AllowPaging="true"  PageSize="12" PagerSettings-Mode="NumericFirstLast"  PagerStyle-HorizontalAlign="Right"  PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" Visible="true"  
CssClass="table table-striped table-hover my-table" HeaderStyle-BackColor="SeaShell"    >
<PagerStyle HorizontalAlign="Right" ForeColor="Black" CssClass ="right-pagination"/>
                    
</asp:GridView>
</div>
        <script src="Scripts/jquery-1.8.2.js"></script>
</asp:Content>
