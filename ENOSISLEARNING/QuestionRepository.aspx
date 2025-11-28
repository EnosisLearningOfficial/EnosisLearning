<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="QuestionRepository.aspx.cs" Inherits="ENOSISLEARNING.QuestionRepository" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

        *
        {
            font-family: 'Montserrat', sans-serif;
        }
        .container-fluid {
            width:95%;
        }

        /*.form-group {
            margin-bottom: 15px;
        }*/

        @media screen and (min-width: 768px) {
            .container-fluid {
                flex-direction: row;
                justify-content: space-between;
            }
            .form-group {
                width: 30%; /* Adjust width as needed */
            }
        }
        .btn
        {
            margin-top:3px;
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
    text-align:justify;
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
    margin-top: 20px;
    border-color:white;
}
.pager2 {
    text-align: left;
    margin-top: 20px;
    border-color:white;
}

.pager .pagination-group {
    display: inline-block;
}
.pager2 .pagination-group {
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
.pager2 a,
.pager2 span {
    padding: 4px 7px;
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
    padding: 7px;
    background-color: #d9534f;
    border-color: #d9534f;
    color: white;
    margin-top:-1px;
}

.pager a:hover,
.pager a:active,
.pager span.current {
    background-color: #d9454f;
    border-color: #d9534f;
}
.pager2 a:hover,
.pager2 a:active,
.pager2 span.current {
    background-color: #d9454f;
    border-color: #d9534f;
}
.pager span {
    cursor: default;
}
.pager2 span {
    cursor: default;
}
.import
{
    background-color:#153448;
    width:100%;
}
.form-control
{
    border:none;
}
.custom-select 
{
   width:100%;
   font-size: 14px;
   height: 35px;
   background-color:transparent;
   margin-left:-20px;
}
.form-control
 {
    border: 1px solid transparent;
    border-radius: 5px;
    font-size: 12px;
    font-weight:500;
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
 .Ptext
 {
     color:green;
     font-size:12px;
     margin-top:-5px;
 }

    </style>
   
 <script type="text/javascript">
     function openModal() {
         $("#myModal").modal('show');
     }
 </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="container-fluid">
           <asp:HiddenField ID="hfModalState" runat="server" />
                <div id="myModal" class="modal fade" tabindex="-1"  role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <asp:UpdatePanel ID="upModalContent" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                            <div class="modal-header">
                              <asp:DropDownList ID="LogTopicDrp" runat="server" OnSelectedIndexChanged="LogTopicDrp_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" style="width:150px;">
                              </asp:DropDownList>
                            </div>
                            <div class="modal-body">
                                <asp:GridView ID="LogGrv" runat="server" AutoGenerateColumns="false" BorderStyle="None" CssClass="table table-borderless gridview-table" FooterStyle-CssClass="footer" PageSize="5" AllowPaging="true" PagerStyle-CssClass="pager2" OnPageIndexChanging="LogGrv_PageIndexChanging">
                                    <Columns>
                                        <asp:TemplateField  HeaderText="Sr. No" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                                            <ItemTemplate>
                                                 <p class="list" style="text-align:center;"> <%#Container.DataItemIndex+1 %>.</p>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                     <Columns>
                                         <asp:TemplateField HeaderText="File Name" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-HorizontalAlign="Center">
                                              <ItemTemplate>
                                                  <asp:Label ID="FileNamelbl" Text='<%#Eval("FileName") %>' runat="server" CssClass="gridview-item" style="text-align:center;"/>
                                              </ItemTemplate>
                                         </asp:TemplateField>
                                    </Columns>
                                    <Columns>
                                         <asp:TemplateField HeaderText="Date & Time" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-HorizontalAlign="Center">
                                              <ItemTemplate>
                                                  <asp:Label ID="UploadDatelbl" Text='<%#Eval("UploadDateTime") %>' runat="server" CssClass="gridview-item" style="text-align:justify;"/>
                                              </ItemTemplate>
                                         </asp:TemplateField>
                                    </Columns>
                                    <Columns>
                                         <asp:TemplateField HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                                             <ItemTemplate>
                                                 <asp:ImageButton ID="LogDeleteBtn" ImageUrl="~/Images/DeleteDoc.png" CommandName="Delete" CommandArgument='<%# Container.DataItemIndex %>' runat="server" ToolTip="Delete" Width="20px" Height="20px" CausesValidation="false" OnClientClick="return confirmAction();"/>
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
                                    </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="LogTopicDrp" EventName="SelectedIndexChanged" />
                                </Triggers>
                                </asp:UpdatePanel>
                    </div>
                <div class="clearfix"></div>
            </div>
        </div>
            <div class="row">
                <div class="import">
                     <div class="col-sm-3 col-md-3">
                          <asp:DropDownList ID="TopicDrp" runat="server" CssClass="form-control custom-select"></asp:DropDownList>
                     </div>
                      <div class="col-sm-3 col-md-3">
                          <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control custom-select" onchange="showProgress()"/>
                      </div>
                      <div class="col-sm-3 col-md-3">
                          <asp:Button ID="BtnExport" runat="server" Text="Import Questions" CssClass="btn btn-primary" OnClick="BtnExport_Click" OnClientClick="return uploadFile();"/>
                      </div>
                </div>
            </div>
             <div id="progressContainer" class="form-group" style="display:none;">
                 <progress id="progressBar" max="100" value="0"></progress>
                 <span id="progressText" class="Ptext">0%</span>
             </div>
            <div class="row">
                <div class="col-md-3">
                     <asp:DropDownList ID="FilterDrp" runat="server" CssClass="form-control custom-select" OnSelectedIndexChanged="FilterDrp_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                </div>
                <div class="col-md-3">
                     <asp:DropDownList ID="FileDrp" runat="server" CssClass="form-control custom-select"></asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <asp:Button ID="Button1" runat="server" Text="Search Questions" CssClass="btn btn-danger" OnClick="Button1_Click"/>
                </div>
            </div>
                <div class="row" style="margin-top: 5px;">
    <div class="col-md-12">
        <div class="gridview-area">
            <asp:GridView ID="QuestionGrv"  AutoGenerateColumns="false" DataKeyNames="QuestionID"  AllowPaging="true" PageSize="5" OnPageIndexChanging="QuestionGrv_PageIndexChanging" OnRowDeleting="QuestionGrv_RowDeleting"  BorderStyle="None" CssClass="table table-borderless gridview-table" FooterStyle-CssClass="footer" PagerStyle-CssClass="pager" runat="server">
               <Columns>
                   <asp:TemplateField HeaderText="Sr. No" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                         <ItemTemplate>
                             <p class="list"> <%#Container.DataItemIndex+1 %>.</p>
                         </ItemTemplate>
                   </asp:TemplateField>
               </Columns>
                <Columns>
                    <asp:TemplateField HeaderText="Question" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                         <ItemTemplate>
                             <asp:Label ID="QuestionLbl" Text='<%#Eval("QuestionText") %>' runat="server" CssClass="gridview-item"/>
                         </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <Columns>
                    <asp:TemplateField HeaderText="A" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                         <ItemTemplate>
                             <asp:Label ID="OptionALbl" Text='<%#Eval("OptionA") %>' runat="server" CssClass="gridview-item"/>
                         </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <Columns>
                    <asp:TemplateField HeaderText="B" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                         <ItemTemplate>
                             <asp:Label ID="OptionBLbl" Text='<%#Eval("OptionB") %>' runat="server" CssClass="gridview-item"/>
                         </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <Columns>
                    <asp:TemplateField HeaderText="C" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                         <ItemTemplate>
                             <asp:Label ID="OptionCLbl" Text='<%#Eval("OptionC") %>' runat="server" CssClass="gridview-item"/>
                         </ItemTemplate>
                   </asp:TemplateField>
                </Columns>
                <Columns>
                     <asp:TemplateField HeaderText="D" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                         <ItemTemplate>
                             <asp:Label ID="OptionDLbl" Text='<%#Eval("OptionD") %>' runat="server" CssClass="gridview-item"/>
                         </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <Columns>
                     <asp:TemplateField HeaderText="Answer" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                         <ItemTemplate>
                             <asp:Label ID="CorrectanswerLbl" Text='<%#Eval("CorrectAnswer") %>' runat="server" CssClass="gridview-item"/>
                         </ItemTemplate>
                     </asp:TemplateField>
                </Columns>
                <Columns>
                     <asp:TemplateField HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                         <ItemTemplate>
                             <asp:ImageButton ID="DeleteBtn" ImageUrl="~/Images/DeleteDoc.png" CommandName="Delete" CommandArgument='<%# Container.DataItemIndex %>' runat="server" ToolTip="Delete" Width="20px" Height="20px" CausesValidation="false" OnClientClick="return confirmAction();"/>
                         </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerTemplate>
                    <asp:LinkButton ID="lbtnFirst" runat="server" CommandName="Page" CommandArgument="First">First</asp:LinkButton>
                    <asp:LinkButton ID="lbtnprev" runat="server" CommandName="Page" CommandArgument="Prev">Prev</asp:LinkButton>
                    <asp:LinkButton ID="lbtnnext" runat="server" CommandName="Page" CommandArgument="Next">Next</asp:LinkButton>
                    <asp:LinkButton ID="lbtnlast" runat="server" CommandName="Page" CommandArgument="Last">Last</asp:LinkButton>
                   <a id="btnRDemo" href="#" class="btn btn-primary" data-toggle="modal" data-target="#myModal" target="_parent">View Log Details</a>
                </PagerTemplate>
            </asp:GridView>
        </div>
    </div>
</div>
</div>
            <asp:Label ID="lblmsg" runat="server" />

    <script>
        function showProgress() {
            var progressContainer = document.getElementById('progressContainer');
            progressContainer.style.display = 'block';
        }

        function uploadFile() {
            var fileInput = document.getElementById('<%= fileUpload.ClientID %>');
            var file = fileInput.files[0];
            if (!file) {
                alert('Please select a file.');
                return false;
            }

            var fileSize = file.size; // Get the file size in bytes

            // Estimate the time it takes to upload the file (e.g., 1 second per 100 KB)
            var uploadTimeInSeconds = Math.ceil(fileSize / (1000 * 1024)); // Assuming 100 KB per second

            // Update the progress bar every second based on the estimated upload time
            var percent = 0;
            var interval = setInterval(function () {
                percent += 5; // Increase the progress by 1% every second
                updateProgressBar(percent);
                if (percent >= 100) {
                    clearInterval(interval); // Stop the interval when the upload is complete
                }
            }, uploadTimeInSeconds * 1000); // Convert upload time to milliseconds

            return true; // Return true to allow the onclick event to continue
        }

        function updateProgressBar(percent) {
            var progressBar = document.getElementById('progressBar');
            var progressText = document.getElementById('progressText');
            progressBar.value = percent;
            progressText.textContent = percent.toFixed(0) + '% Completed';
        }
    </script>
     <script>
         function confirmAction() {
             var result = confirm("Are you sure you want to Delete?");
             if (result) {
                 return true;
             } else {
                 return false;
             }
         }

         function deleteItem() {
             var confirmed = confirmAction();
             if (confirmed) {
                 console.log("Item deleted.");
             } else {
                 console.log("Deletion cancelled.");
             }
         }
     </script>
      <script type="text/javascript">
          Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
              $("#myModal").modal('show');
        });
      </script>

</asp:Content>


