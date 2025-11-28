<%@ Page Title="" Language="C#" MasterPageFile="~/NewMyAdmin.Master" AutoEventWireup="true" CodeBehind="BatchInfoDetails.aspx.cs" Inherits="ENOSISLEARNING.BatchInfoDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Tagify CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
    <style>
           *
           {
               font-family: 'Montserrat', sans-serif;
           }
            .batch-info-card {
            background-color: transparent;
            padding: 5px;
            text-align:center;
            margin-left:30px;
    }
    .info-value {
        font-size: 1rem;
        font-weight: 500;
        color: #333;
    }

    .info-icon{
        font-size: 1rem;
        color: #0d6efd;
        margin-right: 10px;
    }

   .batch-top-info {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(80px, 0.2fr));
    gap: 10px;
    align-items: center;
}

    .info-item {
        display: flex;
        align-items: center;
        background: #f8f9fa;
        border-radius: 5px;
        padding: 5px;
        font-size:1rem;
        transition: 0.2s;
        text-align:center;
    }

    .info-item:hover {
        background: #eef4ff;
    }
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
        .modal-header
        {
            height:60px;
        }
        .modal-title
        {
            font-size:24px;
   
        }
        .custom-modal-header
{
    border-radius:0px;
    background-color:dodgerblue;
}
.custom-modal-content {
  display: flex;
  flex-direction: column;
  height: 500px; /* Fixed height to show scroll */
  max-width: 400px;
}

.custom-modal-body {
  flex-grow: 1;
  display: flex;
  flex-direction: column;
  padding: 0.5rem 1rem;
  background-color: #f7f7f7;
  overflow-y:hidden;
}
#chatMessages p {
  margin: 5px 0;
  padding:0;
  border-radius: 15px;
  max-width: 75%;
  word-wrap: break-word;
}

/* Styling messages differently by sender - example */
.message-user {
  background-color: #d1e7dd;  /* light green */
  align-self: flex-end;
  text-align: right;
}

.message-student {
  background-color: #f8d7da;  /* light red */
  align-self: flex-start;
  text-align: left;
}

#chatMessages {
        background-color: #f9f9f9;
        border-radius: 8px;
        padding: 10px;
        font-size: 14px;
    }
/* Chat area container */
#chatMessages {
    max-height: 400px;
    overflow-y: auto;
    padding: 10px;
    background: #f9f9f9;
    border: 1px solid #ccc;
    border-radius: 10px;
}

/* Each chat bubble */
.chat-bubble {
    max-width: 80%;
    margin-bottom: 12px;
    padding: 10px 15px;
    border-radius: 15px;
    position: relative;
    word-wrap: break-word;
    background-color: #e4f1ff;
    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
}

/* Sender name */
.chat-bubble .sender {
    font-weight: 600;
    margin-bottom: 4px;
    color: #0056b3;
}

/* Timestamp */
.chat-bubble .timestamp {
    font-size: 0.75rem;
    color: gray;
    position: absolute;
    bottom: 5px;
    right: 10px;
}

