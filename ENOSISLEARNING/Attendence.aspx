<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMaster.Master" AutoEventWireup="true" CodeBehind="Attendence.aspx.cs" Inherits="ENOSISLEARNING.Attendence" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
            <style>
        /* Google Font Import - Poppins */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

        :root {
            /* ===== Colors ===== */
            --body-color: #E4E9F7;
            --sidebar-color: #FFF;
            --primary-color: #355c7d;
            --primary-color-light: #F6F5FF;
            --toggle-color: #DDD;
            --text-color: #707070;
            /* ====== Transition ====== */
            --tran-03: all 0.2s ease;
            --tran-03: all 0.3s ease;
            --tran-04: all 0.3s ease;
            --tran-05: all 0.3s ease;
        }
       .main
       {
           width:100%;
           height:100%;
           background-color:transparent;
           margin:auto;
           padding:10px;
           border:0px solid grey;
       }
       .navbar
       {
           width:1060px;
           height:50px;
           border:0px solid grey;
           margin:auto;
           border-radius:3px;
           background-color:var(--primary-color);
       }
       .profile-pic
       {
           width:45px;
           height:100%;
           background-color:transparent;
           border-radius:50%;
           position:relative;
           left:1000px;
           cursor:pointer;
       }
       .picture
       {
           width:45px;
           height:100%;
       }
       .username
       {
           position:relative;
           right:87%;
       }
       .uname
       {
           color:white;
           font-family: 'Poppins', sans-serif;
           position:relative;
           left:50%;
           top:3px;
       }
       .main-body
        {
            width:1060px;
            height: 70vh;
            display: flex;
            border:1px solid transparent;
            padding:10px;
            margin:auto;
            margin-top:0px;
        }
       .table-responsive
       {
           position:relative;
           top:-20px;
       }
         /* Overall table styles */
    table.dataTable {
        border-collapse: collapse !important;
        width: 1060px;
    }

    /* Table header */
    table.dataTable thead th {
        background-color: #685b7b;
        color: white;
        font-size: 16px;
        text-align: center;
        font-weight: bold;
        padding: 12px;
    }

    /* Table body */
    table.dataTable tbody td {
        background-color: #FFF;
        padding: 12px;
        font-size: 14px;
        text-align: center;
    }
    /* Set white background color for the first column (body cells) */
table.dataTable td:first-child {
    background-color: #ffffff !important; /* White background for the first column */
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
    .dataTables_wrapper .dataTables_paginate .paginate_button {
        background-color: #685b7b;
        color: white;
        border: none;
        padding: 8px 15px;
        margin: 0 5px;
        font-size: 14px;
        border-radius: 5px;
        cursor: pointer;
    }

    .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
        background-color: #ccc;
    }

    /* Styling search box */
    .dataTables_filter input {
        padding: 8px;
        font-size: 14px;
        border: 1px solid #FFF;
        border-radius: 5px;
    }

    /* Add a border to the table */
    table.dataTable {
        border: 1px solid #ddd;
        border-radius: 8px;
    }

    /* Styling the table container */
    .table-responsive {
        margin-top: 30px;
        overflow-x: auto;
    }

    /* Table container shadow */
    .table-responsive table {
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }
    .drparea
    {
        width:1030px;
        height:50px;
        margin:auto;
        margin-top:10px;
        border:1px solid transparent;

    }
    .drp
    {
        width:140px;
        height:33px;
        margin: 15px 0px;
        border-radius:2px;
        float:left;
        border:1px solid #aaa;
    }
    .drop
    {
        border:none;
        text-align:center;
        height:100%;
    }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="main">
     <div class="navbar" style="position:fixed;">
         <div class="profile-pic">
             <img class="picture" src="Images/add.png" alt="" style="width:45px"/>
         </div>
         <div class="username">
             <asp:Label ID="lbltxt" Text="Welcome User" runat="server" CssClass="uname" style="padding-left:22px;"/>
         </div>
     </div>
        <%-- <div class="drparea">
              <div class="drp">
                  <select class="form-control drop">
                      <option value="value">Select Course</option>
                  </select>
              </div>
         </div>--%>
         <div class="main-body">
                <div class="table-responsive">
                     <div class="drparea"  style="margin-top:65px;">
                           <div class="drp">
                               <asp:HiddenField ID="hfCandidateID" runat="server" />
                                 <select id="DropDownListCourse" class="form-control drop">
                                        <option value="0">Select Course</option>
                                 </select>
                           </div>
                    </div>
                   <table id="AttendenceGrv" class="display table table-borderless" style="width:1030px;background-color:white;">
                        <thead>
                            <tr>
                               <%-- <th>Student Name</th>--%>
                                <th>Chapter Number</th>
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
         <asp:Label ID="Errorlbl" runat="server" />
    </div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script>
    $(document).ready(function () {
        var candidateId = $("#<%= hfCandidateID.ClientID %>").val(); // Get Candidate ID from HiddenField

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
            "ordering": true,
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
