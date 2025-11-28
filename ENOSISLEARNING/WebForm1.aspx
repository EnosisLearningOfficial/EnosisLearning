<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ENOSISLEARNING.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous"/>
  </head>
<body>
    <form id="form1" runat="server">
        <table class="table table-borderless">
            <tr>
                <td>
                      <asp:TextBox ID="nametxt" runat="server" placeholder="Name"/>
                </td>
            </tr>
            <tr>
                <td>
                      <asp:TextBox ID="agetxt" TextMode="Number" runat="server" placeholder="Age"/>
                </td>
            </tr>
            <tr>
                <td>
                      <asp:TextBox ID="destxt"  runat="server" placeholder="Designation"/>
                </td>
            </tr>
            <tr>
                <td>
                     <asp:TextBox ID="emailtxt"  runat="server" placeholder="Email"/>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="contacttxt"  runat="server" placeholder="Contact"/>
                </td>
            </tr>
            <tr>
                <td>
                     <asp:Button ID="Savebtn" Text="Save" runat="server" OnClick="Savebtn_Click"/>
               
                     <asp:Button ID="Viewbtn" Text="View" runat="server" OnClick="Viewbtn_Click"/>
               
                     <asp:Button ID="Editbtn" Text="Edit" runat="server"/>
               
                     <asp:Button ID="Deletebtn" Text="Delete" runat="server"/>
                </td>
            </tr>
        </table>
        <asp:Repeater ID="Repeater1" runat="server">
            <HeaderTemplate>
                <table class="table table-bordered">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Age</th>
                        <th>Designation</th>
                        <th>Email</th>
                        <th>Contact</th>
                        <th>Action</th>
                    </tr>
            </HeaderTemplate>

            <ItemTemplate>
                <tr>
                    <td><%# Eval("Id") %></td>
                    <td><%# Eval("Name") %></td>
                    <td><%# Eval("Age") %></td>
                    <td><%# Eval("Designation") %></td>
                    <td><%# Eval("Email") %></td>
                    <td><%# Eval("Contact") %></td>
                    <td>
                        <a id="Editbtn" class="btn btn-primary"/>
                        <asp:Button ID="Deletebtn" Text="Delete" runat="server" CssClass="btn btn-danger"/>
                    </td>
                </tr>
            </ItemTemplate>

            <FooterTemplate>
                </table>
            </FooterTemplate>
       </asp:Repeater>
    </form>
</body>
</html>
