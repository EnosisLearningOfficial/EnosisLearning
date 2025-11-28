<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeFile="Question_Status.aspx.cs" Inherits="ENOSISLEARNING.Question_Status" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
     *
 {
     font-family: 'Montserrat', sans-serif;
 } 
 textarea {
    font-family: inherit;
    font-size: inherit;
    line-height: inherit;
    width: 100% !important;
}
 a {
  color:#070606;
  padding: 2px 5px;
  text-decoration: none;
}
    .mylblcss
    {
        text-align:right;
      
    }
    .headstyle
    {
color:#31708f;
        font-size:18px;
        font-weight:500;
    }
#accordion .panel{
    border: none;
    box-shadow: none;
    border-radius: 0;
    margin-bottom: 15px;
}
#accordion .panel-heading{
    padding: 0;
}
#accordion .panel-title a {
   display: block;
    font-size: 23px;
    font-weight: bold;
    line-height: 10px;
    color: #fff;
   background: #173151;
    border: 2px solid #173151;
    padding: 10px 20px 10px 47px;
    position: relative;
    transition: all 0.5s ease 0s;
}
.panel-footer {
    padding: 10px 15px;
    background-color:transparent !important; 
    border-top: 1px solid #ddd;
    border-bottom-right-radius: 3px;
    border-bottom-left-radius: 3px;
}
#accordion .panel-title a.collapsed{
    background: #27a9e3;
    border-color: #ddd;
    color: white;
}

label.radio-inline {
    font-size: 17px;
    color: black;
    padding: 0px 10px;
}
#accordion .panel-title a:before{
    content: "\f106";
    font-family: "Font Awesome 5 Free";
    font-weight: 900;
    font-size: 18px;
    position: absolute;
    top: 30%;
    left: 20px;
    transition: all 0.3s ease 0s;
}
.btn-warning {
    background-repeat: repeat-x;
    border-color: #e38d13;
    background-image: linear-gradient(to bottom,#f0ad4e 0,#eb9316 100%);
    color: white;
    box-shadow: 3px 3px 2px grey;
}
#accordion .panel-title a.collapsed:before{
    content: "\f107";
}
#accordion .panel-body{
    font-size: 16px;
    color: #888;
    line-height: 25px;
    border: 2px solid #333;
    border-top: none;
    padding: 14px 20px;
}
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 
        <div class="panel-group" id="accordion">
              
      <div class="row">
          <div class="col-md-12">
                    <div class="row  form-group">
                <div class="col-md-2">Select Course:</div>
                   <div class="col-md-6">      
                          <asp:DropDownList ID="ddlcourse" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlcourse_SelectedIndexChanged" />
                       </div>
                        <div class="col-md-3">
                            <asp:Button ID="btnaddnewques" runat="server" OnClick="btnaddnewques_Click" Text="Add New Question" CssClass="btn btn-danger float-right" /> 
                        </div>
                        </div>
                </div>
                <div class="clearfix"></div>
      <br />
                <div class="col-md-12 " >
           <br />         
                     <div class="panel panel-info" >
            <div class="panel-heading " >
              
              <h1 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true"
                    aria-controls="collapseOne">
                 Unaswered Question Details
                            </a>
                       </h1>
           
                 
         
                </div>
            <!-- /.box-header -->
                         <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne"> 
            <div class="panel-body" id="panel1" runat="server">
                <asp:Repeater ID="rppostedquesdetails"    runat="server" OnItemDataBound="rppostedquesdetails_ItemDataBound">
                           <ItemTemplate>
                               <div class="container-fluid">
                                   <div class="row">
                                       <div class="col-md-12">
                                <asp:Label ID="lblpostid" Visible="false" runat="server" Text='<%#Eval("Post_id") %>' />
                              </div>
                                       <div class="col-md-12 form-group">
                           <asp:Label ID="lblquess" runat="server" Text="Ques."  CssClass="col-md-2 mylblcss headstyle"></asp:Label>
                             
                                           <asp:Label ID="lblques" runat="server" CssClass="col-md-10 headstyle" Text='<%#Eval("Ques") %>' />
                    
                        
                  </div>
                                       <div class="clearfix"></div>
                                           <div class="col-md-12 form-group" >
                       <asp:Label ID="lblans" runat="server" Text="Ans." CssClass="col-md-2 mylblcss"  />
                                           <div class="col-md-10">
                      <asp:TextBox ID="txtans" runat="server" CssClass="form-control" TextMode="MultiLine" />
