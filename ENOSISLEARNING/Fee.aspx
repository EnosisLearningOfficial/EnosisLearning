<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMaster.Master" AutoEventWireup="true" CodeBehind="Fee.aspx.cs" Inherits="ENOSISLEARNING.Fee" %>
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
#FeeGrv thead th {
    font-weight: 600;
    font-size: 14px;
    color: #495057;
    white-space: nowrap;
}

#FeeGrv tbody td {
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

 .fa-sack-dollar {
   animation: jump 1s infinite;
 }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container-fluid attendance-wrapper">
    <!-- Page Header -->
    <div class="page-header">
        <h4>
        <i class="fa-solid fa-sack-dollar" style="color:#42be00"></i>
            Fee Details
        </h4>
    </div>
    <!-- Table Section -->
    <div class="table-card">
        <div class="table-responsive">
             <table id="FeeGrv" class="table table-hover align-middle w-100"></table>
        </div>
    </div>
    <asp:Label ID="Errorlbl" runat="server" CssClass="text-danger mt-2 d-block" />
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $.ajax({
            type: "POST",
            url: "Fee.aspx/GetFee",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.d.length === 0) {
                    alert("No data found!");
                    return;
                }

                $("#FeeGrv").DataTable({
                    destroy: true, // Allows reloading table without errors
                    responsive: true,
                    bLengthChange: true,
                    lengthMenu: [[5, 10, -1], [5, 10, "All"]],
                    bFilter: true,
                    bSort: true,
                    bPaginate: true,
                    data: response.d,
                    columns: [
                        { title: "Id", data: "CANDIDATEID" },
                        { title: "Student Name", data: "FULLNAME" },
                        { title: "Date", data: "CREATEDDATE" },
                        { title: "Amount", data: "FEESAMOUNT" },
                        { title: "Paid By", data: "FEESPAIDDATE" },
                        { title: "Due By", data: "FEESDUEDATE" },
                        { title: "Fee Type", data: "FEESTYPE" },
                        { title: "Status", data: "STATUS" }
                    ]
                });
            },
            error: function (xhr, status, error) {
                console.error("AJAX Error: ", status, error);
                alert("Error fetching data. Please try again.");
            }
        });
    });
</script>
</asp:Content>
