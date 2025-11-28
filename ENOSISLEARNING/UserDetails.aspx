<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="UserDetails.aspx.cs" Inherits="ENOSISLEARNING.Users_Details" %>
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
             margin-top :5px;
             margin:auto;
         }
          .top
         {
             margin-top :5px;
             width:100%;
             height:30px;
             background-color:transparent;
             display:flex;
         }
          .drp
          {
              margin-left:10px;
          }
          .form-control
         {
            border: 1px solid #efeeed;
            border-radius: 5px;
            font-size: 12px;
            font-weight:600;
            height:30px;
         }
           .custom-select 
         {
         width: 35%;
         height: 30px;
         padding: 5px;
         background-color:transparent;
         font-size: 12px;
         color:dimgray;
         font-weight:500;
         border:none;
         transition: border-color 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
         }
         .custom-select:focus 
         {
         border-color: #1d96b2;
         border-radius:8px;
         outline: 0;
         box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
         }
         .btn-custom {
         width:100px;
         height:30px;
        display: inline-block;
        padding: 2px 2px;
        text-decoration: none;
        color: #fff;
        background-color: #1d96b2;
        border-radius: 5px;
        transition: all 0.3s ease;
        margin-left:10px;
        }
          .btn:hover
           {
          background-color:tomato;
           transform: scale(1.1);
           color:white;
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
     background-color :white;
}
.gridview-item
{
    padding:-10px;
    transition: background-color 0.3s ease;
    text-align:center;
    font-size:10px;
    font-family: 'Montserrat', sans-serif;
    font-weight:500;
    color:black;
    background-color :white;
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
     background-color :white;
 }
  .footer
{
    border-bottom:0.5px solid lightgrey;
    border-top:none;
    border-right:none;
    border-left:none;
}
  .pager {
     text-align: right;
     margin-top: 22px;
     border-color:white;
     position:absolute;
     right:65px;
     background-color:transparent;

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
    </style>  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
         <div class="top">
             <div><asp:TextBox ID="txtName" runat="server" CssClass="form-control"  placeholder="Name" /></div>
             <div class="drp">
                 <asp:DropDownList ID="drpStatus"  runat="server"  style="height:30px"  AutoPostBack="true" CssClass="form-control"  OnSelectedIndexChanged="drpStatus_SelectedIndexChanged">
                    <asp:ListItem Text="ACTIVE" Selected="True" />
                    <asp:ListItem Text="INACTIVE" /> 
                </asp:DropDownList>
             </div>
             <div><asp:Button ID="btnSearch" Text="Search"  runat="server"  OnClick="btnSearch_Click" CssClass="btn btn-custom" BorderStyle="Solid"></asp:Button></div>
             <div><asp:Button ID="Button1"  runat="server" OnClick="Unnamed_Click"   CssClass="btn btn-custom" BorderStyle="Ridge" Text="Add User"></asp:Button></div>
         </div>
         <div class="gridview-area">
             <asp:GridView ID="gvDetails" DataKeyNames="USERID,USERNAME,PASSWORD,FULLNAME,DOB,EMAILID,MOBILENO,DOJ,DESIGNATION,SKILLS" runat="server" AutoGenerateColumns="false" EmptyDataText="No records has been added." AllowPaging="true" PageSize="8" OnPageIndexChanging="gvDetails_PageIndexChanging"  OnRowCommand="gvDetails_RowCommand"  OnRowDeleting="gvDetails_RowDeleting" BorderStyle="None" AlternatingRowStyle-BackColor="white"  AlternatingRowStyle-ForeColor="black" CssClass="table table-borderless gridview-table" FooterStyle-CssClass="footer" PagerStyle-CssClass="pager">
                 <Columns>
                     <asp:TemplateField HeaderText="USERID" HeaderImageUrl="~/Images/customer2.png" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">   
                        <EditItemTemplate >
                            <asp:Label ID="txtID" runat="server" Text='<%#Eval("USERID") %>' CssClass="gridview-item"/>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblitemID" runat="server" Text='<%#Eval("USERID") %>' CssClass="gridview-item"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="USERNAME" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                        <EditItemTemplate>
                            <asp:Label ID="lbleditusr" runat="server" Text='<%#Eval("USERNAME") %>' CssClass="gridview-item"/>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblitemUsr" runat="server" Text='<%#Eval("USERNAME") %>' CssClass="gridview-item"/>
                        </ItemTemplate>
                 </asp:TemplateField>
                <asp:TemplateField HeaderText="FULLNAME"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtstate" runat="server" Text='<%#Eval("FULLNAME") %>' CssClass="gridview-item"/>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblstate" runat="server" Text='<%#Eval("FULLNAME") %>' CssClass="gridview-item"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DOB" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                <EditItemTemplate>
                    <asp:TextBox ID="txtdob" runat="server" Text='<%#Eval("DOB", "{0:M-dd-yyyy}") %>' CssClass="gridview-item"/>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbldob" runat="server" Text='<%#Eval("DOB", "{0:dd MMMM yyyy}") %>' CssClass="gridview-item"/>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DOJ" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                    <EditItemTemplate>
                    <asp:TextBox ID="txtdoj" runat="server" Text='<%#Eval("DOJ", "{0:M-dd-yyyy}") %>' CssClass="gridview-item"/>
                    </EditItemTemplate>
                    <ItemTemplate>
                    <asp:Label ID="lbldoj" runat="server" Text='<%#Eval("DOJ", "{0:M-dd-yyyy}") %>' CssClass="gridview-item"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="EMAILID"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtemail" runat="server" Text='<%#Eval("EMAILID") %>' CssClass="gridview-item"/>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblemail" runat="server" Text='<%#Eval("EMAILID") %>' CssClass="gridview-item"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MOBILENO"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                    <EditItemTemplate>
                    <asp:TextBox ID="txtmobile" runat="server" Text='<%#Eval("MOBILENO") %>' CssClass="gridview-item"/>
                    </EditItemTemplate>
                    <ItemTemplate>
                    <asp:Label ID="lblmobile" runat="server" Text='<%#Eval("MOBILENO") %>' CssClass="gridview-item"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DESIGNATION"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtdegn" runat="server" Text='<%#Eval("DESIGNATION") %>' CssClass="gridview-item"/>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbldegn" runat="server" Text='<%#Eval("DESIGNATION") %>' CssClass="gridview-item"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField  HeaderText="Action" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                    <ItemTemplate>
                        <asp:ImageButton ID="imgbtnEdit" CommandName="btnEdit" runat="server" CausesValidation="false" ImageUrl="Images/edit-icon-png-3598.png" OnClick="imgbtnEdit_Click" ToolTip="Edit" Height="20px" Width="20px" CssClass="gridview-item"/>
                        <asp:ImageButton ID="imgbtnDelete" CommandName="Delete" Text="Delete" ClientIDMode="Static" runat="server" ImageUrl="Images/DeleteDoc.png" ToolTip="Delete" Height="20px" Width="20px" OnClientClick="return confirm('Are you sure to delete?');" CssClass="gridview-item"/>
                    </ItemTemplate>
                </asp:TemplateField>
                 </Columns>
                 <PagerTemplate>
    <asp:LinkButton ID="lbtnFirst" runat="server" CommandName="Page" CommandArgument="First">First</asp:LinkButton>
    <asp:LinkButton ID="lbtnprev" runat="server" CommandName="Page" CommandArgument="Prev">Prev</asp:LinkButton>
    <asp:LinkButton ID="lbtnnext" runat="server" CommandName="Page" CommandArgument="Next">Next</asp:LinkButton>
    <asp:LinkButton ID="lbtnlast" runat="server" CommandName="Page" CommandArgument="Last">Last</asp:LinkButton>
</PagerTemplate>
             </asp:GridView>
         </div>
     </div>
</asp:Content>