</div>
                         </div>
                                           <div class="clearfix"></div>
                <div class="col-md-12  form-group">
                   <asp:Label ID="lblquestype" runat="server" Text="Question Type:" CssClass="col-md-2 mylblcss">

                   </asp:Label> 
                    <div class="col-md-10">
                     <asp:DropDownList ID="drpquestype1" runat="server" CssClass="form-control" />
                </div>
                    </div>
                                           <div class="clearfix"></div>
                                       <div class="text-lg-right card-body" >
<asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" style="margin-right: 13px;" CssClass="btn btn-warning  pull-right col-md-pull-2"  />
                               <asp:Button ID="btnpost" runat="server" Text="Post Answer" style="margin-right: 13px;" CssClass="btn btn-danger pull-right col-md-pull-2" OnClick="btnpost_Click"  />
               </div>
     <div class="clearfix"></div>

                    
                   
         <div id="dvNoRecords" runat="server" visible="false" style="text-align: center; color: Red;">  
                <font>  
                    <b>  
                        <i>No records to display.</i>  
                    </b>  
                </font>  
            </div>
                                   </div>
        </div>
 </ItemTemplate>
                </asp:Repeater>
                    
                 
                </div>
                           
                      
                </div>
                         </div>
                    </div>
                 
      
   
            </div>
            <div class="clearfix"><br /></div>
        <div class="row">
           
            <div class="col-md-12">
                    <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">
                      <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        Question Details</a></h3>
            </div>
            <!-- /.box-header -->
                         <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                          
                                      <div class="panel-body">
         
                  <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                              <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                  <ContentTemplate>
                    <asp:GridView ID="grddeactive" width="100%" runat="server" OnDataBound="grddeactive_DataBound" ShowHeaderWhenEmpty="True" EmptyDataText="No records Found" OnRowCommand="grddeactive_RowCommand" AutoGenerateColumns="false"  OnRowEditing="grddeactive_RowEditing" OnRowCancelingEdit="grddeactive_RowCancelingEdit"  OnRowDeleting="grddeactive_RowDeleting" OnRowUpdating="grddeactive_RowUpdating" DataKeyNames="Ques_id" ShowFooter="true" AllowPaging="true" PageSize="5" OnRowDataBound="grddeactive_RowDataBound" OnPageIndexChanging="grddeactive_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="Ques_id" HeaderText="Ques_id" Visible="false" />
                     
        <asp:TemplateField HeaderText="Change Status">
            <ItemTemplate>
                <asp:CheckBox ID="chkRow" runat="server" style="padding:10px;" Width="20px" Checked='<%#Convert.ToBoolean(Eval("Status")) %>' />
            </ItemTemplate>
        </asp:TemplateField>
                             <asp:TemplateField HeaderText="Question">
            <ItemTemplate>
                <asp:Label ID="lblquestion" runat="server" Text='<%#Eval("Question") %>' />
            </ItemTemplate>
                                 <EditItemTemplate>
                                     <asp:TextBox ID="txtques" runat="server" width="100%" Text='<%#Eval("Question") %>' TextMode="MultiLine" />
                                 </EditItemTemplate>
                                 <FooterTemplate>
                                      <asp:TextBox ID="txtques1" runat="server" width="100%" TextMode="MultiLine"  />
                                 </FooterTemplate>
        </asp:TemplateField>
                           <asp:TemplateField HeaderText="Answer">
            <ItemTemplate>
                <asp:Label ID="lblanswer" runat="server" Text='<%#Eval("Answer") %>' />
            </ItemTemplate>
                                 <EditItemTemplate>
                                     <asp:TextBox ID="txtans" runat="server" width="100%" Text='<%#Eval("Answer") %>' TextMode="MultiLine" />
                                 </EditItemTemplate>
                               <FooterTemplate>
                                    <asp:TextBox ID="txtans1" runat="server" width="100%" TextMode="MultiLine"/>
                                   
                               </FooterTemplate>
        </asp:TemplateField>
                             <asp:TemplateField HeaderText="Question Type">
            <ItemTemplate>
                <asp:Label ID="lblquesttype" runat="server" Text='<%#Eval("Question_Type") %>' />
            </ItemTemplate>
                       <EditItemTemplate>
                           <asp:DropDownList id="drpquestype" runat="server" width="100%" />
                                 
                                 </EditItemTemplate>
                               <FooterTemplate>
                                 <asp:DropDownList id="drpquestypee" runat="server" width="100%"  />
                                   
                               </FooterTemplate>        
        </asp:TemplateField>
