<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feedback_Form.aspx.cs" Inherits="ENOSISLEARNING.Feedback_Form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Feedback Form</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">


    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e0f7fa; /* Sky Blue Background */
            margin: 0;
            padding: 0;
        }

        #header {
            background-color: #43a047; /* Green Header */
            color: #fff;
            text-align: center;
            padding: 10px;
        }

        #formContainer {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        fieldset {
            border: 1px solid #81c784; /* Light Green Border */
            margin: 10px 0;
            padding: 15px;
            border-radius: 8px;
        }

        legend {
            font-size: 18px;
            font-weight: bold;
            color: #43a047; /* Dark Green Legend Text */
        }

        .form-label {
            display: block;
            margin-bottom: 5px;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
            border: 1px solid #81c784; /* Light Green Border */
            border-radius: 4px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #1565c0; /* Dark Blue Header */
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #e3f2fd; /* Light Blue Rows */
        }

        tr:hover {
            background-color: #bbdefb; /* Hover Blue Rows */
        }

        .btn-submit {
            background-color: #43a047; /* Green Submit Button */
            color: #fff;
            padding: 10px 15px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn-submit:hover {
            background-color: #2e7d32; /* Darker Green Hover */
        }

        .error-message {
            color: #d32f2f; /* Dark Red Error Message */
            font-weight: bold;
        }

        #rateYo {
        margin-top: 10px;
    }

    .rateyo-container {
        display: inline-block;
        font-size: 40px; /* Adjust the font size as needed */
    }

    .rateyo-rater {
        color: #FF5252; /* Red */
    }

    .rateyo-rated-group .rateyo-fill {
        color: #FFD600; /* Yellow */
    }

    .rateyo-waiting-group .rateyo-fill {
        color: #B2EBF2; /* Light Blue */
    }
    </style>
</head>
<body>
     <div id="header">
        <h2>Corporate Trainer Feedback Form</h2>
    </div>
    <div id="formContainer">
    <form id="form1" runat="server">
        <fieldset>
            <legend>Trainer Information</legend>
            <label class="form-label">Trainer Name: Dillip Sir</label>
            <%--<label class="form-label">Batch weekly Time: 1st Jan 24 to 8 Jan 24</label>--%>
        </fieldset>

        <fieldset>
            <legend>Contact Information</legend>
            <label class="form-label" for="txtName">Name:</label>
            <asp:TextBox ID="txtName" runat="server" Required="true" CssClass="form-control"></asp:TextBox>

            <label class="form-label" for="txtEmail">Email:</label>
            <asp:TextBox ID="txtEmail" runat="server" Required="true" CssClass="form-control"></asp:TextBox>

            <label class="form-label" for="txtContactNo">Contact No:</label>
            <asp:TextBox ID="txtContactNo" runat="server" Required="true" CssClass="form-control"></asp:TextBox>
        </fieldset>

        <fieldset>
            <legend>Rating Categories</legend>
           <table border="1">
    <tr>
        <th>Questions</th>
        <th>Very Good</th>
        <th>Good</th>
        <th>Fair</th>
        <th>Poor</th>
        <th>Very Poor</th>
    </tr>
    <tr>
        <td>Trainer's Communication Skills:</td>
        <td><asp:RadioButton ID="rblCommunicationSkillsVG" runat="server" Text="1" GroupName="CommunicationSkills1" /></td>
        <td><asp:RadioButton ID="rblCommunicationSkillsG" runat="server" Text="2" GroupName="CommunicationSkills1" /></td>
        <td><asp:RadioButton ID="rblCommunicationSkillsF" runat="server" Text="3" GroupName="CommunicationSkills1" /></td>
        <td><asp:RadioButton ID="rblCommunicationSkillsP" runat="server" Text="4" GroupName="CommunicationSkills1" /></td>
        <td><asp:RadioButton ID="rblCommunicationSkillsVP" runat="server" Text="5" GroupName="CommunicationSkills1" /></td>
    </tr>
    <tr>
        <td>Trainer's Preparedness of the Subject:</td>
        <td><asp:RadioButton ID="rblPreparednessOfSubjectVG" runat="server" Text="1" GroupName="PreparednessOfSubject1" /></td>
        <td><asp:RadioButton ID="rblPreparednessOfSubjectG" runat="server" Text="2" GroupName="PreparednessOfSubject1" /></td>
        <td><asp:RadioButton ID="rblPreparednessOfSubjectF" runat="server" Text="3" GroupName="PreparednessOfSubject1" /></td>
        <td><asp:RadioButton ID="rblPreparednessOfSubjectP" runat="server" Text="4" GroupName="PreparednessOfSubject1" /></td>
        <td><asp:RadioButton ID="rblPreparednessOfSubjectVP" runat="server" Text="5" GroupName="PreparednessOfSubject1" /></td>
    </tr>
    <tr>
        <td>Trainer's Presentation Skills:</td>
        <td><asp:RadioButton ID="rblPresentationSkillsVG" runat="server" Text="1" GroupName="PresentationSkills1" /></td>
        <td><asp:RadioButton ID="rblPresentationSkillsG" runat="server" Text="2" GroupName="PresentationSkills1" /></td>
        <td><asp:RadioButton ID="rblPresentationSkillsF" runat="server" Text="3" GroupName="PresentationSkills1" /></td>
        <td><asp:RadioButton ID="rblPresentationSkillsP" runat="server" Text="4" GroupName="PresentationSkills1" /></td>
        <td><asp:RadioButton ID="rblPresentationSkillsVP" runat="server" Text="5" GroupName="PresentationSkills1" /></td>
    </tr>
    <tr>
        <td>Trainer's Knowledge About the Subject:</td>
        <td><asp:RadioButton ID="rblKnowledgeAboutSubjectVG" runat="server" Text="1" GroupName="KnowledgeAboutSubject1" /></td>
        <td><asp:RadioButton ID="rblKnowledgeAboutSubjectG" runat="server" Text="2" GroupName="KnowledgeAboutSubject1" /></td>
        <td><asp:RadioButton ID="rblKnowledgeAboutSubjectF" runat="server" Text="3" GroupName="KnowledgeAboutSubject1" /></td>
        <td><asp:RadioButton ID="rblKnowledgeAboutSubjectP" runat="server" Text="4" GroupName="KnowledgeAboutSubject1" /></td>
        <td><asp:RadioButton ID="rblKnowledgeAboutSubjectVP" runat="server" Text="5" GroupName="KnowledgeAboutSubject1" /></td>
    </tr>
    <tr>
        <td>Trainer's Problem Solving Skills:</td>
        <td><asp:RadioButton ID="rblProblemSolvingSkillsVG" runat="server" Text="1" GroupName="ProblemSolvingSkills1" /></td>
        <td><asp:RadioButton ID="rblProblemSolvingSkillsG" runat="server" Text="2" GroupName="ProblemSolvingSkills1" /></td>
        <td><asp:RadioButton ID="rblProblemSolvingSkillsF" runat="server" Text="3" GroupName="ProblemSolvingSkills1" /></td>
        <td><asp:RadioButton ID="rblProblemSolvingSkillsP" runat="server" Text="4" GroupName="ProblemSolvingSkills1" /></td>
        <td><asp:RadioButton ID="rblProblemSolvingSkillsVP" runat="server" Text="5" GroupName="ProblemSolvingSkills1" /></td>
    </tr>
    <tr>
        <td>Trainer's Punctuality:</td>
        <td><asp:RadioButton ID="rblPunctualityVG" runat="server" Text="1" GroupName="Punctuality1" /></td>
        <td><asp:RadioButton ID="rblPunctualityG" runat="server" Text="2" GroupName="Punctuality1" /></td>
        <td><asp:RadioButton ID="rblPunctualityF" runat="server" Text="3" GroupName="Punctuality1" /></td>
        <td><asp:RadioButton ID="rblPunctualityP" runat="server" Text="4" GroupName="Punctuality1" /></td>
        <td><asp:RadioButton ID="rblPunctualityVP" runat="server" Text="5" GroupName="Punctuality1" /></td>
    </tr>
    <tr>
        <td>Trainer's Overall Behaviour:</td>
        <td><asp:RadioButton ID="rblOverallBehaviourVG" runat="server" Text="1" GroupName="OverallBehaviour1" /></td>
        <td><asp:RadioButton ID="rblOverallBehaviourG" runat="server" Text="2" GroupName="OverallBehaviour1" /></td>
        <td><asp:RadioButton ID="rblOverallBehaviourF" runat="server" Text="3" GroupName="OverallBehaviour1" /></td>
        <td><asp:RadioButton ID="rblOverallBehaviourP" runat="server" Text="4" GroupName="OverallBehaviour1" /></td>
        <td><asp:RadioButton ID="rblOverallBehaviourVP" runat="server" Text="5" GroupName="OverallBehaviour1" /></td>
    </tr>
