<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="TskManager.aspx.cs" Inherits="ENOSISLEARNING.TskManager" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="AjaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <script type="text/javascript">
     $(document).ready(function () {
         $("#myModal").modal('hide');
        
     });

 </script>
 <script type="text/javascript">
     function openModal() {

         //$('#myModal').modal();
         $("#myModal").modal('show');
     }
 </script>
 <script type="text/javascript">
     function CloseModal() {

         $("#myModal").modal('hide');
     }
 </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#myModal").modal('hide');

        });

    </script>


<script type="text/javascript">
    function openModal() {

        //$('#myModal').modal();
        $('#myModaltwo').modal('show');
    }
</script>
<script type="text/javascript">
    function CloseModal() {

        $("#myModaltwo").modal('hide');
    }
</script>

    
    <script type="text/javascript">
        $(document).ready(function () {
            $("#myModaltwo").modal('hide');

        });

    </script>
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
        font-size:13px;
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
        span {
            font-size: 12px;
            font-family: 'Montserrat', sans-serif;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
   <%-- <form id="form1" runat="server">--%>
        <div class="container">
         <div class="SortBy">    
         </div>
         
       <div id="myTaskModal" clientidmode="Static" class="modal fade" data-backdrop="false"  role="dialog" style="background-color:#ddd;">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content br" style="width: 90%;">
           <div class="modal-body">
               
               <button type="button" class="close text-danger" data-dismiss="modal">&times;</button>
              <div class="form-horizontal">
                   <div><h2 style="color:#2191C0"><b><center>Task Information</center></b></h2></div>
                 
  <div class="form-group row">
     
          <div class="col-sm-9 size">
            <div class="input-group br">
           
                 <asp:TextBox ID="TxtCategoryNo" Visible="false" CssClass="form-control form-control-lg" style="border-style:Solid;border-radius: 50px; text-align:center;" runat="server" placeholder="Enter_CategoryNo"  />
                   <div class="help-block with-errors br"></div>
               </div>
          </div>
      </div>


    
   <div class="form-group row">
     <label class="col-sm-3 col-form-label c" for="firstName">Employee Name:</label>
          <div class="col-sm-9 size" >
              <div class="input-group">
                    <asp:DropDownList ID="EmpDrp1" runat="server"  CssClass="form-control" style="height:35px; border-style:Solid;border-radius: 50px; text-align:center;width: 350px;"></asp:DropDownList>
                      <span style='color:Red;'>*</span>
                    <div class="help-block with-errors"></div>
              </div>
               <asp:RequiredFieldValidator ID="RFEmpDrp1" ValidationGroup="test" ControlToValidate="EmpDrp1" ErrorMessage="Employee Name is required." ForeColor="Red" runat="server" CssClass="reqMessage float-right"></asp:RequiredFieldValidator>
          </div>
      </div>




  
    <div class="form-group row">
    <label class="col-sm-3 col-form-label c" for="firstName">Task Name:</label>
         <div class="col-sm-9 size" >
             <div class="input-group">
                   <asp:TextBox ID="TskNameAdd" runat="server" style="border-style:Solid;border-radius: 50px; text-align:center;width: 350px;" CssClass="form-control" placeholder="Enter Name"/>
                   <span style='color:Red;'>*</span>
                 <div class="help-block with-errors"></div>
             </div>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="test" ControlToValidate="TskNameAdd" ErrorMessage="Full Name  is required." ForeColor="Red" runat="server" CssClass="reqMessage float-right"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="test" ControlToValidate="TskNameAdd" ErrorMessage="Invalid FullName format." runat="server" CssClass="reqMessage" ValidationExpression="^[a-zA-Z\s]+$"></asp:RegularExpressionValidator>
         </div>
     </div>
   
        <%--Task Details--%>
     <div class="form-group row">
        <label class="col-sm-3 col-form-label c" for="firstName">Task Details:</label>
        <div class="col-sm-9 size">
         <div class="input-group">
         <asp:TextBox ID="TextTaskDetails" TextMode="MultiLine" runat="server"  style="border-style:Solid;border-radius: 50px; text-align:center;width: 350px; height: 35px;" CssClass="form-control" placeholder="Enter Details"/>
              
              <div class="help-block with-errors"></div>
        </div>
    </div>
</div>


   <div class="form-group row">
          <label class="col-sm-3 col-form-label c" for="firstName">StartDate:</label>
          <div class="col-sm-9 size">
              <div class="input-group">
            <asp:TextBox ID="StartDateAdd" runat="server" CssClass="form-control" style="border-style:Solid;border-radius: 50px; text-align:center;width: 350px;" TextMode="Date"/>
                  <span style='color:Red;'>*</span>
                <div class="help-block with-errors"></div>
          </div>
      </div>
  </div>
 
 <div class="form-group row">
        <label class="col-sm-3 col-form-label c" for="firstName">EndDate:</label>
        <div class="col-sm-9 size">
            <div class="input-group">
           <asp:TextBox ID="EndDateAdd" runat="server" style="border-style:Solid;border-radius: 50px; text-align:center;width: 350px;" CssClass="form-control" TextMode="Date"/>
              <span style='color:Red;'>*</span>
              <div class="help-block with-errors"></div>
        </div>
    </div>
</div>

  <div class="form-group row">
        <label class="col-sm-3 col-form-label c" for="firstName">Status:</label>
        <div class="col-sm-9 size">
            <div class="input-group">
                 <asp:DropDownList ID="StatusAdd" CssClass="form-control my-form-control" style="border-style:Solid;border-radius: 15px; text-align:center;width: 350px;" runat="server">
                 </asp:DropDownList>
              
              <div class="help-block with-errors"></div>
        </div>
    </div>
</div>  

 <div class="form-group row">
        <label class="col-sm-3 col-form-label c" for="firstName">Comment:</label>
        <div class="col-sm-9 size">
            <div class="input-group">
          <%--        <span class="input-group-addon br" id="basic-addon5">@</span>--%>
         <asp:TextBox ID="CommentAdd" TextMode="MultiLine" runat="server"  style="border-style:Solid;border-radius: 50px; text-align:center;width: 350px;" CssClass="form-control" placeholder="Comment"/>
              
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
</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <asp:Button ID="Save" runat="server" Text="Save" onclick="Save_Click" ValidationGroup="test"  class="btn btn-primary br"  />
      </div>
           </div>
            
            <div class="clearfix"></div>
         </div>
        </div>
      </div>

         <div class="vacancy-top-tab" >
            <div class="row"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <div class="SortBy">
                <asp:DropDownList ID="ddlSearchBy" runat="server" AutoPostBack="True" style="height:30px; width:20%; border-style:none; border-radius: 15px; text-align:center" CssClass="drp">
                  <asp:ListItem Text="All" Value="All"></asp:ListItem>
                  <asp:ListItem Text="Employee Name" Value="EmployeeName"></asp:ListItem>      
                  <asp:ListItem Text="Task Name" Value="TaskName"></asp:ListItem>
                  <asp:ListItem Text="Status" Value="Status"></asp:ListItem>
                  </asp:DropDownList> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:TextBox ID="txtSearch" runat="server" Height="35px" Width="20%" placeholder="Search" Style="border-radius:15px; border-style:none; text-align:center" CssClass="txtbx"></asp:TextBox>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                 <asp:LinkButton ID="Search" Width="35px" Height="35px" style="background-color:white; border-radius:15px" runat="server" OnClick="Search_Click">
               <img src="../img/View.png" title="Search" height="25" width="25" style="margin-top: 4px;"/>
               <span class="hidden-xs"></span>
                </asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                 <asp:Button ID="ViewGrid" runat="server" CausesValidation="false" Style="border-radius:15px;  text-align:center" ForeColor="Black" Text="View All Tasks" CssClass="btn btn-danger bton datafield br" BorderColor="Green"  BackColor="white"   OnClick="ViewGrid_Click"/>      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                 <a id="btnRDemo" href="#" class="btn btn-danger br" style="box-shadow: 1px 1px 3px 1px gray"" data-toggle="modal" data-target="#myTaskModal" target="_parent"><span>  <img src="../img/Add4.png"  title="Add" height="25" width="25" /></span> &nbsp;ADD NEW TASK</a>&nbsp;&nbsp;&nbsp;

                  <%--  <asp:Label ID="lblUsername" runat="server" Text="Login_User:"></asp:Label>--%>
                    <asp:TextBox ID="txtUsername" runat="server" Height="35px" Width="10%" ReadOnly="True" Style="border-radius:15px; color: white; border-style:none; text-align:center"></asp:TextBox>

  
</div>
            </div>
          </div>

          <div class="gridview-area" style="height:100%; border-radius: 15px;">
          <asp:GridView ID="TaskGrv" AutoGenerateColumns="False" DataKeyNames="Id" OnRowEditing="TaskGrv_RowEditing" OnRowCancelingEdit="TaskGrv_RowCancelingEdit" OnRowUpdating="TaskGrv_RowUpdating" OnRowDeleting="TaskGrv_RowDeleting"  HeaderStyle-BackColor="#BFCFFF" OnRowCommand="TaskGrv_RowCommand" runat="server" AlternatingRowStyle-ForeColor="#071a29"  AllowPaging="true" OnPageIndexChanging="TaskGrv_PageIndexChanging" PageSize="10"  BorderStyle="None" AlternatingRowStyle-BackColor="white"   CssClass="table table-borderless gridview-table" PagerStyle-CssClass="pager" FooterStyle-CssClass="footer" > 
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775"/>
                    <Columns>
                          
                             <%--Employee Name--%>
                             <asp:TemplateField HeaderText="Employee Name" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="9%" HeaderStyle-Font-Size="small" >
                                 <ItemTemplate>
                                     <asp:Label ID="EmpName" runat="server" Text='<%#Bind("EName") %>' CssClass="gridview-item" ></asp:Label>
                                 </ItemTemplate>
                                 <EditItemTemplate>
                                     <asp:TextBox ID="EmpnameText" style="text-align: center;border-style: none;border-radius:50px;" runat="server" Text='<%# Bind("Ename") %>' Width="40px" Height="22px"></asp:TextBox>                         
                                 </EditItemTemplate>
                             </asp:TemplateField>
                             <%--Employee Name--%>

                             <%--Task Name--%>
                             <asp:TemplateField HeaderText="Task Name" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="8%" HeaderStyle-Font-Size="small" >
                                 <ItemTemplate>
                                    <asp:Label ID="TaskName" runat="server" Text='<%#Bind("TaskName") %>' CssClass="gridview-item" ></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TaskNameText" style="text-align: center;border-radius:50px;border-style: none;" runat="server" Text='<%# Bind("TaskName") %>' Width="80px" Height="22px"></asp:TextBox>
                                </EditItemTemplate>
                             </asp:TemplateField>
                             <%--Task Name--%>
                            
                             <%--Task Details--%>
                            <asp:TemplateField HeaderText="Task Details" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="10%" HeaderStyle-Font-Size="small" >
                             <%-- <ItemTemplate>
                                <asp:Label ID="IDetails" runat="server" Text='<%#Bind("Details") %>' CssClass="gridview-item" ></asp:Label>
                              </ItemTemplate>--%>
                                <ItemTemplate>
                            <asp:TextBox ID="IDetails" runat="server" Text='<%# Eval("Details") %>' ToolTip='<%# Bind("Details")%>' Rows="4" Columns="20"  Style="display: block; text-align: center; border-radius: 15px; border-style: none; width: 200px; height: 22px; overflow: hidden;" />
                                </ItemTemplate>
                            <EditItemTemplate>
                             <asp:TextBox ID="EDetails" style="text-align: center;border-radius:50px;border-style: none;" runat="server" ToolTip='<%# Bind("Details")%>' Text='<%# Bind("Details") %>'  Width="150px" Height="22px"></asp:TextBox>
                             </EditItemTemplate>
                         </asp:TemplateField>

                             <%--Task Details--%>


                             <%--Start Date--%>
                             <asp:TemplateField HeaderText="Start Date" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="8%" HeaderStyle-Font-Size="small">
                                 <ItemTemplate>
                                   <%-- <asp:Label ID="StartDate" runat="server" Text='<%#Bind("StartDate") %>' CssClass="gridview-item font"></asp:Label>--%>
                                      <asp:Label ID="StartDate" runat="server" Text='<%#Bind("StartDate","{0:dd/MM/yyyy}") %>' CssClass="gridview-item" ></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="StartDateText" style="text-align: center;border-radius:50px;border-style: none;" runat="server" Text='<%# Bind("StartDate","{0:dd/MM/yyyy}") %>' Width="80px" Height="22px"></asp:TextBox>
                                </EditItemTemplate>
                             </asp:TemplateField>
                              <%--Start Date--%>

                              <%--End Date--%>
                             <asp:TemplateField HeaderText="End Date" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="8%" HeaderStyle-Font-Size="small" >
                                 <ItemTemplate>
                                    <asp:Label ID="EndDate" runat="server" Text='<%#Bind("EndDate","{0:dd/MM/yyyy}") %>'  CssClass="gridview-item" ></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="EndDateText" style="text-align: center;border-radius:50px;border-style: none;" runat="server" Text='<%# Bind("EndDate","{0:dd/MM/yyyy}") %>'  Width="80px" Height="22px"></asp:TextBox>
                                </EditItemTemplate>
                             </asp:TemplateField>
                              <%--End Date--%>

                              <%--Status--%>
                             <asp:TemplateField HeaderText="Status" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="6%" HeaderStyle-Font-Size="small" >
                                  <ItemTemplate>
                                    <asp:Label ID="Status" runat="server" Text='<%#Bind("Status") %>' CssClass="gridview-item" ></asp:Label>
                                  </ItemTemplate>
                                <EditItemTemplate>

                         <div style="display: flex; align-items: center;">
                             <div style="text-align: right; margin-right: 10px; width: 80px;">
                                 <asp:Label ID="StatusText" 
                                            runat="server" 
                                            Text='<%# Bind("Status") %>'  
                                            ToolTip='<%# Bind("Status") %>'  
                                            CssClass="gridview-item"></asp:Label>
                             </div>
                             <asp:DropDownList ID="StatusAdd1" 
                                               CssClass="form-control my-form-control" 
                                               style="height:30px; border-style:Solid; border-radius: 15px; text-align:center; width: 120px;" 
                                               runat="server">
                             </asp:DropDownList>
                         </div>
                                </EditItemTemplate>
                             </asp:TemplateField>
                              <%--Status--%>

                              <%--Comment--%>
                             <asp:TemplateField HeaderText="Comment" AccessibleHeaderText="COMMENTS" HeaderStyle-Font-Size="small" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="6%" >
                                 
                                     <ItemTemplate><asp:TextBox ID="Comment"  runat="server" Text='<%# Eval("Comment") %>' ToolTip='<%# Bind("Comment")%>'   Rows="4" Columns="20"  Style="display: block;text-align: center; border-radius: 15px; border-style: none; width: 350px; height: 22px; overflow: hidden;" />
                                     </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="CommentText" style="text-align: center; border-radius: 15px; width: 350px; height: 22px; border-style: none;" runat="server" Text='<%# Bind("Comment") %>' ToolTip='<%# Bind("Comment")%>'  ></asp:TextBox>
                                 </EditItemTemplate>  
                             </asp:TemplateField>
                              <%--Comment--%>

                              <%--File--%>
                             <asp:TemplateField HeaderText="File Details" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="15%" HeaderStyle-Font-Size="small">
                              
                               <ItemTemplate>
                                 <asp:LinkButton  ID="FileUpload" TextMode="MultiLine" runat="server"  CommandArgument='<%#Bind("FileDetails") %>' Text='<%#Bind("FileDetails") %>' ToolTip='<%# Bind("FileDetails")%>' CommandName="Download" CssClass="gridview-item font" style="display: block; width: 180px; height: 22px; overflow: hidden;"> </asp:LinkButton>
                                </ItemTemplate>

                                 <EditItemTemplate>
                                 <asp:FileUpload ID="FileEdit" runat="server" Width="96px" />
                                     <asp:Label ID="lblEditFile" TextMode="MultiLine"  style="display: block; width: 100px; height: 22px; overflow: hidden; text-align: center; border-radius: 50px; border-style: none;" Text='<%#Eval("FileDetails") %>' ToolTip='<%# Bind("FileDetails") %>' runat="server" />
                                </EditItemTemplate>

                             </asp:TemplateField>

                        <asp:TemplateField HeaderText="AuditDetails" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="6%" HeaderStyle-Font-Size="small">
                              <ItemTemplate>
                             <asp:LinkButton ID="EmpId" runat="server" CommandName="AuditDetails" CommandArgument='<%# Eval("Id") %>' Style="color: black;"> <img src="../img/View.png" title="ViewAuditDetails" height="22" width="25" /><span><%# Eval("Id") %></span></asp:LinkButton>
                            </ItemTemplate>
                            </asp:TemplateField>

                         
                            <%--Actions--%>
                        
                        <asp:TemplateField HeaderText="Edit/Delete"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-width="6%" HeaderStyle-Font-Size="small">
                                <ItemTemplate>
                                       <asp:ImageButton ID="Edit" runat="server" CausesValidation="false" CommandName="Edit"
                                         AlternateText="Edit" ToolTip="Edit"  ImageUrl="~/img/Edit1.png" Width="20" Height="20" />

                                     <asp:ImageButton ID="Delete" runat="server" CausesValidation="false" onclientclick="return confirm('Do you want to delete this record?');"
                                   CommandName="Delete" Text="Delete" ToolTip="Delete"  ImageUrl="~/img/Delete3.png" Width="20" Height="20" />

                                </ItemTemplate>

                                <EditItemTemplate>
                                      <asp:ImageButton ID="Update" runat="server" CausesValidation="false" onclientclick="return confirm('Do you want to Update this record?');"
                                    CommandName="Update" Text="Update" ToolTip="Update"  ImageUrl="~/img/Add4.png" Width="20" Height="20" />

                                 
                                      <asp:ImageButton ID="Cancel" runat="server" CausesValidation="false" onclientclick="return confirm('Do you want to Cancel this record?');"
                                   CommandName="Cancel" Text="Cancel" ToolTip="Cancel"  ImageUrl="~/img/cancel2.png" Width="20" Height="20" />
                                </EditItemTemplate>
                                 <%--Actions--%>
                            <HeaderStyle ></HeaderStyle>
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
            </div>


           <!-- Modal Code -->
<div id="myModaltwo" clientidmode="Static" class="modal fade" data-backdrop="false" role="dialog" style="background-color:#ddd;">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content br" style="width: 250%; margin-left: -450px;">
            <div class="modal-body">
                <button type="button" class="close text-danger" data-dismiss="modal">&times;</button>
                <div class="form-horizontal">
                    <h2 style="color:#2191C0"><b><center>VIEW AUDIT-HISTORY</center></b></h2>
                     <asp:TextBox ID="TextEMPID" runat="server"  CssClass="form-control" />
                    <asp:Label ID="idlbl" runat="server" />
                    <asp:GridView ID="AuditGrv" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered">
    <Columns>
        <asp:BoundField DataField="AuditID" HeaderText="Audit ID" SortExpression="AuditID" />
        <asp:BoundField DataField="Action" HeaderText="Action" SortExpression="Action" />
        <asp:BoundField DataField="ActionDate" HeaderText="Action Date" SortExpression="ActionDate" />
        <asp:BoundField DataField="USERNAME" HeaderText="Username" SortExpression="USERNAME" />
        <asp:BoundField DataField="EName" HeaderText="Employee Name" SortExpression="EName" />
        <asp:BoundField DataField="TaskName" HeaderText="Task Name" SortExpression="TaskName" />
        <asp:BoundField DataField="StartDate" HeaderText="Start Date" SortExpression="StartDate" />
        <asp:BoundField DataField="EndDate" HeaderText="End Date" SortExpression="EndDate" />
        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
        <asp:BoundField DataField="Comment" HeaderText="Comment" SortExpression="Comment" />
        <asp:BoundField DataField="Details" HeaderText="Details" SortExpression="Details" />
    </Columns>
</asp:GridView>

                </div>
            </div>
        </div>
    </div>
</div>




           <div class="head">
       <table  class="table table-responsive table-borderless">
           <tr>
               <td>
                       <asp:DropDownList ID="EmpDrp" Visible="false" runat="server"  CssClass="form-control" style="border-style:none; border-radius: 50px; text-align:center"></asp:DropDownList>
               </td>
                <td>
                    <asp:TextBox ID="TaskName" Visible="false" runat="server" Style="border-radius:50px; text-align:center" CssClass="form-control" placeholder="Task Name"/>
                </td>
                <td>
                <asp:TextBox ID="StartDate" Visible="false" runat="server" CssClass="form-control" Style="border-radius:50px; text-align:center" TextMode="Date"/>
               </td>
                <td>
                  <asp:TextBox ID="EndDate" Visible="false" runat="server" Style="border-radius:50px; text-align:center" CssClass="form-control" TextMode="Date"/>
               </td>
                <td>
                   <asp:TextBox ID="Status" Visible="false" runat="server" Style="border-radius:50px; text-align:center" CssClass="form-control" placeholder="Status"/>
                </td>
                <td>
                 <asp:TextBox ID="Comment" Visible="false" TextMode="MultiLine" runat="server"  Style="border-radius:50px; text-align:center" CssClass="form-control" placeholder="Description"/>
                </td>
                <td>
                    <asp:FileUpload ID="File" Visible="false" runat="server" style="margin-left:50px; height:50px;width:200px"/>
                </td>
               <td>
                 <asp:TextBox ID="Details" Visible="false" TextMode="MultiLine" runat="server"  Style="border-radius:50px; text-align:center" CssClass="form-control" placeholder="Description"/>
                </td>
               <td>
                   <asp:Button ID="btn" Visible="false" class="btn btn-danger"  Text="Add New Task" runat="server"  style="box-shadow: 1px 1px 3px 1px gray; border-radius:50px" CssClass="btn btn-danger bton datafield br" OnClick="btn_Click" />

               </td>
           </tr>
          
       </table>
  </div>
              <asp:Label ID="Label12" runat="server" />

        </div>
  <%--  </form>--%>
    <script type="text/javascript">
        function setEmpIdAndShowModal(empId) {
            // Set the EmpId in the TextEMPID TextBox inside the modal
            document.getElementById('<%= TextEMPID.ClientID %>').value = empId;

            // Show the modal (Bootstrap method)
            $('#myModaltwo').modal('show');

            // Now make the AJAX request to bind the AuditGrv GridView
            $.ajax({
                type: "POST",
                url: "TskManager.aspx", // Current page URL
                data: { empId: empId },
                success: function (data) {
                    // Handle the response here, if needed
                }
            });
        }

    </script>


</asp:Content>
