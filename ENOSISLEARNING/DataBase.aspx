<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="DataBase.aspx.cs" Inherits="ENOSISLEARNING.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        * {
            font-family: 'Montserrat', sans-serif;
        }

        .drpsection {
            width: 250px;
            height: 100px;
            border: 1px solid transparent;
        }

        .lbl-margin-right {
            color: black;
            margin-left: -10px;
            font-weight: 100;
        }

        .drp {
            text-align: center;
            margin-top: 5px;
            border-radius:10px;
        }

        .container-fluid {
            width: 95%;
            height: 100%;
            margin-top: 5px;
            margin: auto;
        }

        .gridview-area {
            max-width: 100%;
            height: 500px;
            margin-top: 10px;
            overflow-x: auto;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            background-color: #f8f9fa;
        }
       .table {
            border-collapse: collapse;
            border-color: #1d96b2;
            background-color: white;
            border: none;
        }

        .gridview-header {
            text-align: center;
            background-color: #1d96b2;
            color: #fff;
            font-size: 10px;
            font-weight: bold;
            font-family: 'Montserrat', sans-serif;
        }
           .gridview-header th {
                text-align: center;
                border-color: #1d96b2;
            }

        .gridview-item {
            padding: -10px;
            transition: background-color 0.3s ease;
            text-align: center;
            font-size: 10px;
            font-family: 'Montserrat', sans-serif;
            font-weight: 500;
            color: black;
            background-color: white;
            border: none;
        }

        .size {
            height: 50px;
        }

        .pager {
            text-align: center; /* Ensure pager is centered */
            margin-top: -10px;
            border-color: white;
            width: 100%;
            background-color: transparent;
            /*position: relative;*/
            float:left;
        }

            .pager a,
            .pager span {
                padding: 9px 14px;
                margin: 2px;
                border-radius: 8px;
                background-color: #007bff;
                color: #fff;
                text-decoration: none;
                transition: background-color 0.3s, color 0.3s;
                font-weight: 500;
            }

                .pager a:last-child {
                    background-color: #d9534f;
                    color: white;
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">

        <div class="drpsection">
            <asp:Label ID="Tbl" runat="server" Text="Select Tables" Font-Bold="true" CssClass="lbl-margin-right"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control drp" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
        </div>
        <center>
            <%--<asp:Label ID="lblMessage" runat="server" ForeColor="Green" CssClass="message-label"></asp:Label>--%>
            <div id="tabs" style="height: 100%; border-radius: 15px;" class="gridview-area">

                <asp:GridView ID="GridView1" runat="server" DataKeyNames="PrimaryKeyColumn" CssClass="table table-borderless" ItemStyle-HorizontalAlign="Center" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" HeaderStyle-HorizontalAlign="Center" HeaderStyle-BorderStyle="None" HeaderStyle-BorderColor="#1d96b2" PageSize="5" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging" PagerStyle-CssClass="pager">
                    <Columns>
                        <asp:TemplateField HeaderText="Action" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" HeaderStyle-Font-Size="15px">
                            <ItemTemplate>
                                <asp:ImageButton ID="btnEdit" runat="server" Text="Edit" CommandName="Edit" ImageUrl="~/Images/edit-icon-png-3598.png" Height="20px" Width="20px" />
                                <asp:ImageButton ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" ImageUrl="~/Images/DeleteDoc.png" Height="20px" Width="20px" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:ImageButton ID="btnUpdate" runat="server" Text="Update" CommandName="Update" ImageUrl="~/Images/UpdateDoc.png" Width="20px" Height="20px" />
                                <asp:ImageButton ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel" ImageUrl="~/Images/cancel.png" Width="20px" Height="20px" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                    <EditRowStyle />
                    <HeaderStyle Font-Bold="True" BackColor="#1D96B2" ForeColor="White"></HeaderStyle>
                    <%--    <PagerStyle BackColor="#1d96b2" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />--%>
                    <PagerTemplate>
                        <div style="display: flex; justify-content: center;">
                            <asp:LinkButton ID="lbtnFirst" runat="server" CommandName="Page" CommandArgument="First">First</asp:LinkButton>
                            <asp:LinkButton ID="lbtnprev" runat="server" CommandName="Page" CommandArgument="Prev">Prev</asp:LinkButton>
                            <asp:LinkButton ID="lbtnnext" runat="server" CommandName="Page" CommandArgument="Next">Next</asp:LinkButton>
                            <asp:LinkButton ID="lbtnlast" runat="server" CommandName="Page" CommandArgument="Last">Last</asp:LinkButton>
                    </PagerTemplate>
                    <PagerStyle CssClass="pager" />
                </asp:GridView>
            </div>
        </center>
    </div>
</asp:Content>
