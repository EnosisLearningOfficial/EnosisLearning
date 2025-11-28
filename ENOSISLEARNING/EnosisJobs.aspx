<%@ Page Title="" Language="C#" MasterPageFile="~/LEARNING.Master" AutoEventWireup="true" CodeBehind="EnosisJobs.aspx.cs" Inherits="ENOSISLEARNING.EnosisJobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="css/jquery-ui.css" />
<script src="Scripts/jquery-ui-1.8.24.js" ></script>


<script type="text/javascript">
$(document).ready(function () {

$('#ContentPlaceHolder1_btnReset').click(function () {
$("input:text").val("");

});
$('.popovers').popover();

});
function getConfirmation(sender, title, message) {
$("#spnTitle").text(title);
$("#spnMsg").text(message);
$('#modalPopUp').modal('show');
$('#btnConfirm').attr('onclick', "$('#modalPopUp').modal('hide');setTimeout(function(){" + $(sender).prop('href') + "}, 10);");
return false;
}
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div id="modalPopUp" class="modal fade" role="dialog">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal">&times;</button>
<h4 class="modal-title">
<span id="spnTitle">
</span>
</h4>
</div>
<div class="modal-body">
<p>
<span id="spnMsg">
</span> .
</p>
</div>
<div class="modal-footer">
<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
<button type="button" id="btnConfirm" class="btn btn-danger">
Yes, please</button>
</div>
</div>
</div>
</div>
<div class="container" 
    style="background-color:white;border-radius:5px;border-style:solid;border-color:#55ACEE;align-content:center;width:900px">


<div class="form-group row" style="background-color:#55ACEE">
<asp:Label ID="lblError" class="col-form-label" Font-Bold="true" ForeColor="Maroon" Font-Size="Medium"
Text="Please fill the details below and submit your resume successfully" runat="server"></asp:Label>
</div>

     
<div class="form-group row">
<label for="drpPosition" class="col-sm-3 col-form-label">Position Applied For</label>
<div class="col-sm-6">
<div class="input-group">
  <span class="input-group-addon" id="basic-addon2">👨‍🎓</span>
   
<asp:DropDownList CssClass="form-control form-control-sm h-25 popovers" ID="drpPosition" runat="server" data-trigger="focus"
data-placement="right" data-content="Select the Position for Which You are applying" data-container="body" aria-describedby="basic-addon2" >
<asp:ListItem Value="-1" Text="Select Position" />
    <asp:ListItem Value="Marketing Intern/Trainee" Text="Marketing Intern/Trainee" />
      <asp:ListItem Value="HR Intern/Trainee" Text="HR Intern/Trainee" />
      <asp:ListItem Value="Software Intern/Trainee" Text="Software Intern/Trainee" />


<asp:ListItem Value="Net Developer" Text="Net Developer" />
<asp:ListItem Value="Java Developer" Text="Java Developer" />
<asp:ListItem Value="Angular/React/NodeJS" Text="Angular/React/NodeJS" />
<asp:ListItem Value="Python/Django" Text="Python/Django" />
<asp:ListItem Value="Database/BI/DBA/Azure" Text="Database/BI/DBA/Azure" />
<asp:ListItem Value="UI Designer/Developer" Text="UI Designer/Developer" />
<asp:ListItem Value="Mobile Developer" Text="Mobile Developer" />
<asp:ListItem Value="SEO/Digital Marketing" Text="SEO/Digital Marketing" />
<asp:ListItem Value="Tester/QA" Text="Tester/QA" />
<asp:ListItem Value="IT Support/Networking/AWS" Text="IT Support/Networking/AWS" />
<asp:ListItem Value="Trainer" Text="Trainer" />
<asp:ListItem Value="BDM/Counsellor" Text="BDM/Counsellor" />
<asp:ListItem Value="HR Executive/Manager" Text="HR Executive/Manager" />
<asp:ListItem Value="Intern" Text="Intern" />
<asp:ListItem Value="Management Trainee" Text="Management Trainee" />
<asp:ListItem Value="Business Analyst" Text="Business Analyst" />
<asp:ListItem Value="Project Lead / Manager" Text="Project Lead / Manager" />
</asp:DropDownList>
    </div>
</div>
</div>
<div class="form-group row">
<label for="txtName" class="col-sm-3 col-form-label">Name</label>
<div class="col-sm-6">
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1">@</span>
    <asp:TextBox ID="txtName" runat="server" CssClass="form-control h-25 popovers"
data-trigger="focus" data-placement="right" data-content="Enter Your Full Name properly " data-container="body" required="true" placeholder="Name"  aria-describedby="basic-addon1" />


</div>

</div>
</div>

