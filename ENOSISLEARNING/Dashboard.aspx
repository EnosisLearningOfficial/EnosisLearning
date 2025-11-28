<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMaster.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="ENOSISLEARNING.StudentView" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <!-- Material CDN -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!----===== Boxicons CSS ===== -->
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
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
/*           display: flex;*/
           border:1px solid transparent;
           padding:10px;
           margin:auto;
           margin-top:10px;
       }
      .card {
            width: 350px;
            height: 200px;
            background-color: #685b7b;
            border-radius: 15px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px;
            position: relative;
        }
      .card-middle
      {
             width: 350px;
             height: 200px;
             background-color: #685b7b;
             border-radius: 15px;
             box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
             display: flex;
             align-items: center;
             justify-content: space-between;
             padding: 20px;
             position: relative;
             margin-left:20px;
      } 
       .chart-container {
            width: 100%;
            max-width: 200px;
            height: 150px;
            margin: auto;
        }

        canvas {
            width: 100% !important;
            height: auto !important;
        }
      .card-right
      {
             width: 350px;
             height: 200px;
             background-color: #685b7b;
             border-radius: 15px;
             box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
             display: flex;
             align-items: center;
             justify-content: space-between;
             padding: 20px;
             position: relative;
             margin-left:20px;
      }
        
        .header {
            font-size: 18px;
            font-weight: bold;
        }

        .stats {
            font-size: 14px;
            font-weight: 600;
        }
                .score-content {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }   
        .score {
            font-size: 28px;
            font-weight: 700;
            color:#dce6eb;
        }

        .out-of {
            font-size: 14px;
            font-weight: 300;
            color:#dce6eb;
        }

        .score-icon {
            font-size: 50px;
        }
        .fee-content {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }
        .status {
            font-size: 20px;
            font-weight: 700;
            padding: 5px 10px;
            border-radius: 10px;
            text-align: center;
            width: fit-content;
        }

        .pending {
            background-color: rgba(255, 0, 0, 0.7);
            color: white;
        }

        .success {
            background-color: rgba(0, 200, 0, 0.7);
            color: white;
        }

        .fee-icon {
            font-size: 50px;
        }
        .tab
        {
            width:1060px;
            height:35vh;
            background-color:red;
            position:relative;
            top:230px;
             
        }
     /* Modern Glassmorphism Effect */
/* Ensure modal is centered */
.modal-dialog {
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 70vh; /* Full screen height */
}

/* Modern Glassmorphism Effect */
.stylish-modal {
    background: rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(10px);
    border-radius: 15px;
    border: 1px solid rgba(255, 255, 255, 0.2);
    box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
    animation: fadeIn 0.5s ease-in-out;
    max-width: 500px; /* Set a max width */
    width: 100%;
}

/* Fade-in Animation */
@keyframes fadeIn {
    from { opacity: 0; transform: scale(0.9); }
    to { opacity: 1; transform: scale(1); }
}

/* Stylish Modal Header */
.modal-header {
    background-color:#685b7b;
    color: white;
    border-top-left-radius: 15px;
    border-top-right-radius: 15px;
}

/* Stylish Modal Text */
.modal-text {
    font-size: 16px;
    color: white;
    text-align: center;
    font-weight: 500;
}

/* Select Box Styling */
.stylish-select {
    border: 2px solid #685b7b;
    border-radius: 10px;
    padding: 10px;
    font-size: 16px;
}

