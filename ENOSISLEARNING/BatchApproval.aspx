<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="BatchApproval.aspx.cs" Inherits="ENOSISLEARNING.BatchApproval" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
                 *
         {
             font-family: 'Montserrat', sans-serif;
         }
         .container
         {
            width:95%;
            height:100%;
            border:1px solid transparent;
         }
         .top-info
         {
             width:100%;
             height:30px;
             border:1px solid transparent;
             display:flex;  
         }
         .top-items
         {
             width:150px;
             height:100%;
             background-color:transparent;
             margin:auto;
         }
         .querystring-label2 
         {
             display: inline-block;
             padding-left:5px;
             color: grey;
             font-size: 10px;
             font-weight: bold;
             text-transform: uppercase;
             font-family:'Montserrat', sans-serif;
             letter-spacing: 1px;       
             transition: background-color 0.3s ease;
         }
         .fa-solid
        {
         margin-top:10px;
         font-size:15px;
         margin-left:88%;
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
     border-color:#1d96b2;
     background-color:white;
}
.gridview-item
{
    padding-left:50px;
    font-weight:normal;
    transition: background-color 0.3s ease;
    text-align:justify;
    font-size:10px;
    font-family: 'Montserrat', sans-serif;
    font-weight:500;
    color:black;
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
/* .gridview-item:hover {
     background-color: rgba(0, 0, 0, 0.03);
 }*/

 .gridview-header-item {
     padding: 12px;
     text-align: center;
     background-color: #4caf50;
     color: #fff;
     border-radius: 8px;
     position: relative;
     cursor: pointer;
     transition: background-color 0.3s ease;
 }

 .gridview-header-item:hover {
     background-color: #388e3c;
 }

 .gridview-header-item::after {
     content: "\f0dc"; /* FontAwesome icon for sorting */
     font-family: "Font Awesome 5 Free";
     font-weight: 900;
     position: absolute;
     right: 10px;
     top: 50%;
     transform: translateY(-50%);
     opacity: 0.7;
 }
 .footer
{
    border-bottom:0.5px solid lightgrey;
    border-top:none;
    border-right:none;
    border-left:none;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
         <div class="gridview-area">
     <asp:GridView ID="gvEnrollmentRequests" runat="server" AutoGenerateColumns="False" CssClass="table table-striped"
        EmptyDataText="No requests found" AllowPaging="true" PageSize="10" OnPageIndexChanging="gvEnrollmentRequests_PageIndexChanging" BorderColor="White">
        <Columns>
            <asp:BoundField DataField="CandidateID" HeaderText="Candidate ID" />
            <asp:BoundField DataField="CandidateName" HeaderText="Candidate Name" />
            <asp:BoundField DataField="RequestedCourse" HeaderText="Course Name" />
            <asp:BoundField DataField="RequestedDate" HeaderText="Requested Date" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="PreviouslyEnrolledCourse" HeaderText="Previously Enrolled Course" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="btnApprove" runat="server" Text="Approve" CssClass="btn btn-success"
                        CommandArgument='<%# Eval("ApprovalID") %>' OnClick="btnApprove_Click" />
                    <asp:Button ID="btnReject" runat="server" Text="Reject" CssClass="btn btn-danger"
                        CommandArgument='<%# Eval("ApprovalID") %>' OnClick="btnReject_Click" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
  </div>
</div>
</asp:Content>
