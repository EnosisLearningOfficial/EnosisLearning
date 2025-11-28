<%@ Page Title="" Language="C#" MasterPageFile="~/NewMyAdmin.Master" AutoEventWireup="true" CodeBehind="BatchInfo.aspx.cs" Inherits="ENOSISLEARNING.BatchInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>Enosis Learning</title>
    <!-- Tagify CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
 *
 {
     font-family: 'Montserrat', sans-serif;
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
.tagify {
    width: 100% !important;
    min-height: 40px;
    display: flex;
    flex-wrap: wrap;
    border: 1px solid #ccc;
    border-radius: 6px;
    padding: 5px 8px;
    background: #fff;
}
.tagify__tag {
    background-color: #e7e7e7;
    margin: 3px;
    padding: 3px 8px;
    border-radius: 4px;
}
.nav-link.active-pill {
    background-color: #1E90FF; 
    color: white !important;
    padding: 5px 12px;
}
.navbar-nav {
    display: flex;
    align-items: center;
    gap: 0;
}

.navbar-nav .nav-item {
    margin: 0;
}

.navbar-nav .nav-link {
    padding: 6px 16px;
    border: 1px solid #dcdcdc;
    border-right: none;
    background: #fff;
    color: #333 !important;
    font-weight: 600;
    transition: 0.2s;
}

.navbar-nav .nav-link:last-child {
    border-right: 1px solid #dcdcdc;
}

.navbar-nav .nav-link:hover {
    background: #f5f5f5;
}
.navbar-nav .nav-link.active-pill {
    background: #007bff !important;
    color: #fff !important;
    border-color: #007bff !important;
}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" EnablePageMethods="true"></asp:ScriptManager>
    <%-- Complete Batches Opup Modal --%>
    <div id="myCompleteBatchesModal" class="modal fade" tabindex="-1" aria-labelledby="completeBatchesLabel" aria-hidden="true">
         <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                  <div class="modal-header" style="background-color:dodgerblue;">
                         <h5 class="modal-title display-5 text-light" id="myCompleteModallabel">
                             <i class="fa-solid fa-graduation-cap"></i>&nbsp;Complete Batches</h5>
                     <button id="btnCompltBatches" type="button" class="btn-close text-danger" data-bs-dismiss="modal" aria-label="Close"/>
                    </div>
                  <div class="modal-body">
                      <div class="container-fluid">
     <div class="row">
         <div class="col">
             <!-- Complete Batches Table -->
             <div class="table-responsive mt-2 mb-4 tab">
              <table id="tblCompleteBatches" class="table  table-borderless nowrap" style="width:100%">
                  <thead>
                      <tr>
                          <th>Batch Id</th>
                          <th>Batch Mode</th>
                          <th>Course Name</th>
                          <th>Faculty Name</th>
                          <th>Total Days Taken</th>
                      </tr>
                  </thead>
                  <tbody></tbody>
              </table>
             </div>
         </div>
     </div>
 </div>
                  </div>
            </div>
        </div>
    </div>
    <%-- Complete Batches Opup Modal --%>
        <%-- Add Modal --%>  
<div id="myModal" class="modal fade" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color:dodgerblue;">
        <h5 class="modal-title display-5 text-light" id="myModallabel">Add Batch</h5>
        <button id="btnClose" type="button" class="btn-close text-danger" data-bs-dismiss="modal" aria-label="Close">
        </button>
      </div>
     <!-- Modal Body -->
       <div class="modal-body">
    <div class="container-fluid">

        <!-- First Row: Batch Subject, Type, Mode -->
        <div class="row mb-3">
            <div class="col-md-4">
                <label for="drpDCourse">Course</label>
                <asp:DropDownList ID="drpDCourse" runat="server" CssClass="form-select" ClientIDMode="Static"></asp:DropDownList>
            </div>
            <div class="col-md-4">
                <label for="FooterBatchTypeDrp">Batch Type</label>
                <asp:DropDownList ID="FooterBatchTypeDrp" runat="server" CssClass="form-select" ClientIDMode="Static">
                    <asp:ListItem Text="Planned" />
                    <asp:ListItem Text="Current" />
                </asp:DropDownList>
            </div>
            <div class="col-md-4">
                <label for="FooterBatchMode">Batch Mode</label>
                <asp:DropDownList ID="FooterBatchMode" runat="server" CssClass="form-select" ClientIDMode="Static">
                    <asp:ListItem Text="Offline" />
                    <asp:ListItem Text="Online" />
                </asp:DropDownList>
            </div>
        </div>

        <!-- Second Row: Dates and Times with Icons -->
        <div class="row mb-3">
            <div class="col-md-3">
                <label>Start Date</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                    <input type="date" id="FooterStartdatettxt" class="form-control" />
                </div>
            </div>
            <div class="col-md-3">
                <label>End Date</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                    <input type="date" id="FooterEnddatettxt" class="form-control" />
                </div>
            </div>
            <div class="col-md-3">
                <label>Start Time</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fa fa-clock"></i></span>
                    <input type="time" id="FooterStartTimetxt" class="form-control" />
                </div>
            </div>
            <div class="col-md-3">
                <label>End Time</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fa fa-clock"></i></span>
                    <input type="time" id="FooterEndTimetxt" class="form-control" />
                </div>
            </div>
        </div>

        <!-- Third Row: Faculty, Status -->
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="drpFaculty">Faculty</label>
                <asp:DropDownList ID="drpFaculty" runat="server" CssClass="form-select" ClientIDMode="Static"></asp:DropDownList>
            </div>
            <div class="col-md-6">
                <label for="FooterStatus">Status</label>
                <asp:DropDownList ID="FooterStatus" CssClass="form-select" runat="server" ClientIDMode="Static">
                    <asp:ListItem Text="Running" />
                    <asp:ListItem Text="Pending" />
                    <asp:ListItem Text="Completed" />
                </asp:DropDownList>
            </div>
        </div>
        <div class="row">
           <div class="col-md-12">
                <label for="FooterExpectStudtxt">Expected Students</label>
                <textarea id="FooterExpectStudtxt" class="form-control" rows="4"
                    placeholder="Enter student names here, one per line"></textarea>

                <!-- Hidden fields to store selected IDs and Names -->
                <input type="hidden" id="SelectedStudentIDs" />
                <input type="hidden" id="SelectedStudentNames" />
            </div>
        </div>

    </div>
</div>

<div class="modal-footer">
    <input type="hidden" id="HiddenBatchID" />
    <button id="btnSave" type="button" class="btn btn-success" onclick="addBatch();">Add Batch</button>
    <button id="btnUpdateBatch" type="button" class="btn btn-warning" style="display:none;" onclick="updateBatch();">
        Update Batch
    </button>
</div>

    </div>
  </div>
</div>

    <%-- Add Modal --%>
   <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
       <%-- Search Bar --%>
  <div class="container-fluid">
    <!-- Left Side Dropdowns -->
    <div class="d-flex">
      <select id="FilterDrpBatchType" class="form-select me-2">
        <option value="1">All Batches</option>
        <option value="2">Current Batches</option>
        <option value="3">Planned Batches</option>
      </select>
        <asp:DropDownList ID="FilterFacultyDrp" runat="server" ClientIDMode="Static" AppendDataBoundItems="true" CssClass="form-select">
              <asp:ListItem Text="Select Faculty" Value="" />
        </asp:DropDownList>
    </div>
        <a href="#myModal" data-bs-toggle="modal" class="btn btn-info mx-2 text-light" style="background-color:#1E90FF;">Add Batch</a>
    <!-- Right Side Links -->
    <div class="ms-auto">
      <ul class="navbar-nav">
          <li class="nav-item">
           <a class="nav-link fw-reset" type="reset" href="#" id="ClearCourse">
               <i class="fa fa-undo text-success"></i> 
           </a>
         </li>
        <li class="nav-item">
          <a class="nav-link fw-semibold" href="#">
              <i class="fa-solid fa-file-code text-success"></i>&nbsp;ASP.NET</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-semibold" href="#">
              <i class="fa-solid fa-brands fa-java text-success"></i>&nbsp;JAVA</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-semibold" href="#">
              <i class="fa-solid fa-server text-success"></i>&nbsp;Data Analytics</a>
        </li>
        <li class="nav-item">
          <button class="nav-link" type="button" data-bs-target="#myCompleteBatchesModal" data-bs-toggle="modal" onclick="loadCompleteBatches();">
              <i class="fa-solid fa-user-graduate text-success"></i>&nbsp;Complete Batches
          </button>
        </li>
      </ul>
    </div>

  </div>
</nav>
<%-- Search Bar --%>
<%-- Data Table --%>
    <div class="container-fluid">
        <div class="row">
            <div class="col">
                <!-- Enquiry Table -->
                <div class="table-responsive mt-2 mb-4 tab">
                 <table id="tblBatches" class="table  table-borderless nowrap" style="width:100%">
                     <thead>
                         <tr>
                             <th>Type</th>
                             <th>Mode</th>
                             <th>Course</th>
                             <th>Start Date</th>
                             <th>End Date</th>
                             <th>Start Time</th>
                             <th>End Time</th>
                             <th>Faculty</th>
                             <th>Students</th>
                             <th>Status</th>
                             <th>Progress</th>
                             <th>Details</th>
                             <th>Action</th>
                         </tr>
                     </thead>
                     <tbody></tbody>
                 </table>
                </div>
            </div>
        </div>
    </div>
<%-- Data Table --%>

<!-- jQuery (must be first) -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- Bootstrap Bundle (with Popper) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- DataTables -->
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
<!-- Tagify JS -->
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
<%-- Initialize Complete Batch Table --%>
<script>
    function loadCompleteBatches() {

        // Destroy old DataTable if exists
        if ($.fn.DataTable.isDataTable('#tblCompleteBatches')) {
            $('#tblCompleteBatches').DataTable().clear().destroy();
        }

        var table = $("#tblCompleteBatches").DataTable({
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
                url: "BatchInfo.aspx/GetCompleteBatches",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: function () {
                    return JSON.stringify({});
                },
                dataSrc: function (json) {
                    if (json.d && json.d.data) {
                        return json.d.data; 
                    }

                    return [];
                },
                error: function (xhr, status, error) {
                    console.error("AJAX ERROR:", status, error, xhr.responseText);
                }
            },

            columns: [
                { data: "BatchId" },
                { data: "BatchMode" },
                { data: "BatchSubject" },  
                { data: "FaclutyName" },
                { data: "TotalDays" }     
            ]
        });

        $('#myCompleteBatchesModal').on('shown.bs.modal', function () {
            table.columns.adjust();
        });
    }
