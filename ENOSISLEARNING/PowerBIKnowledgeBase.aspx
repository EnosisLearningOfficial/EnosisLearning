<%@ Page Title="" Language="C#" MasterPageFile="~/LEARNING.Master" AutoEventWireup="true" CodeBehind="PowerBIKnowledgeBase.aspx.cs" Inherits="ENOSISLEARNING.KnowledgeBase.PowerBIKnowledgeBase" %>
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
          <span style="color:#FFA521;">Power BI Knowledge Base</span>
        </h3>
      </div>
    </div>
</div>

    <div class="section">
        <span class="section-label">Tutorials</span>
        <div class="link-list">
            <p> <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="https://www.tutorialgateway.org/power-bi-tutorial/" >https://www.tutorialgateway.org/power-bi-tutorial/ </asp:HyperLink></p>
               
                   <p><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="https://data-flair.training/blogs/power-bi-tutorial/"  > https://data-flair.training/blogs/power-bi-tutorial/ </asp:HyperLink></p>
              
                   <p><asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="https://www.mssqltips.com/sqlservertip/6792/analyzing-and-visualizing-data-with-microsoft-power-bi-certification/" > https://www.mssqltips.com/sqlservertip/6792/analyzing-and-visualizing-data-with-microsoft-power-bi-certification/ </asp:HyperLink></p>
               
                   <p><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="https://docs.microsoft.com/en-us/learn/certifications/exams/da-100?tab=tab-learning-paths"  > https://docs.microsoft.com/en-us/learn/certifications/exams/da-100?tab=tab-learning-paths </asp:HyperLink></p>
        </div>
    </div>

    <div class="section">
        <span class="section-label">Case Study</span>
        <div class="link-list">
            <p><asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="https://docs.microsoft.com/en-us/power-bi/create-reports/sample-customer-profitability" > https://docs.microsoft.com/en-us/power-bi/create-reports/sample-customer-profitability </asp:HyperLink></p>
             
 <p><asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="https://www.mssqltips.com/sqlservertip/6792/analyzing-and-visualizing-data-with-microsoft-power-bi-certification/" > https://www.mssqltips.com/sqlservertip/6792/analyzing-and-visualizing-data-with-microsoft-power-bi-certification/ </asp:HyperLink></p>
<p><asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="https://docs.microsoft.com/en-us/learn/certifications/exams/da-100?tab=tab-learning-paths" > https://docs.microsoft.com/en-us/learn/certifications/exams/da-100?tab=tab-learning-paths</asp:HyperLink></p>
 <p><asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="https://hevodata.com/learn/top-10-best-power-bi-dashboard-examples-in-2021/" >https://hevodata.com/learn/top-10-best-power-bi-dashboard-examples-in-2021/ </asp:HyperLink></p>
        </div>
    </div>

    <div class="section">
        <span class="section-label">Deployment</span>
        <div class="link-list">
              <p><asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="https://www.red-gate.com/simple-talk/databases/sql-server/bi-sql-server/deploying-securing-updating-power-bi-reports/" >https://www.red-gate.com/simple-talk/databases/sql-server/bi-sql-server/deploying-securing-updating-power-bi-reports/ </asp:HyperLink></p>
        </div>
    </div>
    <div class="section">
        <span class="section-label">Interview Questions</span>
        <div class="link-list">
            <p><asp:HyperLink ID="HyperLink13" runat="server" NavigateUrl="https://www.enosislearning.com/Interview_Questions.aspx?lag=POWERBI"  >https://www.enosislearning.com/Interview_Questions.aspx?lag=POWERBI</asp:HyperLink></p>
               
                  <p> <asp:HyperLink ID="HyperLink14" runat="server" NavigateUrl="https://data-flair.training/blogs/power-bi-interview-questions/" >https://data-flair.training/blogs/power-bi-interview-questions/ </asp:HyperLink></p>             
        </div>
    </div>
    <div class="section">
        <span class="section-label">Exams / Online Quiz</span>
        <div class="link-list">             
                 <p> <asp:HyperLink ID="HyperLink15" runat="server" NavigateUrl="https://data-flair.training/blogs/power-bi-quiz/"  > https://data-flair.training/blogs/power-bi-quiz/ </asp:HyperLink></p>         
        </div>
    </div>
</div>
</asp:Content>


