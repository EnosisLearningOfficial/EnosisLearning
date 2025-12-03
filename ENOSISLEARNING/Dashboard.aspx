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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="container-fluid my-3">
        <!-- Row: Header + Month Filter -->
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h4 class="mb-0">Attendance Dashboard</h4>

            <div class="d-flex align-items-center gap-2">
                <label class="mb-0 me-2">Select Course</label>
               <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-select form-select-sm" Width="180px">
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
                                    <asp:Label ID="lblTotalDays" runat="server" Text="0"></asp:Label>
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
                                    <asp:Label ID="lblCompletedDays" runat="server" Text="0"></asp:Label>
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
                                    <asp:Label ID="lblPendingDays" runat="server" Text="0"></asp:Label>
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
                                    <asp:Label ID="lblProgress" runat="server" Text="0%"></asp:Label>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Row: Chart + Table -->
        <div class="row g-3">
            <div class="col-lg-4">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h6 class="card-title">Overall Score Summary</h6>
                        <!-- Chart.js canvas -->
                        <%--<canvas id="attendanceDonut" width="400" height="300"></canvas>
                        <small class="text-muted d-block mt-2">Present / Pending (visual)</small>--%>
                    </div>
                </div>
            </div>

            <div class="col-lg-8">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h6 class="card-title mb-3">Detailed Schedule / Topics</h6>
                        <!-- Data table (will be filled via AJAX) -->
                        <div class="table-responsive">
                           <table id="tblAttendance" class="table table-sm table-hover" runat="server">
                                <thead class="table-light">
                                    <tr>
                                        <th>Date</th>
                                        <th>Chapter</th>
                                        <th>Topic Covered</th>
                                        <th>Faculty / Student</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Will be populated by AJAX -->
                                </tbody>
                            </table>
                        </div>
                        </div>
                        <!-- small note area -->
                        <div class="mt-3">
                            <small class="text-muted">Note: CompletedDays = entries in BatchSheetDetails. Pending = TotalDays - CompletedDays.</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
            $(document).ready(function () {

    var candidateCode = '<%= Session["CANDID"] %>'; // Fetch from session

                $('#tblAttendance').DataTable({
                "ajax": {
                        "url":"Dashboard.aspx/GetCandidateBatchDetails",
            "contentType": "application/json; charset=utf-8",
            "data": function(d) {
                return JSON.stringify({candidateCode: candidateCode });
            },
            "dataSrc": ""
        },
            "columns": [
            {"data": "Date" },
            {"data": "Chapter" },
            {"data": "Topic" },
            {"data": "Student" },
            {
                "data": "Status",
            "render": function(data, type, row) {
                    return data === 'Present' ? '<span style="color:green;">✔️</span>' : '<span style="color:red;">❌</span>';
                }
            }
            ],
            "order": [[0, "asc"]],
            "pageLength": 10,
            "lengthMenu": [5, 10, 25, 50]
    });

});
    </script>
</asp:Content>