<asp:TemplateField >
    <ItemTemplate>
        <asp:ImageButton ID="btnedit" runat="server" ImageUrl="~/img/edit.png" Width="30" Height="30" CommandName="Edit" ToolTip="Edit" />
        <asp:ImageButton ID="btndelete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this event?');" ImageUrl="~/img/delete1.png" Width="20" Height="20" CommandName="Delete" ToolTip="Delete" />
    </ItemTemplate>
<EditItemTemplate>
    <asp:ImageButton ID="btnupdate" runat="server" ImageUrl="~/img/update.png"  Width="20" Height="20"  CommandName="Update" ToolTip="Update" />
        <asp:ImageButton ID="btncancel" runat="server" ImageUrl="~/img/cancel.png"  Width="20" Height="20" CommandName="Cancel" ToolTip="Cancel" />
</EditItemTemplate>
    <FooterTemplate>
        <asp:ImageButton ID="btnadd" runat="server" ImageUrl="~/img/plus-png-4.png" Width="20" Height="20" CommandName="Add" ToolTip="Add" />
    
    </FooterTemplate>
</asp:TemplateField>

      
    </Columns>
                    </asp:GridView>
                                   </ContentTemplate>
                              </asp:UpdatePanel>
                                          <br />
                                                <asp:Button ID="btnactive" runat="server" Text="Change Status" CssClass="btn btn-danger" OnClick="btnactive_Click" />
         <asp:Button ID="btnactiveall" runat="server" Text="Active All" CssClass="btn btn-danger" OnClick="btnactiveall_Click" />
                         <asp:Button ID="btndeactiveall" runat="server"  Text="Deactive All" CssClass="btn btn-danger" OnClick="btndeactiveall_Click" />

                </div>
                        
      
            
    </div>
                        </div>
            </div>
            </div>
          <div class="clearfix"><br /></div>
                                      
                      <asp:HiddenField ID="PaneName" runat="server" />      
        </div>

     <%-- <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.0.min.js"></script>--%>
    <script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" ></script>--%>
    <script src="js/bootstrap.min.js" ></script>
<script type="text/javascript">
    $(function () {
        var paneName = $("[id*=PaneName]").val() != "" ? $("[id*=PaneName]").val() : "collapseOne";

        //Remove the previous selected Pane.
        $("#accordion .in").removeClass("in");

        //Set the selected Pane.
        $("#" + paneName).collapse("show");

        //When Pane is clicked, save the ID to the Hidden Field.
        $(".panel-heading a").click(function () {
            $("[id*=PaneName]").val($(this).attr("href").replace("#", ""));
        });
    });
</script>
    <br />
    <br />

        <script src="Scripts/jquery-1.8.2.js"></script>
</asp:Content>