/* Button Styling */
.stylish-btn {
    background: linear-gradient(135deg, #007bff, #6610f2);
    color: white;
    padding: 10px 15px;
    border-radius: 8px;
    font-weight: 600;
    transition: 0.3s;
}

.stylish-btn:hover {
    background: linear-gradient(135deg, #6610f2, #007bff);
    color: white;
}

/* Save Button */
.stylish-save {
    background: #28a745;
    border-radius: 8px;
    font-weight: 600;
    padding: 10px 15px;
    transition: 0.3s;
}

.stylish-save:hover {
    background: #218838;
}
    .add
    {
        width:100%;
        height:30px;
        background-color:transparent;
        position:relative;
        right:0px;
    }
    .right-btn
    {
         width:140px;
         height:100%;
         background-color:#ffb900;
         float:right;
         padding:4px;
         border-radius:15px;
         text-align:center;
         position:relative;
         right:5px;
         box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }
    .info
    { 
         margin-top:10px;
         width:100%;
         height:70%;
         background-color:transparent;
         display:flex;
    }
    .a
    {
        text-decoration:none;
        color:#212529;
        font-weight:bold;
    }
    .a:hover
    {
        color:#0277bd;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
     <%-- Create Batch Modal Popup --%>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
   <div class="modal fade" id="CreateModal" tabindex="-1" aria-labelledby="CreateModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content stylish-modal">
                <div class="modal-header">
                    <h5 class="modal-title" id="CreateModalLabel">✨ Add New Course</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p class="modal-text">Select a course and enroll now! 🚀</p>
                   <%-- <asp:DropDownList ID="CourseDrp" runat="server" CssClass="form-control stylish-select" AutoPostBack="true"></asp:DropDownList>--%>
                    <input type="hidden" id="CandidateIDHidden" value="<%= Session["CANDID"] %>" />
                    <select id="CourseDrp" class="form-control stylish-select"></select>
                    <select id="FacultyDrp" class="form-control stylish-select"></select>
                <%--   <asp:DropDownList ID="FacultyDrp" runat="server" CssClass="form-control stylish-select" AutoPostBack="true"></asp:DropDownList>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary stylish-save">Enroll Now</button>
                </div>
            </div>
        </div>
    </div>
    </ContentTemplate>
</asp:UpdatePanel>
 <%-- Create Batch Modal Popup --%>
    <div class="main">
         <asp:Label ID="lbltxt" Text="Welcome User" runat="server" CssClass="uname" style="padding-left:22px;display:none;"/>
       <%-- <div class="navbar" style="position:fixed">
            <div class="profile-pic">
                <img class="picture" src="Images/add.png" alt="" style="width:45px"/>
            </div>
            <div class="username">
               
            </div>
        </div>--%>
        <div class="main-body"> 
            <div class="add">
               <%-- <div class="right-btn" style="margin-top:40px;">
                    <a id="btnRDemo" href="#" data-bs-toggle="modal" data-bs-target="#CreateModal" class="a">
                        <i class='fa fa-plus' style="color:#0277bd"></i>
                        <span class="text nav-text">Join Batch</span>
                    </a>
                </div>     --%>
            </div>
           <%-- <div class="info">
                   <div class="card" style="margin-top:10px;">
                          <div class="header">Attendance Overview</div>
                                <div class="chart-container">
                                    <canvas id="attendanceChart"></canvas>
                                </div>
                          </div>
                   <div class="card-middle" style="margin-top:10px;">
                        <div class="score-content">
                            <div class="header">Last Test Score</div>
                            <div class="score" id="testScore">45</div>
                            <div class="out-of">Out of 50</div>
                        </div>
                <!-- Right Side: Trophy Icon -->
                        <div class="score-icon">🏆</div>
                   </div>
                   <div class="card-right" style="margin-top:10px;">
                        <div class="fee-content">
                    <div class="header">Fee Status</div>
                    <div id="feeStatus" class="status pending">Pending</div> <!-- Change class to "success" for successful -->
                </div>
                <!-- Right Side: Money Icon -->
                <div class="fee-icon">💰</div>
                   </div>
                 </div>--%>
            </div>
        <asp:Label ID="Errorlbl" runat="server" />
        </div>
<!-- jQuery (Required for Bootstrap Modals) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
 <!-- Chart.js CDN -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let present = 20;
            let absent = 5;

            let ctx = document.getElementById("attendanceChart").getContext("2d");

            new Chart(ctx, {
                type: "doughnut",
                data: {
                    labels: ["Present", "Absent"],
                    datasets: [{
                        data: [present, absent],
                        backgroundColor: ["#4CAF50", "#FF5733"],
                        hoverBackgroundColor: ["#45A049", "#D84315"]
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            position: "right",
                            labels: { color: "white" }
                        }
                    }
                }
            });
        });
    </script>
<%-- <script>
     function updateProgress() {
         let present = parseInt(document.getElementById("presentCount").textContent);
         let absent = parseInt(document.getElementById("absentCount").textContent);
         let total = present + absent;
         let percentage = Math.round((present / total) * 100);

         let progressCircle = document.getElementById("progressCircle");
         progressCircle.style.background = `conic-gradient(#4CAF50 ${percentage * 3.6}deg, #ddd ${percentage * 3.6}deg)`;

         document.getElementById("progressText").textContent = percentage + "%";
     }

     // Run function on page load
     updateProgress();
 </script>--%>
 <script>
     // Example: You can update the score dynamically
     let lastTestScore = 45;  // Change this as needed
     document.getElementById("testScore").textContent = lastTestScore;
 </script>
<script>
    // Example: You can dynamically change the fee status
    let feeStatus = "Pending"; // Change this to "Successful" to update the UI
    let statusElement = document.getElementById("feeStatus");

    if (feeStatus === "Successful") {
        statusElement.textContent = "Successful";
        statusElement.classList.remove("pending");
        statusElement.classList.add("success");
    } else {
        statusElement.textContent = "Pending";
        statusElement.classList.remove("success");
        statusElement.classList.add("pending");
    }
</script>
<script>
    $(document).ready(function () {
        $.ajax({
            type: "POST",
            url: "Dashboard.aspx/GetCourses",  // Check spelling
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var courses = response.d;
                var $dropdown = $("#CourseDrp"); // ID Direct Use Karein

                $dropdown.empty().append('<option value="">Select Course</option>');

                $.each(courses, function (index, course) {
                    $dropdown.append('<option value="' + course.CourseID + '">' + course.CourseName + '</option>');
                });

                console.log("Dropdown Updated Successfully!");
            },
            error: function (xhr, status, error) {
                console.log("AJAX Error:", error);
                console.log("Response Text:", xhr.responseText);
            }
        });
    });
