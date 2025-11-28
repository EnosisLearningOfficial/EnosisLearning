<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMaster.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="ENOSISLEARNING.Student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        setTimeout(function () {
            window.location.href = "Login.aspx"; // Redirect to login page
        }, 2000);
    </script>
    <h2>Logging out, please wait...</h2>
</asp:Content>
