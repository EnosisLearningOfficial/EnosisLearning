<%@ Page Title="" Language="C#" MasterPageFile="~/LEARNING.Master" AutoEventWireup="true" CodeBehind="courses.aspx.cs" Inherits="ENOSISLEARNING.courses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
        .main
        {
            margin-top:10px;
        }
      .card {
          margin-bottom: 20px;
        }

        .col-sm-6, .col-md-3 {
          padding-left: 15px;  
          padding-right: 15px;  
        }

        .row {
          margin-left: -15px;
          margin-right: -15px;
        }
        .card img
        {
            width:100%;
            height:150px;
        }
        .card h3
        {
            font-size:16px;
            text-align:center;
            position:relative;
            bottom:0px;
        }
         .card h3:hover
         {
             color:dodgerblue;
         }
         .anchor
         {
             text-decoration:none;
             color:#333;
         }
         .anchor .star
         {
             position:relative;
             bottom:0px;
         }
         .row.last-row {
          display: flex;
          justify-content: left;
          margin-left:0px;
        }
       @media (max-width: 767px) {
  .row.last-row .col-sm-6 {
    float: none;
    width: 98%;
    max-width: none;
    margin: 0 auto;
    margin-left:-4px;
  }

  .card {
    margin: 10px 0; /* spacing between cards */
    max-width: 100%; /* make it full width */
  }
}

       
.course-card {
  position: relative;
  overflow: hidden;
}

.course-card img {
  width: 100%;
  display: block;
  transition: transform 0.5s ease;
}

/* Hover zoom effect */
.course-card:hover img {
  transform: scale(1.1);
}

/* Overlay */
.course-card .overlay {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0,0,0,0.7);
  color: #fff;
  padding: 15px;
  text-align: center;
  transform: translateY(100%);
  transition: transform 0.4s ease;
}

.course-card:hover .overlay {
  transform: translateY(0);
  cursor:pointer;
}