</script>

<%-- Initialize Batch Table --%>
  <script>
      $(document).ready(function () {
          $('#tblBatches').DataTable({
              processing: true,
              serverSide: false,
              scrollX: true,
              responsive: true,
              paging: true,
              ordering: false,
              searching: true,
              lengthMenu: [[10, 20, 30, -1], [10, 20, 30, "All"]],
              autoWidth: false,
              "ajax": {
                  "url": "BatchInfo.aspx/GetBatches",
                  "type": "POST",
                  "contentType": "application/json; charset=utf-8",
                  "dataType": "json",
                  "data": function (d) {
                      return JSON.stringify({});
                  },
                  "dataSrc": function (json) {
                      return json.d.data;
                  }
              },
              "columns": [
                  { "data": "BatchType" },
                  { "data": "BatchMode" },
                  { "data": "BatchSubject" },
                  {
                      "data": "StartDate",
                      "render": function (data) {
                          if (data) {
                              var date = new Date(parseInt(data.replace(/\/Date\((\d+)\)\//, '$1')));
                              return date.toLocaleDateString("en-GB"); // dd/MM/yyyy
                          }
                          return "";
                      }
                  },
                  {
                      "data": "EndDate",
                      "render": function (data) {
                          if (data) {
                              var date = new Date(parseInt(data.replace(/\/Date\((\d+)\)\//, '$1')));
                              return date.toLocaleDateString("en-GB");
                          }
                          return "";
                      }
                  },
                  {
                      "data": "StartTime",
                      "render": function (data) {
                          if (data && data.Hours !== undefined) {
                              return (data.Hours % 12 || 12) + ":" +
                                  (data.Minutes < 10 ? "0" + data.Minutes : data.Minutes) +
                                  (data.Hours >= 12 ? " PM" : " AM");
                          }
                          return "";
                      }
                  },
                  {
                      "data": "EndTime",
                      "render": function (data) {
                          if (data && data.Hours !== undefined) {
                              return (data.Hours % 12 || 12) + ":" +
                                  (data.Minutes < 10 ? "0" + data.Minutes : data.Minutes) +
                                  (data.Hours >= 12 ? " PM" : " AM");
                          }
                          return "";
                      }
                  },
                  { "data": "FaclutyName" },
                  { "data": "ExpectedStudent" },
                  { "data": "Status" },
                  {
                      data: "ProgressPercent",
                      render: function (data) {

                          let p = parseInt(data) || 0;
                          let color = "bg-danger";  // default red

                          if (p < 10) color = "bg-warning";
                          else if (p < 20) color = "bg-warning";
                          else if (p < 30) color = "bg-warning";
                          else if (p < 40) color = "bg-primary";
                          else if (p < 70) color = "bg-primary";
                          else if (p < 80) color = "bg-info";
                          else if (p < 90) color = "bg-info";
                          else if (p < 100) color = "bg-success";
                          else color = "bg-success";

                          return `
        <div class="progress" style="height:18px;">
            <div class="progress-bar ${color}" role="progressbar"
                 style="width:${p}%; color:white; font-weight:900;">
                ${p}%
            </div>
        </div>`;
                      }
                  },
                  {
                      data: "BatchId",
                      render: function (data, type, row) {
                          return `<a class="btn btn-sm btn-info batchInfo-btn" data-id="${row.BatchId}">
                        <i class="fa fa-info-circle"></i> Info
                    </a>`;
                      }
                  },
                  {
                      data: "BatchId",
                      render: function (data, type, row) {
                          return `<a class="btn btn-sm btn-primary edit-btn" data-id="${row.BatchId}">
                        <i class="fa fa-edit"></i>
                    </a>
                    <a class="btn btn-sm btn-danger delete-btn" data-id="${row.BatchId}">
                        <i class="fa fa-trash"></i>
                    </a>`;
                      }
                  }
              ]
          });
      });
  </script>
    <%-- Tagify Script --%>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var textarea = document.getElementById('FooterExpectStudtxt');
        var hiddenIDs = document.getElementById('SelectedStudentIDs');
        var hiddenNames = document.getElementById('SelectedStudentNames');

        // ✅ Initialize Tagify
        var tagify = new Tagify(textarea, {
            enforceWhitelist: false,
            maxTags: 50,
            whitelist: [],
            dropdown: {
                maxItems: 10,
                enabled: 0,
                closeOnSelect: false
            }
        });

        tagify.on('input', function (e) {
            var value = e.detail.value;
            $.ajax({
                type: "POST",
                url: "BatchInfo.aspx/GetCandidates",
                data: JSON.stringify({ keyword: value }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    var candidates = result.d.map(function (item) {
                        return { value: item.Name, id: item.ID };
                    });
                    tagify.settings.whitelist = candidates;
                    tagify.dropdown.show.call(tagify, value);
                }
            });
        });

        tagify.on('change', function () {
            var selectedTags = tagify.value;
            var ids = selectedTags.map(t => t.id).filter(id => id !== '');
            var names = selectedTags.map(t => t.value).filter(n => n !== '');
            hiddenIDs.value = ids.join(',');
            hiddenNames.value = names.join('\n');
        });

        if (typeof editData !== 'undefined' && editData.ExpectedStudent) {
            try {
                console.log("Raw ExpectedStudent:", editData.ExpectedStudent);


                var fixed = editData.ExpectedStudent.replace(/\\n/g, '\n').trim();


                var names = fixed.split(/\n+/).map(n => n.trim()).filter(n => n.length > 0);

                console.log("Parsed names:", names);

                var prefilledTags = names.map(n => ({ value: n }));
                tagify.removeAllTags();
                tagify.addTags(prefilledTags);

                hiddenNames.value = names.join('\n');
            } catch (err) {
                console.error('Prefill error:', err);
            }
        }
    });

</script>
    <%-- Add Batch --%>
<script>
    function addBatch() {

        var batchType = $('#FooterBatchTypeDrp').val();
        var batchMode = $('#FooterBatchMode').val();
        var courseDrp = $('#drpDCourse');
        var batchSubject = courseDrp.find('option:selected').text().trim();
        var courseId = parseInt(courseDrp.val());
        var startDate = $('#FooterStartdatettxt').val();
        var endDate = $('#FooterEnddatettxt').val();
        var startTime = $('#FooterStartTimetxt').val();
        var endTime = $('#FooterEndTimetxt').val();
        var facultyDrp = $('#drpFaculty');
        var facultyName = facultyDrp.find('option:selected').text().trim();
        var userId = parseInt(facultyDrp.val());
        var status = $('#FooterStatus').val();

        var tagifyInput = document.getElementById('FooterExpectStudtxt');
        var expectedStudent = "";
        if (tagifyInput && tagifyInput.value) {
            try {
                var parsed = JSON.parse(tagifyInput.value);
                expectedStudent = parsed.map(t => t.value.trim()).join("\n");
            } catch (e) {
                expectedStudent = tagifyInput.value.trim();
            }
        }

        // NEW FIELDS
        var selectedIDs = $('#SelectedStudentIDs').val();
        var selectedNames = $('#SelectedStudentNames').val();
        if (!batchType) {
            return Swal.fire("Missing!", "Please select Batch Type.", "warning");
        }
        if (!batchMode) {
            return Swal.fire("Missing!", "Please select Batch Mode.", "warning");
        }
        if (!courseId || !batchSubject) {
            return Swal.fire("Missing!", "Please select a Course.", "warning");
        }
        if (!facultyName || !userId) {
            return Swal.fire("Missing!", "Please select a Faculty.", "warning");
        }
        if (!startDate) {
            return Swal.fire("Missing!", "Please select Start Date.", "warning");
        }
        if (!endDate) {
            return Swal.fire("Missing!", "Please select End Date.", "warning");
        }
        if (!startTime) {
            return Swal.fire("Missing!", "Please enter Start Time.", "warning");
        }
        if (!endTime) {
            return Swal.fire("Missing!", "Please enter End Time.", "warning");
        }
        if (!status) {
            return Swal.fire("Missing!", "Please select Status.", "warning");
        }
        if (!expectedStudent) {
            return Swal.fire("Missing!", "Please enter Candidate Name.", "warning");
        }

        // NEW fields validation
        if (!selectedIDs) {
            return Swal.fire("Missing!", "Please select minimum one enrolled student.", "warning");
        }
        $.ajax({
            type: "POST",
            url: "BatchInfo.aspx/AddBatch",
            data: JSON.stringify({
                batchType,
                batchMode,
                batchSubject,
                startDate,
                endDate,
                startTime,
                endTime,
                facultyName,
                expectedStudent,
                status,
                userId,
                courseId,
                selectedIDs,
                selectedNames
            }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.d === "success") {
                    Swal.fire({
                        icon: 'success',
                        title: 'Done!',
                        text: 'Batch added successfully!',
                        timer: 2000,
                        showConfirmButton: false
                    }).then(() => {
                        $('#myModal').modal('hide');
                        setTimeout(() => {
                            $('.modal-backdrop').remove();
                            $('body').removeClass('modal-open').css('padding-right', '');
                        }, 400);

                        $('#FooterBatchTypeDrp, #FooterBatchMode, #drpDCourse, #drpFaculty, #FooterStatus')
                            .prop('selectedIndex', 0);

                        $('#FooterStartdatettxt, #FooterEnddatettxt, #FooterStartTimetxt, #FooterEndTimetxt').val('');
                        $('#SelectedStudentIDs').val('');
                        $('#SelectedStudentNames').val('');
                        if (tagifyInput && tagifyInput._tagify) tagifyInput._tagify.removeAllTags();

                        if ($.fn.DataTable.isDataTable('#tblBatches')) {
                            $('#tblBatches').DataTable().ajax.reload(null, false);
                        }
                    });
                } else {
                    Swal.fire("Failed!", "Could not add batch. Try again.", "error");
                }
            },
            error: function (err) {
                console.error("AJAX Error:", err.responseText);
                Swal.fire("Server Error!", "Something went wrong while adding batch.", "error");
            }
        });
    }


    // Edit button click
    $(document).on("click", ".edit-btn", function () {
        var id = $(this).data("id"); // BatchId
        console.log("Selected Batch ID:", id);

        $.ajax({
            type: "POST",
            url: "BatchInfo.aspx/GetBatchById",
            data: JSON.stringify({ batchId: id }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (res) {
                console.log("Server Response:", res);
                if (res.d) {
                    var data = res.d;
                    $('#HiddenBatchID').val(data.BatchId);  
                    $("#drpDCourse").val(data.COURSEID);
                    $("#FooterBatchTypeDrp").val(data.BatchType);
                    $("#FooterBatchMode").val(data.BatchMode);
                    $('#<%= drpFaculty.ClientID %>').val(data.USERID).trigger('change');
                    $("#FooterStatus").val(data.Status);
                    $("#FooterExpectStudtxt").val(data.ExpectedStudent);

                    //safe date parsing
                    function parseJsonDate(value) {
                        if (!value) return null;
                        try {
                            var timestamp = Number(value.replace(/[^0-9]/g, ""));
                            return new Date(timestamp);
                        } catch (e) {
                            console.warn("Invalid date:", value);
                            return null;
                        }
                    }

                    var startDate = parseJsonDate(data.StartDate);
                    var endDate = parseJsonDate(data.EndDate);
                    var startTime = parseJsonDate(data.StartTime);
                    var endTime = parseJsonDate(data.EndTime);

                    // Set date only if valid
                    if (startDate instanceof Date && !isNaN(startDate))
                        $("#FooterStartdatettxt").val(startDate.toISOString().split("T")[0]);
                    if (endDate instanceof Date && !isNaN(endDate))
                        $("#FooterEnddatettxt").val(endDate.toISOString().split("T")[0]);
                    if (startTime instanceof Date && !isNaN(startTime))
                        $("#FooterStartTimetxt").val(startTime.toTimeString().slice(0, 5));
                    if (endTime instanceof Date && !isNaN(endTime))
                        $("#FooterEndTimetxt").val(endTime.toTimeString().slice(0, 5));

                    // change modal title and button visibility
                    $("#myModallabel").text("Edit Batch");
                    $("#btnSave").hide();
                    $("#btnUpdateBatch").show();

                    // modal reset & shown
                    var modalEl = document.getElementById("myModal");
                    var modal = bootstrap.Modal.getOrCreateInstance(modalEl);
                    modal.show();
                } else {
                    console.warn("No data returned from server");
                }
            },
            error: function (xhr, status, err) {
                console.error("AJAX Error:", err, xhr.responseText);
            }
        });
    });

    //Update Batch
    function updateBatch() {
        var batchId = $('#HiddenBatchID').val();
        if (!batchId) {
            Swal.fire({
                icon: 'warning',
                title: 'Oops!',
                text: 'Batch ID missing. Please select a batch to edit.'
            });
            return;
        }

        var batchType = $('#FooterBatchTypeDrp').val();
        var batchMode = $('#FooterBatchMode').val();
        var courseDrp = $('#drpDCourse');
        var batchSubject = courseDrp.find('option:selected').text().trim();
        var courseId = parseInt(courseDrp.val());

        var startDate = $('#FooterStartdatettxt').val();
        var endDate = $('#FooterEnddatettxt').val();
        var startTime = $('#FooterStartTimetxt').val();
        var endTime = $('#FooterEndTimetxt').val();

        var facultyDrp = $('#drpFaculty');
        var facultyName = facultyDrp.find('option:selected').text().trim();
        var userId = parseInt(facultyDrp.val());
        var status = $('#FooterStatus').val();
        var selectedIDs = $('#SelectedStudentIDs').val();
        var selectedNames = $('#SelectedStudentNames').val();
        // Expected Students (Tagify)
        var expectedStudent = "";
        var tagifyInput = $('#FooterExpectStudtxt').val();
        if (tagifyInput) {
            try {
                var parsed = JSON.parse(tagifyInput);
                expectedStudent = parsed.map(t => t.value.trim()).join("\n");
            } catch {
                expectedStudent = tagifyInput.trim();
            }
        }

        $.ajax({
            type: "POST",
            url: "BatchInfo.aspx/UpdateBatch",
            data: JSON.stringify({
                batchId: parseInt(batchId),
                batchType,
                batchMode,
                batchSubject,
                startDate,
                endDate,
                startTime,
                endTime,
                facultyName,
                expectedStudent,
                status,
                userId,
                courseId,
                selectedIDs,
                selectedNames
            }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            beforeSend: function () {
                $('#btnUpdateBatch').prop('disabled', true).html('<i class="fa fa-spinner fa-spin"></i> Updating...');
            },
            success: function (response) {
                if (response.d === "success") {

                    $('#myModal').modal('hide');

                    if ($.fn.DataTable.isDataTable('#tblBatches')) {
                        $('#tblBatches').DataTable().ajax.reload(null, false);
                    }
                    $('#btnSave').show();
                    $('#btnUpdateBatch').hide();
                    Swal.fire({
                        icon: 'success',
                        title: 'Updated!',
                        text: 'Batch updated successfully!',
                        timer: 2000,
                        showConfirmButton: false
                    });
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Update Failed',
                        text: response.d || 'Something went wrong. Try again.'
                    });
                }
            },
            error: function (err) {
                Swal.fire({
                    icon: 'error',
                    title: 'AJAX Error',
                    html: `<pre>${err.responseText}</pre>`
                });
            },
            complete: function () {
                $('#btnUpdateBatch').prop('disabled', false).html('Update');
                $("#myModallabel").text("Add Batch");
                $('#FooterBatchTypeDrp, #FooterBatchMode, #drpDCourse, #drpFaculty, #FooterStatus')
                    .prop('selectedIndex', 0);
                $('#FooterStartdatettxt, #FooterEnddatettxt, #FooterStartTimetxt, #FooterEndTimetxt, #FooterExpectStudtxt').val('');
            }
        });
    }
    $(document).ready(function () {
        $("#myModal").on("hidden.bs.modal", function () {
            $('#btnUpdateBatch').prop('disabled', false).html('Update');
            $('#btnSave').show();
            $('#btnUpdateBatch').hide();
            $("#myModallabel").text("Add Batch");
            $('#FooterBatchTypeDrp, #FooterBatchMode, #drpDCourse, #drpFaculty, #FooterStatus')
                .prop('selectedIndex', 0)
                .trigger('change');

            $('#FooterStartdatettxt, #FooterEnddatettxt, #FooterStartTimetxt, #FooterEndTimetxt').val('');
            $('#HiddenBatchID').val('');

            var tagifyInput = document.getElementById("FooterExpectStudtxt");
            if (tagifyInput && tagifyInput._tagify) {
                tagifyInput._tagify.removeAllTags();
                tagifyInput.value = "";
            } else {
                $('#FooterExpectStudtxt').val('');
            }
            $('.is-invalid').removeClass('is-invalid');

            console.log("Modal auto-reset done ✅");
        });
    });


    //Onchange Method for BatchType and status Dropdown
    $('#FooterBatchTypeDrp').on('change', function () {

        var batchType = $(this).val();
        var statusDDL = $('#FooterStatus');

        if (batchType === "Current") {
            statusDDL.val("Running"); 
        }
        else if (batchType === "Planned") {
            statusDDL.val("Pending");
        }
        else {
            statusDDL.prop('selectedIndex', 0);
        }
    });

    //Onchange Method for Batchstatus as Complete
    $('#FooterStatus').on('change', function () {
        var batchId = $('#HiddenBatchID').val();
        var batchstatus = $(this).val();

        if (batchstatus === "Completed") {
            $.ajax({
                type: "POST",
                url: "BatchInfo.aspx/UpdateBatchAsComplete",
                data: JSON.stringify({
                    id: parseInt(batchId),   
                    status: batchstatus
                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    $('#btnUpdateBatch')
                        .prop('disabled', true)
                        .html('<i class="fa fa-spinner fa-spin"></i> Updating...');
                },
                success: function (response) {
                    if (response.d === "success") {

                        $('#myModal').modal('hide');

                        if ($.fn.DataTable.isDataTable('#tblBatches')) {
                            $('#tblBatches').DataTable().ajax.reload(null, false);
                        }

                        $('#btnSave').show();
                        $('#btnUpdateBatch').hide();

                        Swal.fire({
                            icon: 'success',
                            title: 'Updated!',
                            text: 'Batch Marked As Completed successfully!',
                            timer: 2000,
                            showConfirmButton: false
                        });
                    }
                }
            });
        }
    });


    function editBatch(data) {
        $('#HiddenBatchID').val(data.BatchId);
        $('#FooterBatchTypeDrp').val(data.BatchType);
        $('#FooterBatchMode').val(data.BatchMode);
        $('#drpDCourse').val(data.CourseId);
        $('#FooterStartdatettxt').val(data.StartDate);
        $('#FooterEnddatettxt').val(data.EndDate);
        $('#FooterStartTimetxt').val(data.StartTime);
        $('#FooterEndTimetxt').val(data.EndTime);
        $('#drpFaculty').val(data.UserId);
        $('#FooterStatus').val(data.Status);

        if (data.ExpectedStudent) {
            if (document.getElementById('FooterExpectStudtxt')._tagify) {
                document.getElementById('FooterExpectStudtxt')._tagify.removeAllTags();
                data.ExpectedStudent.split("\n").forEach(function (name) {
                    document.getElementById('FooterExpectStudtxt')._tagify.addTags([{ value: name.trim() }]);
                });
            } else {
                document.getElementById('FooterExpectStudtxt').value = data.ExpectedStudent;
            }
        }

        $('#btnSave').hide();
        $('#btnUpdateBatch').show();
        $('#myModal').modal('show');
    }


    $("#myModal").on("hidden.bs.modal", function () {
        const $modal = $(this);


        $modal.find("input[type=text], input[type=date], input[type=time], input[type=hidden], textarea, select").each(function () {
            $(this).val("");
        });


        $modal.find("select").each(function () {
            this.selectedIndex = 0;
        });


        $modal.find("textarea").each(function () {
            if (this._tagify) {
                this._tagify.removeAllTags();
            }
        });


        $("#BatchId").val("");


        $('#btnSave').show();
        $('#btnUpdateBatch').hide();


        $("#myModallabel").text("Add Batch");

        setTimeout(() => {
            $(".modal-backdrop").remove();
            $("body").removeClass("modal-open");
            $("body").css("padding-right", "");
        }, 200);
    });
</script>
    <%-- Delete Batch --%>
<script>
    // Delete button click
    $(document).on("click", ".delete-btn", function () {
        var id = $(this).data("id"); // BatchId
        var table = $('#tblBatches').DataTable();

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

                var currentPage = table.page(); 
                var currentRecords = table.rows({ page: 'current' }).data().length;

                $.ajax({
                    type: "POST",
                    url: "BatchInfo.aspx/DeleteBatch",
                    data: JSON.stringify({ batchId: id }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (res) {
                        if (res.d === "Success") {
                            Swal.fire({
                                icon: 'success',
                                title: 'Done!',
                                text: 'Batch deleted successfully!',
                                timer: 2000,
                                showConfirmButton: false
                            }).then(() => {
                                if (currentRecords === 1) {
                                    table.page(0).draw('page');
                                }
                                table.ajax.reload(null, false);
                            });
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Failed!',
                                text: 'Delete failed!'
                            });
                        }
                    },
                    error: function (err) {
                        console.log("Error:", err.responseText);
                        Swal.fire({
                            icon: 'error',
                            title: 'Error!',
                            text: 'Something went wrong!'
                        });
                    }
                });
            }
        });
    });
