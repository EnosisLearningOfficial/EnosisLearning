<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="DocumentManager.aspx.cs" Inherits="ENOSISLEARNING.DocumentManager" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="AjaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <style>
     *
     {
        font-family: 'Montserrat', sans-serif;
     }
      .container-fluid
        {
 
           width:95%;
           margin-top :5px;
           margin:auto;
        }
     .head
     {
         width:100%;
         height:100px;
         border:0px solid green;
     }
     .form-control
     {
       text-align:center;
     }
     th
     {
         text-align:center;
         margin-bottom:5px;
     }
     .SortBy
     {
         display:inline;
         width:53%;
         height:30px;
         margin-bottom:25px;
     }
     .drp
     {
         width:150px;
         font-family:'Times New Roman';
         font-weight:500;
         border-top:none;
         border-right:none;
         border-left:none;
     }
      .txtbx
      {
           width:200px;
           font-family:'Times New Roman';
           margin-left:10px;
           border-top:none;
           border-right:none;
           border-left:none;
           border-bottom:1px solid grey;
      }
      .grv
      {
          margin-top:15px;
      }
      .file
      {
          color:black;
      }
      .heading
      {
          font-weight:700;
      }
      .tab
      {
          
      }
     
     .gridview-area
{
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
    text-align:left;
    font-size:13px;
    font-family: 'Montserrat', sans-serif;
    font-weight:500;
    color:black;
    background-color :white;
    overflow:hidden;
     width: 150px;
    display: inline-block;
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
 .gridview-item:hover 
 {
      background-color: rgba(0, 0, 0, 0.03);
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
  .font{
      font-size: 14px;
  }
  .vacancy-top-tab {
 text-align: center;
 padding: 10px 10px 10px;
 background-color: #1d96b2;  
 border-radius:15px;
 }
 .vacancy-top-tab select {
 padding: 7px;
 border:none;
 position: relative;
 top: 1px;
 }
 .br
 {
     border-radius: 15px;     
 }
 .close
 {
     width:30px;
     height:30px;
     color:red;
     font-size:40px;
 }
 .close:hover
 {
     color:red;
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
#btnRDemo img,span
{
    position:relative;
    bottom:3px;
}
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          <div class="container-fluid">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="vacancy-top-tab" style="height:70px">
            <table style=" background-color :#1d96b2;border-radius: 15px;border-collapse: separate; border-spacing: 5px;">
             <tr>
            <td class="text-center" style="border-radius:15px;border-style: none;">
          <asp:TextBox ID="txtdocname"  Height="35px" Width="250px" Style="border-radius:50px; text-align:center" runat="server" placeholder="Document Name"></asp:TextBox>
          </td>
                 <td>
                      <asp:LinkButton ID="Btnsearch" Width="35px" Height="35px" style="background-color:white; border-radius:15px" runat="server" onclick="Btnsearch_Click1">
 <img src="../img/View.png" title="Search" height="25" width="25" /><span class="hidden-xs"></span></asp:LinkButton>
                 </td>
                 <td>
                     <asp:Button ID="ViewAll"  runat="server" onclick="ViewAll_Click" Text="View All" BorderColor="Green"  BackColor="Green" CssClass="btn btn-danger bton datafield br" BorderStyle="Solid"   />
                 </td>
           <td style="border-style: none;">

        <a id="btnRDemo" href="#" class="btn btn-danger br" style="box-shadow: 1px 1px 3px 1px gray;height:33px;" data-toggle="modal" data-target="#myDocModal" target="_parent"><img src="../img/Add4.png"  title="Add" height="25" width="25" /> &nbsp;ADD NEW DOCUMENT</a> 
               
         </td>
        </tr>
        </table>
            
            <!-- Modal Dialog -->
   
        
    <div id="myDocModal" clientidmode="Static" class="modal fade" data-backdrop="false"  role="dialog" style="background-color:#ddd;">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content br" style="background-color:MintCream;width: 90%;">
          <div class="modal-content br">
   <br /> <button type="button" class="close" data-dismiss="modal">&times;</button>
    <div class="modal-header" style="border-style: none;color:#2191C0"">
     <h4 class="modal-title modal-dialog-centered"><b>Add New Document</b></h4> 
    </div>
    <div class="modal-body">
<b><asp:Label ID="Label1" runat="server" Text="Document Name"></asp:Label></b>
   <asp:TextBox ID="txtname" CssClass="form-control br" style="text-align:center;" runat="server" placeholder="Enter_Document_Name" />
        <asp:RequiredFieldValidator ID="rfvalid" runat="server" ErrorMessage="Name is Required" ForeColor="Red" ControlToValidate="txtname" ValidationGroup="test" CssClass="float-right"></asp:RequiredFieldValidator>

<b><asp:Label ID="Label2" runat="server" Text="File"></asp:Label></b>
    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control br" />
        <asp:RequiredFieldValidator ID="rfvalidfile" runat="server" ErrorMessage="File is Required" ForeColor="Red" ControlToValidate="FileUpload1" ValidationGroup="test" CssClass="float-right"></asp:RequiredFieldValidator>
     </div>
     <div class="modal-footer" style="border-style: none;">
     <asp:Button ID="Btnsave" runat="server" Text="Save" ValidationGroup="test" OnClick="Btnsave_Click" Width="90px" height="30px" Cssclass="btn-primary br"/>
     </div>
 </div>
            <div class="clearfix"></div>
         </div>
        </div>
      </div>
    </div>
         <div id="tabs" style="height:100%; border-radius: 15px;" class="gridview-area">  

     <center><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="docId" OnRowEditing="GridView1_RowEditing"  
         OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowUpdating="GridView1_RowUpdating"  HeaderStyle-BackColor="#14A3C7" AllowPaging="true" PagerSettings-Mode="NumericFirstLast" PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last"  PageSize="10" PagerStyle-CssClass="pager" BorderStyle="None" AlternatingRowStyle-BackColor="white"   CssClass="table table-borderless gridview-table text-center" FooterStyle-CssClass="footer" OnRowCommand="GridView1_RowCommand">
              <Columns>
                 
                  <asp:TemplateField HeaderText="Document Name"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                         <ItemTemplate>
                    <asp:Label ID="lbldname" Text='<%#Eval("DocumentName") %>' ToolTip='<%# Bind("DocumentName")%>'  style="height: 22px; overflow:hidden;" runat="server"  CssClass="gridview-item"/>
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:TextBox ID="txtdname" style="text-align: center;" Text='<%#Eval("DocumentName") %>' runat="server" Width="250px"/>
                         </EditItemTemplate>
                         </asp:TemplateField>

                  <asp:TemplateField HeaderText="File Name"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                         <ItemTemplate>

                  <asp:Label ID="lblpath" Text='<%#Eval("DocumentFile") %>' ToolTip='<%# Bind("DocumentFile")%>' style="height: 22px; overflow:hidden;" runat="server"  CssClass="gridview-item" Width="700px" />

                         </ItemTemplate>

                         <EditItemTemplate>
                             <asp:FileUpload ID="txtpath" style="text-align: center;" Text='<%#Eval("DocumentFile") %>' runat="server" />
                             
                         </EditItemTemplate>
                         </asp:TemplateField>

                  <asp:TemplateField HeaderText="Action"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
               <ItemTemplate>


                 <asp:ImageButton ID="View" runat="server" ImageUrl="~/images/file.png" ToolTip="View Document" Width="20" Height="20" CommandName="ViewDocument" CommandArgument='<%# Eval("DocumentFile") %>' />
       
      
               <asp:ImageButton ID="Edit" runat="server" CausesValidation="false" CommandName="Edit" Text="Delete" ToolTip="Update"  ImageUrl="~/Images/edit-icon-png-3598.png" Width="20" Height="20" />

                     <asp:ImageButton ID="Delete" runat="server" CausesValidation="false" onclientclick="return confirm('Do you want to delete this record?');" CommandName="Delete" Text="Delete" ToolTip="Delete"  ImageUrl="~/Images/DeleteDoc.png" Width="20" Height="20" />
               </ItemTemplate>

                <EditItemTemplate>
                         <asp:ImageButton ID="Update" runat="server" CausesValidation="false" onclientclick="return confirm('Do you want to Update this record?');" CommandName="Update" Text="SAVE" ToolTip="Update"  ImageUrl="~/img/Add4.png" Width="20" Height="20" />
                        <asp:ImageButton ID="Cancel" runat="server"  CausesValidation="false" onclientclick="return confirm('Do you want to Cancel this record?');" CommandName="Cancel" Text="Cancel" ToolTip="Cancel"  ImageUrl="~/img/cancel2.png" Width="20" Height="20" />
               </EditItemTemplate>

                     </asp:TemplateField>
              </Columns>
           <PagerTemplate>
       <asp:LinkButton ID="lbtnFirst" runat="server" CommandName="Page" CommandArgument="First">First</asp:LinkButton>
       <asp:LinkButton ID="lbtnprev" runat="server" CommandName="Page" CommandArgument="Prev">Prev</asp:LinkButton>
       <asp:LinkButton ID="lbtnnext" runat="server" CommandName="Page" CommandArgument="Next">Next</asp:LinkButton>
       <asp:LinkButton ID="lbtnlast" runat="server" CommandName="Page" CommandArgument="Last">Last</asp:LinkButton>
</PagerTemplate>  
           <EditRowStyle />
   <HeaderStyle Font-Bold="True" BackColor="#5D7B9D" ForeColor="White"></HeaderStyle>
  <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
  <SortedAscendingCellStyle BackColor="#E9E7E2" />
  <SortedAscendingHeaderStyle BackColor="#506C8C" />
  <SortedDescendingCellStyle BackColor="#FFFDF8" />
  <SortedDescendingHeaderStyle BackColor="#6F8DAE" /> 
            </asp:GridView></center>
    </div>
   </div>    
</asp:Content>
