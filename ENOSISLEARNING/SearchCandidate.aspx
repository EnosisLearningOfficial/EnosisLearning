<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="SearchCandidate.aspx.cs" Inherits="ENOSISLEARNING.SearchCandidate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <%-- Bootstrap JS --%>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#myModal").modal('hide');
            $("#myfooter").modal('hide');
            $("#myadmissions").modal('hide');

            $('#ContentPlaceHolder1_btnAJava').click(function () {
                alert('show');
                $("#dialog-detail").dialog('open');
            });
            $("#dialog-detail1").dialog({
                title: 'Fill User Details',
                autoOpen: false,
                resizable: false,
                width: 400,
                modal: true,
                show: { effect: 'drop', direction: "up" },
                draggable: true,
                beforeclose: function (event) {
                    if (!confirm("Close dialog ?")) return false;
                },

                open: function (event, ui) {


                    // $(".ui-dialog-titlebar-close").hide();
                },
                buttons: {
                    "OK": function () {
                        $(this).dialog("close");

                    },
                    "Cancel": function () {
                        $(this).dialog("close");
                    }
                }
            });



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

        function popup() {

            $("#EmailModal").modal('show');
        }


    </script>
    <script>
        document.getElementById("uploadBtn").onchange = function () {
            document.getElementById("uploadFile").value = this.value;
        };
    </script>
    <style>
         .modalBackground{
             background: #00000087;
         }
         .popupheading
         {
             color: white;
             background: navy;
             padding: 5px 30px;
         }
         .modalPopup
         {
             padding:10px;
             width:40%;
             background:white;
         }
             .modalPopup table tr td
             {
                 padding:10px;

             }
             .modalPopup input
             {
                 width:100%;
             }

        .iconstyle
        {
            background: #173151;
    color: white;
    font-size: 19px;
        margin-bottom: 7px;
            margin-right: 20px;
        }
        .datafield
        {
            padding-left:2px;
        }

@media (max-width:766px)
{
    .col-md-1,.col-md-2
    {
        width:30% !important;
        margin-bottom:2px;
    }
}
        *
        {
          font-family: 'Montserrat', sans-serif;
        } 
        .container
        {
          width:95%;
          height:100%;
          border:1px solid transparent;
        }
        .inline-div 
        {
            display: inline-block;
            width: 9.5%;
            height: 30px;
            background-color: #f2f2f2;
            border: 1px solid transparent;
            border-radius:5px;
            text-align: center;
            vertical-align: top;
            line-height: 50px; /* Centers the text vertically */
        }
        .search-bar
        {
            margin-top:5px;
            margin-left:0%;
        }
        .btn
        {
            color:white;
            text-align:center;
            vertical-align: top;
            line-height: 15px; /* Centers the text vertically */
            border-radius:5px;
            background-color:#1d96b2;
            transition: all 0.3s ease;
        }
        .btn:hover
        {
            background-color:tomato;
            transform: scale(1.1);
            color:white;
        }
        .form-control
        {
            height:35px;
            border-radius:5px;
        }
        .Filter-info
        {
            margin-top:10px;
            margin-left:0%;
        }
        .Filter-info-items-1
        {
            display: inline-block;
            width: 10%;
            height: 30px;
            border: 1px solid transparent;
            border-radius:5px;
            text-align:center;
            vertical-align: top;
            line-height: 22px; /* Centers the text vertically */
        }
        .Filter-info-items-2
        {
            display: inline-block;
            width: 24%;
            height: 30px;
            border: 1px solid transparent;
            border-radius:5px;
            text-align:center;
            vertical-align: top;
            line-height: 22px; /* Centers the text vertically */
        }
        .Filter-info-items-3
        {
            display: inline-block;
            width: 25%;
            height: 30px;
            border: 1px solid transparent;
            border-radius:5px;
            text-align:center;
            vertical-align: top;
            line-height: 22px; /* Centers the text vertically */
        }
        .Filter-info-items-4
        {
            display: inline-block;
            width: 25%;
            height: 30px;
            border: 1px solid transparent;
            position:relative;
            margin-left:5px;
        }
        #btnRDemo
        {
            height:30px;
            border-radius:5px;
            text-align:center;
            position:absolute;
        }
        .bx-send
        {
           color:white;
           position:absolute;
           left:0.5px;
        }
        .bx-send:hover
        {
            color:white;
        }
