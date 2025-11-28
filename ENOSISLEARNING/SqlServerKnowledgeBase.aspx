<%@ Page Title="" Language="C#" MasterPageFile="~/LEARNING.Master" AutoEventWireup="true" CodeBehind="SqlServerKnowledgeBase.aspx.cs" Inherits="ENOSISLEARNING.KnowledgeBase.SqlServerKnowledgeBase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    
   <style type="text/css">

    h1 {
        text-align: center;
        font-weight: 300;
        font-size: 3rem;
        margin-bottom: 25px;
        color: #333;
    }

    .section {
        background: linear-gradient(135deg, #173151, #1f3a6e);
        border-radius: 10px;
        padding: 30px;
        margin-bottom: 25px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
    }

    .section-label {
        display: inline-block;
        background-color: #D9534F;
        padding: 10px 20px;
        border-radius: 5px;
        font-size: 1.5rem;
        font-weight: bold;
        margin-bottom: 10px;
        color:white;
    }

    .link-list p {
        margin: 5px 0;
    }

    .link-list a {
        color: #fff;
        font-size: 1.4567rem;
        text-decoration: none;
        word-break: break-all;
        transition: color 0.3s;
    }

    .link-list a:hover {
        color: #ffcc00;
        text-decoration: underline;
    }

    @media (max-width: 768px) {
        .section-label {
            font-size: 1.1rem;
        }

        h1 {
            font-size: 2.2rem;
        }
    }
     
/* Hover animation */
.training-program h3 i:hover {
  transform: scale(1.2) rotate(8deg);
  color: #4fd1c5; /* soft cyan on hover */
}
@keyframes pulse {
  0%, 100% { transform: scale(1); opacity: 1; }
  50% { transform: scale(1.2); opacity: 0.7; }
}
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

              <div class="container-fluid">
      <div class="row">
    <div class="col-lg-12 col-sm-12">
      <div class="training-program">
        <h3>
                         <i class="fa-solid fa-star" style="color:gold;animation: pulse 1.5s infinite;font-size:2.5rem"></i>
          <span style="color:#FFA521;">SQL Knowledge Base</span>
        </h3>
      </div>
    </div>
</div>

    <div class="section">
        <span class="section-label">Tutorials</span>
        <div class="link-list">
            <p><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="https://www.tutorialgateway.org/sql/">https://www.tutorialgateway.org/sql/</asp:HyperLink></p>
            <p><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="https://www.tutorialspoint.com/ms_sql_server/index.htm">https://www.tutorialspoint.com/ms_sql_server/index.htm</asp:HyperLink></p>
            <p><asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="https://www.sqlservertutorial.net/">https://www.sqlservertutorial.net/</asp:HyperLink></p>
        </div>
    </div>

    <div class="section">
        <span class="section-label">Interview Questions</span>
        <div class="link-list">
            <p><asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="https://www.enosislearning.com/Interview_Questions.aspx?lag=SQL%20Server">https://www.enosislearning.com/Interview_Questions.aspx?lag=SQL%20Server</asp:HyperLink></p>
        </div>
    </div>

    <div class="section">
        <span class="section-label">Exams / Online Quiz</span>
        <div class="link-list">
            <p><asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="https://career.guru99.com/sql-server-quiz/">https://career.guru99.com/sql-server-quiz/</asp:HyperLink></p>
            <p><asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="https://www.tutorialsteacher.com/online-test/sqlserver-test">https://www.tutorialsteacher.com/online-test/sqlserver-test</asp:HyperLink></p>
            <p><asp:HyperLink ID="HyperLink13" runat="server" NavigateUrl="https://www.w3schools.com/sql/sql_quiz.asp">https://www.w3schools.com/sql/sql_quiz.asp</asp:HyperLink></p>
            <p><asp:HyperLink ID="HyperLink14" runat="server" NavigateUrl="https://www.onlineinterviewquestions.com/sql-server-mcq/">https://www.onlineinterviewquestions.com/sql-server-mcq/</asp:HyperLink></p>
        </div>
    </div>
</div>
    
</asp:Content>


