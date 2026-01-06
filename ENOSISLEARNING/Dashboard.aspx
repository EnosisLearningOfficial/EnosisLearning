<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMaster.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="ENOSISLEARNING.StudentView" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css" />
    <style>
     /* cards smaller shadow + rounded look */
        .card { border-radius: 10px; }
        .card .card-body h5 { font-weight:600; }
        /* icons tint */
        .fa-2x { opacity: .95; }
.ai-card {
    background: linear-gradient(135deg, #ffffff, #f7faff);
    transition: all .3s ease;
    border-left: 5px solid #4A90E2;
}
.ai-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 4px 12px rgba(0,0,0,0.15);
}

.ai-card h2 {
    font-size: 32px;
}

.ai-card small {
    font-size: 12px;
}
.dashboard-title {
    font-weight: 600;
    color: #2c3e50;
}
.dashboard-title i {
    font-size: 1.8rem;
    color: #0d6efd; /* Bootstrap primary */
}
@keyframes jump {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-8px); }
}

 .bi-speedometer2 {
   animation: jump 1s infinite;
 }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <div class="container-fluid my-3">
        <!-- Row: Header + Month Filter -->
        <div class="d-flex justify-content-between align-items-center mb-3">
           <h4 class="mb-0 d-flex align-items-center dashboard-title">
                <i class="bi bi-speedometer2 me-2"></i> Dashboard
            </h4>
            <div class="d-flex align-items-center gap-2">
                <label class="mb-0 me-2">Courses</label>
                 <asp:HiddenField ID="hfCandidateID" runat="server" />
                <asp:HiddenField ID="hfCourseID" runat="server" />
               <asp:DropDownList ID="ddlCourse" runat="server" ClientIDMode="Static" CssClass="form-select form-select-sm" Width="180px">
            </asp:DropDownList>
            </div>
        </div>

        <!-- Row: Summary Cards -->
        <div class="row g-3 mb-3">
            <div class="col-sm-6 col-md-3">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="me-3">
                                <i class="fa-solid fa-calendar-days fa-2x text-primary"></i>
                            </div>
                            <div>
                                <small class="text-muted">Total Days</small>
                                <h5 class="mb-0">
                                    <!-- server label -->
                                    <asp:Label ID="lblTotalDays" runat="server" Text="0" ClientIDMode="Static"></asp:Label>
                                </h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-md-3">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="me-3">
                                <i class="fa-solid fa-check-circle fa-2x text-success"></i>
                            </div>
                            <div>
                                <small class="text-muted">Completed Days</small>
                                <h5 class="mb-0">
                                    <asp:Label ID="lblCompletedDays" runat="server" Text="0" ClientIDMode="Static"></asp:Label>
                                </h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-md-3">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="me-3">
                                <i class="fa-solid fa-hourglass-half fa-2x text-warning"></i>
                            </div>
                            <div>
                                <small class="text-muted">Pending Days</small>
                                <h5 class="mb-0">
                                    <asp:Label ID="lblPendingDays" runat="server" Text="0" ClientIDMode="Static"></asp:Label>
                                </h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-md-3">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <small class="text-muted">Progress</small>
                        <div class="d-flex align-items-center mt-1">
                            <div class="flex-grow-1 me-3">
                               <div class="progress" style="height:12px;">
                                    <div id="divProgress" class="progress-bar" role="progressbar" style="width: 0%;" 
                                         aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <div style="min-width:60px; text-align:right;">
                                    <asp:Label ID="lblProgress" runat="server" Text="0%" ClientIDMode="Static"></asp:Label>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div> <!-- END SUMMARY ROW -->
        <!-- Row: Chart + Table -->
        <div class="row g-3">
            <div class="col-lg-12">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h6 class="card-title">Overall Score Summary</h6>
                        <canvas id="scoreLineChart" height="50"></canvas>
                    </div>
                </div>
            </div>

         <div id="aiSummaryContainer" class="row g-3">
                    <div class="col-md-4">
                        <div class="ai-card p-3 shadow-sm rounded">
                            <h6 class="text-muted mb-1">Classes Attended (This Week)</h6>
                            <h2 id="weekAttendance" class="fw-bold mb-0">--</h2>
                            <small class="text-success" id="weekAttendanceRemark"></small>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="ai-card p-3 shadow-sm rounded">
                            <h6 class="text-muted mb-1">Topic Completion Speed</h6>
                            <h2 id="topicSpeed" class="fw-bold mb-0">--%</h2>
                            <small class="text-info" id="topicSpeedRemark"></small>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="ai-card p-3 shadow-sm rounded">
                            <h6 class="text-muted mb-1">Estimated Course Completion</h6>
                            <h2 id="estimatedDate" class="fw-bold mb-0">--</h2>
                            <small class="text-warning" id="estimatedDateRemark"></small>
                        </div>
                    </div>

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
                url: "Dashboard.aspx/GetCourses",
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
<%-- Line Graph --%>
   <script>

       var scoreChart = null;

       $(document).ready(function () {

           var CandidateId = $("#<%= hfCandidateID.ClientID %>").val();

        if (CandidateId && CandidateId > 0) {
            loadScoreGraph(CandidateId);
        }
    });

       function loadScoreGraph(CandidateId) {

           $.ajax({
               type: "POST",
               url: "Dashboard.aspx/GetCandidateScoreData",
               data: JSON.stringify({ candidateId: CandidateId }),
               contentType: "application/json; charset=utf-8",
               dataType: "json",

               success: function (response) {

                   var data = response.d;

                   var labels = data.map(x => x.TestDate);
                   var scores = data.map(x => x.Percentage);

                   drawLineChart(labels, scores);
               }
           });
       }
       function drawLineChart(labels, scores) {

           var ctx = document.getElementById("scoreLineChart").getContext("2d");
           if (scoreChart != null) {
               scoreChart.destroy();
           }

           scoreChart = new Chart(ctx, {
               type: 'line',
               data: {
                   labels: labels,
                   datasets: [{
                       label: "Score (%)",
                       data: scores,
                       borderColor: "#007bff",
                       backgroundColor: "rgba(0,123,255,0.2)",
                       fill: true,
                       tension: 0.3,
                       borderWidth: 2,
                       pointRadius: 4
                   }]
               },
               options: {
                   responsive: true,
                   scales: {
                       y: {
                           beginAtZero: true,
                           max: 100,
                           ticks: {
                               callback: function (value) {
                                   return value + "%";
                               }
                           }
                       }
                   }
               }
           });
       }

       //Table Binding Logic
   </script>
    <script>
        $(document).ready(function () {

            var candidateId = $("#<%= hfCandidateID.ClientID %>").val();
            var courseId = $("#<%= hfCourseID.ClientID %>").val();

                if (candidateId && courseId) {
                    loadAttendanceTable(candidateId, courseId);
                }
            });


        function loadAttendanceTable(candidateId, courseId) {

            $('#tblAttendance').DataTable({
                "destroy": true,
                "processing": true,
                "paging": false,
                "info": false,
                "searching": false,
                "ordering": false,
                scrollY: "200px",
                "scrollX": false,
                scrollCollapse: true,

                "language": {
                    "search": "",
                    "searchPlaceholder": "Search attendance..."
                },

                "ajax": {
                    "url": "Dashboard.aspx/GetAttendanceData",
                    "type": "POST",
                    "contentType": "application/json; charset=utf-8",
                    "dataType": "json",
                    "data": function () {
                        return JSON.stringify({
                            candidateId: candidateId,
                            courseId: courseId
                        });
                    },
                    "dataSrc": function (response) {
                        return response.d;
                    }
                },

                "columns": [
                    { "data": "ChapterNumber" },
                    { "data": "TopicCovered" },
                    {
                        "data": "Status",
                        "render": function (data) {

                            if (data === "Present" || data === "Completed") {
                                return '<span class="badge bg-success" style="font-size:11px;">✔</span>';
                            }
                            else {
                                return '<span class="badge bg-warning text-dark" style="font-size:11px;">⏳ Pending</span>';
                            }
                        }
                    }
                ]
            });
        }
    </script>