@media (max-width:766px)
{
    .col-md-1,.col-md-2
    {
        width:30% !important;
        margin-bottom:2px;
    }
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
.inline-item-2 {
    width: 100%;
    margin-top:10px;
    background-color: transparent;
    display: flex;
    align-items: center;
    justify-content: flex-start;
    flex-wrap: wrap; /* allow wrapping properly */
    gap: 20px;       /* even spacing between items */
    row-gap: 12px;   /* extra vertical spacing */
}

.inline-item-2 .items {
    margin: 0 !important;     /* override inline margin-left */
    width: auto !important;   /* override inline width */
    display: flex;
    align-items: center;
}

.inline-item-2 .items button {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 6px; /* spacing between icon and text */
    font-size: 10px;
    font-weight: normal;
    padding: 4px 10px;
    white-space: nowrap; /* keep text in one line */
}

.image-item {
    width: 16px;
    height: 16px;
    vertical-align: middle;
}


.image-item {
    width: 16px;
    height: 16px;
    vertical-align: middle;
}

.items
{   
    width:20%;
    height:100%;
    background-color:transparent;
    font-size:12px;
    font-weight:normal;
    margin-left:8px;
}
.btn-primary
{
   
    height:30px;
    border-radius:5px;
    text-align:center;
    position:relative;
    padding:5px 10px;
}
.image-item
{
    width:25px;
    height:25px;
    position:absolute;
    left:0px;
    top:1px;
}
.resume
{
    color:black;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div id="dialog-detail1" style="display: none">
        <h1>welcome to enosis</h1>
    </div>

   <div id="myModal3" class="modal fade" tabindex="-1"  role="dialog">
<div class="modal-dialog">
<div class="modal-content">
     <div class="modal-header" style="background-color:transparent;">
   <h5 class="modal-title display-5 text-primary" id="myModallabel">Add Candidate</h5>
   <button type="button" class="close" data-dismiss="modal" aria-label="Close">
     <span aria-hidden="true" style="color:red;">&times;</span>
   </button>
 </div>
<div class="modal-body">
<div class="form-horizontal">
    <!-- Full Name -->
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label" for="txtUserName">Full Name:</label>
                    <div class="col-sm-9">
                        <div class="input-group">
                            
                            <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server" placeholder="Full Name" style="width:420px;border-radius:5px;"/>
                            <asp:RequiredFieldValidator ErrorMessage="*" ControlToValidate="txtUserName" runat="server" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"/>
                        </div>
                    </div>
                </div>

                <!-- Email ID -->
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label" for="txtEmailId">Email ID:</label>
                    <div class="col-sm-9">
                        <div class="input-group">                
                            <asp:TextBox ID="txtEmailId" CssClass="form-control" runat="server" placeholder="Email ID" style="width:420px;border-radius:5px;"/>
                             <asp:RequiredFieldValidator ErrorMessage="*" ControlToValidate="txtEmailId" runat="server" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"/>
                        </div>
                    </div>
                </div>
                <!-- DOB -->
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label" for="txtEmailId">DOB:</label>
                    <div class="col-sm-9">
                        <div class="input-group">                
                            <asp:TextBox ID="txtDob" CssClass="form-control" runat="server" TextMode="Date" style="width:420px;border-radius:5px;"/>
                             <asp:RequiredFieldValidator ErrorMessage="*" ControlToValidate="txtDob" runat="server" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"/>
                        </div>
                    </div>
                </div>

                <!-- Mobile -->
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label" for="txtMobile">Mobile:</label>
                    <div class="col-sm-9">
                        <div class="input-group">
                            <asp:TextBox ID="txtMobile" CssClass="form-control" runat="server" placeholder="Mobile" style="width:420px;border-radius:5px;"/>
                            <asp:RequiredFieldValidator ErrorMessage="*" ControlToValidate="txtMobile" runat="server" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"/>
                        </div>
                    </div>
                </div>

                <!-- Course -->
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label" for="drpDCourse1">Course:</label>
                    <div class="col-sm-9">
                        <asp:DropDownList CssClass="form-control" ID="drpDCourse1" runat="server">
                            <asp:ListItem Value="0">Select Course</asp:ListItem>
                            
                        </asp:DropDownList>
                    </div>
                </div>

                <!-- Fees -->
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label" for="txtFees">Fees:</label>
                    <div class="col-sm-9">
                        <asp:TextBox ID="txtFees" CssClass="form-control" runat="server" placeholder="Fees" />
                         <asp:RequiredFieldValidator ErrorMessage="*" ControlToValidate="txtFees" runat="server" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"/>
                    </div>
                </div>

                <!-- Qualification -->
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label" for="drpRQualifications">Qualification:</label>
                    <div class="col-sm-9">
                        <asp:DropDownList CssClass="form-control" ID="drpRQualifications" runat="server">
                            <asp:ListItem Value="0">Select Qualification</asp:ListItem>
                           
                        </asp:DropDownList>
                    </div>
                </div>

                <!-- Counsellor -->
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label" for="drpCounsellor1">Counsellor:</label>
                    <div class="col-sm-9">
                        <asp:DropDownList CssClass="form-control" ID="drpCounsellor1" runat="server">
                            <asp:ListItem Value="0">Select Counsellor</asp:ListItem>
                            <asp:ListItem Value="DILLIP">DILLIP</asp:ListItem>
                            <asp:ListItem Value="DIPALI">DIPALI</asp:ListItem>
                            <asp:ListItem Value="SHRUTI">SHRUTI</asp:ListItem>
                            <asp:ListItem Value="SHRADHA">SHRADHA</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
    <div class="card-footer text-end" style="float:right">
            <asp:Button ID="btnSAVE" Text="SAVE" runat="server" OnClick="btnSAVE_Click" CssClass="btn btn-primary" />
        </div>
</div>
    </div>
    </div>
<div class="clearfix"></div>
</div>
</div>

    <div id="#myadmissions" class="modal fade" tabindex="-1" role="dialog">
        <%-- <asp:GridView ID="grvCounsellorCandidates" runat="server" >
                    <Columns>
                                  <asp:BoundField DataField="CANDIDATE_CODE" HeaderText="RegNo"   />
                                  <asp:BoundField DataField="FULLNAME" HeaderText="Name"  />
                    </Columns>
              </asp:GridView>--%>
    </div>
    <div id="dialog-detail" style="display:none;">
        <asp:GridView ID="grvCounsellorCandidates" AutoGenerateColumns="false" runat="server"  BorderStyle="None" AlternatingRowStyle-BackColor="white"  AlternatingRowStyle-ForeColor="white" CssClass="table table-hover table-borderless gridview-table" FooterStyle-CssClass="footer" FooterStyle-BorderColor="White">
            <Columns>
                <asp:BoundField DataField="CANDIDATE_CODE" HeaderText="RegNo" FooterStyle-BorderColor="White"/>
                <asp:BoundField DataField="FULLNAME" HeaderText="Name" FooterStyle-BorderColor="White"/>
            </Columns>
        </asp:GridView>
    </div>
     <div class="container">
    <div class="search-bar">
         <div class="inline-div">
             <asp:TextBox ID="txtRegNo" runat="server" CssClass="form-control" placeholder="RegNo"/>
         </div>
         <div class="inline-div">
              <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Name" />
         </div>
         <div class="inline-div">
             <asp:DropDownList AppendDataBoundItems="true" Height="35px"  CssClass="form-control" ID="drpEducation" runat="server">
                 <asp:ListItem Value="0" Text="Education"></asp:ListItem>
             </asp:DropDownList>
         </div>
         <div class="inline-div">
             <asp:DropDownList AppendDataBoundItems="true" Height="35px"  CssClass="form-control" ID="drpExperience" runat="server">
                  <asp:ListItem Value="-1" Text="Experience" />
                  <asp:ListItem Value="0" Text="Fresher" />
             </asp:DropDownList>
         </div>
         <div class="inline-div">
             <asp:DropDownList AppendDataBoundItems="true" Height="35px"  CssClass="form-control datafield" ID="drpYearPassing" runat="server">
                 <asp:ListItem Value="0" Text="Passing Year" />
             </asp:DropDownList>
         </div>
         <div class="inline-div">
             <asp:DropDownList AppendDataBoundItems="true" Height="35px"  CssClass="form-control datafield" ID="drpYear" runat="server">
                 <asp:ListItem Value="-1" Text="Year" />
             </asp:DropDownList> 
         </div>
         <div class="inline-div">
               <asp:DropDownList AppendDataBoundItems="true" Height="35px"  CssClass="form-control datafield" ID="drpMonth" runat="server">
                        <asp:ListItem Value="-1" Text="Month" />
                        <asp:ListItem Value="1" Text="JAN" />
                        <asp:ListItem Value="2" Text="FEB" />
                        <asp:ListItem Value="3" Text="MAR" />
                        <asp:ListItem Value="4" Text="APR" />
                        <asp:ListItem Value="5" Text="MAY" />
                        <asp:ListItem Value="6" Text="JUN" />
                        <asp:ListItem Value="7" Text="JUL" />
                        <asp:ListItem Value="8" Text="AUG" />
                        <asp:ListItem Value="9" Text="SEP" />
                        <asp:ListItem Value="10" Text="OCT" />
                        <asp:ListItem Value="11" Text="NOV" />
                        <asp:ListItem Value="12" Text="DEC" />
               </asp:DropDownList>
         </div>
         <div class="inline-div">
             <asp:DropDownList AppendDataBoundItems="true" Height="35px"  CssClass="form-control datafield" ID="drpCourses" runat="server">
                <asp:ListItem Value="0" Text="Courses"></asp:ListItem>
             </asp:DropDownList>
         </div>
         <div class="inline-div">
             <asp:TextBox ID="txtSkills" runat="server" Height="35px"  CssClass="form-control datafield" placeholder="Enter Your Skills" />
         </div>
         <div class="inline-div">
                <asp:Button ID="btnSearch" CssClass="form-control btn" Text="Search" OnClick="btnSearch_Click" runat="server" CausesValidation="false"/>
         </div>
    </div>
     <div class="Filter-info">
         <div class="Filter-info-items-1">
              <label class="radio-inline"><asp:RadioButton ID="chkAll" runat="server" Text="" GroupName="filter1" />All Candidates</label>
         </div>
         <div class="Filter-info-items-2">
             <label class="radio-inline"><asp:RadioButton ID="chkPlacement" runat="server" GroupName="filter1" />Filter Candidates Requires Placement</label>
         </div>
         <div class="Filter-info-items-3">
              <label class="radio-inline">Total Number of Candidates Selected = 5</label>
         </div>
         <div class="Filter-info-items-4">
             <a id="btnRDemo" href="#" class="btn btn-primary" data-toggle="modal" data-target="#myModal3" target="_parent"><span class="bx bx-send"></span>&nbsp;&nbsp;&nbsp;ADD STUDENTS</a>
             <asp:Label ID="lblError" BackColor="Yellow" ForeColor="Black" runat="server" />
         </div>
     </div>
    <div class=" gridview-area">
        <asp:GridView ID="grvCandidatesDetail" AutoGenerateColumns="false" runat="server"
            DataKeyNames="CANDIDATE_CODE" EmptyDataText="No records has been added."
            AllowPaging="true" PageSize="8" PagerSettings-Mode="NumericFirstLast" Font-Size="Small" OnRowDataBound="GridView1_RowDataBound" 
            PagerStyle-HorizontalAlign="Right" PagerSettings-FirstPageText="First"
            PagerSettings-LastPageText="Last" Visible="true"
             OnPageIndexChanging="OnPaging" OnRowCommand="grvCandidatesDetail_RowCommand"  BorderStyle="None" AlternatingRowStyle-BackColor="white"  AlternatingRowStyle-ForeColor="black" CssClass="table table-hover table-borderless gridview-table" FooterStyle-CssClass="footer">
            <PagerStyle HorizontalAlign="Right" ForeColor="Black" BorderColor="White"/>

            <Columns>

                <asp:HyperLinkField DataTextField="CANDIDATE_CODE" ControlStyle-CssClass="CANDIDATE_CODE" ItemStyle-ForeColor="Black" ControlStyle-ForeColor="Black" DataNavigateUrlFields="CANDIDATE_CODE" DataNavigateUrlFormatString="~/CandidatesReportCard.aspx?Id={0}" HeaderText="RegNo"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None"/>

                <%--<asp:BoundField DataField="CANDIDATE_CODE" HeaderText="RegNo"   />--%>
                <asp:BoundField DataField="FULLNAME" ItemStyle-CssClass="FULLNAME" HeaderText="Name"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None"/>
                <asp:BoundField DataField="GENDER" HeaderText="Gender"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None"/>
                <asp:BoundField DataField="DOB" HeaderText="DOB"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None"/>
                <asp:BoundField DataField="MOBILENO" HeaderText="MobileNo"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None"/>
                <asp:BoundField DataField="EMAIL" ItemStyle-CssClass="email" HeaderText="EmailId"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None"/>
                <asp:BoundField DataField="COURSENAME" ItemStyle-CssClass="COURSENAME" HeaderText="Courses"   HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None"/>
                <asp:BoundField DataField="SKILLS" Visible="false" HeaderText="Skills"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None"/>


                <asp:BoundField DataField="QUALIFICATION" Visible="false" HeaderText="Qualification"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None"/>
                <asp:BoundField DataField="YEARSEXPERIENCE" Visible="false" HeaderText="Experience"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None"/>
                <asp:BoundField DataField="COMPANYNAME" ItemStyle-ForeColor="Black" HeaderText="Company"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None"/>

               <%-- <asp:HyperLinkField ItemStyle-ForeColor="Black" DataTextField="RESUME" HeaderText="Resume"
                    DataNavigateUrlFields="RESUME" DataNavigateUrlFormatString="http://docs.google.com/gview?url=http://www.enosislearning.com//Resumes/{0}" Target="_blank" />--%>
                  <asp:TemplateField HeaderText="Resume"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-CssClass="resume">
            <ItemTemplate>
                <asp:LinkButton ID="lnkDownload" Text ='<%# Eval("RESUME") %>' CommandArgument = '<%# Eval("RESUME") %>' runat="server" OnClick="lnkDownload_Click" style="color:black;" CausesValidation="false"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>

                <asp:BoundField DataField="CAN_TYPE" HeaderText="TYPE"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None"/>
                <asp:TemplateField HeaderText="Edit"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                    <ItemTemplate>
                        <asp:ImageButton ID="btnEdit" runat="server" CausesValidation="false" ToolTip="Edit"
                            CommandName="EDIT" Text="Edit" widht="30" Height="30" ImageUrl="~/img/edit.png" />

                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Notify"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                    <ItemTemplate>
                   
                        <asp:ImageButton ID="btnEmail" runat="server" CausesValidation="false"
                             Text="EMAIL" Width="20" Height="20" ToolTip="Email" ImageUrl="~/img/email.png" />

                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Fees"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                    <ItemTemplate>
                        <asp:ImageButton ID="btnFees" runat="server" CausesValidation="false"
                            CommandName="FEES" Text="Fees" ToolTip="Fees" ImageUrl="~/img/fees.png" Width="20" Height="20" />

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="De Activate"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                    <ItemTemplate>
                        <asp:ImageButton ID="btnDeActivate" runat="server" CausesValidation="false"
                            CommandName="DEACTIVATE" Text="DeActivate" ToolTip="Deactivate" ImageUrl="~/img/deactive.png" Width="20" Height="20" />

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Upgrade"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                    <ItemTemplate>
                        <asp:ImageButton ID="btnUpgrade" runat="server" CausesValidation="false" Width="30" Height="30"
                            CommandName="UPGRADE" Text="Upgrade" ToolTip="Upgrade" ImageUrl="/img/upgrade.png" />

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Assessments"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                    <ItemTemplate>
                        <asp:ImageButton ID="btnAssessments" runat="server" CausesValidation="false"
                            CommandName="ASSESSMENTS" Text="Assessments" ToolTip="Assessments" ImageUrl="~/img/Assessent.png" Width="20" Height="20" />

                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Genrate Certificate"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                                        <ItemTemplate>
                                   
                                            <asp:ImageButton ID="btncertificate" runat="server"  CausesValidation="false" 
                                              Text="Certificate" ToolTip="Certificate" ImageUrl="~/img/certificate_icon.png"  Width="20" Height="20" />
                                            <asp:LinkButton ID="lblviewcertificate" ForeColor="Red" runat="server" OnClick="lblviewcertificate_Click" Text="View" Visible='<%# (Eval("Certificate_Status").ToString() != "0" && Eval("Certificate_Status").ToString() != "") ? true : false %>'   />
                                             
                                           </ItemTemplate>
                                   </asp:TemplateField>
                     <asp:TemplateField HeaderText="Registration Form"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                                        <ItemTemplate>
                                             <asp:ImageButton ID="btnviewregform" runat="server"  CausesValidation="false" 
                                            Visible='<%# (Eval("Registration_status").ToString() != "0" && Eval("Registration_status").ToString() != "") ? true : false%>'   Text="Registration Form" OnClick="btnviewregform_Click" ToolTip="Registration From" ImageUrl="img/results.png"  Width="20" Height="20" />

                                             
                                           </ItemTemplate>
                                   </asp:TemplateField>
            </Columns>
        </asp:GridView>
</div>
        <div class="col-md-12">
        <div id="EmailModal" class="container-fluid" style="display: none">
  
                        <div class="form-horizontal">
                            <div class="form-group">
    
                                <div class="col-xs-12">
                                    <asp:TextBox ID="ToEmail" runat="server" placeholder="Mail To" CssClass="form-control my-form-control emailid"  />

                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-12">
                                    <asp:TextBox ID="Subjects" runat="server" placeholder="Subject" CssClass="form-control my-form-control" />


                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-12">
                                    <asp:TextBox ID="Body" runat="server" placeholder="Enter Body" TextMode="MultiLine"  CssClass="form-control my-form-control" />

                                </div>
                            </div>


                            <div class="form-group">
                                <div class="col-xs-12">

                                    <asp:FileUpload ID="fattach" runat="server" placeholder="Attachment" CssClass="form-control my-form-control" />
                                    <asp:HyperLink ID="hykResume" runat="server" CssClass="file-upl" />

                                </div>
                            </div>

                        </div>
                  
                        <asp:Button runat="server" ID="SubEmail" Text="Send" class="btn btn-danger" OnClick="btnEmail_Click" />
                        <button type="button" id="btnclose1" class="btn btn-orange " data-dismiss="modal">Cancel</button>
            </div>
            </div>
        <div class="clearfix"></div>
    <div class="col-md-12">
        <div id="divcertificate" class="container-fluid" style="display: none">
  
                        <div class="form-horizontal">
                      
                            <div class="form-group">
                                    <div class="col-xs-12">
              
                                      <asp:HiddenField ID="hdcand_id" runat="server" />    
                                    </div>
                            </div>
                            <div class="form-group">
    
                                <div class="col-xs-12">
                                    <asp:TextBox ID="lblsname" placeholder="Student Name" CssClass="form-control my-form-control"   runat="server"></asp:TextBox>


                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-12">
                                    

                                    <asp:Textbox ID="txtcourse"  placeholder="Course" CssClass="form-control my-form-control"    runat="server"></asp:Textbox>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-12">
                                   
                                    <asp:TextBox ID="txtsdate"  runat="server" placeholder="Start Date" CssClass="form-control my-form-control" ></asp:TextBox>

                 </div>
                            </div>
                             <div class="form-group">
                                <div class="col-xs-12">
                                   
                                    <asp:TextBox ID="txtedate"  runat="server" placeholder="End Date" CssClass="form-control my-form-control" ></asp:TextBox>
                            
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-12">
                    <asp:Textbox ID="txtgrade" placeholder="Grade"  runat="server" CssClass="form-control my-form-control"  ></asp:Textbox>
   

                                </div>
                            </div>

                        </div>
                   <asp:Button ID="btngenrate" runat="server" Text="Generate Certificate"   OnClick="btngenrate_Click" CssClass="btn btn-danger" />
                        
                        <button type="button" id="btnclose" class="btn btn-orange " data-dismiss="modal">Cancel</button>
            </div> 
            </div>
         <div class="inline-item-2">
             <div class="items">
               <button runat="server" color="#BFCFFF"    id="btnExcel" style="" class="btn btn-primary" onserverclick="btnExcel_Click" causesvalidation="false">
                    <i>
                        <img src="Images/icon/excel.png" class="image-item"/></i><span style="font-size: 8px; font-weight:normal;"> Export All Candidates</span>
              </button>
           </div>
           <div class="items">
               <button runat="server" color="#BFCFFF" id="btnSearchedExcel" class="btn btn-primary" onserverclick="btnSearchedExcel_Click" causesvalidation="false">
                    <i>
                        <img src="Images/icon/excel.png" class="image-item"/></i><span style="font-size: 10px;font-weight:normal;"> Export Candidates</span>
               </button>
            </div>
          <div class="items">
            <button runat="server" id="btnSearchedResumes" class="btn btn-primary" onserverclick="btnSearchedResumes_Click" causesvalidation="false">
                <i>
                    <img src="img/resume.png" class="image-item" /></i><span style="font-size: 10px; font-weight:normal;"> DownLoad Resumes</span>
            </button>
        </div>
       <div class="items">
         <button runat="server" id="btnPrint" class="btn btn-primary" onserverclick="btnprint_Click" causesvalidation="false">
             <i>
                 <img src="img/print1.png" class="image-item"/></i><span style="font-size: 10px;font-weight:normal;"> Print</span>
         </button>
      </div>
      <div class="items">
        <button runat="server" id="btnAdmissionAnalysis" class="btn btn-primary" onserverclick="btnAdmissionAnalysis_Click" causesvalidation="false">
            <i>
                <img src="img/admission.png" class="image-item"/></i><span style="font-size: 10px; font-weight:normal;"> Admission Analysis</span>
        </button>
     </div>
    <div class="items">
         <button runat="server" id="btnFacultyAssessments" class="btn btn-primary" onserverclick="btnFacultyAssessments_Click" causesvalidation="false">
             <i>
                 <img src="img/faculty1.png" class="image-item"/></i><span style="font-size: 10px; font-weight:normal;"> Faculty Assessments</span>
         </button>
    </div>
    <div class="items">
        <button runat="server" id="btnStudentsResults" class="btn btn-primary" onserverclick="btnStudentsResults_Click" causesvalidation="false">
            <i>
                <img src="img/results.png" class="image-item"/></i><span style="font-size: 10px; font-weight:normal;"> Student Results</span>
        </button>
    </div>
    <div class="items">
        <button runat="server" id="btnPendingFees" class="btn btn-primary" onserverclick="btnPendingFees_Click" style="width:150px;" causesvalidation="false">
            <i>
                <img src="img/fees.png" class="image-item"/></i><span style="font-size: 10px;font-weight:normal;"> Fees Collected</span>
        </button>
    </div>
         </div>
         </div>

         <script src="Scripts/ajax-libs-jquery-1.7.2-jquery.min.js"></script>
    <script src="Scripts/ajax-jquery.ui-1.8.9-query-ui.js"></script>
    <link href="Scripts/ajax-jquery.ui-1.8.9-themes-start-jquery-ui.css" rel="stylesheet" />
    <script type="text/javascript">
        $("[id*=btnModalPopup]").live("click", function () {
            $("#btngenrate").click(function () {

                $.ajax({

                    type: "POST",

                    url: "SearchCandidate.aspx/btngenrate_Click",

                    contentType: "application/json; charset=utf-8",
                    dataType: "Json",
                    success: function (response) {

                        alert("AJAX call Successfully");

                    },

                });

            });
            $("#modal_dialog").dialog({
                title: "Certificate Details",
                buttons: {
                    Close: function () {
                        $(this).dialog('close');
                    }
                },
                modal: true
            });
            return false;

            // Basic example
            $(document).ready(function () {
                $('#grvCandidatesDetail').DataTable({
                    "pagingType": "simple" // "simple" option for 'Previous' and 'Next' buttons only
                });
                $('.dataTables_length').addClass('bs-select');
            });
        });
    </script>
    <script type="text/javascript" src="./assets/scripts/main.js"></script>
   


<script type="text/javascript">
    $("[id*=btnEmail]").live("click", function () {
      
        var emailid = $(".email", $(this).closest("tr")).html();
        $("#<%=ToEmail.ClientID%>").val(emailid);
 
        $("#EmailModal").dialog({

            title: "Enter Send Email Details",
            height: 400,
            width: 500,

            modal: true,
            open: function (type, data) {
                $(this).parent().appendTo("form");
            }
        });
        return false;
    });
    $("#btnclose1").bind("click", function (event) {
        $("#EmailModal").dialog("close");

    });

    $("[id*=btncertificate]").live("click", function () {

        var cand_id = $(".CANDIDATE_CODE", $(this).closest("tr")).html();

        var name = $(".FULLNAME", $(this).closest("tr")).html();
        var course = $(".COURSENAME", $(this).closest("tr")).html();
      
        $("#<%=hdcand_id.ClientID%>").val(cand_id);
        $("#<%=lblsname.ClientID%>").val(name);
        $("#<%=txtcourse.ClientID%>").val(course);
        $("#divcertificate").dialog({

            title: "Enter Certificate Details",
            height: 550,
            width: 500,
           
            modal: true,
            open: function (type, data) {
                $(this).parent().appendTo("form");
            }
           
        });


            $("#btnclose").bind("click", function (event) {
                $("#divcertificate").dialog("close");

        });

    
        return false;
    });

    $("#<%=txtsdate.ClientID%>").datepicker({
        dateFormat: 'dd/mm/yy',
        changeMonth: true,
        changeYear: true,
        yearRange: '1950:2100'

    });
    $("#<%=txtedate.ClientID%>").datepicker({
        dateFormat: 'dd/mm/yy',
        changeMonth: true,
        changeYear: true,
        yearRange: '1950:2100'

    });
    $("[id*=btngenrate]").live("click", function () {
        var sdate = $("#<%=txtsdate.ClientID%>").val();
        var edate = $("#<%=txtedate.ClientID%>").val();
       
        var grade = $("#<%=txtgrade.ClientID%>").val();
        var TodayDate = new Date();
      
        if (edate == '' || sdate == '' || grade=='') {
            alert("Please enter all the details");
            return false;
        }
        edate = new Date(edate);
        sdate = new Date(sdate);
        if (edate < sdate) {
            alert("End Date Must be greater than Start Date");
            return false;
        }
        return true;
     
    });
</script>
   
    <script src="Scripts/ajax-jquery.ui-1.8.9-jquery-ui.js"></script>
</asp:Content>
