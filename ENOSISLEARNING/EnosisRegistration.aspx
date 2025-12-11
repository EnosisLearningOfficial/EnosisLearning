<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="EnosisRegistration.aspx.cs" Inherits="ENOSISLEARNING.EnosisRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css" />
    <style>
*
        {
            font-family: 'Montserrat', sans-serif;
        }
        .container {
            width: 75%;
            margin-top: 10px;
            padding: 10px;
            background: #f8f9fb;
            border-radius: 10px;
            border: 2px solid #d0d7ff;
            box-shadow: 0 0 10px #00000020;
        }

        .form-wrapper {
            background: white;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 10px;
            border: 1px solid #e0e0e0;
            box-shadow: 0 0 8px #00000015;
        }

        .form-title {
            font-size: 20px;
            font-weight: 700;
            margin-bottom: 10px;
            padding-bottom: 5px;
            border-bottom: 2px solid #007bff;
            color: #333;
        }

        .form-group label {
            font-weight: 600;
            color: #000;
        }

        .form-group.row { 
            display: flex; 
            flex-wrap: nowrap; 
            align-items: center; 
            margin-bottom: 12px;
        }

        .form-group.row label { 
            width: 150px; 
            margin-right: 10px; 
            text-align: right; 
        }

        .form-group.row > div { 
            flex: 1; 
        }

        .submit-row {
            text-align: left;
            margin-top: 5px;
            margin:auto;
        }
    </style>
    <script type="text/javascript">


         
        $(document).ready(function () {
          


             

               SearchText();

               function SearchText() {
                   $(".autosuggest").autocomplete({
                       source: function (request, response) {
                           $.ajax({
                               type: "POST",
                               contentType: "application/json; charset=utf-8",
                               url: "EnosisRegistration.aspx/GetAutoCompleteData",
                               data: "{'username':'" + document.getElementById('txtReferBy').value + "'}",
                               dataType: "json",
                               success: function (data) {
                                   response(data.d);
                               },
                               error: function (result) {
                                   alert("Error");
                               }
                           });
                       }
                   });
               }
          

            $("#ContentPlaceHolder1_txtDOB").datepicker({
                changeMonth: true,
                changeYear: true,
                showOn: 'onchange'

            });
            
            $('[id*=ContentPlaceHolder1_drpCourses]').multiselect({
               
                    includeSelectAllOption: true
                });
               

           });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

