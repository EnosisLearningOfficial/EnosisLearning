<%@ Page Title="" Language="C#" MasterPageFile="~/LEARNING.Master" AutoEventWireup="true" CodeBehind="PinCode.aspx.cs" Inherits="ENOSISLEARNING.PinCode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
        body
        {
            margin:0px;
            padding:0px;
        }
         tr.myclass a
         {
             padding:10px;
         }
         .main
         {
             width:700px;
             height:60px;
             margin:auto;
         }
         .statedrp
         {
             width:250px;
             height:50px;
             border-radius:25px;
             margin:5px 0px 0px 65px;
             background-color:#f0ad4eff;
             color:#fff;
             font-family:Verdana, Geneva, Tahoma, sans-serif;
             font-weight:600;
             font-size:15px;
             text-align:center;
             border:3px solid #fff;
         }
         .citydrp
         {
             width:250px;
             height:50px;
             border-radius:25px;
             margin:5px 0px 0px 28px;
             background-color:#f0ad4eff;
             color:#fff;
             font-family:Verdana, Geneva, Tahoma, sans-serif;
             font-weight:600;
             font-size:15px;
             text-align:center;
             border:3px solid #fff;
         }
         .button
         {
             width:80px;
             height:40px;
             border-radius:25px;
             margin:10px 0px 0px 15px;
             background-color:#963923ff;
             color:#fff;
             font-family:Verdana, Geneva, Tahoma, sans-serif;
             font-weight:900;
             text-align:center;
             border:1px solid #f0ad4eff;
         }
         .button:hover
         {
             background-color:#25d366ff;
         }
         .gridView
         {
             width:700px;
             margin:auto;
         }
         .grv
         {
            width:700px;
            margin-top:-10px;
            text-align:center;
         }
         .GridHeader
          {
              text-align:center;
              font-size:15px;
              color:#fff;
              font-family:Verdana, Geneva, Tahoma, sans-serif;
              font-weight:700;
          }
         .items
         {
             font-size:15px;
             color:#d9534fff;
             font-family:Verdana, Geneva, Tahoma, sans-serif;
             font-weight:500;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--navbar starts here--%>
        <nav class="navbar bg-body-tertiary" style="background-color:#f0ad4eff; margin-top:-30px;">
            <div class="container-fluid">
                 <%--dropdown starts here--%>
                <div class="col">
                    <div class="main">
                        <table>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="drpState" runat="server" OnSelectedIndexChanged="drpState_SelectedIndexChanged" AutoPostBack="true"  CssClass="statedrp"></asp:DropDownList>         
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpCity" OnSelectedIndexChanged="drpCity_SelectedIndexChanged" AutoPostBack="true" runat="server" CssClass="citydrp"></asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Button ID="Button1" Text="Search" runat="server" CssClass="button" OnClick="Search"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <%--dropdown ends here--%>
            </div>
        </nav>
    <%--navbar ends here--%>       
    <%--GridView Starts here--%>
    <div class="gridView">
            <asp:GridView ID="grvpincode" runat="server" AutoGenerateColumns="False" AllowPaging="true" OnPageIndexChanging="OnPageIndexChanging" PageSize="10" PageIndex="1" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" CssClass="grv">
                    <Columns>
                        <asp:BoundField HeaderText="OFFICE" DataField="OFFICE" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="GridHeader">
                        <ItemStyle HorizontalAlign="Center" CssClass="items"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField HeaderText="TALUKA" DataField="TALUKA" HeaderStyle-CssClass="GridHeader" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <ItemStyle HorizontalAlign="Center" CssClass="items"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField HeaderText="PINCODE" DataField="PINCODE" HeaderStyle-CssClass="GridHeader" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <ItemStyle HorizontalAlign="Center" CssClass="items"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FFF1D4" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                    <pagerstyle cssclass="myclass" />  
                    <pagersettings mode="NextPrevious" previouspagetext="Previous" nextpagetext="Next"/>  
            </asp:GridView>
    </div>
        <%--GridView ends here--%>
        <%--Label starts here--%>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblmsg" Font-Bold="true" ForeColor="Green" runat="server" /> 
                </td>
            </tr>
        </table>
        <%--Label ends here--%>    
</asp:Content>