.course-card .overlay h4 {
  margin: 0;
  color: #00c4ff;  
  font-weight: bold;
}
.course-card .overlay p {
  margin: 5px 0 0;
  font-style: italic;
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    	   <div class="container main">
  <div class="row">
      <%-- 1 --%>
    <div class="col-sm-6 col-md-3">
      <div class="card">
        <div class="card-body text-center">
           <div class="course-card">
                    <img src="Images/programming-language-1.jpg" class="img-responsive" alt="Course"/>
                    <div class="overlay">
                        <a href="c-training-in-pune.aspx" class="dc" data-course="1"><i class="fa-solid fa-square-arrow-up-right" style="color:white;"></i></a>
                    </div>
           </div>
                 <a href="#" class="anchor">
                      <h3 class="pt-2">Complete C Language Bootcamp</h3>
                        <div class="text-center star">
                          <span class="text-warning">&#9733;</span>
                          <span class="text-warning">&#9733;</span>
                          <span class="text-warning">&#9733;</span>
                          <span class="text-warning">&#9733;</span>
                          <span class="text-warning">&#9733;</span>(22)
                      </div>
                 </a>
        </div>
      </div>
    </div>
    <%-- 2 --%>
    <div class="col-sm-6 col-md-3">
      <div class="card">
        <div class="card-body text-center">
          <div class="course-card">
                     <img src="Images/programming-language-3.jpg" class="img-responsive" alt="Course"/>
                     <div class="overlay">
                         <a href="java-training-in-pune.aspx" class="dc" data-course="20"><i class="fa-solid fa-square-arrow-up-right" style="color:white;"></i></a>
                     </div>
            </div>
                  <a href="java-training-in-pune.aspx" class="dc anchor" data-course="20">
                      <h3 class="pt-2">Complete Java Language Bootcamp</h3>
                         <div class="text-center star">
                           <span class="text-warning">&#9733;</span>
                           <span class="text-warning">&#9733;</span>
                           <span class="text-warning">&#9733;</span>
                           <span class="text-warning">&#9733;</span>
                           <span class="text-warning">&#9733;</span>(10)
                       </div>
                  </a>
        </div>
      </div>
    </div>
    <%-- 3 --%>
    <div class="col-sm-6 col-md-3">
      <div class="card">
        <div class="card-body text-center">
          <div class="course-card">
         <img src="Images/programming-language-4.png" class="img-responsive" alt="Course"/>
         <div class="overlay">
             <a href="dot-net-training-in-pune.aspx" class="dc" data-course="5"><i class="fa-solid fa-square-arrow-up-right" style="color:white;"></i></a>
         </div>
</div>
                    <a href="dot-net-training-in-pune.aspx" class="dc anchor" data-course="5">
                        <h3 class="pt-2">Complete Full Stack .Net Bootcamp</h3>
                           <div class="text-center star">
                             <span class="text-warning">&#9733;</span>
                             <span class="text-warning">&#9733;</span>
                             <span class="text-warning">&#9733;</span>
                             <span class="text-warning">&#9733;</span>
                             <span class="text-warning">&#9733;</span>(10)
                         </div>
                    </a>
        </div>
      </div>
    </div>
    <%-- 4 --%>
    <div class="col-sm-6 col-md-3">
      <div class="card">
        <div class="card-body text-center">
                   <div class="course-card">
         <img src="Images/programming-language-5.png" class="img-responsive" alt="Course"/>
         <div class="overlay">
             <a href="dot-net-core-training-pune.aspx" class="dc" data-course="30"><i class="fa-solid fa-square-arrow-up-right" style="color:white;"></i></a>
         </div>
</div>
                 <a href="dot-net-core-training-pune.aspx" class="dc anchor" data-course="30">
                      <h3 class="pt-2">Complete .Net Core Bootcamp</h3>
                        <div class="text-center star">
                          <span class="text-warning">&#9733;</span>
                          <span class="text-warning">&#9733;</span>
                          <span class="text-warning">&#9733;</span>
                          <span class="text-warning">&#9733;</span>
                          <span class="text-warning">&#9733;</span>(22)
                      </div>
                 </a>
        </div>
      </div>
    </div>
    
  </div>
  <div class="row">
      <%-- 1 --%>
    <div class="col-sm-6 col-md-3">
      <div class="card">
        <div class="card-body text-center">
                   <div class="course-card">
         <img src="Images/programming-language-6.png" class="img-responsive" alt="Course"/>
         <div class="overlay">
             <a href="web-designing-training-in-pune.aspx" class="dc" data-course="8"><i class="fa-solid fa-square-arrow-up-right" style="color:white;"></i></a>
         </div>
</div>
                   <a href="web-designing-training-in-pune.aspx" class="dc anchor" data-course="8">
                       <h3 class="pt-2">Complete Web Design Bootcamp</h3>
                         <div class="text-center star">
                           <span class="text-warning">&#9733;</span>
                           <span class="text-warning">&#9733;</span>
                           <span class="text-warning">&#9733;</span>
                           <span class="text-warning">&#9733;</span>
                           <span class="text-warning">&#9733;</span>(10)
                       </div>
                  </a>
        </div>
      </div>
    </div>
    <%-- 2 --%>
    <div class="col-sm-6 col-md-3">
      <div class="card">
        <div class="card-body text-center">
                      <div class="course-card">
         <img src="Images/programming-language-7.png" class="img-responsive" alt="Course"/>
         <div class="overlay">
             <a href="Sql-training-in-pune.aspx" class="dc" data-course="6"><i class="fa-solid fa-square-arrow-up-right" style="color:white;"></i></a>
         </div>
</div>
         <a href="Sql-training-in-pune.aspx" class="dc anchor" data-course="6">
                      <h3 class="pt-2">Complete Microsoft SQL Server Bootcamp</h3>
                         <div class="text-center star">
                           <span class="text-warning">&#9733;</span>
                           <span class="text-warning">&#9733;</span>
                           <span class="text-warning">&#9733;</span>
                           <span class="text-warning">&#9733;</span>
                           <span class="text-warning">&#9733;</span>(10)
                       </div>
                  </a>
        </div>
      </div>
    </div>
    <%-- 3 --%>
    <div class="col-sm-6 col-md-3">
      <div class="card">
        <div class="card-body text-center">
                    <div class="course-card">
         <img src="Images/programming-language-8.png" class="img-responsive" alt="Course"/>
         <div class="overlay">
             <a href="power-bi-training-in-pune.aspx" class="dc" data-course="25"><i class="fa-solid fa-square-arrow-up-right" style="color:white;"></i></a>
         </div>
</div>
                    <a href="power-bi-training-in-pune.aspx" class="dc anchor" data-course="25">
                        <h3 class="pt-2">Complete Microsoft Power BI Bootcamp</h3>
                           <div class="text-center star">
                             <span class="text-warning">&#9733;</span>
                             <span class="text-warning">&#9733;</span>
                             <span class="text-warning">&#9733;</span>
                             <span class="text-warning">&#9733;</span>
                             <span class="text-warning">&#9733;</span>(10)
                         </div>
                    </a>
        </div>
      </div>
    </div>
    <%-- 4 --%>
    <div class="col-sm-6 col-md-3">
      <div class="card">
        <div class="card-body text-center">
                  <div class="course-card">
         <img src="Images/programming-language-9.png" class="img-responsive" alt="Course"/>
         <div class="overlay">
             <a href="data-analytics-trainig-in-pune.aspx" class="dc" data-course="29"><i class="fa-solid fa-square-arrow-up-right" style="color:white;"></i></a>
         </div>
</div>
                   <a href="data-analytics-trainig-in-pune.aspx" class="dc anchor" data-course="29">
                       <h3 class="pt-2">Complete Data Analytics Bootcamp</h3>
                          <div class="text-center star">
                            <span class="text-warning">&#9733;</span>
                            <span class="text-warning">&#9733;</span>
                            <span class="text-warning">&#9733;</span>
                            <span class="text-warning">&#9733;</span>
                            <span class="text-warning">&#9733;</span>(10)
                        </div>
                   </a>
        </div>
      </div>
    </div>
    <div class="row last-row">
  <div class="col-sm-6 col-md-3">
    <div class="card">
      <div class="card-body text-center">
                 <div class="course-card">
         <img src="Images/programming-language-2.png" class="img-responsive" alt="Course"/>
         <div class="overlay">
             <a href="c-plus-plus-training-in-pune.aspx" class="dc" data-course="2"><i class="fa-solid fa-square-arrow-up-right" style="color:white;"></i></a>
         </div>
            </div>
                 <a href="c-plus-plus-training-in-pune.aspx" class="dc anchor" data-course="2">
                      <h3 class="pt-2">Complete C++ Language Bootcamp</h3>
                        <div class="text-center star">
                          <span class="text-warning">&#9733;</span>
                          <span class="text-warning">&#9733;</span>
                          <span class="text-warning">&#9733;</span>
                          <span class="text-warning">&#9733;</span>
                          <span class="text-warning">&#9733;</span>(22)
                      </div>
                 </a>
      </div>
    </div>
  </div>
</div>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const menuItems = document.querySelectorAll(".dc[data-course]");

        menuItems.forEach(item => {
            const courseId = item.getAttribute("data-course");
            const link = item;

            if (courseId) {
                link.addEventListener("click", function (e) {
                    e.preventDefault();

                    fetch('SetCourseSession.aspx', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json' },
                        body: JSON.stringify({ courseId: courseId })
                    })
                        .then(response => {
                            if (response.ok) {
                                window.location.href = link.getAttribute("href");
                            } else {
                                console.error("Failed to set session.");
                            }
                        })
                        .catch(error => console.error("Error:", error));
                });
            }
        });
    });
</script>
</asp:Content>
