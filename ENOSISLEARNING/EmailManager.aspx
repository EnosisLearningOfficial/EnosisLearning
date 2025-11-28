<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="EmailManager.aspx.cs" Inherits="ENOSISLEARNING.EmailManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <script src="Scripts/bootstrap.min.js"></script>
    <link href="css/MyAdmin.css" rel="stylesheet" />
   <script src="js/jquery-3.3.1.min.js"></script>
    <link href="../Layout_file/libs/flot/css/float-chart.css" rel="stylesheet"/>
   <%-- <link href="../Layout_file/css/style.min.css" rel="stylesheet"/>--%>
   
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script  src="https://www.googletagmanager.com/gtag/js?id=UA-35962033-1"></script>


     <link rel="stylesheet" type="text/css" href="css/bootstrap-min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css" />
  <script type="text/javascript" src="Scripts/jquery-1.11.3.min.js"></script>
  <script type="text/javascript" src="Scripts/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.ico"/>
     <%-- Font Style --%>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond&display=swap"/>
    <%-- Bootstrap CSS --%>
    <link href="css/bootstrap-min.css" rel="stylesheet" />
    <!-- Boxicons CSS -->
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
    <%-- Font Awesome --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
     <%-- Jquery --%>
    <script src="js/jquery-3.3.1.min.js"></script>
   <%-- Popper JS --%>
  <script src="../Layout_file/libs/popper.js/dist/umd/popper.min.js"></script>              
    <script type="text/javascript">
    $(document).ready(function () {
        $("#myModal").modal('hide');
       
    });

</script>
<script type="text/javascript">
    function openModal() {

        $("#myModal").modal('show');
    }
</script>
<script type="text/javascript">
    function CloseModal() {

        $("#myModal").modal('hide');
    }

