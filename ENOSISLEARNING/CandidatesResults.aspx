<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="CandidatesResults.aspx.cs" Inherits="ENOSISLEARNING.CandidatesResults" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
 *
 {
     font-family: 'Montserrat', sans-serif;
 }
        @media (max-width:766px)
        {
            .form-control
            {
                Font-Size :x-small;
            }
        }
         @media (min-width:766px)
        {
            .form-control
            {
                Font-Size :small;
            }
        }
        .form-control
        {
            padding-left:0px;
        }

                       .table td, .table th {
    padding: 3px;
    vertical-align: top;
    border-top: 1px solid #dee2e6;
}
        .header
        {
            background:#1d96b2 !important;
            text-align:center;
            color:white;
            padding:5px;
            margin-top:5px;
            width:1490px;
            margin:auto;
            position:relative;
            right:15px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .headerexternal
        {
            background:#1d96b2 !important;
            text-align:center;
            color:white;
            padding:5px;
            margin-top:5px;
            width:1490px;
             border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .container-fluid
        {
           width:93%;
           height:100%;
           margin-top :5px;
           margin:auto;
        } 
        .gridview-area
        {
            margin-top:5px;
            overflow-x: auto;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            background-color: #f8f9fa;
        }
        .table
        {
             border-collapse: collapse;
             border-color:white;
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
         .gridview-header th {
         text-align: center;
         border: none;
         }


         .gridview-header-item {
             padding: 12px;
             text-align: center;
             background-color: #4caf50;
             color: #fff;
             border-radius: 8px;
             position: relative;
             cursor: pointer;
             transition: background-color 0.3s ease;
         }

         .gridview-header-item:hover {
    
         }

         .gridview-header-item::after {
             content: "\f0dc"; /* FontAwesome icon for sorting */
             font-family: "Font Awesome 5 Free";
             font-weight: 900;
             position: absolute;
             right: 10px;
             top: 50%;
             transform: translateY(-50%);
             opacity: 0.7;
             background-color :white;
         }
         .form-control
         {
            border: 1px solid #efeeed;
            border-radius: 5px;
            font-size: 12px;
            font-weight:600;
         }
         .form-control::placeholder
         {
            color: dimgray;
            font-family:'Montserrat', sans-serif;
         }
         .form-control:hover
         {
            outline: none;
            border-color: #00adef;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1"  runat="server">
    <div class="container-fluid">
<asp:Label ID="lblErrorMsg" runat="server" />
<div class="header">
<h5 id="hr1" runat="server" >INTERNAL ASSESSMENTS DETAILS ( CANDIDATE NAME : </h5> 
</div>
   
    <div class="row">
    
        <div class="gridview-area">      
<asp:GridView ID="grvInternalTests" runat="server" 
AutoGenerateColumns="false"  HeaderStyle-BackColor="#1d96b2" 
ShowFooter="true"  HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="false" RowStyle-Height="25px"
FooterStyle-Height="40px"  FooterStyle-Font-Size="Small"
OnRowCommand="grvInternalTests_RowCommand"  DataKeyNames="TESTID" OnDataBound="grvInternalTests_DataBound" BorderStyle="None" AlternatingRowStyle-BackColor="white"  AlternatingRowStyle-ForeColor="white" CssClass="table table-borderless gridview-table">

<Columns>
 

<asp:TemplateField  HeaderText="DATE" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" HeaderStyle-BorderColor="#1d96b2">
  
<ItemTemplate>
<asp:Label ID="lbldate" Text='<%# Eval("DATEOFTEST","{0:d}") %>' 
Font-Size="Small" runat="server" CssClass="gridview-item" style="text-align:center;margin-left:25%"></asp:Label>
</ItemTemplate>
<FooterTemplate>
<asp:TextBox ID="txtDateofTest" CssClass="form-control" width="100px" style="text-align:center;margin-left:25%" runat="server"></asp:TextBox>
</FooterTemplate>
</asp:TemplateField>
<asp:TemplateField  HeaderText="TakenBy" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" HeaderStyle-BorderColor="#1d96b2">
  
<ItemTemplate>
<asp:Label ID="lblTakenByName" Text='<%# Eval("UPDATEDBY") %>' 
Font-Size="Small" runat="server" CssClass="gridview-item" style="text-align:center;margin-left:10%"></asp:Label>
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="TEST TYPE" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
<ItemTemplate >
<asp:Label ID="lblTestType"  Font-Size="Small"  Text='<%# Eval("TESTTYPE") %>' runat="server" CssClass="gridview-item" style="text-align:center;margin-left:18%"></asp:Label>
</ItemTemplate>
<FooterTemplate>
<asp:DropDownList ID="drpTestType" CssClass="form-control"  style="width:100px;height:35px;text-align:center;margin-left:18%"    runat="server">
<asp:ListItem Value="1" Text="Aptitude" />
<asp:ListItem Value="2" Text="Technical-Test" />
<asp:ListItem Value="3" Text="Practical" />
<asp:ListItem Value="4" Text="Machine" />
<asp:ListItem Value="5" Text="HR" />


</asp:DropDownList>

</FooterTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="COURSE" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
<ItemTemplate>
<asp:Label ID="lblCourse" Text='<%# Eval("COURSENAME") %>'   runat="server" CssClass="gridview-item" style="text-align:center;margin-left:23%"></asp:Label>
</ItemTemplate>
<FooterTemplate>
<asp:DropDownList ID="drpCourses"  CssClass="form-control" style="width:100px;height:35px;text-align:center;margin-left:25%"  runat="server" />

</FooterTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Score" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
        <ItemStyle Width="60px" />
    <FooterStyle Width="60px" />
<ItemTemplate>
<asp:Label ID="lblScore" Text='<%# Eval("Score") %>' runat="server" CssClass="gridview-item"></asp:Label>
</ItemTemplate>
<FooterTemplate>
<asp:TextBox ID="txtScore" CssClass="form-control"  runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ControlToValidate="txtScore" ErrorMessage="*" ForeColor="Red" 
ToolTip="Please enter a Value" runat="server" ValidationGroup="a1" />
<asp:RegularExpressionValidator runat="server" id="reScore"  
controltovalidate="txtScore" ValidationGroup="a1" ValidationExpression="^[0-9]{1,3}(?:\.[0-9]{1,2})?$" errormessage="*" ForeColor="Red" ToolTip="Value Shoule be Maximum 3 Digits" />

</FooterTemplate>
</asp:TemplateField>


<asp:TemplateField HeaderText="Outof" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
        <ItemStyle Width="60px" />
    <FooterStyle Width="60px" />
<ItemTemplate>
<asp:Label ID="lOUTOF" Text='<%# Eval("OUTOF") %>' runat="server" CssClass="gridview-item"></asp:Label>
</ItemTemplate>
<FooterTemplate>
<asp:TextBox ID="txtOUTOF" CssClass="form-control" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="rOutOf" ControlToValidate="txtOUTOF" ErrorMessage="*" ForeColor="Red" 
ToolTip="Please enter a Value" runat="server" />
 
<asp:RegularExpressionValidator runat="server" id="reOutScore" 
controltovalidate="txtOUTOF" ValidationGroup="a1" validationexpression="^[0-9]{1,3}(?:\.[0-9]{1,2})?$" errormessage="*" ToolTip="Value Shoule be Maximum 3 Digits" />

<asp:CompareValidator ControlToValidate="txtOUTOF" ValidationGroup="a1" ControlToCompare="txtScore"  Type="Integer" Operator="GreaterThanEqual" errormessage="*" ToolTip="Outof Should Be Greater Than Results Score" runat="server" />

</FooterTemplate>
</asp:TemplateField>


    <asp:TemplateField HeaderText="TestPaper" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
  
<ItemTemplate>
      <asp:LinkButton Width="90px" ID="lnkDownload" Font-Size="XX-Small" Text ='<%# Eval("TESTANSWERS_FILENAME") %>' CommandArgument = '<%# Eval("TESTANSWERS_FILENAME") %>' runat="server" CssClass="btn btn-link" OnClick="lnkIDownload_Click"></asp:LinkButton>
</ItemTemplate>
<FooterTemplate>
       <asp:FileUpload Width="90px" Height="35px" ID="fTestPaper" runat="server" />

</FooterTemplate>

</asp:TemplateField>
<asp:TemplateField HeaderText="Feedback" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
     <ItemStyle Width="350px" />
    <FooterStyle Width="350px" />
<ItemTemplate>
<asp:Label ID="lFeedback" Text='<%# Eval("Feedback") %>' runat="server" CssClass="gridview-item" style="text-align:center;margin-left:35%;"></asp:Label>
</ItemTemplate>
<FooterTemplate>
<asp:TextBox ID="txtFeedback" CssClass="form-control" TextMode="MultiLine" rows="1" runat="server" ></asp:TextBox>

</FooterTemplate>

</asp:TemplateField>
<asp:TemplateField HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" HeaderStyle-BorderColor="#1d96b2">
<ItemTemplate>
    <asp:ImageButton ID="btnDel" ImageUrl="~/Images/DeleteDoc.png" OnClientClick="return confirm('Are you sure you want to Delete?');" CommandName="DEL" runat="server" ToolTip="Delete" Width="22px" Height="22px" CausesValidation="false"/>
</ItemTemplate>
<FooterTemplate>
    <asp:ImageButton ID="btnSave" runat="server" ToolTip="Details" ValidationGroup="a1" CommandName = "SAVE"  ImageUrl="~/Images/AddDoc.png" Width="25px" Height="25px" ImageAlign="Middle" CssClass="add" CausesValidation="false"/>
</FooterTemplate>

</asp:TemplateField>
</Columns>
</asp:GridView>
  </div>  


     
<div>

<div class="headerexternal"><h5>EXTERNAL ASSESSMENTS DETAILS </h5></div> 
  
    <div class="row">
        <div class="gridview-area" style="width:1490px;margin-left:15px;">
     <asp:GridView ID="grvInternalInterviews" runat="server" 
AutoGenerateColumns="false"  HeaderStyle-BackColor="#BFCFFF"
ShowFooter="true"  HeaderStyle-ForeColor="Black" HeaderStyle-Font-Bold="false" RowStyle-Height="25px"
FooterStyle-Height="40px"  FooterStyle-Font-Size="Small"
OnRowCommand="grvInternalInterviews_RowCommand" DataKeyNames="INTERVIEWID" OnDataBound="grvInternalInterviews_DataBound" BorderStyle="None" AlternatingRowStyle-BackColor="white"  AlternatingRowStyle-ForeColor="white" CssClass="table table-borderless gridview-table">
<Columns>

<asp:TemplateField HeaderText="DATE" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
<ItemTemplate>
<asp:Label ID="lbldate"   Text='<%# Eval("DATEOFINTERVIEW","{0:d}") %>' runat="server" CssClass="gridview-item" style="text-align:center;margin-left:20%"></asp:Label>
</ItemTemplate>
<FooterTemplate>
<asp:TextBox ID="txtDateofInterview" CssClass="form-control" Width="90px" style="width:100px;height:35px;text-align:center;margin-left:20%;"  runat="server"></asp:TextBox>
</FooterTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Taken By" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
<ItemTemplate>
<asp:Label ID="lblTakenByName" Text='<%# Eval("UPDATEDBY") %>' 
Font-Size="Small" runat="server" CssClass="gridview-item" style="text-align:center;"></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="INTERVIEW TYPE" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" HeaderStyle-Width="350px">
<ItemTemplate>
<asp:Label ID="lblTestType" Text='<%# Eval("INTERVIEWTYPE") %>' runat="server"  CssClass="gridview-item" style="text-align:center;margin-left:8%"></asp:Label>
</ItemTemplate>
<FooterTemplate>
<asp:DropDownList ID="drpTestType" runat="server" CssClass="form-control" style="width:100px;height:35px;text-align:center;margin-left:8%">
<asp:ListItem Value="1" Text="Technical-Interview" />

<asp:ListItem Value="2" Text="HR" />
<asp:ListItem Value="3" Text="General" />
<asp:ListItem Value="4" Text="Aptitude" />

</asp:DropDownList>

</FooterTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="COURSE" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" HeaderStyle-Width="200px">
<ItemTemplate>
<asp:Label ID="lblCourse" Text='<%# Eval("COURSENAME") %>'  runat="server"  CssClass="gridview-item" style="text-align:center;margin-left:20%"></asp:Label>
</ItemTemplate>
<FooterTemplate>
<asp:DropDownList ID="drpCourses"  runat="server" CssClass="form-control" style="width:100px;height:35px;text-align:center;margin-left:20%"   />

</FooterTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Score"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
      <ItemStyle Width="60px" />
    <FooterStyle Width="60px" />
<ItemTemplate>
<asp:Label ID="lblScore"  Text='<%# Eval("Score") %>' runat="server"  CssClass="gridview-item" style="text-align:center;margin-left:25%"></asp:Label>
</ItemTemplate>
<FooterTemplate>
<asp:TextBox ID="txtScore" CssClass="form-control" runat="server" style="width:100px;height:35px;text-align:center;margin-left:25%"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtScore" ErrorMessage="*" ForeColor="Red" 
ToolTip="Please enter a Value" runat="server" ValidationGroup="c1" />
<asp:RegularExpressionValidator runat="server" id="reScore"  
controltovalidate="txtScore" ValidationGroup="c1" ValidationExpression="^[0-9]{1,3}(?:\.[0-9]{1,2})?$" errormessage="*" ForeColor="Red" 
ToolTip="Value Shoule be Maximum 3 Digits" />

</FooterTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Outof" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
    <ItemStyle Width="60px" />
    <FooterStyle Width="60px" />
<ItemTemplate>
<asp:Label ID="lOUTOF" Text='<%# Eval("OUTOF") %>' runat="server"  CssClass="gridview-item" style="text-align:center;margin-left:25%"></asp:Label>
</ItemTemplate>
<FooterTemplate>
<asp:TextBox ID="txtOUTOF" runat="server" CssClass="form-control" style="width:100px;height:35px;text-align:center;margin-left:25%"></asp:TextBox>
<asp:RequiredFieldValidator ID="rOutOf" ControlToValidate="txtOUTOF" ValidationGroup="c1" ErrorMessage="*" ForeColor="Red" 
ToolTip="Please enter a Value" runat="server" />
 
<asp:RegularExpressionValidator runat="server" id="reOutScore" 
controltovalidate="txtOUTOF" ValidationGroup="c1" validationexpression="^[0-9]{1,3}(?:\.[0-9]{1,2})?$" errormessage="*" ToolTip="Value Shoule be Maximum 3 Digits" />

<asp:CompareValidator ID="CompareValidator2" ControlToValidate="txtOUTOF" ValidationGroup="c1" ControlToCompare="txtScore"  Type="Integer" Operator="GreaterThan" errormessage="*" ToolTip="Outof Should Be Greater Than Results Score" runat="server" />

</FooterTemplate>


</asp:TemplateField>
    <asp:TemplateField HeaderText="TestPaper" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
  
<ItemTemplate>
      <asp:LinkButton Width="90px" ID="lnkDownload" Font-Size="XX-Small" Text ='<%# Eval("TESTANSWERS_FILENAME") %>' CommandArgument = '<%# Eval("TESTANSWERS_FILENAME") %>' runat="server" OnClick="lnkEDownload_Click" style="text-align:center;margin-left:8%"></asp:LinkButton>
</ItemTemplate>
<FooterTemplate>
       <asp:FileUpload Width="150px" Height="35px" ID="fTestPaper" runat="server" style="text-align:center;margin-left:9%"/>

</FooterTemplate>

</asp:TemplateField>


<asp:TemplateField HeaderText="Feedback"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
    <ItemStyle Width="650px" />
    <FooterStyle Width="650px" />
<ItemTemplate>
<asp:Label ID="lFeedback" Text='<%# Eval("Feedback") %>'  runat="server"  CssClass="gridview-item"></asp:Label>
</ItemTemplate>
<FooterTemplate>
<asp:TextBox ID="txtFeedback" CssClass="form-control" TextMode="MultiLine" rows="1" runat="server"  ></asp:TextBox>

</FooterTemplate>

</asp:TemplateField>
<asp:TemplateField HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
<ItemTemplate>
<asp:Button ID="btnDel" OnClientClick="return confirm('Are you sure you want to Delete?');" CausesValidation="false" CommandName = "del" runat="server" CommandArgument='<%# Container.DataItemIndex %>' Text="Delete" CssClass="btn btn-warning" style="color: #fff;" />

</ItemTemplate>
<FooterTemplate>
   <%-- <asp:Button ID="btnSave"  CommandName ="save"   ValidationGroup="c1"  runat="server"
Text="Save" CssClass="btn btn-danger" style="width:100px;height:35px;text-align:center;color:white;"/>--%>
        <asp:ImageButton ID="btnSave" runat="server" ToolTip="Details" CommandName ="save"   ValidationGroup="c1"   ImageUrl="~/Images/AddDoc.png" Width="25px" Height="25px" ImageAlign="Middle" CssClass="add" CausesValidation="false"/>
</FooterTemplate>


</asp:TemplateField>


</Columns>
</asp:GridView>
</div>
</div>
</div>
<div class="header" style=" margin-left:15px;margin-top:5px;width:1490px;">
   <%-- <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-success" />--%>
    <a href="SearchCandidate.aspx" class="btn btn-success">Back</a>
</div>
</div>
    </div>
        <script src="Scripts/jquery-1.8.2.js"></script>
</asp:Content>
