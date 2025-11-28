<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="AdmissionAnalysis.aspx.cs" Inherits="ENOSISLEARNING.AdmissionAnalysis" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


 
 
    <style>
          *
  {
      font-family: 'Montserrat', sans-serif;
  } 
        body {
        background-color:#fff;
        }
        .hide-div {
            display: none;
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
        .container-fluid
        {
            width:95%;
        }
        .table-striped tbody th {
    background-color: #1d96b2 !important;
    color:white;
    text-align:center;

}
        .table-striped tbody td {
    background: white;
    text-align:center;
   
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
<div>
&nbsp;
</div>
<center>
<table  style="font-size:14px;" Width="800px" >
<tr>
<td >
<center>
<h4 class="upld-resume" >ADMISSION ANALYSIS</h4>
</center>
                 


<br />
</td>
</tr>

</table>
<div>
<table>
<tr style="height:50px">
<td>C,C++,JAVA,ADV-JAVA ANALYSIS</td>
<td>.NET, MVC , WEB DESIGNING  ANALYSIS</td>
<td>SQL SERVER, MSBI, POWER BI ANALYSIS </td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
</tr>
</table>
    <div class="container-fluid">
<asp:GridView ID="grvCandidatesFees"  AutoGenerateColumns="false" runat="server"
EmptyDataText="No records has been added."  DataKeyNames="COUNSELLORNAME"
AllowPaging="true"  PageSize="12" PagerSettings-Mode="NumericFirstLast"  PagerStyle-HorizontalAlign="Right"  PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" Visible="true"  
CssClass="table table-striped table-hover my-table" HeaderStyle-BackColor="SeaShell"  OnPageIndexChanging="grvCandidatesFees_PageIndexChanging"   >
<PagerStyle HorizontalAlign="Right" ForeColor="Black" CssClass ="right-pagination"/>
                    
<Columns>
                           
<asp:BoundField DataField="COUNSELLORNAME" HeaderText="COUNSELLORNAME"  />
<asp:BoundField DataField="TOTALFEES" HeaderText="TOTALFEES"  />
<asp:BoundField DataField="STUDENTCOUNTS" HeaderText="STUDENTCOUNTS" />
                             
                           
                            
</Columns>
</asp:GridView>
        
</div>
  </div>  
</center>
</asp:Content>
