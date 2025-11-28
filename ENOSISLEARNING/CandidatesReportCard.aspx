<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="CandidatesReportCard.aspx.cs" Inherits="ENOSISLEARNING.CandidatesReportCard" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <style>
       *
 {
     font-family: 'Montserrat', sans-serif;
 } 
       html, body {
    overflow-x: hidden !important;
}
       .container-fluid
       {
           width:95%;
       }
       .table-striped
       {
           border:none;
       }
             .table-striped tbody th {
    background: #1d96b2 !important;
    color:white;
    border:none;
    text-align:center;
     font-family: 'Montserrat', sans-serif;

}
             .table-striped tbody td
             {
                 border:none;
                 text-align:center;
                  font-family: 'Montserrat', sans-serif;
             }
        .table-striped tbody tr {
    background: white;
    
   
}
        .grid-area
        {
            max-width: 100%;
            margin-top:5px;
            overflow-x: auto;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            background-color: #f8f9fa;
        }
        .iconstyleexcel
        {
            margin-left:50px;
            border-radius:4px;
        }
        .iconstylepdf
        {
            margin-left:10px;
            border-radius:4px;
        }
        .iconstyleexcel span
        {
           position:relative;
           top:5px;
        }
        .iconstylepdf span
        {
           position:relative;
           top:5px;
        }
        .upld-resume
        {
             font-family: 'Montserrat', sans-serif;
             text-align:center;
        }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
<center>
<h4 class="upld-resume"> OVERALL INTERVIEW RESULTS</h4> 
          <div runat="server" id="div1" visible="false">
              <asp:Chart ID="chartcandidatereports" runat="server" Width="1200px">
                  <Series>
                      <asp:Series Name="score" XValueMember="Dateoftest" YValueMembers="score"
                        IsVisibleInLegend="true"
                        IsValueShownAsLabel="true" YValuesPerPoint="2"></asp:Series></Series><ChartAreas><asp:ChartArea Name="ChartArea1"></asp:ChartArea></ChartAreas></asp:Chart>

          </div> 
</center >
      <div class="container-fluid">
          <div class="grid-area">
<asp:GridView ID="grvCandidatesReports"  AutoGenerateColumns="true" runat="server"
EmptyDataText="No records has been added."   DataKeyNames="CANDIDATEID"
AllowPaging="true"  PageSize="10" PagerSettings-Mode="NumericFirstLast"  PagerStyle-HorizontalAlign="Right"  PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" Visible="true"  
CssClass="table table-striped table-hover my-table" HeaderStyle-BackColor="#0398D2"  OnPageIndexChanging="grvCandidatesReports_PageIndexChanging" >
<PagerStyle HorizontalAlign="Right" ForeColor="Black" CssClass ="right-pagination"/>
                    
          
</asp:GridView>
</div>
</div>  
</div>
<div class="row">   
<div class="col-md-6">
<h4 class="upld-resume"> INTERNAL INTERVIEWS</h4>
    <div  class="table-responsive">
        <asp:GridView ID="grInternals"  AutoGenerateColumns="false" runat="server"
EmptyDataText="No records has been added." DataKeyNames="CANDIDATEID"
AllowPaging="true"  PageSize="12" PagerSettings-Mode="NumericFirstLast"  PagerStyle-HorizontalAlign="Right"  PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" Visible="true"  
CssClass="table table-striped table-hover my-table" HeaderStyle-BackColor="#0398D2"  >
<PagerStyle HorizontalAlign="Right" ForeColor="Black" CssClass ="right-pagination"/>
                    <Columns>
                        <asp:BoundField HeaderText="ID"  DataField="CANDIDATEID" />
                        <asp:BoundField HeaderText="Date" DataField="DATEOFTEST" />
                        <asp:BoundField HeaderText="Course" DataField="COURSENAME" />
                        <asp:BoundField HeaderText="UPDATED BY" DataField="UPDATEDBY" />
                        <asp:BoundField HeaderText="TEST TYPE" DataField="TESTTYPE" />
                        <asp:BoundField HeaderText="SCORE" DataField="SCORE" />
                        <asp:BoundField HeaderText="OUT OF" DataField="OUTOF" />
                        <asp:BoundField HeaderText="FEEDBACK" DataField="FEEDBACK" />
                    </Columns>
          
</asp:GridView>
    </div>
</div>
    <div class="col-md-6">
<h4 class="upld-resume">  EXTERNAL INTERVIEWS</h4>
      <div  class="table-responsive">
<asp:GridView ID="grExternals"  AutoGenerateColumns="true" runat="server"
EmptyDataText="No records has been added."  DataKeyNames="CANDIDATEID"
AllowPaging="true"  PageSize="12" PagerSettings-Mode="NumericFirstLast"  PagerStyle-HorizontalAlign="Right"  PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" Visible="true"  
CssClass="table table-striped table-hover my-table" HeaderStyle-BackColor="#0398D2"    >
<PagerStyle HorizontalAlign="Right" ForeColor="Black" CssClass ="right-pagination"/>
                    
          
</asp:GridView>
</div>
</div>

</div>
    <br />
      <button runat="server" id="btnExcel" style=" background: #1d96b2 !important;" class="btn  iconstyleexcel" onserverclick="btnExcel_ServerClick">
                    <i style="font-size: 20px; float: left;">
                        <img src="Images/icon/excel.png" width="30" height="30" /></i><span style="font-size: 10px; margin-left: 10px;"> Export To Excel</span>
                </button>

           <button runat="server" id="btnPdf" style=" background: #1d96b2 !important;" class="btn  iconstylepdf" onserverclick="btnPdf_ServerClick">
                    <i style="font-size: 20px; float: left;">
                        <img src="img/print1.png"" width="30" height="30" /></i><span style="font-size: 10px; margin-left: 10px;"> Export To PDF</span>
                </button>

        <script src="Scripts/jquery-1.8.2.js"></script>
</asp:Content>
