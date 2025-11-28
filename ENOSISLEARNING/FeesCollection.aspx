<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="FeesCollection.aspx.cs" Inherits="ENOSISLEARNING.FeesCollection" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
         *
 {
     font-family: 'Montserrat', sans-serif;
 } 
        body {
        background-color:#fff;
        }
                       .table-striped tbody th {
    background:  #1d96b2 !important;
    color:white;
    border:none;
    text-align:center;

}
                       .container-fluid
                       {
                           width:95%;
                       }
        .table-striped tbody td {
    background: white;
     border:none;
 text-align:center;
   
}
                       .table td, .table th {
    padding: 3px;
    vertical-align: top;
    border-top: 1px solid #dee2e6;
}
        .hide-div {
            display: none;
        }
        .crousel-bg {
        padding:0px;
        }
        .add-candidate {
            height: 34px;
            margin: 0 auto;
            background: url(images/employee-details-main-h.png) repeat-x;
            line-height: 32px;
            padding-left: 20px;
            font-family: arial;
            font-size: 14px;
            font-weight: bold;
            color: #368aff;       
         }
        .add-candidate h5{
          padding:10px;
          color:#1C71BB;
          font-weight:bold;
          font-family:15px!important;  
        }
        .baccolor {
            color:blue;
            
        }
        .registration_tabl h5 {
          padding:0px 0px;
          color:#1C71BB;
          font-weight:bold;
          font-family:17px;  
        }
        .myhr {
        margin-top: 20px!important;
        margin-bottom:0px!important;
        border: 0;
        border-top: 2px solid #069;
        }
        input[type="radio"], input[type="checkbox"] {
        margin: 7px 0 0 0;
        line-height: normal;
        }
       
        .css3-shadow

        {
  	        position:relative;
	        -webkit-box-shadow:0 1px 4px rgba(0, 0, 0, 0.3);
                    box-shadow:0 1px 4px rgba(0, 0, 0, 0.3);
        }

        .css3-shadow:after
        {
	        content:"";
            position:absolute;
            z-index:-1;
            -webkit-box-shadow:0 0 40px rgba(0,0,0,0.8);
    		        box-shadow:0 0 40px rgba(0,0,0,0.8);
            bottom:0px;
	        width:80%;
	        height:50%;
            -moz-border-radius:100%;
            border-radius:100%;
	        left:10%;
	        right:10%;
        }

    </style>
     <script type="text/javascript">
        
         function popup() {

             $("#EmailModal").modal('show');
         }


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<center>
<table  style="font-size:14px;" Width="800px" >
<tr>
<td >
<center>
<h4 class="upld-resume" >FEES TO BE COLLECTED URGENTLY</h4>
</center>
                 


<br />
</td>
</tr>

</table>
<div class="container-fluid">
<asp:GridView ID="grvCandidatesFees" OnPageIndexChanging="grvCandidatesFees_PageIndexChanging"  AutoGenerateColumns="false" runat="server"
EmptyDataText="No records has been added."  DataKeyNames="CANDIDATE_CODE"
AllowPaging="true"  PageSize="12" PagerSettings-Mode="NumericFirstLast"  PagerStyle-HorizontalAlign="Right"  PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" Visible="true"  
CssClass="table table-striped table-hover my-table" HeaderStyle-BackColor=" #1d96b2"  OnRowCommand="grvCandidatesFees_RowCommand"   >
<PagerStyle HorizontalAlign="Right" ForeColor="Black" CssClass ="right-pagination"/>
                    
<Columns>
                           
<asp:BoundField DataField="FULLNAME" HeaderText="Name"  />
<asp:BoundField DataField="FEESAMOUNT" HeaderText="FeesPendingAmount"  />
<asp:BoundField DataField="FEESDUEDATE" HeaderText="FeesDueDate" DataFormatString = "{0:dd/MMM/yyyy}"  />
<asp:BoundField DataField="MOBILENO" HeaderText="MOBILENO"  />
<asp:BoundField DataField="EMAIL" HeaderText="EMAIL"  />
<asp:BoundField DataField="COURSENAME" HeaderText="COURSENAME"  />
<asp:BoundField DataField="BATCHNAME" HeaderText="BATCHNAME"  />
<asp:BoundField DataField="COUNSELLORNAME" HeaderText="COUNSELLORNAME"  />
                           
                            

                                
                                       
                                 

<asp:TemplateField HeaderText="Notify" >
<ItemTemplate>
<asp:Button ID="btnEmail" runat="server" CausesValidation="false"
CommandName="btnEmail"  Text="Email" ForeColor="White" BackColor="#006495"  />
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Fees" >
<ItemTemplate>
<asp:Button ID="btnFees" runat="server" CausesValidation="false"
CommandName="btnFees"  Text="Fees" ForeColor="White" BackColor="#006495"  />
</ItemTemplate>
</asp:TemplateField>
</Columns>
</asp:GridView>
<div id="EmailModal" class="modal fade" tabindex="-1" role="dialog">
<div class="modal-dialog modal-sm">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×                                       <h2 class="modal-title" style="color: #617284!important; top: 0px!important;">Send Email</h2>
</div>

<div class="modal-body">
<div class="form-horizontal">
<div class="form-group">
<div class="col-xs-12">
<asp:TextBox ID="ToEmail" runat="server" placeholder="Mail To"  CssClass="form-control my-form-control"  /> 
                           
</div>
</div>
                                                    
<div class="form-group">
<div class="col-xs-12">
<asp:TextBox ID="Subjects" runat="server" placeholder="Subject"  CssClass="form-control my-form-control"  /> 
                           

</div>
</div>

<div class="form-group">
<div class="col-xs-12">
<asp:TextBox ID="Body" runat="server" placeholder="Enter Body" TextMode = "MultiLine" Height = "150" Width = "300"  CssClass="form-control my-form-control"  /> 
                           
</div>
</div>


<div class="form-group">
<div class="col-xs-12">
                                                            
<asp:FileUpload  ID="fattach" runat="server" placeholder="Attachment" CssClass="form-control my-form-control" />
<asp:HyperLink ID="hykResume" runat="server" CssClass="file-upl" />

</div>
</div>

</div>
</div>
<div class="modal-footer">
<asp:Button runat="server" ID="SubEmail" Text="Send" class="btn btn-primary"  OnClick="SubEmail_Click" />
<button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
</div>
</div>
<div class="clearfix"></div>
</div>
</div>
</div>
    
    </center>
        <script src="Scripts/jquery-1.8.2.js"></script>
</asp:Content>