<%-- Dynamic binding in onchange --%>
    <script>
        $(document).ready(function () {

            // 🔹 On Course Change
            $("#ddlCourse").on("change", function () {
                var candidateId = $("#<%= hfCandidateID.ClientID %>").val();
        var courseId = $(this).val();

        if (courseId !== "0") {
            loadAISummary(candidateId, courseId);
            loadCourseSummary(candidateId, courseId);
        }
    });

});

        /* ================= AI SUMMARY ================= */
        function loadAISummary(candidateId, courseId) {

            if (!candidateId || !courseId || courseId === "0") {
                console.warn("Invalid CandidateId or CourseId");
                return;
            }

            $.ajax({
                type: "POST",
                url: "Dashboard.aspx/GetAISummary",
                data: JSON.stringify({
                    candidateId: candidateId,
                    courseId: courseId
                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",

                success: function (response) {

                    if (!response.d || response.d.error) {
                        console.warn("AI Summary not available");
                        return;
                    }

                    var data = response.d;

                    $("#weekAttendance").text(data.WeekAttendance);
                    $("#weekAttendanceRemark").text(data.WeekAttendanceRemark);

                    $("#topicSpeed").text(data.TopicSpeed + "%");
                    $("#topicSpeedRemark").text(data.TopicSpeedRemark);

                    $("#estimatedDate").text(data.EstimatedFinish);
                    $("#estimatedDateRemark").text(data.EstimatedRemark);
                },

                error: function (err) {
                    console.error("AI Summary Error:", err);
                }
            });
        }

        /* ================= COURSE SUMMARY ================= */
        function loadCourseSummary(candidateId, courseId) {

            $.ajax({
                type: "POST",
                url: "Dashboard.aspx/GetCourseSummary",
                data: JSON.stringify({
                    candidateCode: candidateId,
                    courseId: courseId
                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",

                success: function (response) {

                    if (!response.d) return;

                    $("#lblTotalDays").text(response.d.TotalDays);
                    $("#lblCompletedDays").text(response.d.CompletedDays);
                    $("#lblPendingDays").text(response.d.PendingDays);
                    $("#lblProgress").text(response.d.Progress + "%");

                    // 🔹 Animate Progress Bar
                    var bar = document.getElementById("divProgress");
                    bar.style.transition = "width 0.8s ease-in-out";
                    bar.style.width = response.d.Progress + "%";
                    bar.setAttribute("aria-valuenow", response.d.Progress);
                },

                error: function (err) {
                    console.error("Course Summary Error:", err);
                }
            });
        }
    </script>
</asp:Content>
