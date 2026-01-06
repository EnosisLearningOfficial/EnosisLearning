<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMaster.Master" AutoEventWireup="true" CodeBehind="Attendence.aspx.cs" Inherits="ENOSISLEARNING.Attendence" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
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
#AttendenceGrv thead th {
    font-weight: 600;
    font-size: 14px;
    color: #495057;
    white-space: nowrap;
}

#AttendenceGrv tbody td {
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

 .bi-calendar-check-fill {
   animation: jump 1s infinite;
 }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div class="container-fluid attendance-wrapper">
    <!-- Page Header -->
    <div class="page-header">
        <h4>
            <i class="bi bi-calendar-check-fill" style="color:#ff4949"></i>
            Attendance Details
        </h4>
    </div>

    <!-- Filter Section -->
    <div class="filter-card">
        <asp:HiddenField ID="hfCandidateID" runat="server" />

        <label class="filter-label">
          <i class="fa-solid fa-calendar-check"></i>
            Select Course
        </label>

        <select id="DropDownListCourse" class="form-select">
            <option value="0">Select Course</option>
        </select>
    </div>

    <!-- Table Section -->
    <div class="table-card">
        <div class="table-responsive">
            <table id="AttendenceGrv" class="table table-hover align-middle w-100">
                <thead>
                    <tr>
                        <th>Chapter No</th>
                        <th>Topic Covered</th>
                        <th>Date</th>
                        <th>Uploads</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>

    <asp:Label ID="Errorlbl" runat="server" CssClass="text-danger mt-2 d-block" />
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script>
    $(document).ready(function () {
        var candidateId = $("#<%= hfCandidateID.ClientID %>").val();

        if (candidateId) {
            console.log("✅ Candidate ID:", candidateId);
            LoadCourses(candidateId);
        } else {
            console.error("❌ Candidate ID Not Found!");
        }

        // 🟢 Initialize DataTable on Page Load
        $("#AttendenceGrv").DataTable({
            "destroy": true,
            "responsive": true,
            "ordering": false,
            "searching": true,
            "paging": true,
            "lengthMenu": [[5, 10, -1], [5, 10, "All"]],
            "info": true,
            "autoWidth": false,
            "data": [],
            "columns": [
                { "title": "Chapter Number" },
                { "title": "Topic Covered" },
                { "title": "Date" },
                { "title": "Uploads" },
                { "title": "Status" }
            ]
        });

        // 🟢 Dropdown Change Event
        $("#DropDownListCourse").on("change", function () {
            var courseId = $(this).val();
            var candidateId = $("#<%= hfCandidateID.ClientID %>").val();

            console.log("Dropdown Changed! Course ID:", courseId, "Candidate ID:", candidateId);

            if (courseId !== "0" && candidateId !== "0") {
                LoadAttendance(courseId);
            } else {
                console.warn("Invalid Course or Candidate ID. Resetting DataTable.");
                var table = $("#AttendenceGrv").DataTable();
                table.clear().draw();
            }
        });

        // 🔄 Load Courses
        function LoadCourses(candidateId) {
            $.ajax({
                type: "POST",
                url: "Attendence.aspx/GetCourses",
                data: JSON.stringify({ candidateId: candidateId }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    console.log("Courses received:", response.d);
                    var dropdown = $("#DropDownListCourse");
                    dropdown.empty();
                    dropdown.append('<option value="0">Select Course</option>');

                    if (response.d.length > 0) {
                        $.each(response.d, function (index, item) {
                            dropdown.append('<option value="' + item.CourseID + '">' + item.CourseName + '</option>');
                        });
                    } else {
                        console.warn("No courses found for candidate.");
                    }
                },
                error: function (xhr, status, error) {
                    console.error("LoadCourses Error:", xhr.responseText);
                }
            });
        }

        // 🔄 Load Attendance Only
        function LoadAttendance(courseId) {
            $.ajax({
                type: "POST",
                url: "Attendence.aspx/GetStudentBatchData",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ courseId: courseId }),
                success: function (response) {
                    var data = response.d;
                    var table = $("#AttendenceGrv").DataTable();
                    table.clear();

                    if (data && data.Attendance.length > 0) {
                        $.each(data.Attendance, function (index, item) {
                            let fileLink = item.Uploads
                                ? `<a href="DownloadFile.ashx?file=${encodeURIComponent(item.Uploads)}" target="_blank">Download</a>`
                                : 'N/A';

                            table.row.add([
                                item.ChapterNumber,
                                item.TopicCovered,
                                item.Date,
                                fileLink,
                                item.Status
                            ]);
                        });
                    }

                    table.draw();
                },
                error: function (xhr, status, error) {
                    console.error("Error:", xhr.responseText);
                }
            });
        }
    });
</script>

</asp:Content>
