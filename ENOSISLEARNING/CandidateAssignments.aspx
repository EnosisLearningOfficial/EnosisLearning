<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMaster.Master" AutoEventWireup="true" CodeBehind="CandidateAssignments.aspx.cs" Inherits="ENOSISLEARNING.CandidateAssignments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css" />
    <style>
        /* Google Font Import - Poppins */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

      
.attendance-wrapper {
    padding: 15px;
    background: white;
    min-height: 95vh;
}

/* Header */
.page-header {
    margin-bottom: 15px;
}

.page-header h4 {
    font-weight: 600;
    color: #2c3e50;
    display: flex;
    align-items: center;
    gap: 8px;
}

.page-header i {
    color: #0d6efd;
}

/* Filter Card */
.filter-card {
    background: #ffffff;
    padding: 15px;
    border-radius: 10px;
    box-shadow: 0 3px 10px rgba(0,0,0,0.08);
    margin-bottom: 15px;
    max-width: 420px;
}

.filter-label {
    font-size: 14px;
    font-weight: 500;
    margin-bottom: 6px;
    display: flex;
    align-items: center;
    gap: 6px;
    color: #495057;
}

/* Table Card */
.table-card {
    background: #ffffff;
    padding: 15px;
    border-radius: 10px;
    box-shadow: 0 3px 10px rgba(0,0,0,0.08);
}

/* Table Styling */
#tblAssignments thead th {
    font-weight: 600;
    font-size: 14px;
    color: #495057;
    white-space: nowrap;
}

#tblAssignments tbody td {
    font-size: 14px;
    vertical-align: middle;
}

/* Mobile Adjustments */
@media (max-width: 768px) {
    .filter-card {
        max-width: 100%;
    }

    .page-header h4 {
        font-size: 18px;
    }
}
@keyframes jump {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-8px); }
}

 .bi-clipboard-check {
   animation: jump 1s infinite;
 }
/* Modal */
.glass-modal {
    width: 420px;
    background: rgba(255, 255, 255, 0.15);
    backdrop-filter: blur(20px);
    border-radius: 16px;
    border: 1px solid rgba(255, 255, 255, 0.25);
    box-shadow: 0 25px 40px rgba(0, 0, 0, 0.25);
    color: #fff;
    overflow: hidden;
    animation: fadeUp 0.4s ease;
}

/* Header */
.glass-header {
    padding: 15px 20px;
    font-size: 18px;
    font-weight: 600;
    background: rgba(255, 255, 255, 0.1);
}

/* Body */
.glass-body {
    padding: 20px;
}

.glass-body label {
    font-size: 14px;
    margin-bottom: 5px;
    display: block;
}

/* Inputs */
.glass-input {
    background: rgba(255, 255, 255, 0.15);
    border: 1px solid rgba(255, 255, 255, 0.3);
    color: #fff;
}

.glass-input::placeholder {
    color: rgba(255, 255, 255, 0.6);
}

/* Footer */
.glass-footer {
    padding: 15px;
    display: flex;
    justify-content: flex-end;
    gap: 10px;
    background: rgba(255, 255, 255, 0.08);
}

/* Buttons */
        .glass-btn {
            padding: 6px 14px;
            border-radius: 8px;
            border: none;
            color: #fff;
            backdrop-filter: blur(10px);
            cursor: pointer;
        }

.glass-btn.cancel {
    background: rgba(255, 99, 71, 0.6);
}

.glass-btn.submit {
    background: rgba(0, 123, 255, 0.75);
}