</script>
    <%-- Info button click --%>
<script>

    function parseDotNetDate(dotNetDate) {
        if (!dotNetDate) return "";


        var match = /\/Date\((\d+)\)\//.exec(dotNetDate);
        if (!match) return "";

        var timestamp = parseInt(match[1]);


        var date = new Date(timestamp);


        var localDate = new Date(date.getTime() + (date.getTimezoneOffset() * 60000 * -1));


        var year = localDate.getFullYear();
        var month = ("0" + (localDate.getMonth() + 1)).slice(-2);
        var day = ("0" + localDate.getDate()).slice(-2);

        return `${year}-${month}-${day}`;
    }


    $(document).on("click", ".batchInfo-btn", function () {
        var table = $('#tblBatches').DataTable();
        var rowData = table.row($(this).closest('tr')).data();

        var dataToSend = {
            BatchId: rowData.BatchId,
            FacultyName: rowData.FaclutyName,
            StartDate: parseDotNetDate(rowData.StartDate),
            EndDate: parseDotNetDate(rowData.EndDate),
            CourseId: rowData.COURSEID,
            BatchSubject: rowData.BatchSubject
        };
        console.log("Data to send:", dataToSend);

        $.ajax({
            type: "POST",
            url: "BatchInfo.aspx/SetBatchSession",
            data: JSON.stringify(dataToSend),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function () {
                window.location.href = "BatchInfoDetails.aspx";
            },
            error: function (xhr, status, error) {
                console.error("Error:", error);
                alert("Failed to set session values.");
            }
        });
    });
