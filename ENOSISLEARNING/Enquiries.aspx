<%@ Page Title="" Language="C#" MasterPageFile="~/NewMyAdmin.Master" AutoEventWireup="true" CodeBehind="Enquiries.aspx.cs" Inherits="ENOSISLEARNING.NewEnquiries" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
      *
      {
          font-family: 'Montserrat', sans-serif;
          box-sizing:border-box;
      }
       .menu2 {
     width: 100%;
     height: 50px;
     margin: auto;
      margin-top: -20px;
     background-color: #ffffff;
     display: flex;
     border: 1px solid white;
     border-radius: 20px;
     font-family: 'Montserrat', sans-serif;
 }

 .Simage {
     width: 50px;
     height: 100%;
     background-color: white;
     border-radius: 50%;
 }

 .Coursedrp {
     width: 100px;
     height: 100%;
     background-color: white;
 }

 .Cdrp {
     width: 100%;
     height: 50%;
     font-size: 15px;
     margin: 10px 0px 0px 12px;
     background-color: white;
     border: none;
 }

     .Cdrp option {
         background-color: transparent;
         color: #333;
         padding: 8px;
         font-size: 12px;
         text-align:center;
     }

 .Coursedrp2 {
     width: 130px;
     height: 100%;
     background-color: transparent;
 }

 .Cdrp2 {
     width: 100%;
     height: 50%;
     font-size: 15px;
     margin: 10px 0px 0px 12px;
     background-color: transparent;
     border: none;
 }

     .Cdrp2 option {
         background-color: transparent;
         color: #333;
         padding: 8px;
         font-size: 12px;
         text-align:center;
     }

 .separater {
     width: 50px;
     height: 100%;
     background-color: transparent;
     font-size: 20px;
     padding: 6px 0px 0px 24px;
     font-weight: lighter;
 }

 .Cdrp:focus {
     border: none;
 }

 .Cdrp2:focus {
     border: none;
 }

 .Cdrp3:focus {
     border-color: transparent;
     border: none;
 }

 .Coursedrp3:focus {
     border: none;
 }

 .Coursedrp3 {
     width: 135px;
     height: 100%;
     background-color: transparent;
 }

 .Cdrp3 {
     width: 100%;
     height: 50%;
     font-size: 15px;
     margin: 10px 0px 0px 12px;
     background-color: transparent;
     border: none;
     border-color: transparent;
 }

 .button {
     width: 25%;
     height: 100%;
     margin: 6px 0px 0px 15px;
     margin-left: 25px;
 }

 .btn-custom {
     width: 45%;
     height: 35px;
     display: inline-block;
     padding: 2px 0px;
     text-decoration: none;
     color: #fff;
     background-color: #1d96b2;
     border-radius: 15px;
     transition: all 0.3s ease;
 }

 .btn-custom2 {
     width: 15%;
     height: 30px;
     margin: -5% 0px 0px 8px;
     display: inline-block;
     padding: 2px 0px;
     text-decoration: none;
     color: #fff;
     background-color: #1d96b2;
     border-radius: 5px;
     transition: all 0.3s ease;
 }
 .bb
 {
     padding:0px 15px 2px 0px;
 }
 .nav-link {
    border-radius: 50px;
    padding: 8px 20px;
    margin-right:0px;
    font-weight: 500;
    color: #333;
    background-color: #f8f9fa;
    border: 1px solid #ddd;
    transition: all 0.3s ease;
    border-radius:0px;
}

.nav-link:hover {
    background-color: #e9ecef;
    color: #000;
}

.nav-link.active {
    background-color: #1d96b2;
    color: #fff;
    border: 1px solid #1d96b2;
    box-shadow: 0 2px 6px rgba(0,0,0,0.2);
}

.modal-header h5
{
    color:white;
}
.close
{
    color:black;
}
      .bb
     {
         padding:0px 3px 2px 0px;
         font-size:0.925rem;
         position: relative;
         top: -1px;
     }
         /* Overall table styles */
    table.dataTable {
        border-collapse: collapse !important;
        width: 1060px;
        cursor:default;
    }

    /* Table header */
    table.dataTable thead th {
        background-color: #1d96b2;
        color: white;
        font-size: 11px;
        text-align: center;
        font-weight: bold;
        padding: 6px;
    }

    /* Table body */
    table.dataTable tbody td {
        background-color: #FFF;
        padding: 6px;
        font-size: 11px;
        text-align: center;
        color:#333;
    }
  /* Comments column truncate */
.comment-col {
    max-width: 100px;       
    white-space: nowrap;     
    overflow: hidden;        
    text-overflow: ellipsis; 
}

    /* Set white background color for the first column (body cells) */
