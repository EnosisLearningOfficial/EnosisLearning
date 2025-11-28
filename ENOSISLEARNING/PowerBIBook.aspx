<%@ Page Title="" Language="C#" MasterPageFile="~/LEARNING.Master" AutoEventWireup="true" CodeBehind="PowerBIBook.aspx.cs" Inherits="ENOSISLEARNING.PowerBIBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
          <object data="Books/POWERBI_BOOK.pdf" type="application/pdf"  style="width:100%;height:100vh;">
</object>
</div>

</asp:Content>