</script>
    <%-- Filterations --%>
<script>
    //Filteration according to BatchType
    $('#FilterDrpBatchType').on('change', function () {
        var filterValue = $(this).val();
        var table = $('#tblBatches').DataTable();

        if (filterValue === "1") {
            // All batches
            table.column(0).search('').draw();
        }
        else if (filterValue === "2") {
            // Current batches
            table.column(0).search('Current', true, false).draw();
        }
        else if (filterValue === "3") {
            // Planned batches
            table.column(0).search('Planned', true, false).draw();
        }
    });

    //Filteration according to BatchType

    $('#FilterFacultyDrp').on('change', function () {
        var facultyName = $(this).val();
        var table = $('#tblBatches').DataTable();

        if (facultyName === "" || facultyName === "0") {
            // Show all if nothing selected
            table.column(7).search('').draw();
        } else {
            table.column(7).search(facultyName, true, false).draw();
        }
    });

    $('.navbar-nav .nav-link').on('click', function (e) {
        e.preventDefault();


        $('.navbar-nav .nav-link').removeClass('active-pill');


        $(this).addClass('active-pill');

        var course = $(this).text().trim();
        var table = $('#tblBatches').DataTable();
        var filterRegex = "";

        if (course === "ASP.NET") {
            filterRegex = "(ASP\\.NET|CSHARP|SQLSERVER|MVC|FULLSTACK|\\.NET|CORE)";
        }
        else if (course === "JAVA") {
            filterRegex = "(JAVA|J2EE|FULL STACK JAVA)";
        }
        else if (course === "Data Analytics") {
            filterRegex = "(SQL SERVER|POWER-BI|DATA ANALYTICS)";
        }

        table.column(2).search(filterRegex, true, false).draw();
    });

    $('#ClearCourse').on('click', function (e) {
        e.preventDefault();

        $('.navbar-nav .nav-link').removeClass('active-pill');

        $('#tblBatches').DataTable().column(2).search('').draw();
    });
</script>
</asp:Content>