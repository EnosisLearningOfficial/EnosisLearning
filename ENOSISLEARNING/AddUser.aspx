<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="ENOSISLEARNING.addPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
         *
         {
             font-family: 'Montserrat', sans-serif;
         } 
        .register{
    background: -webkit-linear-gradient(left, #3931af, #00c6ff);
    margin-top: 1%;
    padding: 3%;
}
.register-left{
    text-align: center;
    color: #fff;
    margin-top: 4%;
}
.register-left input{
    border: none;
    border-radius: 1.5rem;
    padding: 2%;
    width: 60%;
    background: #f8f9fa;
    font-weight: bold;
    color: #383d41;
    margin-top: 10%;
    margin-bottom: 3%;
    cursor: pointer;
}
.register-right{
    height:490px;
    background: #f8f9fa;
    border-top-left-radius: 2% 2%;
    border-bottom-left-radius: 10% 10%;
    margin-top:-45px;
    margin-left:45px;
}
.register-left img{ 
    margin-top: 5%;
    margin-bottom: 5%;
    width: 25%;
    -webkit-animation: mover 2s infinite  alternate;
    animation: mover 1s infinite  alternate;
}
@-webkit-keyframes mover {
    0% { transform: translateY(0); }
    100% { transform: translateY(-20px); }
}
@keyframes mover {
    0% { transform: translateY(0); }
    100% { transform: translateY(-20px); }
}
.register-left p{
    font-weight: lighter;
    padding: 12%;
    margin-top: -9%;
}
.register .register-form{
    padding: 2%;
    margin-top: 2%;
}
.btnRegister{
    float: right;
    margin-top: 10%;
    border: none;
    border-radius: 1.5rem;
    padding: 2%;
    background: #0062cc;
    color: #fff;
    font-weight: 600;
    width: 50%;
    cursor: pointer;
}
.register .nav-tabs{
    margin-top: 3%;
    border: none;
    background: #0062cc;
    border-radius: 1.5rem;
    width: 28%;
    float: right;
}
.register .nav-tabs .nav-link{
    padding: 2%;
    height: 34px;
    font-weight: 600;
    color: #fff;
    border-top-right-radius: 1.5rem;
    border-bottom-right-radius: 1.5rem;
}
.register .nav-tabs .nav-link:hover{
    border: none;
}
.register .nav-tabs .nav-link.active{
    width: 100px;
    color: #0062cc;
    border: 2px solid #0062cc;
    border-top-left-radius: 1.5rem;
    border-bottom-left-radius: 1.5rem;
}
.register-heading{
    text-align: center;
    margin-top: 5%;
    margin-bottom: -15%;
    color: #495057;
}
    </style>
      <script>
        // Self-executing function
        (function() {
            'use strict';
            window.addEventListener('load', function() {
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.getElementsByClassName('needs-validation');
                
                // Loop over them and prevent submission
                var validation = Array.prototype.filter.call(forms, function(form) {
                    form.addEventListener('submit', function(event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
      </script>
</asp:Content>
<%--https://bootsnipp.com/snippets/dlZAN--%>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="container register">
    <div class="row">
                    <div class="col-md-4 register-left">
             
                      
                     
                    </div>
                    <div class="col-md-11 register-right">
                        <div class="container" style="margin-top:5px;">
    <div class="row">
        <!-- First Row -->
        <div class="col-md-3">
            <div class="form-group">
                <label for="txtfullname2">Full Name</label>
                <asp:TextBox class="form-control" ID="txtfullname2" runat="server" placeholder="Full Name" required></asp:TextBox>
                <div class="invalid-tooltip">Please enter Full Name.</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group">
                <label for="txtemail">Personal Email ID</label>
                <asp:TextBox class="form-control" ID="txtemail" runat="server" placeholder="Email ID" required></asp:TextBox>
                <div class="invalid-tooltip">Please enter Email.</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group">
                <label for="txtdoj">Date Of Joining</label>
                <asp:TextBox class="form-control" ID="txtdoj" runat="server" type="date" placeholder="Date Of Joining"></asp:TextBox>
                 <div class="invalid-tooltip">Please enter Date Of Joining.</div>
            </div>
        </div>
    </div>

    <div class="row">
        <!-- Second Row -->
        <div class="col-md-3">
            <div class="form-group">
                <label for="txtuser">Username</label>
                <div class="input-group">
                    <asp:TextBox class="form-control" ID="txtuser" runat="server" placeholder="Username" style="width:135%"></asp:TextBox>
                     <div class="invalid-tooltip">Please enter Username.</div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group">
                <label for="txtmobile">Mobile No</label>
                <asp:TextBox class="form-control" ID="txtmobile" runat="server" placeholder="Mobile No"></asp:TextBox>
                 <div class="invalid-tooltip">Please enter Mobile No.</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group">
                <label for="drp">Designation</label>
                <asp:DropDownList class="form-control" ID="drp" runat="server">
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>HR</asp:ListItem>
                    <asp:ListItem>Counselor</asp:ListItem>
                    <asp:ListItem>Faculty</asp:ListItem>
                    <asp:ListItem>Placement Coordinator</asp:ListItem>
                </asp:DropDownList>
                 <div class="invalid-tooltip">Please enter Designation.</div>
            </div>
        </div>
    </div>

    <div class="row">
        <!-- Third Row -->
        <div class="col-md-3">
            <div class="form-group">
                <label for="txtpass">Password</label>
                <asp:TextBox class="form-control" ID="txtpass" runat="server" placeholder="Password"></asp:TextBox>
                 <div class="invalid-tooltip">Please enter Password.</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group">
                <label for="txtdob">Date Of Birth</label>
                <asp:TextBox class="form-control" ID="txtdob" runat="server" type="date" placeholder="DOB"></asp:TextBox>
                 <div class="invalid-tooltip">Please enter Date Of Birth.</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group">
                <label for="txtskills">Skills</label>
                <asp:TextBox class="form-control" ID="txtskills" runat="server" placeholder="Skills"></asp:TextBox>
                 <div class="invalid-tooltip">Please enter Skills.</div>
            </div>
        </div>
    </div>

    <div class="row">
        <!-- Fourth Row -->
        <div class="col-md-3">
            <div class="form-group">
                <label for="fOfferLetter">Offer Letter</label>
                <asp:FileUpload class="form-control" ID="fOfferLetter" runat="server"></asp:FileUpload>
                 <div class="invalid-tooltip">Please enter Offer Letter.</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group">
                <label for="fResume">Resume</label>
                <asp:FileUpload class="form-control" ID="fResume" runat="server"></asp:FileUpload>
                 <div class="invalid-tooltip">Please enter Resume.</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group">
                <label for="fPhoto">Photo</label>
                <asp:FileUpload class="form-control" ID="fPhoto" runat="server"></asp:FileUpload>
                 <div class="invalid-tooltip">Please enter Photo.</div>
            </div>
        </div>
    </div>

    <div class="row">
        <!-- Fifth Row -->
        <div class="col-md-3">
            <div class="form-group">
                <label for="txtOffEmail">Offer Email ID</label>
                <asp:TextBox class="form-control" ID="txtOffEmail" runat="server" placeholder="Offer Email"></asp:TextBox>
                 <div class="invalid-tooltip">Please enter Offer Email Id.</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group">
                <label for="txtEmailPass">Email Password</label>
                <asp:TextBox class="form-control" ID="txtEmailPass" runat="server" placeholder="Email Password"></asp:TextBox>
                 <div class="invalid-tooltip">Please enter Email Password.</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group">
                <label for="fID">ID Proof (PAN/ADHAR etc.)</label>
                <asp:FileUpload class="form-control" ID="fID" runat="server"></asp:FileUpload>
                 <div class="invalid-tooltip">Please enter ID Proof.</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group">
                 <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Add User" OnClick="btnAddUSer_Click" OnClientClick="return validate();" style="margin-top:24px;height:35px"/>
            </div>
        </div>
    </div>
</div>
</div>
                  </div>
     </div>
</asp:Content>
