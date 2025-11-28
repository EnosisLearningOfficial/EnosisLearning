<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMaster.Master" AutoEventWireup="true" CodeBehind="Fee.aspx.cs" Inherits="ENOSISLEARNING.Fee" %>
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
            height: 80vh;
            display: flex;
            border:1px solid transparent;
            padding:10px;
            margin:auto;
            margin-top:10px;
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
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="main">
         <div class="navbar" style="position:fixed">
             <div class="profile-pic">
                 <img class="picture" src="Images/add.png" alt="" style="width:45px"/>
             </div>
             <div class="username">
                 <asp:Label ID="lbltxt" Text="Welcome User" runat="server" CssClass="uname" style="padding-left:22px;"/>
             </div>
         </div>
              <div class="main-body" style="margin-top:55px;">
                 <%-- <asp:GridView ID="FeeGrv" runat="server"></asp:GridView>--%>
                   <div class="table-responsive">
                        <table id="FeeGrv" class="display table table-borderless" style="width:1030px;background-color:white;">
                        </table>
                   </div>
              </div>
             <asp:Label ID="Errorlbl" runat="server" />
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
