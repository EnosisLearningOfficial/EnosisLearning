<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMaster.Master" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="ENOSISLEARNING.Result" %>
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
#ResultGrv thead th {
    font-weight: 600;
    font-size: 14px;
    color: #495057;
    white-space: nowrap;
}

#ResultGrv tbody td {
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

.fa-trophy {
  animation: jump 1s infinite;
}
  </style>    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container-fluid attendance-wrapper">
    <!-- Page Header -->
    <div class="page-header">
        <h4>
           <i class="fa-solid fa-trophy" style="color:#fff64b"></i>
            Test Score Details
        </h4>
    </div>

    <!-- Filter Section -->
    <div class="filter-card">
      <asp:HiddenField ID="hfCandidateID" runat="server" />

        <label class="filter-label">
           <i class="fa-solid fa-clipboard-check"></i>
            Select Course
        </label>

        <select id="DropDownListCourse" class="form-select drop">
        <option value="0">Select Course</option>
        </select>
    </div>

    <!-- Table Section -->
    <div class="table-card">
        <div class="table-responsive">
            <table id="ResultGrv" class="table table-hover align-middle w-100">
                <thead>
                    <tr>
                        <th>Student Name</th>
                        <th>Date</th>
                        <th>Score</th>
                        <th>Out Of</th>
                        <th>Faculty</th>
                        <th>Test Type</th>
                        <th>Feedback</th>
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
<script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
<script>
    $(document).ready(function () {
        var candidateId = $("#<%= hfCandidateID.ClientID %>").val(); // Get Candidate ID from HiddenField

    if (candidateId) {
        console.log("✅ Candidate ID:", candidateId);
        LoadCourses(candidateId);
    } else {
        console.error("❌ Candidate ID Not Found!");
    }

    // **Page Load par Empty Table Initialize**
    $("#ResultGrv").DataTable({
        "destroy": true,
        "responsive": true,
        "ordering": true,
        "searching": true,
        "paging": true,
        "lengthMenu": [[5, 10, -1], [5, 10, "All"]],
        "info": true,
        "autoWidth": false,
        "data": [], // Initially empty data
        "columns": [
            { data: "FULLNAME" },
            { data: "UPDATEDDATE" },
            { data: "SCORE" },
            {  data: "OUTOF" },
            { data: "UPDATEDBY" },
            { data: "ASSESSMENTTYPE" },
            { data: "FEEDBACK" }
        ]
    });

    // **Dropdown Change Event**
    $("#DropDownListCourse").on("change", function () {
        var courseId = $(this).val();
        var candidateId = $("#<%= hfCandidateID.ClientID %>").val(); // Get Candidate ID

        console.log("Dropdown Changed! Course ID:", courseId, "Candidate ID:", candidateId);

        if (courseId !== "0" && candidateId !== "0") {
            LoadResults(courseId, candidateId);
        } else {
            console.warn("Invalid Course or Candidate ID. Resetting DataTable.");

            // **Reset Table to Empty Data with Theme**
            var table = $("#ResultGrv").DataTable();
            table.clear().draw();
        }
    });
       });

    // **Function to Load Courses**
    function LoadCourses(candidateId) {
        $.ajax({
            type: "POST",
            url: "Result.aspx/GetCourses",
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

    // Function to Load Results
    function LoadResults(courseId, candidateId) {
        $.ajax({
            type: "POST",
            url: "Result.aspx/GetResults", // Change as per your Page
            data: JSON.stringify({ courseId: courseId, candidateId: candidateId }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                console.log("Results Data:", response.d);
                var table = $("#ResultGrv").DataTable();
                table.clear().draw();

                if (response.d.length > 0) {
                    table.rows.add(response.d).draw();
                } else {
                    console.warn("No Results Found!");
                }
            },
            error: function (xhr, status, error) {
                console.error("LoadResults Error:", xhr.responseText);
            }
        });
    }

    // Dropdown Change Event
    $("#DropDownListCourse").on("change", function () {
        var courseId = $(this).val();
        var candidateId = $("#<%= hfCandidateID.ClientID %>").val();

    if (courseId !== "0" && candidateId !== "0") {
        LoadResults(courseId, candidateId);
    } else {
        console.warn("Invalid Course or Candidate ID. Resetting Table.");
        $("#ResultGrv").DataTable().clear().draw();
    }
});
</script>
</asp:Content>