</script>
<script>
    $(document).ready(function () {
        $.ajax({
            type: "POST",
            url: "Dashboard.aspx/GetFaculty",  // Check spelling
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var faculty = response.d;
                var $dropdown = $("#FacultyDrp"); // ID Direct Use Karein

                $dropdown.empty().append('<option value="">Select Instructor</option>');

                $.each(faculty, function (index, facultyMember) {
                    $dropdown.append('<option value="' + facultyMember.UserId + '">' + facultyMember.UserName + '</option>');
                });

                console.log("Dropdown Updated Successfully!");
            },
            error: function (xhr, status, error) {
                console.log("AJAX Error:", error);
                console.log("Response Text:", xhr.responseText);
            }
        });
    });
</script>
<%-- Request for Batch Enrollment --%>
<script>
    $(document).ready(function () {
        $(".stylish-save").click(function () {
            var facultyID = $("#FacultyDrp").val();
            var candidateID = $("#CandidateIDHidden").val();
            var courseID = $("#CourseDrp").val();
            var approvedBy = "Null"; // Replace with actual username

            if (facultyID === "" || courseID === "") {
                alert("Please select both Course and Faculty.");
                return;
            }

            $.ajax({
                type: "POST",
                url: "Dashboard.aspx/SaveEnrollment",
                data: JSON.stringify({ facultyID: facultyID, candidateID: candidateID, courseID: courseID, approvedBy: approvedBy }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d === "Success") {
                        alert("Batch Enrollment Request Submitted Successfully!");

                        //Reset dropdowns after successful save
                        $("#CourseDrp").val("").trigger("change");
                        $("#FacultyDrp").val("").trigger("change");

                        // 🔥 Close modal after saving
                        $("#CreateModal").modal("hide");
                    } else if (response.d === "AlreadyEnrolled") {
                        alert("You are already enrolled in this course!");
                    } else {
                        alert("Error: " + response.d);
                    }
                },
                error: function (xhr, status, error) {
                    console.log("AJAX Error:", error);
                    console.log("Response Text:", xhr.responseText);
                }
            });
        });
    });
</script>
<%-- Request for Batch Enrollment --%>
</asp:Content>
