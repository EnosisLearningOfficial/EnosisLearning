<%@ Page Title="" Language="C#" MasterPageFile="~/LEARNING.Master" AutoEventWireup="true" CodeBehind="CSharpKnowledgeBase.aspx.cs" Inherits="ENOSISLEARNING.KnowledgeBase.CSharpKnowledgeBase" %>
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
          <span style="color:#FFA521;">CSHARP Tutorials</span>
        </h3>
      </div>
    </div>
</div>

    <div class="section">
        <span class="section-label">.Net Framework</span>
        <div class="link-list">
           <p> <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="https://www.c-sharpcorner.com/UploadFile/cb1429/net-framework-overview/"  >https://www.c-sharpcorner.com/UploadFile/cb1429/net-framework-overview/</asp:HyperLink></p>
               
                    <p><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="https://www.geeksforgeeks.org/introduction-to-net-framework/"  >https://www.geeksforgeeks.org/introduction-to-net-framework/</asp:HyperLink></p>
               
                    <p><asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="https://www.geeksforgeeks.org/c-sharp-net-framework-basic-architecture-component-stack/?ref=rp"  >https://www.geeksforgeeks.org/c-sharp-net-framework-basic-architecture-component-stack/?ref=rp</asp:HyperLink></p>
               
                    <p><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="https://www.geeksforgeeks.org/garbage-collection-in-c-sharp-dot-net-framework/?ref=rp"  >https://www.geeksforgeeks.org/garbage-collection-in-c-sharp-dot-net-framework/?ref=rp</asp:HyperLink></p>
        </div>
    </div>

    <div class="section">
        <span class="section-label">CSharp</span>
        <div class="link-list">
            <p><asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="https://www.tutlane.com/tutorial/csharp" >https://www.tutlane.com/tutorial/csharp</asp:HyperLink></p>            
  <p><asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="https://www.tutorialspoint.com/csharp/index.htm" >https://www.tutorialspoint.com/csharp/index.htm</asp:HyperLink></p>
 <p><asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="https://www.tutorialsteacher.com/csharp/csharp-tutorials"  >https://www.tutorialsteacher.com/csharp/csharp-tutorials</asp:HyperLink></p>
  <p><asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="https://www.c-sharpcorner.com"  >https://www.c-sharpcorner.com</asp:HyperLink></p>
  <p> <asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="https://www.codeproject.com/"  >https://www.codeproject.com/</asp:HyperLink></p>
        </div>
    </div>

    <div class="section">
        <span class="section-label">OOPS</span>
        <div class="link-list">
              <p><asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="http://www.codeproject.com/Articles/22769/Introduction-to-Object-Oriented-Programming-Concep" >http://www.codeproject.com/Articles/22769/Introduction-to-Object-Oriented-Programming-Concep</asp:HyperLink></p>
               
                    <p><asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="http://www.codeproject.com/Articles/1445/Introduction-to-inheritance-polymorphism-in-C"  >http://www.codeproject.com/Articles/1445/Introduction-to-inheritance-polymorphism-in-C</asp:HyperLink></p>
        </div>
    </div>
    <div class="section">
        <span class="section-label">Collections in .Net</span>
        <div class="link-list">
            <p><asp:HyperLink ID="HyperLink13" runat="server" NavigateUrl="https://www.c-sharpcorner.com/article/collections-in-net/"  >https://www.c-sharpcorner.com/article/collections-in-net/</asp:HyperLink></p>
               
                   <p> <asp:HyperLink ID="HyperLink14" runat="server" NavigateUrl="https://www.geeksforgeeks.org/collections-in-c-sharp/"  >https://www.geeksforgeeks.org/collections-in-c-sharp/</asp:HyperLink></p>            
        </div>
    </div>
    <div class="section">
        <span class="section-label">Best Practices</span>
        <div class="link-list">
            <p> <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="https://www.c-sharpcorner.com/blogs/c-sharp-coding-guidelines-and-best-practices-v10" >https://www.c-sharpcorner.com/blogs/c-sharp-coding-guidelines-and-best-practices-v10</asp:HyperLink></p>
               
                    <p><asp:HyperLink ID="HyperLink16" runat="server" NavigateUrl="https://docs.microsoft.com/en-us/dotnet/csharp/fundamentals/coding-style/coding-conventions#naming-conventions" >https://docs.microsoft.com/en-us/dotnet/csharp/fundamentals/coding-style/coding-conventions#naming-conventions</asp:HyperLink></p>   
        </div>
    </div>
    <div class="section">
        <span class="section-label">Delegates</span>
        <div class="link-list">
           <p><asp:HyperLink ID="HyperLink26" runat="server" NavigateUrl="https://www.c-sharpcorner.com/UploadFile/puranindia/C-Sharp-net-delegates-and-events/" >https://www.c-sharpcorner.com/UploadFile/puranindia/C-Sharp-net-delegates-and-events/</asp:HyperLink></p>
        </div>
    </div>
    <div class="section">
        <span class="section-label">ExceptionHanding</span>
        <div class="link-list">
          <p><asp:HyperLink ID="HyperLink27" runat="server" NavigateUrl="https://www.c-sharpcorner.com/article/exception-handling-in-C-Sharp/" >https://www.c-sharpcorner.com/article/exception-handling-in-C-Sharp/</asp:HyperLink></p>
        </div>
    </div>
    <div class="section">
        <span class="section-label">DLL in .Net</span>
        <div class="link-list">
         <p><asp:HyperLink ID="HyperLink28" runat="server" NavigateUrl="https://www.c-sharpcorner.com/UploadFile/1e050f/creating-and-using-dll-class-library-in-C-Sharp/" >https://www.c-sharpcorner.com/UploadFile/1e050f/creating-and-using-dll-class-library-in-C-Sharp/</asp:HyperLink></p>
               
                    <p><asp:HyperLink ID="HyperLink29" runat="server" NavigateUrl="https://www.onlinebuff.com/article_how-to-deploy-an-assembly-into-gacglobal-assembly-cache-_38.html"  >https://www.onlinebuff.com/article_how-to-deploy-an-assembly-into-gacglobal-assembly-cache-_38.html</asp:HyperLink></p>
        </div>
    </div>
    <div class="section">
        <span class="section-label">Interview Questions</span>
        <div class="link-list">
        
                    <p><asp:HyperLink ID="HyperLink17" runat="server" NavigateUrl="https://www.enosislearning.com/Interview_Questions.aspx?lag=Csharp" >https://www.enosislearning.com/Interview_Questions.aspx?lag=Csharp</asp:HyperLink></p>
               
                   <p> <asp:HyperLink ID="HyperLink18" runat="server" NavigateUrl="https://www.c-sharpcorner.com/UploadFile/puranindia/C-Sharp-interview-questions/"  >https://www.c-sharpcorner.com/UploadFile/puranindia/C-Sharp-interview-questions/</asp:HyperLink></p>
               
                   <p> <asp:HyperLink ID="HyperLink19" runat="server" NavigateUrl="https://www.guru99.com/c-sharp-interview-questions.html"  >https://www.guru99.com/c-sharp-interview-questions.html</asp:HyperLink></p>
        </div>
    </div>
    <div class="section">
        <span class="section-label">Quiz/Tests</span>
        <div class="link-list">             
                  <p><asp:HyperLink ID="HyperLink20" runat="server" NavigateUrl="https://tests4geeks.com/c-sharp-online-test" >https://tests4geeks.com/c-sharp-online-test</asp:HyperLink></p>
               
                    <p><asp:HyperLink ID="HyperLink21" runat="server" NavigateUrl="https://www.withoutbook.com/OnlineTestStart.php?quizId=71"  >https://www.withoutbook.com/OnlineTestStart.php?quizId=71</asp:HyperLink></p>
               
                    <p><asp:HyperLink ID="HyperLink22" runat="server" NavigateUrl="https://www.tutorialsteacher.com/online-test/csharp-test"  >https://www.tutorialsteacher.com/online-test/csharp-test</asp:HyperLink></p>
               
                    <p><asp:HyperLink ID="HyperLink23" runat="server" NavigateUrl="https://www.tutorialspoint.com/csharp/csharp_online_quiz.htm"  >https://www.tutorialspoint.com/csharp/csharp_online_quiz.htm</asp:HyperLink></p>
               
                    <p><asp:HyperLink ID="HyperLink24" runat="server" NavigateUrl="https://www.testdome.com/for-jobseekers"  >https://www.testdome.com/for-jobseekers</asp:HyperLink></p>
               
                  <p> <asp:HyperLink ID="HyperLink25" runat="server" NavigateUrl="http://www.pskills.org/csharp.jsp"  >http://www.pskills.org/csharp.jsp</asp:HyperLink></p>       
        </div>
    </div>
</div>    
   
</asp:Content>