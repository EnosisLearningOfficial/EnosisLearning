<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="PaymentGateway.aspx.cs" Inherits="ENOSISLEARNING.PaymentGateway" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

         <style>
    *
    {
       font-family: 'Montserrat', sans-serif;
    }
     .container
    {
       width:1265px;
       height:100%;
       margin-top :5px;
       margin:auto;
    }  
    .br{
        border-radius:15px;
    }
   
    .modal-header {
       
        color: white; /* Text color for the header */
        border-style: none;
    }
    .modal-footer {
       
       border-style: none;
    }
       .gridview-area
    {
        max-width: 100%;
        margin-top:5px;
        overflow-x: auto;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        background-color: #f8f9fa;
    }
    .table
    {
         border-collapse: collapse;
         border-color:#1d96b2;
         background-color :white;
    }
    .gridview-item
    {
        padding:-10px;
        transition: background-color 0.3s ease;
        text-align:center;
        font-size:10px;
        font-family: 'Montserrat', sans-serif;
        font-weight:500;
        color:black;
        background-color :white;
    }
      .gridview-header {
     text-align:center;
     background-color: #1d96b2;
     color: #fff;
     font-size:10px;
     font-weight: bold;
     font-family: 'Montserrat', sans-serif;
    }
     .vacancy-top-tab {
    text-align: center;
    padding: 10px 10px 10px;
    background-color: #1d96b2;  
    border-radius:15px;
    }
     .close
    {
        width:30px;
        height:30px;
        color:red;
        font-size:40px;
    }
    .close:hover
    {
        color:red;
    }
     body {
      background-image: url('images/Payment.PNG'); /* Update with your image URL */
     background-size: cover;
     background-position: center;
     background-repeat: no-repeat;
     margin: 0;
     padding: 0;
     color: white;
     }


</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="container">
     
<!-- Button to Open the Modal -->   
        <div>
            <br />
            <center>  <a id="btnRDemo" href="#" class="btn btn-danger br" style="box-shadow: 1px 1px 3px 1px gray;width: 160px;height: 40px;"" data-toggle="modal" data-target="#myPayModal" target="_parent"><span>  <img src="../img/Add4.png"  title="Add" height="25" width="25" /></span> &nbsp;ADD PAYMENT</a>  </center>
               
   
 <!-- Modal Dialog -->
    
    </div>
      <div class="modal fade" id="myPayModal" data-backdrop="false" role="dialog"  clientidmode="Static"  style="background-color:#ddd;">
       <div class="modal-dialog modal-dialog-centered">
         <div class="modal-content br" style="width: 90%;">
            <div class="modal-header" style="border-style:none;">
             <button type="button" class="close text-danger" data-dismiss="modal">&times;</button>
             <center><h5 class="modal-title" ><b style="color: #1d96b2;">Payment Gateway </b></h5></center>
                
            </div>

           <div class="modal-body">
              <br />
          
              <div class="form-horizontal"> 
              <div class="form-group row" style="margin:0; padding:0;">
               <label class="col-sm-3 col-form-label c" style="color: black;">Full Name:</label>

                  <div class="col-sm-9 size">
                     <div class="input-group">
                          
                      <asp:TextBox ID="txtName" CssClass="form-control br" runat="server"  style="border-style:Solid;border-radius: 15px; text-align:center;width: 350px;" placeholder="Enter Name" />
                      <asp:RequiredFieldValidator ID="rfvalid" runat="server" ErrorMessage="Name is required" ForeColor="Red" ControlToValidate="txtName" ValidationGroup="test" CssClass="float-right"></asp:RequiredFieldValidator>
                          <div class="help-block with-errors br"></div>
                       </div>
                    </div>
                 </div>

                  <div class="form-group row" style="margin:0; padding:0;">
                     <label class="col-sm-3 col-form-label c" style="color: black;">Email:</label>
                       <div class="col-sm-9 size">
                         <div class="input-group">
                             <asp:TextBox ID="txtEmail" CssClass="form-control br" runat="server"  style="border-style:Solid;border-radius: 15px; text-align:center;width: 350px;" placeholder="Enter Email" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Email is required" ForeColor="Red" ControlToValidate="txtEmail" ValidationGroup="test" CssClass="float-right"></asp:RequiredFieldValidator>
                          <div class="help-block with-errors br"></div>
                       </div>
                     </div>
                  </div>

               <div class="form-group row" style="margin:0; padding:0;">
                   <label class="col-sm-3 col-form-label c" style="color: black;">Select Course:</label>
                   <div class="col-sm-9 size">
                       <div class="input-group">
                          
                            <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control br" style="height:30px; border-style:Solid;border-radius: 15px; text-align:center;width: 350px;" AutoPostBack="True" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged" >
                            <asp:ListItem Text="Please select a course" Value="" />
                            </asp:DropDownList>
                           <div class="help-block with-errors br"></div>
                       </div>
                   </div>
               </div>
                  <br />
               <div class="form-group row" style="margin:0; padding:0;">
                   <label class="col-sm-3 col-form-label c" style="color: black;">Course Charge:</label>
                   <div class="col-sm-9 size">
                       <div class="input-group">
                          
                           <asp:TextBox ID="txtCourseCharge" CssClass="form-control br" runat="server"  style="border-style:Solid;border-radius: 15px; text-align:center;width: 350px;" ReadOnly="True" />
                           <div class="help-block with-errors br"></div>
                       </div>
                   </div>
               </div>

              
              </div>  
           </div>
               
       
            <!-- Modal Footer -->
            <div class="modal-footer" style="border-style:none;">
                 <asp:Button ID="btnPay" runat="server" Text="Pay" OnClick="btnPay_Click" CssClass="btn btn-primary br" />
                 <button type="button" class="btn btn-default br" data-dismiss="modal" style="background-color: #f89d0d; margin-right: 70px;">Close</button>
            </div>
                <div class="clearfix"></div>
        </div>
    </div>
</div>
          <br /><br />
  

          </div>
</asp:Content>
