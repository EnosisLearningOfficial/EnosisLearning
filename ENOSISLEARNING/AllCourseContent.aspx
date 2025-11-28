<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="AllCourseContent.aspx.cs" Inherits="ENOSISLEARNING.FinalBatchSheet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style> 
         *
         {
             font-family: 'Montserrat', sans-serif;
         }
          .container-fluid
         {
            width:95%;
            height:100%;
            margin-top :5px;
         } 
        .drp
        {
            height:30px;
            margin:5px 0px 0px -15px;
            border-bottom:0.5px solid lightgrey;
            border-top:none;
            border-right:none;
            border-left:none;
            color:black;
            font-weight:600;
            font-family: 'Montserrat', sans-serif;
            font-size:12px;
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
     background-color :white;
}
.gridview-item
{
    margin-left:-25px;
    transition: background-color 0.3s ease;
    text-align:justify;
    font-size:10px;
    font-family: 'Montserrat', sans-serif;
    font-weight:500;
    color:#000;
    background-color :white;
    border : none;
}
.gridview-header {
 margin-left:-25px;
 text-align:justify;
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
        .topic-gridview-item {
            padding: 12px;
            text-align: center;
            background-color: white;
            color: black;
            border-radius:0px;
            position: relative;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .topic-gridview-item:hover {
            background-color: rgba(0, 0, 0, 0.03);
        }
        .topic-gridview-header
        { 
             text-align:center;
             background-color: #1d96b2;
             border-radius:0px;
             color: #fff;
             font-size:10px;
             font-weight: bold;
             font-family: 'Montserrat', sans-serif;
        }
        .topic-gridview-header-item {
            padding: 12px;
            text-align: center;
            background-color: #4caf50;
            color: red;
            border-radius: 8px;
            position: relative;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .topic-gridview-header-item:hover {
            background-color: #388e3c;
        }

        .topic-gridview-header-item::after {
            content: "\f0dc"; /* FontAwesome icon for sorting */
            font-family: "Font Awesome 5 Free";
            font-weight: 900;
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            opacity: 0.7;
        }

        .add
        {
            margin:4px 0px 0px 18px;
        }
         .footer
         {
             border-bottom:0.5px solid lightgrey;
             border-top:none;
             border-right:none;
             border-left:none;
         }
          .btn:hover
          {
             transform: scale(1.1);
             box-shadow: 0 0 20px rgba(#499292);
             color:#499292;
          }
          .btn:active
          {
              transform: scale(0.9);
              box-shadow: none;
          }
          .dropbtn 
          {
           text-align:center;
           font-size: 10px;
           border: none;
           cursor: pointer;
           border-radius: 4px;
           font-family: 'Montserrat', sans-serif;
           color:#1d96b2;
          font-weight:600;
          }
         .dropbtn  option 
         {
           position: absolute;
           background-color:whitesmoke;
           min-width: 160px;
           box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
           z-index: 1;
           border-radius: 4px;
           font-family:'Montserrat', sans-serif;
           font-weight:600;
           color:#1d96b2;
         }
        .dropbtn:hover
        {
            border:1px solid #00adef;
            box-shadow: 0 0 5px #00adef;
        }
        .form-control
        {
           border: 1px solid #efeeed;
           border-radius: 5px;
           font-size: 8px;
        }
        .form-control::placeholder
        {
           color: black;
        }
        .form-control:hover
        {
           outline: none;
           border-color: #00adef;
           box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }
        .fa-solid
        {
         margin-top:10px;
         font-size:15px;
         margin-left:87%;
        }
        .btn
        {
          padding: 10px 20px;
          background-color: #ddd;
          border: none;
          cursor: pointer;
          outline: none;
         border:none;
         padding: 5px 5px;
         margin-top: 3px;
         font-size: 10px;
         border: none;
         border-radius: 0px;
         background: none;
         color: black;
         cursor: pointer;
         transition: all 0.3s ease-in;
         font-weight:600;
         font-family:'Montserrat', sans-serif;
        }
        .btn:hover
        {
           transform: scale(1.1);
           box-shadow: 0 0 20px rgba(#499292);
           color:#499292;
        }
        .btn:active
        {
            transform: scale(0.9);
            box-shadow: none;
        }
        .active {
          background-color: #007bff;
          color: white;
        }
        .custom-select 
            {
            width: 100%;
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
            .labelstyle
            {
                color:black;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <div class="container-fluid">
           <%-- DropDown Starts--%>
             <div class="row">
                 <div class="col-sm-12 col-md-1 col-lg-1">
                      <asp:DropDownList ID="drpCourses" runat="server" OnSelectedIndexChanged="drpCourses_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control custom-select" style="width:155px;height:30px;"></asp:DropDownList>
                 </div>
              </div>
           <%-- DropDown Ends--%>
           <%-- Chapter GridView Starts--%>
             <div class="row">
                 <div class="col-md-12">
                     <div class="gridview-area">
                          <%-- Chapter GridView Starts Here--%>
                         <asp:GridView ID="ChapterGrv" AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="Chapter_Id" runat="server" OnRowCommand="ChapterGrv_RowCommand" OnRowDataBound="ChapterGrv_RowDataBound" OnRowEditing="ChapterGrv_RowEditing" OnRowCancelingEdit="Chaptergv_RowCancelingEdit" OnRowUpdating="Chaptergv_RowUpdating" OnRowDeleting="Chaptergv_RowDeleting" BorderStyle="None" FooterStyle-BorderStyle="None" CssClass="table table-hover table-borderless gridview-table" AlternatingRowStyle-BackColor="white"  AlternatingRowStyle-ForeColor="black" FooterStyle-CssClass="footer" RowStyle-ForeColor="Black">
                            <Columns>
                                <asp:TemplateField Visible="false">
                                      <ItemTemplate>
                                       <asp:Label ID="LblChpId" runat="server" Visible="false" Text='<%#Eval("Chapter_Id") %>'></asp:Label>
                                  </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" ItemStyle-CssClass="gridview-item" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                                    <ItemTemplate>
                                         <asp:ImageButton ID="btnExpand" ImageUrl="~/Images/col11.png" CommandName="Expand" CommandArgument='<%# Container.DataItemIndex %>' CausesValidation="false" ToolTip="Expand" Width="20px" Height="20px" ImageAlign="Middle" runat="server" OnClick="btnExpand_Click"  CssClass="expand-collapse-btn"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Chapter Number" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" ItemStyle-CssClass="gridview-item" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-ForeColor="Black">
                                        <ItemTemplate>
                                            <asp:Label ID="lblChapterNumber" runat="server" Text='<%# Eval("Chapter_Number") %>' CssClass="gridview-item" style="color:red;"></asp:Label>
                                            <%--Panel Of  Topic Gridview Starts Here--%>
                                            <asp:Panel ID="pnlNestedGridView" runat="server" Visible="false">
                                                 <%-- Topic GridView Starts--%>
                                                <asp:GridView ID="TopicGrv" DataKeyNames="Topic_Id" runat="server" AutoGenerateColumns="false" ShowFooter="true" OnRowCommand="TopicGrv_RowCommand" OnRowEditing="TopicGrv_RowEditing" OnRowCancelingEdit="Chaptergv_RowCancelingEdit" OnRowUpdating="TopicGrv_RowUpdating" CssClass="table table-hover table-borderless gridview-table" BorderStyle="None" FooterStyle-BorderStyle="None" AlternatingRowStyle-BackColor="white"  AlternatingRowStyle-ForeColor="black" FooterStyle-CssClass="footer">
                                                    <Columns>
                                                        <asp:TemplateField  HeaderText="Sr. No" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" ItemStyle-CssClass="gridview-item" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-ForeColor="Black">
                                                            <ItemTemplate>
                                                                <p class="list"> <%#Container.DataItemIndex+1 %></p>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField Visible="false">
                                                           <ItemTemplate>
                                                               <asp:HiddenField ID="HdnTopicId" Visible="false" runat="server" Value='<%#Eval("Topic_Id")%>'/>
                                                           </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Topic Name" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" ItemStyle-CssClass="gridview-item" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-ForeColor="Black">
                                                            <ItemTemplate>
                                                                <asp:Label ID="TopicNameLabel" runat="server" Text='<%#Eval("Topic_Name") %>' CssClass="gridview-item"></asp:Label>
                                                            </ItemTemplate>
                                                             <EditItemTemplate>
                                                                 <asp:TextBox ID="Topic_NameTxt" Text='<%# Eval("Topic_Name") %>' runat="server" CssClass="form-control" style="width:280px; height:35px; display:inline;"/>
                                                            </EditItemTemplate>
                                                            <FooterTemplate>
                                                                 <asp:RequiredFieldValidator ID="Topic" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ErrorMessage="Enter Topic" ControlToValidate="FooterTopic_NameTxt" runat="server" />
                                                                 <asp:TextBox ID="FooterTopic_NameTxt" runat="server" BorderStyle="None" placeholder="Topic Name" CssClass="form-control" style="width:280px; height:35px; display:flex; margin:auto;"></asp:TextBox>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Days" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="topic-gridview-header" ItemStyle-CssClass="topic-gridview-item" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                                                            <ItemTemplate>
                                                                <asp:Label ID="DaysLabel" runat="server" Text='<%#Eval("Days") %>' CssClass="gridview-item"></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="DaysTxt" Text='<%# Eval("Days") %>' runat="server" CssClass="form-control" style="width:80px; height:35px; display:inline;"/>
                                                            </EditItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:RequiredFieldValidator ID="Days" ErrorMessage="Enter Days" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="FooterTopic_DaysTxt" runat="server"/>
                                                                 <asp:TextBox ID="FooterTopic_DaysTxt" runat="server" BorderStyle="None" placeholder="Days" CssClass="form-control" style="width:80px; height:35px; display:inline; margin-left:36%;"></asp:TextBox>
                                                                <asp:ImageButton ID="btnAddTopic" runat="server" ImageUrl="~/Images/plus-icon-13071.png" ToolTip="Add Topic" CommandName="AddTopicGrv" CausesValidation="false" Width="25px" Height="25px" style="position:absolute; margin-top:5px; margin-left:10px;"/>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Action" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="topic-gridview-header" ItemStyle-CssClass="topic-gridview-item" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                                                             <ItemTemplate>
                                                                <asp:ImageButton ID="EditTopicBtn" ImageUrl="Images/edit-icon-png-3598.png" Text="Edit"  CommandName="Edit" CausesValidation="false" ToolTip="Edit Topic" Width="20px" Height="20px" ImageAlign="Middle"  runat="server"/>
                                                                <asp:ImageButton ID="DeleteTopic" ImageUrl="~/Images/DeleteDoc.png" CommandName="DeleteTopic"  ToolTip="Delete Topic" Width="20px" Height="20px" runat="server" ImageAlign="Middle" CausesValidation="false"/>
                                                            </ItemTemplate>
                                                             <EditItemTemplate>
                                                                  <asp:ImageButton  ImageUrl="Images/UpdateDoc.png" CommandName="Update" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CausesValidation="false"  ToolTip="Update Topic" Width="20px" Height="20px" runat="server" style="margin-top:5px;"/>
                                                                  <asp:ImageButton ImageUrl="Images/cancel.png" CommandName="Cancel" ToolTip="Cancel" Width="20px" CausesValidation="false" Height="20px" runat="server" style="margin-top:5px;"/>
                                                             </EditItemTemplate>
                                                         </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                                <%-- Topic GridView Ends--%>
                                            </asp:Panel>
                                            <%--Panel Of Topic Gridview Ends Here--%>
                                        </ItemTemplate>
                                         <EditItemTemplate>
                                            <asp:TextBox ID="Chapter_NumberTxt" Text='<%# Eval("Chapter_Number") %>' runat="server" CssClass="form-control" style="width:250px; height:35px; display:inline;color:red;"/>
                                         </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:RequiredFieldValidator ID="Chapter" ErrorMessage="*" ControlToValidate="txtNewChapterNumber" SetFocusOnError="true" ForeColor="Red" Display="Dynamic" runat="server"/>
                                            <asp:TextBox ID="txtNewChapterNumber" runat="server" BorderStyle="None" placeholder="Enter Chapter Number" CssClass="form-control" style="width:250px; height:35px; display:inline;color:red; font-family: 'Montserrat', sans-serif;"></asp:TextBox>
                                            <asp:ImageButton ImageUrl="Images/plus-icon-13071.png" CommandName="AddNew" CausesValidation="false" ToolTip="Add New Chapter" Width="25px" Height="25px" style="position:absolute; margin-top:5px; margin-left:10px;" runat="server"/>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" ItemStyle-CssClass="gridview-item" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                                    <ItemTemplate>
                                        <asp:ImageButton ImageUrl="Images/edit-icon-png-3598.png" CausesValidation="false" ToolTip="Edit" CommandName="Edit" Width="20px" Height="20px" runat="server"/>
                                        <asp:ImageButton ImageUrl="Images/DeleteDoc.png" CausesValidation="false" ToolTip="Delete" CommandName="Delete" Width="20px" Height="20px" runat="server"/>
                                    </ItemTemplate>
                                     <EditItemTemplate>
                                         <asp:ImageButton ImageUrl="Images/UpdateDoc.png" ToolTip="Update" CommandName="Update" CausesValidation="false" Width="20px" Height="20px" runat="server"/>
                                        <asp:ImageButton ImageUrl="Images/cancel.png" ToolTip="Cancel" CommandName="Cancel" CausesValidation="false" Width="20px" Height="20px" runat="server"/>
                                   </EditItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                         </asp:GridView>
                          <asp:HiddenField ID="hdn" runat="server"/>
                         <%-- Chapter GridView Ends--%>
                    </div>
                 </div>
        
             <div class="row">
                 <div class="col-md-12">
                      <asp:Label ID="Errorlbl" runat="server" />
                 </div>
            </div>
            </div>
         </div>
         <%--Collapse script Starts--%>
     <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        function StateCity(input) {
    // Get the hidden field value
            var previousStateId = $("#btnExpand").val();

    // Collapse the previously expanded grid, if any
    if (previousStateId && previousStateId !== input) {
        var previousIcon = "img" + previousStateId;
        $("#" + previousIcon).attr("src", "../Images/col2.jpg");
        $("#" + previousIcon).closest("tr").next().remove();
    }

    // Set the hidden field value to the current state_id
    $("#hdn").val(input);

    var displayIcon = "img" + input;

    // Check the current icon and toggle the city grid accordingly
    if ($("#" + displayIcon).attr("src") === "../image/col2.jpg") {
        // Append the city grid after the state row
        $("#" + displayIcon).closest("tr")
            .after("<tr><td></td><td colspan='100%'>" + $("#" + input).html() + "</td></tr>");
        $("#" + displayIcon).attr("src", "../Images/col11.jpg");
    } else {
        // Remove the city grid
        $("#" + displayIcon).closest("tr").next().remove();
        $("#" + displayIcon).attr("src", "../Images/col11.jpg");
        $("#hdn").val(""); // Clear the hidden field
    }
}
    </script>
<%--Collapse script Ends--%>
</asp:Content>
