<%@ Page Title="" Language="C#" MasterPageFile="~/LEARNING.Master" AutoEventWireup="true" CodeBehind="ProfileGoals.aspx.cs" Inherits="ENOSISLEARNING.ProfileGoals" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    

     <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" />
     <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js">

        </script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.5/validator.min.js">

        </script>




     <script type="text/javascript">
        //Initialize popover with jQuery
       $(document).ready(function () {
    
           $('.popovers').popover();

        
           
       });
         function getConfirmation(sender, title, message) {
             $("#spnTitle").text(title);
             $("#spnMsg").text(message);
             $('#modalPopUp').modal('show');
             return false;
         }


               // Self-executing function
          
     

     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <div class="alert alert-success alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Well done! You have submitted your profile successfully,Please fill your personal details , goals etc </strong> 
</div>

      <div  class="container" style="background-color:white;border-radius:5px;border-style:solid;border-color:#55ACEE;align-content:center;width:1200px">
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
                                </span>                                .
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
                <div class="form-group row" style="background-color:#55acee">
                <asp:Label ID="LabelT1" class="col-form-label" Font-Bold="true" ForeColor="White" Font-Size="Medium" 
                    Text="You have submitted your profile successfully,Please fill your personal details , goals etc to complete the process"  runat="server"></asp:Label>

              </div>

            <div class="border">
   <%-- <h3 style="color:maroon">Enosis is a software development and IT training company started in the year 2011.
Enosis works in the areas Product Development, Software Development, IT Training, Consultancy and Recruitment.</h3>
     
       
    <h4 style="color:maroon"> Company Vision:  To Make Education Better, Professional, Cheaper and Accessible to Each Part & Section of the society.</h4>
   --%>    <div class="form-group row">
            <label class="col-sm-2 col-form-label" for="firstName">Full Name:</label>
            <div class="col-sm-4">
                <div class="input-group">
  <span class="input-group-addon" id="basic-addon1">@</span>

            <asp:TextBox ID="txtTFullName" CssClass="form-control form-control-lg" data-error="Please enter name field." runat="server" placeholder="Full Name" required aria-describedby="basic-addon1" />

                      <div class="help-block with-errors"></div>
                    </div>
              <%--  <input type="text" class="form-control form-control-lg"  placeholder="Full Name" required>--%>
            </div>
            <label class="col-sm-2 col-form-label" for="Position">Position:</label>
            <div class="col-sm-4">

                 <div class="input-group">
  <span class="input-group-addon" id="basic-addon2">👨‍🎓</span>
                  <asp:TextBox ID="txtTPosition" CssClass="form-control form-control-lg" data-error="Please enter Position" runat="server" placeholder="Position" required aria-describedby="basic-addon2"  />
                  <div class="help-block with-errors"></div>
                    </div>
            <%--    <input type="text" class="form-control form-control-lg"  placeholder="Position" required>--%>
            </div>


        </div>
         <div class="form-group row">
            <label class="col-sm-2 col-form-label" for="firstName">Current Company Name:</label>
            <div class="col-sm-4">
                 <asp:TextBox ID="txtTCompany" CssClass="form-control form-control-lg" runat="server" placeholder="Current Company Name" />
    
            </div>
            <label class="col-sm-2 col-form-label" for="firstName">Experience</label>
            <div class="col-sm-4">
                 <asp:TextBox ID="txtTExp" CssClass="form-control form-control-lg" runat="server" placeholder="Experience" />
            </div>
        </div>

         <div class="form-group row">
            <label class="col-sm-2 col-form-label" for="firstName">Current Salary:</label>
            <div class="col-sm-4">
                  <div class="input-group">
  <span class="input-group-addon" id="basic-addoncs">₹</span>
                  <asp:TextBox ID="txtTCurSal" CssClass="form-control form-control-lg" runat="server" placeholder="Current Salary"
                      aria-describedby="basic-addoncs" />
                    </div>
            </div>
            <label class="col-sm-2 col-form-label" for="firstName">Expected Salary</label>
            <div class="col-sm-4">
                <div class="input-group">
  <span class="input-group-addon" id="basic-addones">₹</span>
                   <asp:TextBox ID="txtTExpSal" CssClass="form-control form-control-lg" runat="server" placeholder="Expected Salary"
                       aria-describedby="basic-addones" />
                </div>
            </div>
        </div>
         <div class="form-group row">
            <label class="col-sm-2 col-form-label" for="firstName">Father Name,Age,Occupation:</label>
            <div class="col-sm-4">
                  <asp:TextBox ID="txtTFatherDetails" CssClass="form-control form-control-lg" runat="server" placeholder="Father Name,Age,Occupation" />
              <%--  <input type="text" class="form-control form-control-lg"  placeholder="Full Name" required>--%>

            </div>
            <label class="col-sm-2 col-form-label" for="firstName">Mother Name,Age,Occupation:</label>
            <div class="col-sm-4">
                 <asp:TextBox ID="txtTMotherDetails" CssClass="form-control form-control-lg" runat="server" placeholder="Mother Name,Age,Occupation:" />
               
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label" for="firstName">No Of Brothers:</label>
            <div class="col-sm-4">
                   <asp:TextBox ID="txtTBrothers" CssClass="form-control form-control-lg" runat="server" placeholder="No Of Brothers" />

             <%--   <input type="text" class="form-control form-control-lg"  placeholder="Full Name" required>--%>
            </div>
            <label class="col-sm-2 col-form-label" for="firstName">No Of Sisters:</label>
            <div class="col-sm-4">
                 <asp:TextBox ID="txtTSisters" CssClass="form-control form-control-lg" runat="server" placeholder="No Of Sisters" />
              <%--  <input type="text" class="form-control form-control-lg"  placeholder="Position" required>--%>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label" for="firstName">Address:</label>
            <div class="col-sm-10">
                  <div class="input-group">
  <span class="input-group-addon" id="basic-addon3">🏠</span>
                  <asp:TextBox ID="txtTAddress" CssClass="form-control form-control-lg" runat="server" placeholder="Address" aria-describedby="basic-addon3"  />