/* Animation */
@keyframes fadeUp {
    from {
        transform: translateY(20px);
        opacity: 0;
    }
    to {
        transform: translateY(0);
        opacity: 1;
    }
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" EnablePageMethods="true"></asp:ScriptManager>
    <%-- Assignment submission Modal --%>
    <input type="hidden" id="hdnCourseId" />
  <div class="modal fade" id="submitModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content glass-modal">
      <div class="modal-header glass-header" style="border:none;">
        <i class="bi bi-file-earmark-check me-2"></i>
            Submit Assignment
      </div>
      <div class="modal-body glass-body">
        <!-- File input -->
        <div class="form-group mb-3">
            <label>Assignment File</label>
            <input type="file" class="form-control glass-input" id="fileSubmission">
        </div>
      </div>
      <div class="modal-footer glass-footer">
        <button class="btn glass-btn cancel" type="button" data-bs-dismiss="modal">
            <i class="bi bi-x-circle me-1"></i> Cancel
        </button>
        <button id="btnSubmitAssignment" class="btn glass-btn submit" type="button">
            <i class="bi bi-send me-1"></i> Submit
        </button>
      </div>
    </div>
  </div>
</div>
    <div class="container-fluid attendance-wrapper">
          <!-- Page Header -->
  <div class="page-header">
      <h4>
          <i class="bi bi-clipboard-check text-danger"></i>
          Assignments
      </h4>
  </div>
    <!-- Filter Section -->
  <div class="filter-card">
      <asp:HiddenField ID="hfCandidateID" runat="server" />
      <asp:HiddenField ID="hfCourseID" runat="server" />
      <label class="filter-label">
        <i class="fa-solid fa-calendar-check"></i>
          Select Course
      </label>

         
            <asp:DropDownList ID="ddlCourse" runat="server" ClientIDMode="Static" CssClass="form-select">
         </asp:DropDownList>
  </div>
   <div class="table-card">
     <div class="table-responsive">
          <table id="tblAssignments" class="table table-hover align-middle w-100">
                <thead>
                    <tr>
                        <th>Assignments</th>
                        <th>Download</th>
                        <th>Submit</th>
                    </tr>
                </thead>
                  <tbody></tbody>
            </table>
     </div>
 </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    //Load Couses DropDownList
    $(document).ready(function () {
        var cid = $("#<%= hfCandidateID.ClientID %>").val();
        if (cid > 0) {
            LoadCoursesForDashboard(cid);
        }
    });
    function LoadCoursesForDashboard(candidateId) {
        $.ajax({
            type: "POST",
            url: "CandidateAssignments.aspx/GetCourses",
            data: JSON.stringify({ candidateId: candidateId }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {

                var ddl = $("#<%= ddlCourse.ClientID %>");
        ddl.empty();
        ddl.append('<option value="0">Select Course</option>');

        if (response.d.length > 0) {
            $.each(response.d, function (i, item) {
                ddl.append('<option value="' + item.CourseID + '">' + item.CourseName + '</option>');
            });
        }
    },
    error: function (xhr) {
        console.log("Error loading courses: ", xhr.responseText);
    }
});
    }
</script>
<%-- Load Assignments --%>
<script>
    $("#ddlCourse").change(function () {
        var courseId = $(this).val();
        //console.log(courseId)
        if (courseId > 0) {
            loadAssignments(courseId);
        }
    });
    function loadAssignments(courseId) {
        $.ajax({
            type: "POST",
            url: "CandidateAssignments.aspx/GetAssignments",
            data: JSON.stringify({ courseId: courseId }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (res) {

                var table = $("#tblAssignments").DataTable({
                    "destroy": true,
                    "responsive": true,
                    "ordering": true,
                    "searching": true,
                    "paging": true,
                    "lengthMenu": [[5, 10, -1], [5, 10, "All"]],
                    "info": true,
                    "autoWidth": false,
                    "data": [],
                    "columns": [
                        { "title": "Assignments" },
                        { "title": "Download" },
                        {
                            "data": null,
                            "render": function (data, type, row) {
                                return `
                                <a href="#" class="btn btn-primary btn-open-modal"
                                   data-bs-toggle="modal"
                                   data-bs-target="#submitModal"
                                   style="font-size:16px;background-color:#FFA500;border-color:transparent;">
                                   Submit
                                </a>`;
                            },
                            "orderable": false,
                            "searchable": false
                        }
                    ]
                });
                table.clear();

                if (res.d.length > 0) {
                    $.each(res.d, function (i, item) {
                        table.row.add([
                            item.AssignmentName,
                            `<a href="${item.DownloadUrl}" 
                               target="_blank"
                               class="btn btn-success text-light"
                               style="font-size:18px;background-color:#0000FF;border-color:transparent;">Download</a>`

                        ]);
                    });
                }

                table.draw();
            }
        });
    }
</script>
    <%-- Assignment Download --%>
<script>
    $(document).on("click", ".btn-download", function () {

        var fileUrl = $(this).data("url");
        fileUrl = fileUrl.replace("~/", "/");
        var a = document.createElement("a");
        a.href = fileUrl;
        a.setAttribute("download", "");
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
    });
</script>
<script>
    $(document).on("click", ".btn-open-modal", function () {

        var courseId = $("#ddlCourse").val();   
        console.log("Selected Course ID: " + courseId);
        if (!courseId || courseId === "0") {
            alert("Please select course first");
            return false;
        }
        $("#hdnCourseId").val(courseId);   
        $("#fileSubmission").val("");     
    });

    //Submit assignment
    $("#btnSubmitAssignment").click(function () {

        var courseId = $("#hdnCourseId").val();
        var fileInput = $("#fileSubmission")[0];

        if (!courseId) {
            alert("Course missing");
            return;
        }

        if (fileInput.files.length === 0) {
            alert("Please select a file");
            return;
        }

        var formData = new FormData();
        formData.append("CourseId", courseId);
        formData.append("AssignmentFile", fileInput.files[0]);

        $.ajax({
            url: "AssignmentUpload.aspx",
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            success: function (res) {
                Swal.fire({
                    icon: 'success',
                    title: 'Success',
                    text: 'Assignment submitted successfully',
                    showConfirmButton: false,
                    timer: 2000
                });
                $("#submitModal").modal("hide");
            },
            error: function () {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'Upload failed',
                    showConfirmButton: true
                });
            }
        });
    });
</script>
</asp:Content>