</script>
 <style>
    *
     {
        font-family: 'Montserrat', sans-serif;
     }
      .container
     {
        width:1265px;
        height:100%;
        margin-top :5px;
        margin:auto;
     }  
     .head
     {
         width:100%;
         height:100px;
         border:0px solid green;
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
    .size{
    height:50px;
 
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

    .modal-content-circular {
        border-radius: 10%;
        border: 1px solid #ccc; 
    }

 

    .modal-title {
        margin-left:30%;
        font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
    }

    .modal-body {
        padding: 20px;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-control {
        border-radius: 10px;
    }

    .form-control:focus {
        border-color: #007bff;
        box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
    }

    .btn-primary {
        background-color: #007bff;
        border-color: black;
        border-radius: 10px;
     
    }

    .btn-primary:hover {
        background-color: #0056b3;
        border-color: #0056b3;
    }

    .btn-secondary {
         height: 35px;
         width: 80px;
        background-color: #6c757d;
        border-color: #6c757d;
        border-radius: 10px;

    }

    .btn-secondary:hover {
        background-color: #5a6268;
        border-color: #545b62;
    }

    .modal-footer
    {
        margin-left:-23%;
    }
    .btn-primary
    {
        height:50px;
        margin-left:5%;
    }
     .bg-warning {
         margin-right: 11%;
         height: 35px;
         width: 80px;
         border-color: #007bff;
         border-radius: 10px;
     }
    .btn-success
    {    margin-left: 1%;
         height: 35px;
         width: 80px;
         border-color: #007bff;
         border-radius: 10px;
    }
    .custom-textbox {
        height: 40px; 
        width: 300px;
        border-radius: 10px;
        border: 1px solid #ccc; 
        padding: 5px 10px; 
        font-size: 14px; 
        margin-left:10%;
    }

    .custom-textbox:focus {
        border-color: #007bff; 
        box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); 
        outline: none; 
    }
    .GridPager a, .GridPager span
    {
        display: block;
        height: 25px;
        width: 25px;
        font-weight: bold;
        text-align: center;
        text-decoration: none;
    }
    .GridPager a
    {
        background-color: #f5f5f5;
        color: #969696;
        border: 1px solid #969696;
    }
    .GridPager span
    {
        background-color: #A1DCF2;
        color: #000;
        border: 1px solid #3AC0F2;
    }
    .label-margin-right {
        margin-right: -140px; 
    }
  
    .reqMessage
    {
    float:right;
    color:red;
    }
    .flex-container
 {
    display: flex;
    margin-top:-33px;
    height: 37px;
    width: 49px;
   
}
.btn-purple
{
     
    margin-left: 250px; 
    top:40px;
    border-color: #6c757d;
    border-radius: 11px;
  
}
 </style>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <%--<form id="form1" runat="server" >--%>
     <div class="container">
        <div>
            <div class="vacancy-top-tab" >
            <table class="table table-bordered"  style="background-color:#1d96b2;">
               
                <tr>
             <td class="text-center" style="border-style: none;" >
       <%-- <b><asp:Label ID="Lblemail" runat="server" Text="Email Id" Font-Size="Large" CssClass="label-margin-right" ></asp:Label></b>     --%>
        <asp:TextBox ID="TxtMail" runat="server" placeholder="Search Email" TextMode="Email" CssClass="custom-textbox"></asp:TextBox>

       <asp:Button ID="Btnsearch" runat="server" Text="Search" OnClick="Btnsearch_Click"  BorderColor="Green"  BackColor="Green" Cssclass="btn-success"/>
         <asp:Button ID="Btnclear" runat="server" Text="Clear"  CssClass="bg-warning"  BorderColor="Green"  BackColor="Green" ForeColor="White" OnClick="Btnclear_Click"/>

     
        <a id="btnRDemo" href="#" class="btn btn-danger br" style="box-shadow: 1px 1px 3px 1px gray"" data-toggle="modal" data-target="#myModal" target="_parent"><span>  <img src="../img/Add4.png"  title="Add" height="25" width="25" /></span> &nbsp;Compose Email</a> 
             </td>
                </tr>
            </table>
        </div>
           
         <!-- Modal Dialog -->
     
   <div id="myModal" ClientIDMode="Static" class="modal fade" data-backdrop="false"  role="dialog" style="background-color:#ddd;">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content br" style="background-color:MintCream;width: 90%;">
          <div class="modal-content br">
           
             <%--<div class="modal-header" style="border-style: none;color:#2191C0"">
                
             </div>--%>

   <div class="modal-body">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
       <center><h5 class="modal-title" ><b style="color: #1d96b2;">Add New Email </b></h5></center>
         <br />
          <!-- Email Sender -->
       
         <div class="form-group row">
    <label ID="Label1" class="col-sm-3 col-form-label c" for="firstName">Email Sender:</label>
         <div class="col-sm-9 size" >
             <div class="input-group">
                 <%--<span class="input-group-addon br" id="basic-addon2">@</span>--%>
                   <asp:TextBox ID="txtname" CssClass="form-control form-control-lg" runat="server" style="border-style:Solid;border-radius: 15px;text-align:center;width: 350px;" placeholder="Enter_Email Sender"  />
                   <div class="help-block with-errors"></div>
             </div>
              <asp:RequiredFieldValidator ID="rfvtxtName" ValidationGroup="test" ControlToValidate="txtname" ErrorMessage=" Full Name  is required." ForeColor="Red" runat="server" CssClass="reqMessage float-right"></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="revtxtName" ValidationGroup="test" ControlToValidate="txtname" ErrorMessage="Invalid FullName format." runat="server" CssClass="reqMessage" ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"></asp:RegularExpressionValidator>
         </div>
     </div>


          <!-- Sender Password -->
         
        <div class="form-group row">
   <label ID="Label2" class="col-sm-3 col-form-label c" for="firstName">Sender Password:</label>
        <div class="col-sm-9 size">
            <div class="input-group br">
             <%--  <span class="input-group-addon br" id="basic-addon3">@</span>--%>
                <asp:TextBox ID="TextBox1" CssClass="form-control form-control-lg" runat="server" style="border-style:Solid;border-radius: 15px; text-align:center;width: 350px;" placeholder="Enter_Sender_Password"  />
                 
                <div class="help-block with-errors"></div>
            </div>
             <asp:RequiredFieldValidator ID="rfvPassword" ValidationGroup="test" ControlToValidate="TextBox1" ErrorMessage=" MobileNo is required." ForeColor="Red" runat="server" CssClass="reqMessage float-right"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revPassword" ValidationGroup="test" ControlToValidate="TextBox1" ErrorMessage="Invalid MobileNo format." runat="server" CssClass="reqMessage" ValidationExpression="^.{6,}$"></asp:RegularExpressionValidator>
        </div>
    </div>

          <!-- Mail To -->
         
         <div class="form-group row">
    <label ID="Label3" class="col-sm-3 col-form-label c" for="firstName">Mail To:</label>
         <div class="col-sm-9 size" >
             <div class="input-group">
                 <%--<span class="input-group-addon br" id="basic-addon2">@</span>--%>
                   <asp:TextBox ID="TextBox3" CssClass="form-control form-control-lg" runat="server" style="border-style:Solid;border-radius: 15px;text-align:center;width: 350px;" placeholder="Enter_Mail To"  />
                   <div class="help-block with-errors"></div>
             </div>
         </div>
     </div>



       <b><asp:Label ID="Label8" runat="server" Text="Upload Excel File" Font-Size="Large"></asp:Label></b>
         <asp:FileUpload ID="uploadexl" runat="server" />

         <div class="flex-container">
             <asp:Button ID="Btnexl" runat="server" Text="Upload Excel" CssClass="btn-purple" OnClick="Btnexl_Click" />
         </div>
     
       <br />
      
          <!-- Subject -->
        

         <div class="form-group row">
    <label ID="Label4" class="col-sm-3 col-form-label c" for="firstName">Subject:</label>
         <div class="col-sm-9 size" >
             <div class="input-group">
                 <%--<span class="input-group-addon br" id="basic-addon2">@</span>--%>
                   <asp:TextBox ID="TextBox4" CssClass="form-control form-control-lg" runat="server" style="border-style:Solid;border-radius: 15px;text-align:center;width: 350px;" placeholder="Enter_Subject"  />
                   <div class="help-block with-errors"></div>
             </div>
              <asp:RequiredFieldValidator ID="rfvSubject" ValidationGroup="test" ControlToValidate="TextBox4" ErrorMessage=" Full Name  is required." ForeColor="Red" runat="server" CssClass="reqMessage float-right"></asp:RequiredFieldValidator>
              
         </div>
     </div>

         
        <!-- Message -->
      
         <div class="form-group row">
    <label ID="Label5" class="col-sm-3 col-form-label c" for="firstName">Message:</label>
         <div class="col-sm-9 size" >
             <div class="input-group">
                 <%--<span class="input-group-addon br" id="basic-addon2">@</span>--%>
                   <asp:TextBox ID="TextBox5" CssClass="form-control form-control-lg" runat="server" style="border-style:Solid;border-radius: 15px;text-align:center;width: 350px;" placeholder="Enter_Message"  />
                   <div class="help-block with-errors"></div>
             </div>
              <asp:RequiredFieldValidator ID="rfvName" ValidationGroup="test" ControlToValidate="TextBox5" ErrorMessage=" Full Name  is required." ForeColor="Red" runat="server" CssClass="reqMessage float-right"></asp:RequiredFieldValidator>
         </div>
     </div>

          <!-- Attachments -->
         <b><asp:Label  runat="server" Text="" Font-Size="Large"></asp:Label></b>
     



   <div class="form-group row">
    <label ID="Label6" class="col-sm-3 col-form-label c" for="firstName">Attachments:</label>
         <div class="col-sm-9 size" >
             <div class="input-group">
                 <%--<span class="input-group-addon br" id="basic-addon2">@</span>--%>
                     <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                 
                   <div class="help-block with-errors"></div>
             </div>
           
         </div>
     </div>
     <br />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:Button ID="BtnClearModal" runat="server" Text="Clear" class="btn btn-primary br" Width="85px" Height="35px" OnClick="BtnClearModal_Click" />

        <asp:Button ID="BtnSend" runat="server" Text="Send"  OnClick="BtnSend_Click" ValidationGroup="test" Width="85px" Height="35px" class="btn btn-primary br" />
      </div>

     <%--<div class="modal-footer" style="border-style: none;">
        
     </div>--%>
         </div>
            <div class="clearfix"></div>
         </div>
        </div>
      </div>

           
   
    </div>

      <br />
      <div id="tabs" style="height:100%; border-radius: 15px;" class="gridview-area">  
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="id" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" 
         Font-Bold="true" HeaderStyle-BackColor="#BFCFFF" AllowPaging="true" PageSize="12" PagerSettings-Mode="NumericFirstLast"   HeaderStyle-Font-Size="Large" PagerStyle-HorizontalAlign="Right" PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" Visible="true" OnPageIndexChanging="GridView1_PageIndexChanging" PagerStyle-ForeColor="Black" PagerStyle-Font-Size="Small" PagerStyle-Font-Underline="true" BorderStyle="None" AlternatingRowStyle-BackColor="white"   CssClass="table table-borderless gridview-table" FooterStyle-CssClass="footer" >

         <PagerStyle HorizontalAlign = "Right" CssClass = "GridPager" />
         
              <Columns>

                  <asp:TemplateField HeaderText="Mail TO" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" >
                         <ItemTemplate>
                    <asp:Label ID="lblmailto" Text='<%#Eval("Mail_To") %>' CssClass="gridview-item" runat="server"/>
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:TextBox ID="txtmailto" Text='<%#Eval("Mail_To") %>' runat="server"/>
                         </EditItemTemplate>
                         </asp:TemplateField>

                  <asp:TemplateField HeaderText="Subject" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                         <ItemTemplate>
                  <asp:Label ID="lblsubject" Text='<%#Eval("Subject") %>' CssClass="gridview-item" runat="server"/>
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:TextBox ID="txtsubject" Text='<%#Eval("Subject") %>' runat="server"/>
                         </EditItemTemplate>
                         </asp:TemplateField>

                  <asp:TemplateField HeaderText="Message" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                         <ItemTemplate>
                             <asp:Label ID="lblmessage" Text='<%#Eval("Message") %>' CssClass="gridview-item" runat="server"/>
                         </ItemTemplate>
                         <EditItemTemplate>
                      <asp:TextBox ID="txtmessage" Text='<%#Eval("Message") %>' runat="server"/>
                         </EditItemTemplate>
                         </asp:TemplateField>
                 

                  <asp:TemplateField HeaderText="Action" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                       
                      <ItemTemplate>

                              <asp:ImageButton ID="Edit" runat="server" CausesValidation="false" CommandName="Edit"
                           Text="Delete" ToolTip="Update"  ImageUrl="~/img/Edit1.png" Width="20" Height="20" />

                               <asp:ImageButton ID="Delete" runat="server" CausesValidation="false" onclientclick="return confirm('Do you want to delete this record?');"
                                CommandName="Delete" Text="Delete" ToolTip="Delete"  ImageUrl="~/img/Delete3.png" Width="20" Height="20" />

                        </ItemTemplate>

                       
                  <EditItemTemplate>
                             <asp:ImageButton ID="Update" runat="server" CausesValidation="false" onclientclick="return confirm('Do you want to Update this record?');"
                          CommandName="Update" Text="SAVE" ToolTip="Update"  ImageUrl="~/img/Add4.png" Width="20" Height="20" />
                           <asp:ImageButton ID="Cancel" runat="server"  CausesValidation="false" onclientclick="return confirm('Do you want to Cancel this record?');"
                            CommandName="Cancel" Text="Cancel" ToolTip="Cancel"  ImageUrl="~/img/cancel2.png" Width="20" Height="20" />
                </EditItemTemplate>

                     </asp:TemplateField>
              </Columns>
         <EditRowStyle />
<%--<FooterStyle BackColor="#1d96b2" Font-Bold="True" ForeColor="White" />--%>
<HeaderStyle Font-Bold="True" BackColor="#1D96B2" ForeColor="White"></HeaderStyle>
<PagerStyle BackColor="#1d96b2" ForeColor="White" HorizontalAlign="Center" />
<%--<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />--%>
<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
<SortedAscendingCellStyle BackColor="#E9E7E2" />
<SortedAscendingHeaderStyle BackColor="#506C8C" />
<SortedDescendingCellStyle BackColor="#FFFDF8" />
<SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
          </div>
          <p>
<center> <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label></center>
</p>
    <%--  </form>--%>
   </div>

    
</asp:Content>
