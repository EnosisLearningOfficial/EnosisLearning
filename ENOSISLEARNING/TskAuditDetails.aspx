<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="TskAuditDetails.aspx.cs" Inherits="ENOSISLEARNING.TskAuditDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
*
{
    font-family: 'Montserrat', sans-serif;
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
 .gridview-header {
 text-align:center;
 background-color: #1d96b2;
 color: #fff;
 font-size:10px;
 font-weight: bold;
 font-family: 'Montserrat', sans-serif;
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
.table
{
     border-collapse: collapse;
     border-color:#1d96b2;
     background-color :white;
}
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:UpdatePanel runat="server">
<ContentTemplate>
<asp:TextBox ID="txtJobID" Visible="false" runat="server" Text='<%# Eval("Id") %>' ReadOnly="True" CssClass="txt" />
<div class="container">
   <div class="gridview-area" style="height:100%; border-radius: 15px;">
     <asp:GridView ID="AuditGrv" runat="server" AutoGenerateColumns="False" CssClass="table table-borderless gridview-table" ShowHeaderWhenEmpty="true" BorderStyle="None" BackColor="White" PageSize="5"  PagerStyle-CssClass="pager" OnPageIndexChanging="AuditGrv_PageIndexChanging">
        <Columns>
            <asp:BoundField DataField="AuditID" HeaderText="Audit ID" SortExpression="AuditID" HeaderStyle-CssClass="gridview-header" HeaderStyle-Font-Bold="true" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" />
            <asp:BoundField DataField="EmployeeID" HeaderText="Emp ID" SortExpression="EmployeeID" HeaderStyle-CssClass="gridview-header" HeaderStyle-Font-Bold="true" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" />
            <asp:BoundField DataField="Action" HeaderText="Action" SortExpression="Action" HeaderStyle-CssClass="gridview-header" HeaderStyle-Font-Bold="true" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" />
            <asp:BoundField DataField="ActionDate" HeaderText="Action Date" SortExpression="ActionDate" HeaderStyle-CssClass="gridview-header" HeaderStyle-Font-Bold="true" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" />
            <asp:BoundField DataField="USERNAME" HeaderText="Username" SortExpression="USERNAME" HeaderStyle-CssClass="gridview-header" HeaderStyle-Font-Bold="true" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" />
            <asp:BoundField DataField="EName" HeaderText="Employee Name" SortExpression="EName" HeaderStyle-CssClass="gridview-header" HeaderStyle-Font-Bold="true" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" />
            <asp:BoundField DataField="TaskName" HeaderText="Task Name" SortExpression="TaskName" HeaderStyle-CssClass="gridview-header" HeaderStyle-Font-Bold="true" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" />
            <asp:BoundField DataField="StartDate" HeaderText="Start Date" SortExpression="StartDate" HeaderStyle-CssClass="gridview-header" HeaderStyle-Font-Bold="true" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" />
            <asp:BoundField DataField="EndDate" HeaderText="End Date" SortExpression="EndDate" HeaderStyle-CssClass="gridview-header" HeaderStyle-Font-Bold="true" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" HeaderStyle-CssClass="gridview-header" HeaderStyle-Font-Bold="true" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" />
           <%-- <asp:BoundField DataField="Comment" HeaderText="Comment" SortExpression="Comment" HeaderStyle-CssClass="gridview-header" HeaderStyle-Font-Bold="true" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None"  />--%>
            <asp:TemplateField HeaderText="Comment" SortExpression="Comment" HeaderStyle-CssClass="gridview-header" HeaderStyle-Font-Bold="true">
            <ItemTemplate>
                <asp:TextBox ID="txtComment" runat="server" Text='<%# Eval("Comment") %>' 
                             TextMode="MultiLine" Rows="4" Columns="20" 
                             Style="text-align: center; border-radius: 15px; border-style: none; width: 350px; height: 22px;" />
            </ItemTemplate>
        </asp:TemplateField>
          <%--  <asp:BoundField DataField="Details" HeaderText="Details" SortExpression="Details" HeaderStyle-CssClass="gridview-header" HeaderStyle-Font-Bold="true" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" />--%>
                <asp:TemplateField HeaderText="Details" SortExpression="Details" HeaderStyle-CssClass="gridview-header" HeaderStyle-Font-Bold="true">
    <ItemTemplate>
        <asp:TextBox ID="txtDetails" runat="server" Text='<%# Eval("Details") %>' 
                     TextMode="MultiLine" Rows="4" Columns="20" 
                     Style="text-align: center; border-radius: 15px; border-style: none; width: 100px; height: 22px;" />
    </ItemTemplate>
</asp:TemplateField>
        </Columns>
  <RowStyle borderStyle="Solid" BorderColor="#f8f9f9"/>
  <EditRowStyle Height="50%" />
  <HeaderStyle Font-Bold="True" BackColor="#1D96B2" ForeColor="White"></HeaderStyle>
  <PagerStyle ForeColor="White" HorizontalAlign="Center" /> <%-- BackColor="#1d96b2"--%>
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
</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>