<%--                <input type="text" class="form-control form-control-lg"  placeholder="Full Name" required>--%>
            </div>
                </div>
           
        </div>

                         </div>

            <div class="border">
        <div class="row" style="background-color:#55acee;">
            <label class="col-sm-12 col-form-label" style="color:white"  for="firstName">What is your goal which you want to achieve in your life? Write your goals in details please:</label>
           
        </div>
        <div class="form-group row">
                <div class="col-sm-12">

                    <asp:TextBox ID="txtTGoals" TextMode="MultiLine" Rows="2" Columns="20" CssClass="form-control form-control-lg popovers" runat="server" placeholder="What is your goal which you want to achieve in your life? Write your goals in details please:" 
                         data-trigger="focus"   data-placement="below"   data-content="Enter your goal which you want to achieve in your life"  />
                <%--<textarea type="text" class="form-control form-control-lg"  placeholder="Full Name" required></textarea>--%>

            </div>
           
        </div>
          <div class="row" style="background-color:#55acee;">
            <label class="col-sm-12 col-form-label" style="color:white" for="firstName">What value you want to add to the society, country or to the world through your work?</label>
           
        </div>
        <div class="form-group row">
                <div class="col-sm-12">
                      <asp:TextBox ID="txtTSocietyValue" data-trigger="focus" 
                          data-placement="center" data-content="What you want to add to the society" 
                          TextMode="MultiLine" Rows="2" Columns="20" 
                          CssClass="form-control form-control-lg popovers" runat="server" 
                          placeholder="What value you want to add to the society, country or to the world through your work?" />

                <%--<textarea type="text" class="form-control form-control-lg"  placeholder="Full Name" required></textarea>--%>
            </div>
           
        </div>
         <div class="row" style="background-color:#55acee;">
            <label class="col-sm-12 col-form-label" for="firstName">Who is your role model?</label>
           
        </div>
        <div class="form-group row">
                <div class="col-sm-12">
                      <asp:TextBox ID="txtTRoleModel" TextMode="MultiLine" Rows="2" Columns="20" 
                          CssClass="form-control form-control-lg popovers" runat="server"
                          data-trigger="focus" 
                          data-placement="center" data-content="What you want to add to the society"
                           placeholder="What is your role model?" />

                 <%--   <textarea type="text" class="form-control form-control-lg"  placeholder="Full Name" required></textarea>--%>
            </div>
           
        </div>
        <div class="row" style="background-color:#55acee;">
            <label class="col-sm-12 col-form-label" for="firstName">Where do you want to see yourself in next 5 Years?</label>
           
        </div>
        <div class="form-group row">
                <div class="col-sm-12">
                   <asp:TextBox ID="txtTNext5Years" TextMode="MultiLine" Rows="2" Columns="20" CssClass="form-control form-control-lg" runat="server" placeholder="Where do you want to see yourself in next 5 Years?" />

                 <%--   <textarea type="text" class="form-control form-control-lg"  placeholder="Full Name" required></textarea>--%>
            </div>
           
        </div>
              <div class="row" style="background-color:#55acee;">
            <label class="col-sm-12 col-form-label" for="firstName">What achievement of your life will make your parents happy for you?</label>
           
        </div>
        <div class="form-group row">
                <div class="col-sm-12">
                       <asp:TextBox ID="txtTAchievements" TextMode="MultiLine" Rows="2" Columns="20" CssClass="form-control form-control-lg" runat="server" placeholder="What achievement of your life will make your parents happy for you?" />

                <%--<textarea type="text" class="form-control form-control-lg"  placeholder="Full Name" required></textarea>--%>
            </div>
           
        </div>
           <div class="row" style="background-color:#55acee;">
            <label class="col-sm-12 col-form-label" for="firstName">Have you read the Company Vision and does your career aspirations aligned with company vision?</label>
           
        </div>
        <div class="form-group row">
                <div class="col-sm-12">
                       <asp:TextBox ID="txtTCompanyVision" TextMode="MultiLine" Rows="2" Columns="20" CssClass="form-control form-control-lg" runat="server" placeholder="Have you read the Company Vision and does your career aspirations aligned with company vision?" />

