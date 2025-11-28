<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="SoftwareCourses.aspx.cs" Inherits="ENOSISLEARNING.SoftwareCourses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
   /*     @media (min-width: 1200px) {
          
        }*/
         *
         {
             margin:0;
             padding:0;
             box-sizing:border-box;
             font-family: 'Montserrat', sans-serif;
         }
         html,body
         {
             width:100%;
             height:100%;
         }
         .container
         {
             width:95%;
             height:100%;
             margin-top :5px;
             margin:auto;
         }
         .modern-dropdown 
         {
             margin-top:5px;
            width:400px;
            height:100%;
            background-color:transparent;
            display:flex;
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
  .auto-style1
  {
    color:dimgray;
    font-size:15px;
    text-align:center;
    font-weight: bold;
    padding-top:3px;
    font-family: 'Montserrat', sans-serif;
  }
  .form-control
 {
    border: 1px solid #efeeed;
    border-radius: 5px;
    font-size: 12px;
    font-weight:600;
 }
 .form-control::placeholder
 {
    color: dimgray;
    font-family:'Montserrat', sans-serif;
 }
 .form-control:hover
 {
    outline: none;
    border-color: #00adef;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
 }
 .buttons
 {
     display:flex;
     margin:10px 0px 0px 0px;
 }
  .btn-custom {
    width:100%;
    height:40px;
 display: inline-block;
 padding: 7px 7px;
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
     margin-top: 5px;
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
 .br {
    border-radius: 15px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   
     <div class="container">
          <div class="modern-dropdown">
              <asp:DropDownList ID="drpCourses" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="form-control custom-select" style="font-weight:100">
                <asp:ListItem value="ALL" >ALL</asp:ListItem>
                <asp:ListItem value="A" Selected="True">ACTIVE</asp:ListItem>
                <asp:ListItem Value="X">INACTIVE</asp:ListItem>
             </asp:DropDownList>
             <span class="auto-style1">Status</span>

                 <a id="btnRDemo" href="#" class="btn btn-danger br" style="box-shadow: 1px 1px 3px 1px gray;position:relative;left:8%; height:30px; width:180px; padding-top: 0px; " data-toggle="modal" data-target="#myModalCourse" target="_parent"> <img src="../img/Add4.png"  title="Add" height="25" width="25" />ADD NEW COURSE</a>
          </div>

    <div id="myModalCourse" clientidmode="Static" class="modal fade" data-backdrop="false"  role="dialog" style="background-color:#ddd;">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content br" style="width: 90%;">
           <div class="modal-body">
               
               <button type="button" class="close text-danger" data-dismiss="modal" style="color:red;">&times;</button>
              <div class="form-horizontal">
                   <div><h2 style="color:#2191C0"><b><center>Course Information</center></b></h2></div>


    <div class="form-group row">
    <label class="col-sm-3 col-form-label c" for="firstName">Course Name:</label>
         <div class="col-sm-9 size" >
             <div class="input-group">
                   <asp:TextBox ID="TxtCourseName" runat="server" style="border-style:Solid;border-radius: 50px; text-align:center;width: 350px;" CssClass="form-control" placeholder="Enter Name"/>
                   <%--<span style='color:Red;'>*</span>--%>
                 <div class="help-block with-errors"></div>
             </div>
              <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="test" ControlToValidate="TxtCourseName" ErrorMessage="Full Name  is required." ForeColor="Red" runat="server" CssClass="reqMessage float-right"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="test" ControlToValidate="TxtCourseName" ErrorMessage="Invalid FullName format." runat="server" CssClass="reqMessage" ValidationExpression="^[a-zA-Z\s]+$"></asp:RegularExpressionValidator>--%>
         </div>
     </div>
   
        <%--Task Details--%>
     <div class="form-group row">
        <label class="col-sm-3 col-form-label c" for="firstName">Course Details:</label>
        <div class="col-sm-9 size">
         <div class="input-group">
         <asp:TextBox ID="TxtCourseDesc" TextMode="MultiLine" runat="server"  style="border-style:Solid;border-radius: 50px; text-align:center;width: 350px; height: 35px;" CssClass="form-control" placeholder="Enter Course Details"/>
              
              <div class="help-block with-errors"></div>
        </div>
    </div>
</div>


     <div class="form-group row">
        <label class="col-sm-3 col-form-label c" for="firstName">Course Fees:</label>
        <div class="col-sm-9 size">
         <div class="input-group">
         <asp:TextBox ID="TexCourseFees"  runat="server"  style="border-style:Solid;border-radius: 50px; text-align:center;width: 350px; height: 35px;" CssClass="form-control" placeholder="Enter Course Fees"/>
              
              <div class="help-block with-errors"></div>
        </div>
    </div>
</div>

  <div class="form-group row">
        <label class="col-sm-3 col-form-label c" for="firstName">Course Duration:</label>
        <div class="col-sm-9 size">
         <div class="input-group">
         <asp:TextBox ID="TexCourseDuration"  runat="server"  style="border-style:Solid;border-radius: 50px; text-align:center;width: 350px; height: 35px;" CssClass="form-control" placeholder="Enter Course Duration"/>
              
              <div class="help-block with-errors"></div>
        </div>
    </div>
</div>

     <div class="form-group row">
        <label class="col-sm-3 col-form-label c" for="firstName">Course Hours:</label>
        <div class="col-sm-9 size">
         <div class="input-group">
         <asp:TextBox ID="TxtCourseHours"  runat="server"  style="border-style:Solid;border-radius: 50px; text-align:center;width: 350px; height: 35px;" CssClass="form-control" placeholder="Enter Course Hours"/>
              
              <div class="help-block with-errors"></div>
        </div>
    </div>
</div>

      <div class="form-group row">
        <label class="col-sm-3 col-form-label c" for="firstName">Course Status:</label>
        <div class="col-sm-9 size">
         <div class="input-group">
         <asp:TextBox ID="TxtStatus"  runat="server"  style="border-style:Solid;border-radius: 50px; text-align:center;width: 350px; height: 35px;" CssClass="form-control" placeholder="Enter Course Status-A"/>
              
              <div class="help-block with-errors"></div>
        </div>
    </div>
</div>


 <div class="form-group row">
        <label class="col-sm-3 col-form-label c" for="firstName">Upload File:</label>
        <div class="col-sm-9 size">
            <div class="input-group">
         <asp:FileUpload ID="FileAdd"   runat="server" style="margin-left:50px; height:50px;width:200px"/>
              <div class="help-block with-errors"></div>
        </div>
    </div>
</div>



 
 <asp:Button ID="Save" runat="server" Text="Save" onclick="Save_Click" style="position: relative; margin-left: 430px;" class="btn btn-primary br"  />
      </div>
           </div>
            
            <div class="clearfix"></div>
         </div>
        </div>
      </div>

         <div class="gridview-area">
            <asp:GridView ID="grvSoftwareCourses"  AutoGenerateColumns="false" runat="server" ShowFooter="true" EmptyDataText="No records has been added." AllowPaging="true" PageSize="8"   OnPageIndexChanging="grvSoftwareCourses_PageIndexChanging"    Visible="true" HeaderStyle-BackColor="SeaShell" OnRowCancelingEdit="grvSoftwareCourses_RowCancelingEdit" OnRowEditing="grvSoftwareCourses_RowEditing" OnRowDeleting="grvSoftwareCourses_RowDeleting" OnRowUpdating="grvSoftwareCourses_RowUpdating" OnRowCommand="grvSoftwareCourses_RowCommand" DataKeyNames="courseid"  AutoGenerateDeleteButton="false" AutoGenerateEditButton="false" BorderStyle="None" AlternatingRowStyle-BackColor="white"  AlternatingRowStyle-ForeColor="black" CssClass="table table-borderless gridview-table" FooterStyle-CssClass="footer" PagerStyle-CssClass="pager">
  <PagerStyle CssClass ="pager" BorderColor="Transparent"/>
      <Columns>
          <asp:TemplateField HeaderText="COURSEID" HeaderStyle-Font-Size="small" SortExpression="JOBCODE" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="8%">
             <EditItemTemplate>
             <asp:Label ID="lbleditid" runat="server"  Text='<%#Eval("Courseid") %>' CssClass="gridview-item"/>
             </EditItemTemplate>
             <ItemTemplate>
             <asp:Label ID="lblitemid" runat="server"  Text='<%#Eval("courseid") %>' CssClass="gridview-item" style="text-align:center;"/>
             </ItemTemplate>
             <FooterTemplate>
             <asp:TextBox ID="txtcourseid" CssClass="form-control"  runat="server"/>
             </FooterTemplate> 
         </asp:TemplateField>

         <asp:TemplateField HeaderText="COURSENAME" HeaderStyle-Font-Size="small" SortExpression="JOBCODE" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="10%">
         <EditItemTemplate>
         <asp:TextBox ID="lbleditname" runat="server" Text='<%#Eval("Coursename") %>' CssClass="gridview-item"/>
         </EditItemTemplate>
         <ItemTemplate>
         <asp:Label ID="lblitemname" runat="server" Text='<%#Eval("coursename") %>' CssClass="gridview-item"/>
         </ItemTemplate>
         <FooterTemplate>
         <asp:TextBox ID="txtcoursename" runat="server" CssClass="form-control"/>
         </FooterTemplate> 
         </asp:TemplateField>

         <asp:TemplateField HeaderText="COURSEDESC" HeaderStyle-Font-Size="small" SortExpression="JOBCODE" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="20%">
         <EditItemTemplate >
         <asp:TextBox ID="lbleditdesc" runat="server" Text='<%#Eval("Coursedesc") %>' CssClass="gridview-item"/>
         </EditItemTemplate>
         <ItemTemplate>
         <asp:Label ID="lblitemdesc" runat="server" Text='<%#Eval("coursedesc") %>' CssClass="gridview-item"/>
         </ItemTemplate>
         <FooterTemplate>
         <asp:TextBox ID="txtcoursedesc" runat="server"  CssClass="form-control"/>
         </FooterTemplate> 
         </asp:TemplateField>

         <asp:TemplateField HeaderText="FEES" HeaderStyle-Font-Size="small" SortExpression="JOBCODE" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="10%">
         <EditItemTemplate>
         <asp:TextBox ID="lbleditfees" Width="40px" runat="server" Text='<%#Eval("fees") %>'  CssClass="gridview-item"/>
         </EditItemTemplate>
         <ItemTemplate>
         <asp:Label ID="lblitemfees" Width="40px" runat="server" Text='<%#Eval("fees") %>'  CssClass="gridview-item"/>
         </ItemTemplate>
         <FooterTemplate>
         <asp:TextBox ID="txtcoursefees" CssClass="form-control" runat="server"/>
         </FooterTemplate> 
         </asp:TemplateField>

         <asp:TemplateField HeaderText="COURSEDURATION" HeaderStyle-Font-Size="small" SortExpression="JOBCODE" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="10%">
         <EditItemTemplate>
         <asp:TextBox ID="lbleditduration" runat="server" Text='<%#Eval("Courseduration") %>' CssClass="gridview-item"/>
         </EditItemTemplate>
         <ItemTemplate>
         <asp:Label ID="lblitemduration" runat="server" Text='<%#Eval("courseduration") %>' CssClass="gridview-item"/>
         </ItemTemplate>
         <FooterTemplate>
         <asp:TextBox ID="txtcourseduration" runat="server" CssClass="form-control"/>
         </FooterTemplate> 
         </asp:TemplateField>

         <asp:TemplateField HeaderText="COURSEHOURS" HeaderStyle-Font-Size="small" SortExpression="JOBCODE" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="10%">
         <EditItemTemplate>
         <asp:TextBox ID="lbledithours" Width="40px" runat="server" Text='<%#Eval("Coursehours") %>' CssClass="gridview-item"/>
         </EditItemTemplate>
         <ItemTemplate>
         <asp:Label ID="lblitemhours" runat="server" Text='<%#Eval("coursehours") %>' CssClass="gridview-item"/>
         </ItemTemplate>
         <FooterTemplate>
         <asp:TextBox ID="txtcoursehours" CssClass="form-control" runat="server"/>
         </FooterTemplate> 
         </asp:TemplateField>

         <asp:TemplateField HeaderText="Contents"  HeaderStyle-Font-Size="small" SortExpression="JOBCODE" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="10%">
         <ItemTemplate>
             <asp:LinkButton Width="90px" ID="lnkDownload" Font-Size="XX-Small" style="display: block; width: 90px; height: 22px; overflow: hidden;" Text ='<%# Eval("CONTENTS_FILENAME") %>' CommandArgument = '<%# Eval("CONTENTS_FILENAME") %>' ToolTip='<%# Bind("CONTENTS_FILENAME")%>'  runat="server" OnClick="lnkDownload_Click" CssClass="gridview-item"></asp:LinkButton>
         </ItemTemplate>
         <EditItemTemplate>
             <asp:FileUpload Width="90px" Height="35px" ID="fContents" runat="server" />
                 <asp:LinkButton Width="90px" ID="lnkEDownload" Font-Size="XX-Small" Text ='<%# Eval("CONTENTS_FILENAME") %>' CommandArgument = '<%# Eval("CONTENTS_FILENAME") %>' runat="server" OnClick="lnkDownload_Click" CssClass="gridview-item"></asp:LinkButton>
         </EditItemTemplate>

         <FooterTemplate>
             <asp:FileUpload Width="90px" Height="35px" ID="fContents" runat="server" style="margin-top:5px;"/>
         </FooterTemplate>
     </asp:TemplateField>

     <asp:TemplateField HeaderText="EDIT" HeaderStyle-Font-Size="small" SortExpression="JOBCODE" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="8%">
     <EditItemTemplate> 
     <asp:ImageButton ID="imgbtnUpdate" CommandName="Update" runat="server" ImageUrl="Images/UpdateDoc.png" ToolTip="Update" Height="20px" Width="20px" />
     </EditItemTemplate>                  
     <ItemTemplate>
     <asp:ImageButton ID="imgbtnEdit" CommandName="Edit" runat="server" ImageUrl="Images/edit-icon-png-3598.png" ToolTip="Edit" Height="20px" Width="20px" />
     </ItemTemplate>
     <FooterTemplate>
     <asp:ImageButton ID="imgbtnAdd" runat="server" ImageUrl="Images/plus-icon-13071.png" CommandName="AddNew" Width="30px" Height="30px" ToolTip="Add new User" ValidationGroup="validaiton" />
     </FooterTemplate>
     </asp:TemplateField>

     <asp:TemplateField HeaderText="DELETE" HeaderStyle-Font-Size="small" SortExpression="JOBCODE" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="8%">
     <EditItemTemplate>
     <asp:ImageButton ID="imgbtnCancel" runat="server" CommandName="Cancel" ImageUrl="Images/cancel.png" ToolTip="Cancel" Height="20px" Width="20px" />
     </EditItemTemplate>
     <ItemTemplate>
     <asp:ImageButton ID="imgbtnDelete" CommandName="Delete" Text="Edit" runat="server" ImageUrl="Images/DeleteDoc.png" ToolTip="Delete" Height="20px" Width="20px" />
     </ItemTemplate>
     </asp:TemplateField>

     <asp:TemplateField HeaderText="History" HeaderStyle-Font-Size="small" SortExpression="JOBCODE" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="10%">
     <ItemTemplate>
     <asp:LinkButton ID="btnhistory" Text="ViewHistory" ForeColor="Black" CssClass="gridview-item" runat="server" OnClick="btnhistory_Click1" CommandArgument='<%# Eval("courseid")%>'/>
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
         <div class="buttons">
             <div><asp:Button ID="btnAddCourse" Text="Add Course Chapters" OnClick="btnAddCourse_Click" runat="server" CssClass="btn btn-custom"/></div>
             <div><asp:Button ID="btnExportToExcel" Text="Export To Excel" runat="server" OnClick="btnExportToExcel_Click" CssClass="btn btn-custom" style="margin-left:10px;"/></div>
         </div>
     </div>
</asp:Content>