<div class="container">
<asp:Label ID="lblError" ForeColor="Red" BackColor="Yellow" runat="server"></asp:Label>
    <!-- BASIC DETAILS -->
    <div class="form-wrapper">
        <div class="form-title">Basic Information</div>

        <div class="form-group row">
            <label class="col-sm-2">Name :</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control text-success" required="true" TabIndex="1" />
            </div>

            <div class="col-sm-2" style="display:flex; align-items:center; margin-top:5px;">
                 <label class="col-sm-1">Gender :</label>
           <%--    <label class="form-label">Male :</label>--%>
               <asp:RadioButton ID="rbMale" GroupName="Gender"  runat="server" Text="Male" TabIndex="2" />
               <%-- <label class="form-label">Female :</label>--%>
               <asp:RadioButton ID="rbFeMale" GroupName="Gender" runat="server" Text="Female" TabIndex="3" />
            </div>

            <div class="col-sm-2">
                <asp:CheckBox ID="chkFresher" runat="server" AutoPostBack="true" OnCheckedChanged="chkFresher_CheckedChanged" Font-Size="Small" TabIndex="4"  style="position:relative;top:1px;left:48px;"/>
                 <label class="form-label">Tick If Fresher</label>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">D.O.B :</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" placeholder="dd/MM/yyyy" TextMode="Date" required="true" TabIndex="5" />
            </div>

            <label class="col-sm-1">MobileNo :</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtMobileNo" runat="server" CssClass="form-control" required="true" TabIndex="6" />
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">Email :</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" required="true" TabIndex="7" />
            </div>

            <label class="col-sm-1">Course :</label>
            <div class="col-sm-3">
                <asp:ListBox ID="drpCourses" runat="server" CssClass="select2 form-control m-t-8" TabIndex="8" style="height:100px;width:100%;" AutoPostBack="true" SelectionMode="Multiple"></asp:ListBox>
            </div>

            <div class="col-sm-2">
                <asp:Label ID="lblFees" Text="Total Fees" runat="server" CssClass="col-form-label" Visible="false" />
                <asp:TextBox ID="txtTotalFees" runat="server" CssClass="form-control" Visible="false" />
            </div>
        </div>
    </div>

    <!-- CONTACT & EDUCATION -->
    <div class="form-wrapper">
        <div class="form-title">Contact & Education Details</div>

        <div class="form-group row">
            <label class="col-sm-2">Software Skills :</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtSkills" runat="server" CssClass="form-control" required="true" TabIndex="9" />
            </div>

            <label class="col-sm-1">Address :</label>
            <div class="col-sm-5">
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" required="true" TabIndex="10" />
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">Location :</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" required="true" TabIndex="11" />
            </div>

            <label class="col-sm-1">City :</label>
            <div class="col-sm-2">
                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" required="true" TabIndex="12" />
            </div>

            <label class="col-sm-1">Pincode</label>
            <div class="col-sm-2">
                <asp:TextBox ID="txtPinCode" runat="server" CssClass="form-control" required="true" TabIndex="13" />
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">Highest Qualification :</label>
            <div class="col-sm-4">
                <asp:DropDownList ID="drpQualifications" runat="server" CssClass="select2 form-control m-t-15" style="height:36px;width:100%;" required="true" TabIndex="14" />
            </div>

            <label class="col-sm-1">Percentage :</label>
            <div class="col-sm-2">
                <asp:TextBox ID="txtPercentage" runat="server" CssClass="form-control" required="true" TabIndex="15" />
            </div>

            <label class="col-sm-1">PassYear</label>
            <div class="col-sm-2">
                <asp:DropDownList ID="drpPassingYears" runat="server" CssClass="select2 form-control m-t-15" style="height:36px;width:100%;" required="true" TabIndex="16"></asp:DropDownList>
            </div>
        </div>

        <div class="form-group row align-items-center">
            <label class="col-sm-2">Resume :</label>
            <div class="col-sm-4">
                <asp:FileUpload ID="fResume" runat="server" TabIndex="17" />
                <asp:HyperLink ID="hykResume" runat="server" style="margin-top:5px;" CssClass="btn btn-primary" />
            </div>

            <label id="trexp1" runat="server" class="col-sm-1">Exp :</label>
            <div class="col-sm-2" id="trexp2" runat="server">
                <label>Year</label>
                <asp:DropDownList ID="drpExpYears" runat="server" CssClass="drpdown1" TabIndex="18"></asp:DropDownList>
                <label>Month</label>
                <asp:DropDownList ID="drpMonths" runat="server" CssClass="drpdown1 drpdown2" TabIndex="19"></asp:DropDownList>
            </div>

            <label id="trexp3" runat="server" class="col-sm-1">Company</label>
            <div class="col-sm-2" id="trexp4" runat="server">
                <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control" TabIndex="20" />
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">Coordinator Name :</label>
            <div class="col-sm-4">
                <asp:DropDownList ID="drpCoordinator" runat="server" CssClass="select2 form-control m-t-15" style="height:36px;width:100%;" TabIndex="21"></asp:DropDownList>
                <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="drpCoordinator" InitialValue="0" runat="server" ForeColor="Red" />
            </div>

            <label class="col-sm-1">ReferedBy :</label>
            <div class="col-sm-2">
                <input type="text" id="txtReferBy" class="autosuggest form-control" TabIndex="22" />
            </div>

            <div class="col-sm-2">
                <asp:CheckBox ID="chkPlacement" runat="server" required="true" TabIndex="23" />
                 <label class="form-label" style="display:inline;position:relative;left:12px;bottom:1px;">Placement Required</label>
            </div>
        </div>

      <div class="submit-row" style="display:flex; justify-content:center; margin-top:15px;">
            <asp:Button ID="btnSubmit" width="150px" Text="Save" runat="server" OnClick="btnSubmit_Click" BorderWidth="2px" CssClass="btn btn-info bton r-btn badge-orange" TabIndex="24" />
        </div>

        <div class="form-group row">
            <asp:ValidationSummary ID="rv1" ShowMessageBox="true" ShowSummary="false" DisplayMode="BulletList" runat="server" ForeColor="Red" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMobileNo" ErrorMessage="Mobile Number format is Not correct" Display="Dynamic"  ForeColor="Red" CssClass="valid" 
            ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>

            <asp:RegularExpressionValidator id="regEmail" ControlToValidate="txtEmail" ForeColor="Red" Text="Please insert valid email ID" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Runat="server" CssClass="valid" /> 
            <asp:RequiredFieldValidator ErrorMessage="Please select Course" ControlToValidate="drpCourses" InitialValue="0" runat="server" ForeColor="Red" />
            <asp:RequiredFieldValidator ErrorMessage="Please select Coordinator" ControlToValidate="drpCoordinator" InitialValue="0" runat="server" ForeColor="Red" />
        </div>

    </div>
</div>          
     
</asp:Content>