<%--                <textarea type="text" class="form-control form-control-lg"  placeholder="Full Name" required></textarea>--%>
            </div>
           
        </div>
           <div class="row" style="background-color:#55acee;">
            <label class="col-sm-12 col-form-label" for="firstName">Any specific question regarding your position or Company?</label>
           
        </div>
        <div class="form-group row">
                <div class="col-sm-12">
                       <asp:TextBox ID="txtTQuestions" data-error="Please enter questions" TextMode="MultiLine" Rows="2" Columns="20" CssClass="form-control form-control-lg" runat="server" placeholder="Any specific question regarding your position or Company?" required />
                       <div class="help-block with-errors"></div>
               <%-- <textarea type="text" class="form-control form-control-lg"  placeholder="Full Name" required></textarea>--%>
        </div>
             <div class="form-group row">
             </div>
        <div class="form-group row">
           <asp:Button  ID="btnTSubmit"  Text="Submit" runat="server"  CssClass="col-sm-10 col-sm-offset-1 btn btn-primary right" 
               OnClick="btnTSubmit_Click1"  />
            
              <asp:Literal ID="litMsg" runat="server"></asp:Literal>

              <%-- OnClientClick="return getConfirmation(this, 'Please confirm','Are you sure you have submitted the details correctly?')"--%>
                       
        </div>
       
           
        </div>


                </div>
          
         </div>
</asp:Content>