/* Chat attachment link */
.chat-bubble a {
    color: #007bff;
    text-decoration: underline;
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container-fluid mt-2">
 <asp:ScriptManager runat="server"></asp:ScriptManager>
      <%-- Add Modal --%>  
<div id="myBatchSheetModal" class="modal fade" tabindex="-1">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">

      <div class="modal-header bg-primary">
        <h5 class="modal-title text-light">Fill Details</h5>
        <button class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body">
        <div class="container-fluid">

          <div class="row mb-3">
            <div class="col-md-6">
              <label>Date</label>
              <input type="date" id="txtDate" class="form-control" />
            </div>

            <div class="col-md-6">
              <label>Chapter</label>
              <asp:DropDownList ID="drpChapter" runat="server" CssClass="form-select" ClientIDMode="Static"></asp:DropDownList>
            </div>
          </div>

          <div class="row mb-3">
            <div class="col-md-8">
              <label>Topic Covered</label>
              <input type="text" id="txtTopic" class="form-control" />
            </div>

            <div class="col-md-4">
              <label>Attach File</label>
              <div id="currentFileLabel" class="mb-1 text-info" style="font-size:13px; display:none;"></div>
              <input type="file" id="fileUpload" class="form-control" />
            </div>
          </div>

          <div class="row mb-3">
            <div class="col-md-12">
              <label>Comments</label>
              <textarea id="txtComment" class="form-control" rows="3"></textarea>
            </div>
          </div>

        </div>
      </div>

      <div class="modal-footer">
        <input type="hidden" id="HiddenBatchSheetID" />
        <input type="hidden" id="HiddenExistingFile" />
        <input type="hidden" id="HiddenBatchId" />

        <button id="btnSave" type="button" class="btn btn-success" onclick="addBatchSheet();">Add</button>
        <button id="btnUpdateBatch" type="button" class="btn btn-warning" style="display:none;">Update</button>
      </div>

    </div>
  </div>
</div>
    <%-- Add Modal --%>
    <%-- Chat Popup Modal --%>
   <!-- Hidden field to store enquiry ID -->
<!-- Hidden field to store enquiry ID -->
<asp:HiddenField ID="HiddenField2" runat="server" ClientIDMode="Static" />

<!-- CHAT MODAL -->
<div class="modal fade" id="myChatModal" tabindex="-1" role="dialog" aria-labelledby="chatModalLabel">
  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
    <div class="modal-content shadow-md rounded-3 border-0">

      <!-- HEADER -->
      <div class="modal-header bg-primary text-white" style="background-color:dodgerblue;">
        <h5 class="modal-title" id="chatModalLabel">💬 Chat Messages</h5>
        <button type="button" class="close" data-bs-dismiss="modal" style="width:20px;background-color:transparent;border:none;">
          <span style="font-size:30px;color:white;">&times;</span>
        </button>
      </div>

      <!-- BODY -->
      <div class="modal-body p-4">

        <!-- MESSAGES AREA -->
        <div id="chatMessages" class="form-control mb-3"
             style="height: 300px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; background:#f9f9f9;">
        </div>

        <!-- REPLY INPUT -->
        <asp:TextBox ID="txtReply" runat="server" CssClass="form-control mb-3"
                     TextMode="MultiLine" Rows="2"
                     placeholder="Type your reply..."
                     Style="resize:none;border-radius:10px;">
        </asp:TextBox>

        <!-- FILE UPLOAD -->
        <asp:FileUpload ID="fileAttachment" runat="server" CssClass="form-control mb-3"
                        Style="border-radius:10px;" ClientIDMode="Static"/>

        <!-- SEND BUTTON -->
        <asp:Button ID="btnSendReply" runat="server" CssClass="btn btn-success btn-md w-100"
                    Text="📤 Send Reply" ClientIDMode="Static"/>

      </div>
    </div>
  </div>
</div>

    <%-- Top Bar --%>
    <div class="batch-info-card mt-2" style="background-color:transparent;">
        <div class="batch-top-info">
            <div class="info-item">
                <i class="fa-solid fa-id-card-alt info-icon"></i>
                <div>
                    <asp:Label ID="BatchId" runat="server" CssClass="info-value"></asp:Label>
                </div>
            </div>

            <div class="info-item">
                <i class="fa-solid fa-book-open info-icon"></i>
                <div>
                    <asp:Label ID="BatchSubject" runat="server" CssClass="info-value"></asp:Label>
                </div>
            </div>

            <div class="info-item">
                <i class="fa-solid fa-chalkboard-teacher info-icon"></i>
                <div>
                    <asp:Label ID="FaclutyName" runat="server" CssClass="info-value"></asp:Label>
                </div>
            </div>

            <div class="info-item">
                <i class="fa-regular fa-calendar-days info-icon"></i>
                <div>
                    <asp:Label ID="StartDate" runat="server" CssClass="info-value"></asp:Label>
                </div>
            </div>

            <div class="info-item">
                <i class="fa-regular fa-calendar-days info-icon"></i>
                <div>
                    <asp:Label ID="EndDate" runat="server" CssClass="info-value"></asp:Label>
                </div>
            </div>
            <div class="info-item" style="height:35px;background-color:transparent">
                <div>
                 <a href="#" 
                   class="btn btn-primary d-flex align-items-center gap-2 px-3 py-2" 
                   style="height:35px; color:white; font-weight:500;background-color:#1E90FF;"
                   data-bs-toggle="modal" 
                   data-bs-target="#myBatchSheetModal">
                    <i class="fa-solid fa-file-circle-plus" style="color:white; font-size:16px;"></i>
                    <span>Fill Batch Sheet</span>
                </a>

                </div>
            </div>
        </div>
    </div>
     <%-- Top Bar --%>
     <%-- Data Table --%>
     <div class="container-fluid">
     <div class="row">
         <div class="col">
             <!-- BatchSheet Table -->
             <div class="table-responsive mt-2 mb-4 tab">
              <table id="tblBatchSheet" class="table  table-borderless nowrap" style="width:100%">
                  <thead>
                      <tr>
                          <th>Day</th>
                          <th>Date</th>
                          <th>Chapter Number</th>
                          <th>Topic Covered</th>
                          <th>Uploads</th>
                          <th>Add Comment</th>
                          <th>Action</th>
                      </tr>
                  </thead>
                  <tbody></tbody>
              </table>
             </div>
         </div>
     </div>
     <div class="row">
         <a href="BatchInfo.aspx" class="btn btn-danger" style="width:15%;margin:auto">
              <i class="fa-solid fa-arrow-left info-icon" style="color:white;"></i>
             Back to Batch List
         </a>
     </div>
 </div>
     <%-- Data Table --%>
</div>


<!-- jQuery (must be first) -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- Bootstrap Bundle (with Popper) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- DataTables (after jQuery and before your script) -->
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>

<!-- Tagify (optional, after everything else) -->
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>

<%-- Initialize BatchSheet Data Table --%>
<script>
    $(document).ready(function () {
        $('#tblBatchSheet').DataTable({
            processing: true,
            serverSide: false,
            scrollX: true,
            responsive: true,
            paging: true,
            ordering: false,
            searching: true,
            lengthMenu: [[10, 20, 30, -1], [10, 20, 30, "All"]],
            autoWidth: false,
            ajax: {
                url: 'BatchInfoDetails.aspx/GetBatchSheetDetails',
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                dataSrc: function (json) {
                    if (json.d && !json.d.error) {
                        return json.d;
                    } else {
                        console.error(json.d?.error || "No data");
                        return [];
                    }
                }
            },
            columns: [
                {
                    data: null,
                    render: function (data, type, row, meta) {
                        return meta.row + 1;
                    }
                },
                {
                    data: 'Date',
                    render: function (data) {
                        if (!data) return '';
                        var timestamp = parseInt(data.replace(/\/Date\((\d+)\)\//, '$1'));
                        var date = new Date(timestamp);
                        return date.toLocaleDateString('en-GB');
                    }
                },
                { data: 'ChapterNumber' },
                { data: 'TopicCovered' },
                { data: 'uploads' },
                {
                    data: 'Comments',
                    render: function (data, type, row) {
                        let text = data ? data : "View";

                        return `
                        <a href="#" 
                           class="btn btn-link p-0 comment-view-btn" 
                           data-id="${row.BatchSheetId}"
                           data-comment="${data ? data.replace(/"/g, '&quot;') : ''}"  data-bs-target="#myChatModal" data-bs-toggle="modal">
                           ${text}
                        </a>`;
                    }
                },

                {
                    data: "BatchSheetId",
                    render: function (data, type, row) {
                        return `<a class="btn btn-sm btn-primary edit-btn" data-id="${row.BatchSheetId}">
                                <i class="fa fa-edit"></i>
                            </a>
                            <a class="btn btn-sm btn-danger delete-btn" data-id="${row.BatchSheetId}">
                                <i class="fa fa-trash"></i>
                            </a>`;
                    }
                }
            ],
            language: {
                emptyTable: "No Data Found"
            }
        });

        $(document).on("click", ".comment-view-btn", function (e) {
            e.preventDefault();

            let id = $(this).data("id");
            let comment = $(this).data("comment") || "";

            console.log("Clicked BatchSheetId:", id);

            $("#HiddenField2").val(id);
            $("#txtCommentModal").val(comment);

            // Open modal
            $("#myChatModal").modal("show");

            // Load chat
            openChatModal(id);
        });

    });

</script>
<%-- Current date bind in input box --%>
<script>
    $(document).ready(function () {
        const today = new Date().toISOString().split('T')[0];
        $("#txtDate").val(today);
    });
</script>
<%-- Add BatchSheet --%>
<script>
    function addBatchSheet() {

        var fileInput = $("#fileUpload")[0];
        var file = fileInput.files.length > 0 ? fileInput.files[0] : null;

        // If NO FILE validation
        if (file === null) {
            console.log("No file selected → saving only DB record...");
            saveBatchSheet("");
            return;
        }
        var formData = new FormData();
        formData.append("file", file);

        $.ajax({
            url: "FileUploadHandler.ashx",
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            success: function (uploadedFileName) {

                console.log("Uploaded:", uploadedFileName);

                if (!uploadedFileName || uploadedFileName.startsWith("Error")) {
                    Swal.fire("Error", uploadedFileName, "error");
                    return;
                }

                saveBatchSheet(uploadedFileName);
            },
            error: function () {
                Swal.fire("Error", "File upload failed!", "error");
            }
        });
    }
    function saveBatchSheet(fileName) {

        const data = {
            Date: $("#txtDate").val(),
            ChapterId: $("#drpChapter").val(),
            Topic: $("#txtTopic").val(),
            Comments: $("#txtComment").val(),
            FileName: fileName
        };

        $.ajax({
            type: "POST",
            url: "BatchInfoDetails.aspx/AddBatchSheet",
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {

                console.log("DB Save:", response);

                if (response.d && response.d.toString().trim() === "Success") {

                    Swal.fire({
                        icon: "success",
                        title: "Saved!",
                        text: "Batch details added successfully!",
                        timer: 2000,
                        showConfirmButton: false
                    });

                    $('#myBatchSheetModal').modal('hide');
                    $('.modal-backdrop').remove();
                    $('body').removeClass('modal-open');

                    $('#tblBatchSheet').DataTable().ajax.reload(null, false);
                }
                else {
                    Swal.fire("Error", response.d, "error");
                }
            },
            error: function (xhr, status, error) {
                Swal.fire("Error", error, "error");
            }
        });
    }
</script>
<%-- Edit and Update BatchSheet Details --%>
<script>
    // Prefill modal for EDIT
    $(document).on("click", ".edit-btn", function () {
        var id = $(this).data("id");
        if (!id) { alert("Invalid id"); return; }

        $.ajax({
            url: "BatchInfoDetails.aspx/GetBatchSheetById",
            type: "POST",
            data: JSON.stringify({ batchSheetId: id }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (res) {
                if (!res.d || res.d.length === 0) { alert("Record not found"); return; }
                var obj = res.d[0];

                $("#HiddenBatchSheetID").val(obj.BatchSheetId || "");
                // Date: accept ISO or /Date(...)/
                var dtVal = "";
                if (obj.Date) {
                    var parsed = new Date(obj.Date);
                    if (!isNaN(parsed)) dtVal = parsed.toISOString().split("T")[0];
                    else {
                        var m = obj.Date.match(/\/Date\((\d+)\)\//);
                        if (m && m[1]) dtVal = new Date(parseInt(m[1], 10)).toISOString().split("T")[0];
                    }
                }
                $("#txtDate").val(dtVal);

                $("#drpChapter").val(obj.ChapterNumber || "");
                $("#txtTopic").val(obj.TopicCovered || "");
                $("#txtComment").val(obj.Comments || "");
                $("#txtStudentName").val(obj.StudentName || "");
                $("#HiddenBatchId").val(obj.BatchId || "");

                // file logic
                $("#HiddenExistingFile").val(obj.ExistingFileName || "");
                if (obj.ExistingFileName) {
                    $("#currentFileLabel").html("<b>Current File:</b> " + obj.ExistingFileName).show();
                } else {
                    $("#currentFileLabel").hide();
                }
                // clear file input
                $("#fileUpload").val("");

                // buttons
                $("#btnSave").hide();
                $("#btnUpdateBatch").show();
                $("#btnUpdateBatch").off("click").on("click", function () {
                    updateBatch();
                });

                $("#myBatchSheetModal").modal("show");
            },
            error: function (xhr) {
                console.error(xhr.responseText);
                alert("Could not load record. See console.");
            }
        });
    });

    function updateBatch() {

        var fileInput = $("#fileUpload")[0];
        var file = fileInput.files[0];

        var payload = {
            BatchSheetId: parseInt($("#HiddenBatchSheetID").val(), 10),
            Date: $("#txtDate").val(),
            ChapterNumber: $("#drpChapter").val(),
            StudentName: $("#txtStudentName").val(),
            TopicCovered: $("#txtTopic").val(),
            Comments: $("#txtComment").val(),
            BatchId: $("#HiddenBatchId").val() ? parseInt($("#HiddenBatchId").val(), 10) : null,

            FileBase64: "",
            FileName: "",
            ExistingFileName: $("#HiddenExistingFile").val() || ""
        };

        function sendUpdate() {
            $.ajax({
                url: "BatchInfoDetails.aspx/UpdateBatchSheet",
                method: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ model: payload }),
                success: function (res) {
                    if (res.d === "success") {

                        Swal.fire({
                            icon: "success",
                            title: "Updated!",
                            text: "Batch sheet updated successfully!",
                            timer: 2000,
                            showConfirmButton: false
                        });

                        $("#myBatchSheetModal").modal("hide");
                        $("#tblBatchSheet").DataTable().ajax.reload(null, false);
                    }
                    else {
                        Swal.fire("Error", "Update failed: " + res.d, "error");
                    }
                },
                error: function (xhr) {
                    console.log(xhr.responseText);
                    Swal.fire("Error", "Server error while updating!", "error");
                }
            });
        }

        // CASE 1: NEW FILE SELECTED
        if (file) {
            var reader = new FileReader();
            reader.onload = function (e) {
                payload.FileBase64 = e.target.result.split(",")[1];
                payload.FileName = file.name;
                sendUpdate();
            };
            reader.readAsDataURL(file);
        }

        // CASE 2: NO NEW FILE
        else {
            payload.FileBase64 = "";
            payload.FileName = "";
            sendUpdate();
        }
    }

</script>
<%-- Delete BatchSheet Details --%>
<script>
    // Delete button click event (delegated for dynamic DataTable rows)
    $(document).on("click", ".delete-btn", function () {
        const id = $(this).data("id");
        $("#HiddenBatchSheetID").val(id);

        Swal.fire({
            title: "Are you sure?",
            text: "This record will be permanently deleted!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, delete it!"
        }).then((result) => {
            if (result.isConfirmed) {
                deleteBatchSheet(id);
            }
        });
    });

    function deleteBatchSheet(batchSheetId) {
        $.ajax({
            type: "POST",
            url: "BatchInfoDetails.aspx/DeleteBatchSheet",
            data: JSON.stringify({ BatchSheetId: batchSheetId }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.d === "Success") {
                    Swal.fire({
                        icon: "success",
                        title: "Deleted!",
                        text: "Record has been deleted successfully."
                    }).then(() => {
                        $("#tblBatchSheet").DataTable().ajax.reload();
                    });
                } else {
                    Swal.fire("Error", response.d, "error");
                }
            },
            error: function (xhr, status, error) {
                Swal.fire("Error", error, "error");
            }
        });
    }

</script>
<%-- Chat popup Modal --%>
</asp:Content>