table.dataTable td:first-child {
    background-color: #ffffff !important; 
}

    /* Alternating row colors for better readability */
    table.dataTable tbody tr:nth-child(even) {
        background-color: #f1f1f1;
    }

    table.dataTable tbody tr:nth-child(odd) {
        background-color: #f1f1f1;
    }

    /* Hover effect for rows */
    table.dataTable tbody tr:hover {
        background-color: #f1f1f1;
    }

    /* Styling pagination controls */
    .dataTables_wrapper  {
      /*  background-color: #f1f1f1;*/
        color: white;
        border: none;
        padding: 8px 15px;
        margin: 0 5px;
        font-size: 14px;
        border-radius: 5px;
        cursor: pointer;
        color:black;
    }

    .dataTables_filter input {
        padding: 8px;
        font-size: 14px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    table.dataTable {
        border: 1px solid #ddd;
        border-radius: 8px;
    }

    .table-responsive {
        margin-top: 30px;
        overflow-x: auto;
    }

    .table-responsive table {
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }
    .tab
    {
        margin-top:-10px;
    }
    .mt-2 .form-control
    {
        height:35px;
        padding:6px 12px;
        font-size:13px;
    }
    .modal-header
    {
        height:60px;
    }
    .modal-title
    {
        font-size:24px;
       
    }
    .btn-outline-primary.active {
    background-color: #0d6efd;
    color: white;
}
.chat-box {
  background: #f7f9fc;
  border: 1px solid #ddd;
  border-radius: 10px;
  padding: 8px;
  height: 300px;
  overflow-y: auto;
  display: flex;
  flex-direction: column;
  gap: 4px; 
}

/* message bubble */
.chat-message {
   width:75%;
  align-self: flex-start; 
  background: #D9FDD3;
  color: #856404;
  border: 1px solid #ffeeba;
  padding: 5px 10px;
  border-radius: 10px;
  font-size: 12px;
  margin: 4px 0;
  text-align: left;
  line-height: 1.2;
}

/* time below each message */
.chat-message .time {
  display: block;
  font-size: 10px;
  color: #666;
  text-align: center;
  margin-top: 2px;
}

/* Left (other) messages */
.chat-message.left {
  align-self: flex-start;
  background: #e5e5ea;
  border-radius: 10px 10px 10px 3px; 
  margin-left: -10px;
}

/* Right (current user) messages */
.chat-message.right {
  align-self: flex-end;
  background: #d1f1d6;
  border-radius: 10px 10px 3px 10px;
  margin-right: 0; 
}

/* Initial comment (system message) */
.initial-comment {
  align-self: flex-start; 
  background: #fff3cd;
  color: #856404;
  border: 1px solid #ffeeba;
  padding: 5px 10px;
  border-radius: 10px;
  font-size: 12px;
  margin: 4px 0;
  text-align: center;
  line-height: 1.2;
}

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <asp:ScriptManager runat="server" EnablePageMethods="true" />
<!-- Chat Modal -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="chatModalLabel">
  <div class="modal-dialog modal-md modal-dialog-centered" role="document">
    <div class="modal-content shadow-md rounded-3 border-0">
      <!-- Modal Header -->
      <div class="modal-header bg-primary text-white" style="border-radius:0px;">
        <h5 class="modal-title mb-0" id="chatModalLabel">💬 Chat Messages</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
        </button>
      </div>
        <!-- Modal Body -->
<div class="modal-body p-4">
  <!-- Chat Display Area -->
<!-- Chat Display Area -->
<input type="hidden" id="hdnCurrentUser" value="<%= Session["FULLNAME"] %>" />
<div id="chatContainer" class="chat-box mb-3"></div>
  <!-- Reply Section -->
    <div class="d-flex" style="gap:10px;">    
    <!-- Reply Box -->
        <div class="flex-grow-1">
            <textarea id="txtReply" class="form-control" rows="3" placeholder="Write your reply..."></textarea>
            <input type="hidden" id="hdnEnquiryId" />
        </div>
    <!-- Buttons Section -->
    <div class="d-flex flex-column justify-content-between">
          <asp:DropDownList ID="ChatStatusDrp" CssClass="form-select mb-2"  runat="server" ClientIDMode="Static">
            <asp:ListItem Text="NEW" />
            <asp:ListItem Text="INTERESTED" />
            <asp:ListItem Text="NOT INTERESTED" />
            <asp:ListItem Text="HOLD" />
            <asp:ListItem Text="JOINED" />
            <asp:ListItem Text="CLOSED" />                
        </asp:DropDownList>
        <input type="date" id="NEXTENQDATE" class="form-control my-form-control" />
        <button type="button" id="btnSendReply" class="btn btn-success btn-sm mt-2">SEND</button>
    </div>
  </div>
</div>
    </div>
  </div>
</div>
 <%--Chat popup moal --%>  
        <%-- Add Modal --%>  
<div id="myModal" class="modal fade" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color:dodgerblue;">
        <h5 class="modal-title display-5 text-light" id="myModallabel">Add Enquiry</h5>
        <button type="button" class="btn-close text-danger" data-bs-dismiss="modal" aria-label="Close">
        </button>
      </div>
     <!-- Modal Body -->
        <div class="modal-body">
            <div class="row">
                <!-- First Column -->
                 <input type="hidden" id="EnquiryId"/>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtName">Full Name</label>
                        <input type="text" id="txtUserName" class="form-control" placeholder="Full Name" />
                    </div>
                    <div class="form-group mt-2">
                        <label for="txtCourse">Course</label>
                        <asp:DropDownList ID="drpDCourse"  runat="server" CssClass="form-select"></asp:DropDownList>
                    </div>
                    <div class="form-group mt-2">
                        <label for="txtAssigned">Assigned To</label>
                        <asp:DropDownList ID="drpPAssigned" CssClass="form-select" runat="server" ClientIDMode="Static"></asp:DropDownList>
                    </div>
                </div>

                <!-- Second Column -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtUpdate">Email Id</label>
                        <input type="text" id="TextBox1" class="form-control" placeholder="Email Id" />
                    </div>
                    <div class="form-group mt-2">
                        <label for="txtMobile">Status</label>
                        <asp:DropDownList ID="drpPStatus" CssClass="form-select"  runat="server" ClientIDMode="Static">
                            <asp:ListItem Text="NEW" />
                            <asp:ListItem Text="INTERESTED" />
                            <asp:ListItem Text="NOT INTERESTED" />
                            <asp:ListItem Text="HOLD" />
                            <asp:ListItem Text="JOINED" />
                            <asp:ListItem Text="CLOSED" />                
                        </asp:DropDownList>
                    </div>
                    <div class="form-group mt-2">
                        <label for="txtStatus">Source</label>
                        <asp:DropDownList ID="drpPSource" CssClass="form-select" runat="server" ClientIDMode="Static">
                            <asp:ListItem Text="WEBSITE" />
                            <asp:ListItem Text="PHONE" />
                            <asp:ListItem Text="WALKIN" />
                            <asp:ListItem Text="JUSTDIAL" />
                            <asp:ListItem Text="URBANPRO" />
                            <asp:ListItem Text="OTHERS" />
                            <asp:ListItem Text="Sulekha" />
                            <asp:ListItem Value="" Text="" /> 
                        </asp:DropDownList>
                    </div>
                </div>

                <!-- Third Column -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtEmail">Mobile</label>
                        <input type="text" id="txtUserContactNo" class="form-control" placeholder="Mobile Number" />
                    </div>
                    <div class="form-group mt-2">
                        <label for="txtCourse">Mode</label>
                        <select id="drpTMode" class="form-select">
                            <option>CLASSROOM</option>
                            <option>ONLINE</option>
                        </select>
                    </div>
                    <div class="form-group mt-2">
                        <label for="txtMode">FollowUp Date:</label>
                        <input type="date" id="clnFNEXTENQDATE" class="form-control my-form-control" />
                    </div>
                </div>
                
                <!-- Comment Section -->
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="txtComment">Comment</label>
                        <textarea id="TextBox12" class="form-control" rows="4" ></textarea>
                    </div>
                </div>
            </div>
        </div>

      <div class="modal-footer">
        <button id="btnSave" type="button" class="btn btn-success" onclick="addEnquiry()">Add Enquiry</button>
      <button id="btnUpdateEnquiry" type="button" class="btn btn-warning" onclick="updateEnquiry()" style="display:none;">
    Update Enquiry
</button>
      </div>
    </div>
  </div>
</div>
        <%-- Add Modal --%>
       <%-- Search Menu --%>
     <div class="menu2">
       <%-- Search Iamage --%>
       <div class="Simage"><i class="fa-solid fa-magnifying-glass" style="font-size : 25px;color:#767c8d;padding:12px 0px 0px 12px;"></i></div>
       <%-- Search Iamage --%>
       <%-- Course Drp --%>
        <div class="Coursedrp">
        <asp:DropDownList ID="drpcourses" AppendDataBoundItems="true" runat="server"  CssClass="Cdrp">
              <asp:ListItem Value="0" Text="Course"></asp:ListItem>
        </asp:DropDownList>
       </div>
       <%-- Course Drp --%>
        <%-- Separater --%>
        <div class="separater">|</div>
        <%-- Separater --%>
       <%-- Mode Drp --%>
       <div class="Coursedrp">
           <asp:DropDownList AppendDataBoundItems="true"  ID="drpmode" CssClass="Cdrp" runat="server">
                  <asp:ListItem Value="0" Text="Mode"></asp:ListItem>
                  <asp:ListItem Text="CLASSROOM" />
                  <asp:ListItem Text="ONLINE" />   
           </asp:DropDownList>
       </div>
       <%-- Mode Drp --%>
        <%-- Separater --%>
        <div class="separater">|</div>
        <%-- Separater --%>
       <%-- Status Drp --%>
        <div class="Coursedrp">
            <asp:DropDownList CssClass="Cdrp"  AppendDataBoundItems="true"   ID="drpstatus" runat="server">
               <asp:ListItem  Value="Status" Text="Status" />
               <asp:ListItem Text="NEW" />
               <asp:ListItem Text="INTERESTED" />
               <asp:ListItem Text="NOT INTERESTED" />
               <asp:ListItem Text="HOLD" />
               <asp:ListItem Text="JOINED" />
               <asp:ListItem Text="CLOSED" />
            </asp:DropDownList>
        </div>
       <%-- Status Drp --%>
       <%-- Separater --%>
       <div class="separater">|</div>
       <%-- Separater --%>
       <%-- Assigned Drp --%>
       <div class="Coursedrp2">
       <asp:DropDownList CssClass="Cdrp2" AppendDataBoundItems="true"   ID="drpAssigned" runat="server" >
           <asp:ListItem Value="0" Text="Assigned To" /> 
           <%--         <asp:ListItem Text="DIPALI" />
               <asp:ListItem Text="DILLIP" />
                     <asp:ListItem Text="SHRUTI" />--%>                 
          <%--<asp:ListItem Value="DBDev" Text="Database/BI Developer" />--%>
       </asp:DropDownList>
       </div>
       <%-- Assigned Drp --%>
        <%-- Separater --%>
        <div class="separater">|</div>
        <%-- Separater --%>
       <%-- Source Drp --%>
        <div class="Coursedrp">
            <asp:DropDownList CssClass="Cdrp" AppendDataBoundItems="true"   ID="drpsource" runat="server">
               <asp:ListItem Value="0" Text="Source" /> 
               <asp:ListItem Text="WEBSITE" />
               <asp:ListItem Text="PHONE" />
               <asp:ListItem Text="WALKIN" />
               <asp:ListItem Text="JUSTDIAL" />
               <asp:ListItem Text="URBANPRO" />
               <asp:ListItem Text="OTHERS" />
            </asp:DropDownList>
        </div>
       <%-- Source Drp --%>
        <%-- Separater --%>
        <div class="separater">|</div>
        <%-- Separater --%>
        <%-- Name Txt --%>
        <div class="Coursedrp3">
           <asp:TextBox ID="txtName" CssClass="Cdrp3" runat="server" placeholder="Student Name"/>
        </div>
        <%-- Name Txt --%>
       <%-- Buttons --%>
       <div class="button">
   <asp:Button ID="btnSearch" Text="Search" runat="server" CssClass="btn btn-custom"></asp:Button>
  <a id="btnRDemo" href="#" 
           class="btn btn-custom" 
           data-bs-toggle="modal" 
           data-bs-target="#myModal">
           <span class="fa fa-send"></span>&nbsp;Add Enquiry
        </a>
</div>
</div>
       <%-- Buttons --%>
   <div class="container mt-2">
    <!-- Tabs -->
    <ul class="nav nav-pills mb-3" id="filterTabs">
        <li class="nav-item">
            <button type="button" class="nav-link active" data-filter="All"  onclick="applyFilter('All')" style="padding:8px;border-radius:0px;">All</button>
        </li>
        <li class="nav-item">
            <button type="button" class="nav-link" data-filter="Hold" onclick="applyFilter('Hold')" style="padding:8px;border-radius:0px;">Hold</button>
        </li>
        <li class="nav-item">
            <button type="button" class="nav-link" data-filter="Not Interested" onclick="applyFilter('Not Interested')" style="padding:8px;border-radius:0px;">Not Interested</button>
        </li>
        <li class="nav-item">
            <button type="reset" class="nav-link fa-reset" data-filter="Reset" onclick="applyFilter('All')" style="padding:8px;border-radius:0px;">
                <i class="fa fa-undo text-success"></i> 
            </button>
        </li>
    </ul>

    <!-- Enquiry Table -->
   <div class="table-responsive mb-4 tab">
    <table id="tblEnquiries" class="table  table-borderless nowrap" style="width:100%">
        <thead>
            <tr>
                <th>Date</th>
                <th>Updated By</th>
                <th>Name</th>
                <th>Mobile</th>
                <th>Email</th>
                <th>Course</th>
                <th>Status</th>
                <th>Mode</th>
                <th>Assigned To</th>
                <th>Source</th>
                <th>Next Eq. Date</th>
                <th>Comments</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody></tbody>
    </table>
</div>
      <asp:Button ID="btnFollowUp" Text="TODAY FOLLOW UP" runat="server" 
CssClass="btn btn-custom2" style="margin-left:20px;" ></asp:Button>
      <a href="EnquiryAnalysis.aspx" class="btn btn-custom2">Enquiry Analysis</a>
</div>
<%-- GridView--%>
<!-- jQuery (must be first) -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- Bootstrap Bundle (with Popper) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- DataTables -->
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
<%-- Add --%>
<script type="text/javascript">
     var currentFilter = "All";
     function addEnquiry() {
         if ($('#txtUserName').val() != "" &&
             $('#<%= drpDCourse.ClientID %>').val() != "" &&
             $('#TextBox1').val() != "" &&
             $('#txtUserContactNo').val() != "" &&
             $('#TextBox12').val() != "") {

             var name = $('#txtUserName').val();
             var course = $('#<%= drpDCourse.ClientID %>').val();
             var assigned = $('#<%= drpPAssigned.ClientID %>').val();
            var email = $('#TextBox1').val();
            var status = $('#<%= drpPStatus.ClientID %>').val();
            var source = $('#<%= drpPSource.ClientID %>').val();
            var mobile = $('#txtUserContactNo').val();
            var mode = $('#drpTMode').val();
            var followUpDate = $('#clnFNEXTENQDATE').val();
            var comment = $('#TextBox12').val();

            $.ajax({
                type: "POST",
                url: "Enquiries.aspx/AddEnquiry",
                data: JSON.stringify({
                    name: name,
                    course: course,
                    assigned: assigned,
                    email: email,
                    status: status,
                    source: source,
                    mobile: mobile,
                    mode: mode,
                    followUpDate: followUpDate,
                    comment: comment
                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d) {
                        alert("Enquiry added successfully!");
                       
                        // Clear fields
                        $('#txtUserName').val("");
                        $('#drpDCourse').val("");
                        $('#<%= drpPAssigned.ClientID %>').val("");
                        $('#TextBox1').val("");
                        $('#<%= drpPStatus.ClientID %>').val("");
                        $('#<%= drpPSource.ClientID %>').val("");
                        $('#txtUserContactNo').val("");
                        $('#drpTMode').val("");
                        $('#clnFNEXTENQDATE').val("");
                        $('#TextBox12').val("");
                        $("#myModal").modal('hide');
                        $(".modal-backdrop").remove(); // remove fade background
                        $("body").removeClass("modal-open"); // scroll lock remove karega
                        $("body").css("padding-right", ""); // layout restore
                        // ✅ Reload table
                        $('#tblEnquiries').DataTable().ajax.reload(null, false);
                    } else {
                        alert("Failed to add enquiry.");
                    }
                },
                error: function (xhr, status, error) {
                    console.log(xhr.responseText);
                    alert("Error: " + xhr.responseText);
                }
            });
         } else {
             alert("Before Add Enquiry Please Fill Fields First.!");
         }
     }
</script>
<script type="text/javascript">
        // Edit button click
        $(document).on("click", ".edit-btn", function () {
            var id = $(this).data("id"); // enquiryId
            console.log("Selected EnquiryId:", id);

            $.ajax({
                type: "POST",
                url: "Enquiries.aspx/GetEnquiryById",
                data: JSON.stringify({ enquiryId: id }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (res) {
                    if (res.d) {
                        var data = res.d;

                        $("#txtUserName").val(data.NAME);
                        $('#<%= drpDCourse.ClientID %>').val(data.COURSENAME);
                        $("#drpPAssigned").val(data.ASSIGNEDTO);
                        $("#TextBox1").val(data.CONTACTEMAIL);
                        $("#drpPStatus").val(data.STATUS);
                        $("#drpPSource").val(data.SOURCE);
                        $("#txtUserContactNo").val(data.CONTACTMOBILENO);
                        $("#drpTMode").val(data.MODE);
                        $("#clnFNEXTENQDATE").val(data.NEXTENQDATE);
                        $("#TextBox12").val(data.COMMENTS);

                        // Modal title update
                        $("#myModallabel").text("Edit Enquiry");


                        $("#EnquiryId").val(id);

                        $('#btnSave').hide();
                        $('#btnUpdateEnquiry').show();

                        var modal = new bootstrap.Modal(document.getElementById('myModal'));
                        modal.show();
                    }
                },
                error: function (err) {
                    alert("Failed to load enquiry details.");
                }
            });
        });
</script>
<script>
       // Update button click
       $(document).on("click", "#btnUpdateEnquiry", function () {
           var enquiryId = $("#EnquiryId").val();
           console.log("Updating EnquiryId:", enquiryId);

           $.ajax({
               type: "POST",
               url: "Enquiries.aspx/UpdateEnquiry",
               data: JSON.stringify({
                   enquiryId: enquiryId,
                   name: $("#txtUserName").val(),
                   courseName:$('#<%= drpDCourse.ClientID %>').val(),
                   assignedTo: $("#<%= drpPAssigned.ClientID %>").val(),
                contactEmail: $("#TextBox1").val(),
                status: $("#<%= drpPStatus.ClientID %>").val(),
                source: $("#<%= drpPSource.ClientID %>").val(),
                contactMobileNo: $("#txtUserContactNo").val(),
                mode: $("#drpTMode").val(),
                nextEnqDate: $("#clnFNEXTENQDATE").val(),
                comments: $("#TextBox12").val()
            }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (res) {
                console.log("Response:", res);
                alert("Enquiry updated successfully!");
                location.reload();
            },
            error: function (err) {
                console.log("Error Response:", err.responseText);
                alert("Update failed!");
            }
        });
    });
   </script>
<script>
    // Delete button click
    $(document).on("click", ".delete-btn", function () {
        var enquiryId = $(this).data("id");
        if (!confirm("Are you sure you want to delete this enquiry?")) return;

        $.ajax({
            type: "POST",
            url: "Enquiries.aspx/DeleteEnquiry",
            data: JSON.stringify({ enquiryId: enquiryId }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (res) {
                if (res.d === "Success") {
                    alert("Enquiry deleted successfully!");
                    location.reload();
                } else {
                    alert("Delete failed!");
                }
            },
            error: function (err) {
                console.log("Error:", err.responseText);
                alert("Something went wrong!");
            }
        });
    });
</script>
    <%-- Data Table Initialization --%>
<script>
    $(document).ready(function () {
        // helper to check default dropdown values
        function isDefault(val) {
            return val === undefined || val === null || val === "" || val === "0";
        }

        var searchName = "";
        var firstLoad = true;
        var tabStatus = "ALL"; // ✅ nav-pills filter 

        // initialize DataTable
        var table = $('#tblEnquiries').DataTable({
            processing: true,
            serverSide: false,
            scrollX: true,
            responsive: true,
            paging: true,
            ordering: false,
            searching: true,
            lengthMenu: [[8, 10, 25, -1], [8, 10, 25, "All"]],
            autoWidth: false,
            ajax: {
                url: "Enquiries.aspx/GetEnquiries",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: function (d) {
                    var courseVal = $('#<%= drpcourses.ClientID %>').val();
                    var modeVal = $('#<%= drpmode.ClientID %>').val();
                    var statusVal = $('#<%= drpstatus.ClientID %>').val();
                    var assignedVal = $('#<%= drpAssigned.ClientID %>').val();
                    var sourceVal = $('#<%= drpsource.ClientID %>').val();

                    var anyDropdownSelected =
                        !isDefault(courseVal) ||
                        !isDefault(modeVal) ||
                        !isDefault(statusVal) ||
                        !isDefault(assignedVal) ||
                        !isDefault(sourceVal);

                    var payload = {
                        course: isDefault(courseVal) ? "" : courseVal,
                        mode: isDefault(modeVal) ? "" : modeVal,
                        assignTo: isDefault(assignedVal) ? "" : assignedVal,
                        source: isDefault(sourceVal) ? "" : sourceVal,
                        name: searchName || ""
                    };

                    // ✅ Status handling
                    if (firstLoad) {
                        payload.status = "ALL";
                        firstLoad = false;
                    }
                    else if (tabStatus && tabStatus !== "ALL") {
                        // ✅ Agar nav-pills use ho raha hai to wahi priority pe
                        payload.status = tabStatus;
                    }
                    else if (statusVal === "Status" || isDefault(statusVal)) {
                        payload.status = "ALL";
                    } else {
                        payload.status = statusVal;
                    }

                    console.log("Filters payload:", payload);
                    return JSON.stringify(payload);
                },
                dataSrc: function (json) {
                    if (!json) return [];
                    if (json.d && json.d.data) return json.d.data;
                    return json.d || [];
                }
            },
            columns: [
                { data: "CREATED_DATE" },
                { data: "UPDATEDBY" },
                { data: "NAME" },
                { data: "CONTACTMOBILENO" },
                { data: "CONTACTEMAIL" },
                { data: "COURSENAME" },
                { data: "STATUS" },
                { data: "MODE" },
                { data: "ASSIGNEDTO" },
                { data: "SOURCE" },
                { data: "NEXTENQDATE" },
                {
                    data: "COMMENTS",
                    render: function (data, type, row) {
                        if (!data) data = "View";
                        return `<a href="#" class="comment-link" data-bs-target="#myModal2" data-bs-toggle="modal" data-id="${row.ENQUIRYID}">${data}</a>`;
                    }
                },
                {
                    data: "ENQUIRYID",
                    render: function (data, type, row) {
                        return `
                            <a class="btn btn-sm btn-primary edit-btn" data-id="${row.ENQUIRYID}">
                                <i class="fa fa-edit"></i>
                            </a>
                            <a class="btn btn-sm btn-danger delete-btn" data-id="${row.ENQUIRYID}">
                                <i class="fa fa-trash"></i>
                            </a>
                        `;
                    }
                }
            ],
            columnDefs: [
                { targets: [1, 4, 11, 7], className: "comment-col" }
            ]
        });

        // ---- dropdown change handlers (Course -> Mode -> Status -> Assigned -> Source) ----
        $('#<%= drpcourses.ClientID %>').on('change', function () {
            table.ajax.reload(null, false);
        });

        $('#<%= drpmode.ClientID %>').on('change', function () {
            table.ajax.reload(null, false);
        });

       <%-- $('#<%= drpstatus.ClientID %>').on('change', function () {
            table.ajax.reload(null, false);
        });--%>
        $('#<%= drpstatus.ClientID %>').on('change', function () {
            tabStatus = null;  // ✅ nav-pill filter reset, ab dropdown ka value chalega
            table.ajax.reload(null, false);
        });

        $('#<%= drpAssigned.ClientID %>').on('change', function () {
            table.ajax.reload(null, false);
        });

        $('#<%= drpsource.ClientID %>').on('change', function () {
            table.ajax.reload(null, false);
        });

        // ---- Search button for Name (only when clicked) ----
        $('#<%= btnSearch.ClientID %>').on('click', function (e) {
            e.preventDefault();
            searchName = $('#<%= txtName.ClientID %>').val().trim();
            table.ajax.reload(null, false);
        });

        // optional: Enter key inside name textbox triggers the search button
        $('#<%= txtName.ClientID %>').on('keypress', function (e) {
            if (e.which === 13) {
                e.preventDefault();
                $('#<%= btnSearch.ClientID %>').click();
            }
        });

        // ✅ nav-pills filter function
        window.applyFilter = function (status) {
            if (status.toLowerCase() === "all" || status.toLowerCase() === "reset") {
                // ✅ Reset case: sab clear kar de
                tabStatus = "ALL";
                searchName = "";
                firstLoad = true;

                // Dropdowns reset
                $('#<%= drpcourses.ClientID %>').val("0");
        $('#<%= drpmode.ClientID %>').val("0");
        $('#<%= drpstatus.ClientID %>').val("Status"); // ya default option ka value
        $('#<%= drpAssigned.ClientID %>').val("0");
        $('#<%= drpsource.ClientID %>').val("0");

        // Search box clear
                $('#<%= txtName.ClientID %>').val("");

                // Pills active reset
                $("#filterTabs .nav-link").removeClass("active");
                $("#filterTabs .nav-link[data-filter='All']").addClass("active");
            } else {
                // ✅ Normal tab filter
                tabStatus = status;
                $("#filterTabs .nav-link").removeClass("active");
                $(`#filterTabs .nav-link[data-filter='${status}']`).addClass("active");
            }

            // Table reload
            table.ajax.reload(null, false);
        };

        // ✅ Comment link click handler
        $('#tblEnquiries').on('click', '.comment-link', function (e) {
            e.preventDefault();
            var enquiryId = $(this).data("id");
            console.log("Clicked Comment for Enquiry:", enquiryId);

            // fetch the main enquiry comment
            $.ajax({
                url: "Enquiries.aspx/GetInitialComment",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ enquiryId: enquiryId }),
                success: function (res1) {
                    var initialComment = res1.d || "No initial comment found.";

                    //  fetch chat messages
                    $.ajax({
                        url: "Enquiries.aspx/GetChatMessages",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify({ enquiryId: enquiryId }),
                        success: function (response) {
                            var messages = response.d || [];
                            var chatHtml = "";

                            //Initial comment (system message)
                            chatHtml += `<div class="initial-comment">${initialComment}</div>`;

                            // Chat messages
                            if (messages.length > 0) {
                                messages.forEach(function (msg) {
                                    const sender = msg.Sender || "Unknown";
                                    const time = msg.MessageTime || "";
                                    const text = msg.MessageText || "";

                                    // check if message is by logged-in user (right side)
                                    const currentUser = $("#hdnCurrentUser").val() || ""; //  hidden field 
                                    const alignment = sender === currentUser ? "right" : "left";

                                    chatHtml += `
              <div class="chat-message ${alignment}">
                <strong>${sender}</strong><br>
                ${text}
                <span class="time">${time}</span>
              </div>`;
                                });
                            } else {
                                chatHtml += `<div class="initial-comment">No chat messages yet.</div>`;
                            }

                            $("#chatContainer").html(chatHtml);
                            $("#hdnEnquiryId").val(enquiryId);
                            loadStatusAndNextDate(enquiryId);
                            $("#myModal2").modal("show");

                            // Auto-scroll to bottom
                            setTimeout(() => {
                                var chatBox = document.getElementById("chatContainer");
                                chatBox.scrollTop = chatBox.scrollHeight;
                            }, 300);
                        },
                        error: function (xhr, status, error) {
                            console.error("Error loading chat:", error);
                        }
                    });
                },
                error: function (xhr, status, error) {
                    console.error("Error loading initial comment:", error);
                }
            });
        });



        // ✅ Function to load Status & Next Enquiry Date
        function loadStatusAndNextDate(enquiryId) {
            $.ajax({
                url: "Enquiries.aspx/GetEnquiryById",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ enquiryId: enquiryId }),
                success: function (response) {
                    console.log("Enquiry details:", response.d);
                    if (response.d) {
                        $("#ChatStatusDrp").val(response.d.STATUS);
                        $("#NEXTENQDATE").val(response.d.NEXTENQDATE);
                    } else {
                        $("#ChatStatusDrp").val("");
                        $("#NEXTENQDATE").val("");
                    }
                },
                error: function (xhr, status, error) {
                    console.error("Error loading enquiry details:", error);
                }
            });
        }
        // ✅ Reply send click
        $("#btnSendReply").on("click", function () {
            var enquiryId = $("#hdnEnquiryId").val();
            var message = $("#txtReply").val().trim();
            var status = $("#ChatStatusDrp").val();
            var nextEnqDate = $("#NEXTENQDATE").val();

            if (!message) {
                alert("Please enter a reply message.");
                return;
            }

            $.ajax({
                url: "Enquiries.aspx/SaveReply",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({
                    enquiryId: parseInt(enquiryId),
                    message: message,
                    status: status,
                    nextEnqDate: nextEnqDate
                }),
                success: function (response) {
                    alert(response.d);

                    // clear reply box
                    $("#txtReply").val("");

                    //reload chat after sending
                    loadChatMessages(enquiryId);

                    //reload DataTable so latest comment reflects
                    $('#tblEnquiries').DataTable().ajax.reload(null, false);
                    $("#myModal2").modal('hide');
                    $(".modal-backdrop").remove(); 
                },
                error: function (xhr, status, error) {
                    console.error("Error sending reply:", error);
                }
            });
        });


        // ✅ Chat reload function
        function loadChatMessages(enquiryId) {
            $.ajax({
                url: "Enquiries.aspx/GetChatMessages",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ enquiryId: enquiryId }),
                success: function (response) {
                    var messages = response.d || [];
                    var chatText = "";

                    if (messages.length > 0) {
                        messages.forEach(function (msg) {
                            chatText += `${msg.Sender} (${msg.MessageTime}):\n${msg.MessageText}\n\n`;
                        });
                    } else {
                        chatText = "No messages yet.";
                    }

                    $("#txtChatBox").val(chatText);
                }
            });
        }
    });
    $(document).ready(function () {
        $("#myModal").on("hidden.bs.modal", function () {
            // Textboxes clear
            $("#txtUserName").val("");
            $("#TextBox1").val("");
            $("#txtUserContactNo").val("");
            $("#TextBox12").val("");

            // Dropdowns reset
            $("#drpDCourse").val("");
            $("#drpPAssigned").val("");
            $("#drpPStatus").val("");
            $("#drpPSource").val("");
            $("#drpTMode").val("");

            // Date reset
            $("#clnFNEXTENQDATE").val("");

            // Hidden fields clear
            $("#EnquiryId").val("");

            // Buttons reset (Add mode)
            $('#btnSave').show();
            $('#btnUpdateEnquiry').hide();

            // Modal title reset
            $("#myModallabel").text("Add Enquiry");
        });
    });
</script>
</asp:Content>