</table> 
                   

        </fieldset>

        <fieldset>
            <legend>Comments/Suggestions</legend> 
            <label class="form-label" for="txtCommentsSuggestions">Comments/Suggestions:</label>
            <asp:TextBox ID="txtCommentsSuggestions" runat="server" TextMode="MultiLine" Required="true" CssClass="form-control"></asp:TextBox>
            <br/>  

            <div class="form-label">Overall Feedback:</div>
             <div id="rateYo"></div>
             <input type="hidden" id="overallRating" name="overallRating" />
        </fieldset>

        

        <asp:Label ID="lblMessage" runat="server" CssClass="error-message"></asp:Label>
        <asp:Button ID="btnSubmit" runat="server" Text="Submit Feedback" OnClientClick="return validateForm()" OnClick="btnSubmit_Click" CssClass="btn-submit" /> 
        
    </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#rateYo").rateYo({
                rating: 0,
                fullStar: true,
                multiColor: {
                    startColor: "#FF6347", /* Red */
                    endColor: "#4CAF50" /* Green */
                },
                onChange: function (rating, rateYoInstance) {
                    $("#overallRating").val(rating);
                }
            });
        });
    </script>

    <script>
        function validateForm() {
            var name = document.getElementById('<%=txtName.ClientID%>').value;
            var email = document.getElementById('<%=txtEmail.ClientID%>').value;
            var contactNo = document.getElementById('<%=txtContactNo.ClientID%>').value;

            // Validate Name
            if (name.trim() === "") {
                alert("Please enter your name.");
                return false;
            }

            // Validate Email
            var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
            if (!emailRegex.test(email)) {
                alert("Please enter a valid email address.");
                return false;
            }

            // Validate Contact Number
            var contactNoRegex = /^\d{10}$/;
            if (!contactNoRegex.test(contactNo)) {
                alert("Please enter a valid 10-digit contact number.");
                return false;
            }

            return true;       
    </script>

</body>
</html>
