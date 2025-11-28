<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="ViewCompany.aspx.cs" Inherits="ENOSISLEARNING.ViewCompany" %>
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
  .buttons
{
    display:flex;
    margin:5px 0px 0px 0px;
}
   .btn-custom {
    width:15%;
    height:35px;
    display: inline-block;
    padding: 5px 5px;
    text-decoration: none;
    color: #fff;
    background-color: #1d96b2;
    border-radius: 5px;
    transition: all 0.3s ease;
}
  .btn:hover
   {
  background-color:tomato;
   transform: scale(1.1);
   color:white;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <div class="gridview-area">
        <asp:GridView ID="grvCompany" AutoGenerateColumns="False" runat="server" DataKeyNames="COMPANY_ID" EmptyDataText="No records has been added."  OnRowCommand="grvCompany_RowCommand" BorderStyle="None" AlternatingRowStyle-BackColor="white"  AlternatingRowStyle-ForeColor="black" CssClass="table table-borderless gridview-table" FooterStyle-CssClass="footer" OnRowDeleting="grvCompany_RowDeleting" OnRowUpdating="grvCompany_RowUpdating" OnPageIndexChanging="grvCompany_PageIndexChanging" PageSize="10" PagerStyle-CssClass="pager" AllowPaging="True" OnRowEditing="grvCompany_RowEditing" OnRowCancelingEdit="grvCompany_RowCancelingEdit" >
         
            <Columns>
                             
                 <asp:TemplateField HeaderText="COMPANY NAME" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="8%">
                     <ItemTemplate>
                        <asp:Label ID="COMPANY_NAME" runat="server"  Text='<%#Eval("COMPANY_NAME") %>' ToolTip='<%# Bind("COMPANY_NAME")%>' CssClass="gridview-item" Style="display: block; border-radius: 15px; text-align:center; border-style: none; width: 200px; height: 22px; overflow: hidden;"/>
                    </ItemTemplate>
                      <EditItemTemplate>
                    <asp:TextBox ID="txtECOMPANY_NAME" Style="display: block; border-radius: 15px; text-align:center; width: 200px; height: 22px; overflow: hidden;" runat="server" Text='<%# Bind("COMPANY_NAME")%>' ToolTip='<%# Bind("COMPANY_NAME")%>' ></asp:TextBox>
                    </EditItemTemplate>
                 </asp:TemplateField>

                <asp:TemplateField HeaderText="COMPANY WEBSITE" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="10%">
                     <ItemTemplate>
                        <asp:Label ID="COMPANY_WEBSITE" runat="server"  Text='<%#Eval("WEBSITE") %>' ToolTip='<%# Bind("WEBSITE")%>' CssClass="gridview-item" Style="display: block;  border-radius: 15px; text-align:center; border-style: none; width: 200px; height: 22px; overflow: hidden;"/>
                    </ItemTemplate>
                     <EditItemTemplate>
                       <asp:TextBox ID="txtEWEBSITE" Style="display: block; border-radius: 15px; text-align:center; width: 200px; height: 22px; overflow: hidden;" runat="server" Text='<%# Bind("WEBSITE")%>'  ></asp:TextBox>
                   </EditItemTemplate>
                 </asp:TemplateField> 

                <asp:TemplateField HeaderText="COMPANY ADDRESS" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="20%">
                     <ItemTemplate>
                        <asp:Label ID="COMPANY_ADDRESS" runat="server"  Text='<%#Eval("COMPANY_ADDRESS") %>' ToolTip='<%# Bind("COMPANY_ADDRESS")%>' CssClass="gridview-item" Style="display: block; border-radius: 15px; text-align:center; border-style: none; width: 200px; height: 17px; overflow: hidden;"/>
                    </ItemTemplate>
                     <EditItemTemplate>
                     <asp:TextBox ID="textECOMPANY_ADDRESS" Style="display: block; border-radius: 15px; text-align:center; width: 200px; height: 22px; overflow: hidden;" runat="server" Text='<%# Bind("COMPANY_ADDRESS")%>' ToolTip='<%# Bind("COMPANY_ADDRESS")%>'  ></asp:TextBox>
                </EditItemTemplate>
                 </asp:TemplateField> 

                <asp:TemplateField HeaderText="CONTACT NO" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="5%">
                     <ItemTemplate>
                        <asp:Label ID="CONTACT_NO" runat="server"  Text='<%#Eval("CONTACT_NO") %>' ToolTip='<%# Bind("CONTACT_NO")%>' CssClass="gridview-item" Style="display: block; border-radius: 15px; text-align:center; border-style: none;  height: 17px; overflow: hidden;"/>
                    </ItemTemplate>
                    <EditItemTemplate>
                <asp:TextBox ID="txtECONTACT_NO" Style="display: block; border-radius: 15px; text-align:center; width: 200px; height: 22px; overflow: hidden;" runat="server" 
                    Text='<%# Bind("CONTACT_NO")%>' ToolTip='<%# Bind("CONTACT_NO")%>'/>

             <%--   <asp:RegularExpressionValidator ID="revMobile" ControlToValidate="txtEMobile" runat="server" 
                    ValidationExpression="^[0-9]+$" ErrorMessage="Only numbers are allowed." ForeColor="Red" />--%>
             </EditItemTemplate>
                 </asp:TemplateField>

                <asp:TemplateField HeaderText="EMAIL" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                     <ItemTemplate>
                        <asp:Label ID="EMAIL" runat="server"  Text='<%#Eval("EMAIL") %>' ToolTip='<%# Bind("EMAIL")%>' CssClass="gridview-item" style="text-align:center;"/>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEEmail" Style="display: block; border-radius: 15px; text-align:center; width: 200px; height: 22px; overflow: hidden;" runat="server" Text='<%# Bind("EMAIL")%>' ToolTip='<%# Bind("EMAIL")%>'></asp:TextBox>
                    </EditItemTemplate>
                 </asp:TemplateField>


                <asp:TemplateField HeaderText="Delete" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="8%">
                    <ItemTemplate>
                       
                           <asp:ImageButton ID="btnEdit1" runat="server" CausesValidation="false" CommandName="Edit" Text="Delete" ToolTip="Update"  ImageUrl="~/img/Edit1.png" Width="20" Height="20" />
                          <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false" onclientclick="return confirm('Do you want to delete this record?');" CommandName="Delete" Text="Delete" ToolTip="Delete"  ImageUrl="~/img/Delete3.png" Width="20" Height="20" />
                    </ItemTemplate>

        <EditItemTemplate>
           <asp:ImageButton ID="btnUpdate" runat="server" CausesValidation="false" onclientclick="return confirm('Do you want to Update this record?');" CommandName="Update" Text="SAVE" ToolTip="Update"  ImageUrl="~/img/Add4.png" Width="20" Height="20" />
            <asp:ImageButton ID="btnCancel" runat="server"  CausesValidation="false" onclientclick="return confirm('Do you want to Cancel this record?');" CommandName="Cancel" Text="Cancel" ToolTip="Cancel"  ImageUrl="~/img/cancel2.png" Width="20" Height="20" />
        </EditItemTemplate>   
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
       <div  class="buttons">
             <button runat="server" id="btnAddCompany" class="btn btn-custom" onserverclick="btnAddCompany_ServerClick">
               <i style="font-size: 20px; float:right;">
                   <img src="img/candidate.png" height="30" style="width: 42px" /></i><span style="font-size: 15px;font:normal;"> Add Company</span>
           </button>
       </div>
</div>
</asp:Content>