<div class="form-group row">
<label for="txtName" class="col-sm-3 col-form-label">Gender</label>
<div class="col-sm-6 popovers" data-trigger="focus"
data-placement="right"
data-content="Select Gender Correctly(Male or Female)" data-container="body">
<asp:RadioButton ID="rbMale" Text="Male" GroupName="Gender" runat="server" />
<asp:RadioButton ID="rbFeMale" Text="Female" GroupName="Gender" runat="server" />
</div>
</div>
<div class="form-group row">
<label for="txtDOB" class="col-sm-3 col-form-label ">DateofBirth</label>
<div class="col-sm-6 h-25">
<div class="input-group">
  <span class="input-group-addon" id="basic-addond">📆</span>

    

<asp:TextBox ID="txtDOB" runat="server" CssClass="form-control popovers" required="true" placeholder="DOB(dd/mm/yyyy)" TextMode="Date"
data-trigger="focus" data-placement="right" data-content="Select Your Date of Birth in dd/mm/yyyy" data-container="body"  aria-describedby="basic-addond" />
    </div>
</div>
</div>

<div class="form-group row">
<label for="txtMobileNo" class="col-sm-3 col-form-label">Mobile Number</label>
<div class="col-sm-6">
<div class="input-group">
  <span class="input-group-addon" id="basic-addonm">☎</span>

   

<asp:TextBox ID="txtMobileNo" runat="server" CssClass="form-control popovers"
required="true" placeholder="MobileNo" data-trigger="focus"
data-placement="right" data-content="Enter Your Mobile No in 10 digit format eg:9988556677" data-container="body" />
</div>
</div>
<div class="col-sm-4">
<asp:RegularExpressionValidator ID="revMobile" runat="server" ControlToValidate="txtMobileNo"
ErrorMessage="Enter 10 digits correctly mobile number eg : 9988556677" Display="Dynamic" CssClass="valid"
ValidationExpression="[0-9]{10}" ></asp:RegularExpressionValidator>
</div>
</div>

<div class="form-group row">

<label for="txtEmail" class="col-sm-3 col-form-label">Email</label>
<div class="col-sm-6">
<div class="input-group">
  <span class="input-group-addon" id="basic-addone">✉</span>


    

<asp:TextBox ID="txtEmail" runat="server" CssClass="form-control popovers" required="true"
placeholder="Email" data-trigger="focus" data-placement="right" data-content="Enter Your EmailID Correctly" data-container="body"/>
  </div>
</div>
<div class="col-sm-4">
<asp:RegularExpressionValidator ID="regEmail" ControlToValidate="txtEmail" Text="Please insert valid email ID" Display="Dynamic"
ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
runat="server" ForeColor="Red" BackColor="Yellow" />
</div>
</div>
<div class="form-group row">
<label for="txtCity" class="col-sm-3 col-form-label">City</label>
<div class="col-sm-6">
<div class="input-group">
       <span class="input-group-addon" id="basic-addone1">🌐</span>
<asp:TextBox ID="txtCity" runat="server" CssClass="form-control popovers" required="true" placeholder="Enter Your City"
data-trigger="focus" data-placement="right" data-content="Enter Your City Current Living" data-container="body" />
</div>
</div>
</div>
<div class="form-group row">
<label for="txtSkills" class="col-sm-3 col-form-label">Skills</label>
<div class="col-sm-6 popovers">
    <div class="input-group">
       <span class="input-group-addon" id="basic-addone2">🔆</span>
    
<asp:TextBox ID="txtSkills" runat="server" CssClass="form-control popovers" required="true" placeholder="Skills"
data-trigger="focus" data-placement="right" data-content="Enter Your Skills eg : Java,MVC,Marketing etc" data-container="body" />
</div>
</div>
</div>
<div class="form-group row">
<label for="txtExp" class="col-sm-3 col-form-label">Experience</label>
<div class="col-sm-6 popovers">
<asp:TextBox ID="txtExp" runat="server" CssClass="form-control" required="true" placeholder="Experience"
data-trigger="focus" data-placement="right" data-content="Enter Your No of Years of Experience eg : 2,3 ,5.5 etc" data-container="body" />
</div>
<div class="col-sm-4">
<asp:RegularExpressionValidator ID="regexp" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
ErrorMessage="Please enter experience in numbers or decimals only, eg : 2.5 or 2"
ControlToValidate="txtExp" Display="Dynamic" CssClass="valid" />
</div>
</div>

<div class="form-group row">
<label for="txtExpSal" class="col-sm-3 col-form-label">Expected Annual Sal(Lakhs)</label>
<div class="col-sm-6">

    <div class="input-group">
  <span class="input-group-addon" id="basic-addonr">₹</span>

