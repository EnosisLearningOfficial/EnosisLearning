<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="ContactManager.aspx.cs" Inherits="ENOSISLEARNING.ContactManager" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="AjaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
.container
{
 
   height:100%;
   margin-top :5px;
   margin:auto;
}  

.gridview-area
{
    margin-left: 40px;
    max-width: 95%;
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
    text-align:center;
}
.close
{
    width:30px;
    height:30px;
    color:red;
    font-size:40px;
}
/*.close:hover
{
    color:red;
}*/
.b {
    position: relative;
    left: 399px;
}
    #ParentDIV {  
    width: 50%;  
    height: 100%;  
    font-size: 12px;  
    font-family: Calibri;  
}  
    .vacancy-top-tab {
     margin-left: 40px;
    max-width: 95%;
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
    .br
    {
        border-radius: 15px;
    }
    *{
     font-family: 'Montserrat', sans-serif;
    }
    .GridPager td{
        background-color:#1d96b2;

    }
    .c{
        color:#1d96b2;
    }

   .size{
       height:50px;
    
   }
   .form-group{
       margin-bottom: 0px;
   }
    .star-rating .fa {
        font-size: 24px;
        cursor: pointer;
        color: #ddd;
    }
    .star-rating .fa-star {
        color: #f2b01e;
    }
    .table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td {
        padding: 3px;
        line-height: 1.42857143;
        vertical-align: top;
        border-top: 1px solid #ddd;
        border:none;
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
 <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
  
    
     <div class="container">
        <asp:HiddenField ID="hdnSelectedTab" runat="server" Value="0" />
     <%--   <asp:Label ID="lblError" runat="server" ForeColor="Maroon" BackColor="Yellow" Font-Bold="true" />--%>

  
<!-- MyModal -->
  <div id="CategorymyModal" clientidmode="Static" class="modal fade" data-backdrop="false"  role="dialog" style="background-color:white;">
     <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content br" style="width: 90%; height: 560px;">
 <asp:UpdatePanel runat="server">
        <ContentTemplate>
          <asp:HiddenField ID="hdnFirstModalOpen" runat="server" Value="false" />
         <asp:HiddenField ID="hdnSecondModalOpen" runat="server" Value="false" />
       <div class="modal-header" style="border-style:none;">
         <button type="button" class="close text-danger" data-dismiss="modal">&times;</button>
         <center><h5 class="modal-title" ><b style="color: #1d96b2;">Contact Information </b></h5></center>
       </div>

    
       <div class="modal-body" style="border-radius: 15px; width: 500px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); margin-left: 20px;" >
        <asp:TextBox ID="TxtCategoryNo" Visible="false" CssClass="form-control form-control-lg" style="border-style:Solid;border-radius: 50px; text-align:center;" runat="server" placeholder="Enter_CategoryNo"  />

<!-- SelectCategory -->
     <div class="form-group row">
        <label class="col-sm-3 col-form-label c" for="firstName">SelectCategory:</label>
        <div class="col-sm-9 size">
            <div class="input-group">
           <asp:DropDownList ID="CategoryDrp2" CssClass="form-control my-form-control" style="border-style:Solid;border-radius: 15px; text-align:center;width: 150px;" runat="server">
            </asp:DropDownList>&nbsp;&nbsp;
               <a id="btnRDemoTwo" href="#" class="btn btn-primary br" style=" width:180px;box-shadow: 1px 1px 3px 1px gray"" data-toggle="modal" data-target="#myModalTwo" target="_parent" title="ADD NEW CONTACT"><%--<span>  <img src="../img/Add4.png"  title="Add" height="25" width="25" /></span> --%>&nbsp;ADD NEW CATEGORY</a> 
               <div class="help-block with-errors"></div>
           </div>
         </div>
     </div>

<!-- FullName -->
      <div class="form-group row">
        <label class="col-sm-3 col-form-label c" for="firstName">FullName:</label>
          <div class="col-sm-9 size" >
            <div class="input-group">
              <asp:TextBox ID="TxtFullName" CssClass="form-control form-control-lg" MaxLength="120" runat="server" style="border-style:Solid;border-radius: 15px;text-align:center;width: 330px;" placeholder="Enter_FullName"  /><span style='color:Red;'>*</span>
                 <div class="help-block with-errors"></div>
             </div>
               <asp:RequiredFieldValidator ID="rfvName" ValidationGroup="test" ControlToValidate="TxtFullName" ErrorMessage="Full Name  is required." ForeColor="Red" runat="server" CssClass="reqMessage float-right"></asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator ID="revName" ValidationGroup="test" ControlToValidate="TxtFullName" ErrorMessage="Invalid FullName format." runat="server" CssClass="reqMessage" ValidationExpression="^[a-zA-Z\s]+$"></asp:RegularExpressionValidator>
          </div>
      </div>

<!-- MobileNo -->
     <div class="form-group row">
        <label class="col-sm-3 col-form-label c" for="firstName">MobileNo:</label>
            <div class="col-sm-9 size">
                <div class="input-group br">
                   <asp:TextBox ID="TxtMobileNo" CssClass="form-control form-control-lg" runat="server" 
                    style="border-style:Solid;border-radius: 15px; text-align:center;width: 330px;" 
                    MaxLength="15" placeholder="Enter Mobile No" 
                    inputmode="numeric" pattern="[0-9]*" /><span style='color:Red;'>*</span>

                  <div class="help-block with-errors"></div>
              </div>
               <asp:RequiredFieldValidator ID="rfvMobile" ValidationGroup="test" ControlToValidate="TxtMobileNo" ErrorMessage=" MobileNo is required." ForeColor="Red" runat="server" CssClass="reqMessage float-right"></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="revMobile" ValidationGroup="test" ControlToValidate="TxtMobileNo" ErrorMessage="Invalid MobileNo format." runat="server" CssClass="reqMessage"  ValidationExpression="^\+?[0-9]{10,15}$"></asp:RegularExpressionValidator>
          </div>
      </div>

<!-- EmailId -->
     <div class="form-group row ">
          <label class="col-sm-3 col-form-label c"  for="firstName">EmailId:</label>
          <div class="col-sm-9 size">
              <div class="input-group br">
                 <asp:TextBox ID="TxtEmailID" CssClass="form-control form-control-lg" runat="server" style="border-style:Solid;border-radius: 15px; text-align:center;width: 330px;"  placeholder="Enter_EmailID"  />
                    <div class="help-block with-errors"></div>
             </div>
                <asp:RegularExpressionValidator ID="revEmailId" ValidationGroup="test" ControlToValidate="TxtEmailID" ErrorMessage="Invalid EmailId format." runat="server" CssClass="reqMessage" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"></asp:RegularExpressionValidator>
          </div>
    </div>

<!-- Address -->
       <div class="form-group row">
     <label class="col-sm-3 col-form-label c" for="firstName">Address:</label>
       <div class="col-sm-9 size" >
         <div class="input-group">
           <asp:TextBox ID="TextAddress" CssClass="form-control form-control-lg" MaxLength="300" runat="server" style="border-style:Solid;border-radius: 15px;text-align:center;width: 330px;" placeholder="Enter_Address"  /><%--<span style='color:Red;'>*</span>--%>
              <div class="help-block with-errors"></div>
          </div>
       </div>
   </div>

<!-- Website -->
   <div class="form-group row">
     <label class="col-sm-3 col-form-label c" for="firstName">Website:</label>
       <div class="col-sm-9 size" >
         <div class="input-group">
           <asp:TextBox ID="TextWebsite" CssClass="form-control form-control-lg" MaxLength="150" runat="server" style="border-style:Solid;border-radius: 15px;text-align:center;width: 330px;" placeholder="Enter_Website"  /><%--<span style='color:Red;'>*</span>--%>
              <div class="help-block with-errors"></div>
          </div>
       </div>
   </div>

<!-- Rating -->   
<div class="form-group row">
    <label class="col-sm-3 col-form-label c" for="rating">Rating:</label>
    <div class="col-sm-9 size">
        <div class="input-group">
            <asp:RadioButtonList ID="RatingList" runat="server" CssClass="form-control form-control-lg" RepeatDirection="Horizontal">
                <asp:ListItem Value="1">1</asp:ListItem>
                <asp:ListItem Value="2">2</asp:ListItem>
                <asp:ListItem Value="3">3</asp:ListItem>
                <asp:ListItem Value="4">4</asp:ListItem>
                <asp:ListItem Value="5">5</asp:ListItem>
            </asp:RadioButtonList>
            <div class="help-block with-errors"></div>
        </div>
    </div>
</div>

      <div class="form-group row">
           <div class="col-sm-12">
           <asp:TextBox ID="TxtComments" TextMode="MultiLine" Rows="2" Columns="20" CssClass="form-control form-control-lg br" runat="server"  style="border-style:Solid;border-radius: 15px; text-align:center"  placeholder="Comments / FeedBack" />
                 
           <div class="help-block with-errors"></div>
        </div>
      </div>
         </div>       
   <asp:Button ID="Button1" runat="server" Text="Save" onclick="Save_Click" ValidationGroup="test"  class="btn btn-primary br" style="margin-top:8px; margin-left: 460px;" />
            
           </div>
          </ContentTemplate>
        <Triggers>
                 <asp:AsyncPostBackTrigger ControlID="btnAddCategory" EventName="Click" />
        </Triggers>
</asp:UpdatePanel>
            <div class="clearfix"></div>
         </div>
        </div>
 
<!-- MyModalTwo -->
   <div id="myModalTwo" clientidmode="Static" class="modal fade" data-backdrop="false"  role="dialog" style="background-color: white;;">
    <div class="modal-dialog modal-dialog-centered">
     <div class="modal-content br" style="width: 90%; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); height: 200px;">
      <div class="modal-header" style="border-style:none;">
       
           <a id="btnRDemoThree" href="#" class="close text-danger"  data-toggle="modal" data-target="#myModalTwo" target="_parent" title="close"><span>  <img src="../img/delete.png"  title="close" height="25" width="25" /></span></a> 
        <center><h5 class="modal-title" ><b style="color: #1d96b2;">ADD NEW CATEGORY </b></h5></center>
      </div>
      <div class="modal-body" style="border-radius: 15px; width: 500px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); margin-left: 20px;">
       <asp:TextBox ID="TextBox1" Visible="false" CssClass="form-control form-control-lg" style="border-style:Solid;border-radius: 50px; text-align:center;" runat="server" placeholder="Enter_CategoryNo"  />

<!-- FullName -->   
<div class="form-group row">
  <label class="col-sm-3 col-form-label c" for="firstName">FullName:</label>
    <div class="col-sm-9 size" >
      <div class="input-group">
         <asp:TextBox ID="TxtCategoryName" CssClass="form-control form-control-lg ml-2" runat="server"
             style="border-style:Solid;border-radius: 15px;text-align:center;width: 320px;" 
             placeholder="Enter Category Name" ClientIDMode="Static" MaxLength="50" />
           <div class="help-block with-errors"></div>
       </div>        
    </div>
</div>
    </div>     
<!-- Button -->
   <asp:Button ID="btnAddCategory" href="#" style="margin-top: 8px; margin-left: 400px;" data-toggle="modal" data-target="#myModalTwo" target="_parent" runat="server" CssClass="btn btn-primary br" Text="Add Category" OnClick="btnAddCategory_Click"  />
    
   
          </div>
           <div class="clearfix"></div>
        </div>
       </div>
      </div>

   <div class="vacancy-top-tab" >
   <div class="row"> &nbsp;
     <asp:DropDownList  ID="CategoryDrp" Height="35px" Width="18%" Style="border-radius:15px; text-align:center"  AppendDataBoundItems="true"  runat="server" AutoPostBack="true" >
        <asp:ListItem Value="0" Text="Select_Category" /></asp:DropDownList>  &nbsp;&nbsp;
       <asp:TextBox ID="txtMobNo" Height="35px" Width="18%" runat="server" Style="border-radius:15px; text-align:center"  placeholder="Enter_MobileNo" />  &nbsp;&nbsp;
       <asp:TextBox ID="txtName" Height="35px" Width="18%" runat="server" Style="border-radius:15px; text-align:center"  placeholder="Enter_Full Name" />  &nbsp;&nbsp;

        <asp:LinkButton ID="LinkSearch" Width="35px" Height="35px" style="background-color:white; border-radius:15px" runat="server" onclick="LinkSearch_Click">
        <img src="../img/View.png" title="Search" height="25" width="25" /><span class="hidden-xs"></span></asp:LinkButton>  &nbsp;&nbsp;

       <asp:Button ID="ViewData"  runat="server" onclick="ViewData_Click" Text="View All" BorderColor="Green"  BackColor="Green" CssClass="btn btn-danger bton datafield br" BorderStyle="Solid"   title="View All" /> &nbsp;&nbsp;

       <asp:Button ID="ClearSearch" runat="server" Text="AllClear" onclick="ClearSearch_Click1" BorderColor="Green"  BackColor="Green" CssClass="btn btn-danger bton datafield br" BorderStyle="Solid" title="AllClear" />  &nbsp;&nbsp;
      
         <a id="btnRDemo" href="#" class="btn btn-danger br" style="box-shadow: 1px 1px 3px 1px gray"" data-toggle="modal" data-target="#CategorymyModal" target="_parent" title="ADD NEW CONTACT"><span>  <img src="../img/Add4.png"  title="Add" height="25" width="25" /></span> &nbsp;ADD NEW CONTACT</a> 
      
</div>
</div>

        <div id="tabs" style="height:100%; border-radius: 15px;" class="gridview-area">  
        <asp:GridView ID="gvCategory" AutoGenerateColumns="false" runat="server" OnRowDataBound="gvCategory_RowDataBound"  AllowPaging="true" DataKeyNames="Categoryid" EmptyDataText="No Records Found For the Selected Search Criteria!!"
            HeaderStyle-BackColor="#BFCFFF" OnRowEditing="gvCategory_RowEditing" Visible="true" ShowFooter="true" OnRowCancelingEdit="gvCategory_RowCancelingEdit" OnRowUpdating="gvCategory_RowUpdating" OnRowDeleting="gvCategory_RowDeleting" OnPageIndexChanging="gvCategory_PageIndexChanging" OnDataBound="gvCategory_DataBound" OnRowCommand="gvCategory_RowCommand" PagerStyle-CssClass="pager"  PageSize="10" BorderStyle="None" AlternatingRowStyle-BackColor="white"   CssClass="table table-borderless gridview-table" FooterStyle-CssClass="footer">
                      
       
            <Columns>       
                 <asp:TemplateField Visible="false">
            <ItemTemplate>
                <asp:Label ID="Idtxt" runat="server" Text='<%# Bind("CategoryId")%>' CssClass="gridview-item" ></asp:Label>
            </ItemTemplate>
            </asp:TemplateField>
                 
                 <asp:TemplateField  HeaderText="Name" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="small" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="12%">
            <ItemTemplate>
                <asp:Label ID="txtName" runat="server" Text='<%# Bind("Name")%>'  ToolTip='<%# Bind("Name")%>'  CssClass="gridview-item"></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                     <asp:TextBox ID="NameTxt" style="text-align: center; border-radius: 15px; width: 150px;" runat="server" Text='<%# Bind("Name")%>'  ></asp:TextBox>
            </EditItemTemplate>        
            </asp:TemplateField>
        <asp:TemplateField AccessibleHeaderText="MOBILENO" HeaderText="MOBILENO" HeaderStyle-Font-Size="small" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-width="11%" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" >
            <ItemTemplate>
                <asp:Label ID="txtMobile" runat="server" Text='<%# Bind("MOBILE")%>'  ToolTip='<%# Bind("MOBILE")%>'  CssClass="gridview-item" ></asp:Label>
            </ItemTemplate>
          
            <EditItemTemplate>
                <asp:TextBox ID="txtEMobile" style="text-align: center; border-radius: 15px; width: 120px;" runat="server" 
                    Text='<%# Bind("MOBILE")%>' MaxLength="15"  inputmode="numeric" pattern="[0-9]*" />
    
                <!-- Regular Expression Validator to enforce numeric input -->
                <asp:RegularExpressionValidator ID="revMobile" ControlToValidate="txtEMobile" runat="server" 
                    ValidationExpression="^[0-9]+$" ErrorMessage="Only numbers are allowed." ForeColor="Red" />
             </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField AccessibleHeaderText="EMAIL" HeaderText="EMAIL" HeaderStyle-Font-Size="small" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
            <ItemTemplate>
                <asp:Label ID="txtEmail" runat="server" Text='<%# Bind("EMAIL")%>' ToolTip='<%# Bind("EMAIL")%>'  CssClass="gridview-item" style="overflow:hidden"></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtEEmail" style="text-align: center; border-radius: 15px; width: 150px;" runat="server" Text='<%# Bind("EMAIL")%>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

     <asp:TemplateField AccessibleHeaderText="CATEGORYNAME" HeaderText="CATEGORYNAME" HeaderStyle-Font-Size="small" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="12%">
            <ItemTemplate>
                <asp:Label ID="txtCategoryName" runat="server" Text='<%# Bind("CATEGORYNAME")%>'  ToolTip='<%# Bind("CATEGORYNAME")%>'  CssClass="gridview-item "></asp:Label>
            </ItemTemplate> 
      <EditItemTemplate>
    <div style="display: flex; align-items: center;">
        <div style="text-align: right; margin-right: 10px; width: 100px;">
            <asp:Label ID="EdittxtCategoryName" 
                       runat="server" 
                       Text='<%# Bind("CATEGORYNAME") %>'  
                       ToolTip='<%# Bind("CATEGORYNAME") %>'  
                       CssClass="gridview-item"></asp:Label>
        </div>
        <asp:DropDownList ID="CategoryDrp3" 
                          CssClass="form-control my-form-control" 
                          style="height:30px; border-style:Solid; border-radius: 15px; text-align:center; width: 120px;" 
                          runat="server">
        </asp:DropDownList>
    </div>
</EditItemTemplate>


        </asp:TemplateField>
             <asp:TemplateField  HeaderText="Address" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="small" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="12%">
                <ItemTemplate>
               <asp:Label ID="textAddress" runat="server" Text='<%# Bind("Address")%>' ToolTip='<%# Bind("Address")%>'  CssClass="gridview-item" ></asp:Label>
             </ItemTemplate>
             <EditItemTemplate>
                 <asp:TextBox ID="textEAddress" style="text-align: center; border-radius: 15px; width: 130px;" runat="server" Text='<%# Bind("Address")%>'  ></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField  HeaderText="Website" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="small" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="12%">
             <ItemTemplate>
               <asp:Label ID="textWebsite" runat="server" Text='<%# Bind("Website")%>' ToolTip='<%# Bind("Website")%>'  CssClass="gridview-item" ></asp:Label>
             </ItemTemplate>
             <EditItemTemplate>
                 <asp:TextBox ID="textEWebsite" style="text-align: center; border-radius: 15px; width: 150px;" runat="server" Text='<%# Bind("Website")%>'  ></asp:TextBox>
            </EditItemTemplate>
    </asp:TemplateField>
    
    <asp:TemplateField AccessibleHeaderText="COMMENTS" HeaderText="COMMENTS" HeaderStyle-Font-Size="small" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="10%">
          <ItemTemplate>
          <asp:Label ID="txtREMARKS" TextMode="MultiLine" runat="server"  Text='<%# Bind("COMMENTS")%>' ToolTip='<%# Bind("COMMENTS")%>'  CssClass="gridview-item" style="width: 180px; height: 22px; overflow:hidden;"></asp:Label>
          </ItemTemplate>
          <EditItemTemplate>  
                <asp:TextBox ID="txtEREMARKS" style="text-align: center; border-radius: 15px; width: 180px; height: 30px;"  TextMode="MultiLine" runat="server" Text='<%# Bind("COMMENTS")%>'></asp:TextBox>
          </EditItemTemplate>
          
         </asp:TemplateField>

       <asp:TemplateField HeaderText="Rating" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="small" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="5%">

      <ItemTemplate>
              
          <asp:Label ID="lblRating" runat="server" Text='<%# GetRatingStars(Eval("Rating")) %>' CssClass="gridview-item" />
            </ItemTemplate>


           <EditItemTemplate>
    <div style="display: flex; align-items: center;">
        <asp:Label ID="EditlblRating" 
                   runat="server" 
                   Text='<%# Bind("Rating") %>' 
                   ToolTip='<%# Bind("Rating") %>' 
                   CssClass="gridview-item" 
                   style="margin-right: 10px; width: 7px;" />
        <asp:RadioButtonList ID="rblRating" 
                             runat="server" 
                             RepeatDirection="Horizontal">
            <asp:ListItem Value="1">★</asp:ListItem>
            <asp:ListItem Value="2">★</asp:ListItem>
            <asp:ListItem Value="3">★</asp:ListItem>
            <asp:ListItem Value="4">★</asp:ListItem>
            <asp:ListItem Value="5">★</asp:ListItem>
        </asp:RadioButtonList>
    </div>
</EditItemTemplate>

</asp:TemplateField>


        
        <asp:TemplateField HeaderText="Edit/Del" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="small" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-width="7%" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
        <ItemTemplate>
              <asp:ImageButton ID="btnEdit1" runat="server" CausesValidation="false" CommandName="Edit"
           Text="Delete" ToolTip="Update"  ImageUrl="~/img/Edit1.png" Width="20" Height="20" />

               <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false" onclientclick="return confirm('Do you want to delete this record?');"
                CommandName="Delete" Text="Delete" ToolTip="Delete"  ImageUrl="~/img/Delete3.png" Width="20" Height="20" />
        </ItemTemplate>
        <EditItemTemplate>
              <asp:ImageButton ID="btnUpdate" runat="server" CausesValidation="false" onclientclick="return confirm('Do you want to Update this record?');"
        CommandName="Update" Text="SAVE" ToolTip="Update"  ImageUrl="~/img/Add4.png" Width="20" Height="20" />
               <asp:ImageButton ID="btnCancel" runat="server"  CausesValidation="false" onclientclick="return confirm('Do you want to Cancel this record?');"
        CommandName="Cancel" Text="Cancel" ToolTip="Cancel"  ImageUrl="~/img/cancel2.png" Width="20" Height="20" />
        </EditItemTemplate>           
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
        <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="add" ForeColor="Red" runat="server" ShowSummary="false" ShowMessageBox="true" />  
    </div>
         
    </div>
     <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
 <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
 <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css" rel="stylesheet"
     type="text/css" />
 
     <script src="Scripts/ajax-jquery.ui-1.8.9-query-ui.js"></script>
 <link href="Scripts/ajax-jquery.ui-1.8.9-themes-start-jquery-ui.css" rel="stylesheet" />
 
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {
        var firstModalOpen = document.getElementById('<%= hdnFirstModalOpen.ClientID %>').value;
        var secondModalOpen = document.getElementById('<%= hdnSecondModalOpen.ClientID %>').value;

        if (firstModalOpen === 'true') {
            $('#myModal').modal('show');
        }

        if (secondModalOpen === 'true') {
            $('#myModalTwo').modal('show');
        }
    });
</script>


       <script>
           function clearModalInputs() {
               // Clear all input fields within the modal
           document.getElementById('<%= TxtCategoryNo.ClientID %>').value = '';
           document.getElementById('<%= TxtFullName.ClientID %>').value = '';
           document.getElementById('<%= TxtMobileNo.ClientID %>').value = '';
           document.getElementById('<%= CategoryDrp2.ClientID %>').selectedIndex = 0;
 
           document.getElementById('<%= TxtComments.ClientID %>').value = '';
           }
       </script>
         <script>
             document.getElementById('<%= TxtMobileNo.ClientID %>').addEventListener('input', function (e) {
                 this.value = this.value.replace(/\D/g, '');
             });
         </script>
    
</asp:Content>