<asp:TextBox ID="txtExpSal" runat="server" CssClass="form-control popovers" required="true" placeholder="Expected Annual Salary"
data-trigger="focus" data-placement="right" data-content="Enter salary in numbers in terms of lakhs like 2.0,3.6,5 or 0 etc" data-container="body" aria-describedby="basic-addonr"  />
    </div>
</div>
<div class="col-sm-4">
<asp:RegularExpressionValidator ID="regexpsal" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
ErrorMessage="Please enter salary in numbers or decimals in terms of lakhs like 2.0,3.6,5 or 0 etc"
ControlToValidate="txtExpSal" Display="Dynamic"
CssClass="valid"
/>
<asp:RangeValidator Type="Double" ControlToValidate="txtExpSal" MinimumValue="0" MaximumValue="100"
Display="Dynamic" CssClass="valid" ErrorMessage="Salary should be in Lakhs and Below 100 Lakhs" runat="server" />
</div>
</div>

<div class="form-group row">
<label for="txtNoticePeriod" class="col-sm-3 col-form-label">Notice Period(Days)</label>
<div class="col-sm-6">
<asp:TextBox ID="txtNoticePeriod" runat="server" CssClass="form-control" required="true" placeholder="Notice Period in Days"
data-trigger="focus" data-placement="right" data-content="Enter Notice Period in terms of Days in Numbers. eg 20,30 etc" data-container="body" />
</div>
<div class="col-sm-4">

<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
ErrorMessage="Please enter Notice Period in Numbers"
ControlToValidate="txtNoticePeriod" Display="Dynamic"
CssClass="valid"
/>
</div>
</div>

<div class="form-group row">
<label for="drpQualification" class="col-sm-3 col-form-label">Highest Qualification</label>
<div class="col-sm-6">

    <div class="input-group">
  <span class="input-group-addon" id="basic-addonq">🧑‍🎓</span>
<asp:DropDownList CssClass="form-control popovers" ID="drpQualifications" runat="server" required="true"
    data-trigger="focus" data-placement="right" data-content="Select Your Qualification Correctly from the List" data-container="body"
    aria-describedby="basic-addonq">
</asp:DropDownList>
    </div>
<%-- <input type="email" class="form-control" id="inputEmail" placeholder="Email">--%>
</div>
</div>

<div class="form-group row">
<label for="drpQualification" class="col-sm-3 col-form-label">Year of Passing</label>
<div class="col-sm-6">

    <div class="input-group">
  <span class="input-group-addon" id="basic-addony">📅</span>

<asp:DropDownList CssClass="form-control" ID="drpPassingYears" runat="server" required="true" 
    data-trigger="focus" data-placement="right" data-content="Select Your Year of Passing Correctly" data-container="body"
    aria-describedby="basic-addony">
</asp:DropDownList>

<%-- <input type="email" class="form-control" id="inputEmail" placeholder="Email">--%>
</div>
</div>
</div>
<div class="form-group row">
<label for="fResume" class="col-sm-3 col-form-label">Resume</label>
 
<div class="col-sm-6">
<asp:FileUpload ID="fResume" runat="server" CssClass="custom-file-input"/>
<asp:HyperLink ID="hykResume" runat="server"
Style="margin-top: -25px; float: right" CssClass="btn btn-primary" />

</div>
</div>

<%--<div class="col-sm-6">
<asp:FileUpload ID="fResume" runat="server" CssClass="custom-file-input"/>
<asp:HyperLink ID="hykResume" runat="server"
Style="margin-top: -25px; float: right" CssClass="btn btn-primary" />

</div>--%>




<div class="form-group row">
<label for="txtComments" class="col-sm-3 col-form-label">Comments/Notes/Feedback</label>
<div class="col-sm-6">
<asp:TextBox ID="txtComments" TextMode="MultiLine" runat="server" CssClass="form-control" placeholder="Comments/Notes/Feedback"
     data-trigger="focus" data-placement="right" data-content="Enter Comments / Questions if any regarding your Job" data-container="body" />


</div>
   
</div>
 <hr />

<div class="form-group row">

<asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click" CssClass="col-sm-10 col-sm-offset-1 btn btn-primary" />
<%-- OnClientClick="return getConfirmation(this, 'Please confirm','Are you sure you have submitted the details correctly?')" />--%>

</div>

<div class="form-group row">

<asp:Button ID="btnReset" Text="Reset" runat="server" CausesValidation="false" CssClass="col-sm-10 col-sm-offset-1 btn btn-danger" />
</div>
<div class="form-group row">
<asp:ValidationSummary ID="rv" DisplayMode="BulletList" ShowValidationErrors="true" BackColor="Lavender" ShowMessageBox="true" ShowSummary="true" runat="server" />
</div>



</div>



</asp:Content>
