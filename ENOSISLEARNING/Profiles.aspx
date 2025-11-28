<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master"  EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Profiles.aspx.cs" Inherits="ENOSISLEARNING.Profiles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <title>Enosis Learning</title>  
        
        <style>  
            *
            {
                font-family: 'Montserrat', sans-serif;
            } 
            body
            {
                background-color:transparent;
            }
            .container-fluid
             {
                width:95%;
                height:100%;
                margin-top :5px;
                margin:auto;
             } 
            .inline-div 
            {
                display: inline-block;
                width: 9.5%;
                height: 30px;
               /* background-color: #f2f2f2;*/
                border: 1px solid transparent;
                border-radius:5px;
                text-align: center;
                vertical-align: top;
                line-height: 50px; /* Centers the text vertically */
            }
            .search-bar
            {
                margin-left:0px;
            }
            .form-control
            {
                height:35px;
                border-radius:5px;
            }
             .btn
             {
                 color:white;
                 text-align:center;
                 vertical-align: top;
                 line-height: 15px; /* Centers the text vertically */
                 border-radius:5px;
                 margin-top:3px;
                 background-color:#1d96b2;
                 transition: all 0.3s ease;
             }
             .btn:hover
             {
                 background-color:tomato;
                 transform: scale(1.1);
                 color:white;
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
.tabs
{
     background-color:transparent;
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
  .footer
{
    border-bottom:0.5px solid lightgrey;
    border-top:none;
    border-right:none;
    border-left:none;
}
 .nav-tabs {
  border-bottom: none;
}
.nav-tabs > li > a {
  background-color: #1d96b2;
  color: white;
  border: none;
  border-radius: 0;
  margin-right: 2px;
}
.nav-tabs > li.active > a,
.nav-tabs > li > a:hover {
  background-color: white;
  color: #337ab7;
  border: 1px solid #337ab7;
}
</style>   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <div id="popupdiv" title="Basic modal dialog" style="display: none">
         Name: <label id="lblName"></label><br />
        <table>
            <tr>
                <td>
                    <asp:GridView ID="grvJobComments" AutoGenerateColumns="false" runat="server">
                        <Columns> 
                        <asp:BoundField DataField="COMMENTS" runat="server"  />
                        </Columns>
                     </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                        <select id="ddlNationality"><option value="0" >--Select Country--</option></select>  

                </td>
            </tr>
        </table>
         <table style="width:200px;height:150px;border:5px solid red;border-radius:5px 5px;">
             <tr style="height:30px">
                 <td style="width:50px">Status</td>
                 <td style="width:150px">Comments</td>

             </tr>
             <tr style="height:100px">
                <td > <asp:DropDownList ID="drpJobStatus" runat="server">
                       
                     </asp:DropDownList> </td>
                 <td><asp:TextBox TextMode="MultiLine" Rows="4" Columns="20" runat="server" /> </td>
             </tr>
             <tr style="height:20px">
                 <td colspan="2"  >
                      <asp:Button ID="btnSave" Text="SAVE" runat="server" OnClick="btnSave_Click" />
                 </td>        
             </tr>
            </table>
</div>
        <div class="container-fluid">
         <div class="search-bar">
              <div class="inline-div">
                  <asp:TextBox ID="txtName" runat="server" CssClass="form-control"  placeholder="Name" />
              </div>
             <div class="inline-div">
                 <asp:DropDownList Height="35px" AppendDataBoundItems="true" CssClass="form-control"  ID="drpEducation" runat="server">
                 <asp:ListItem Value="0" Text="Qualification"></asp:ListItem>
                 </asp:DropDownList>
             </div> 
             <div class="inline-div">
                <asp:DropDownList Height="35px" AppendDataBoundItems="true"  CssClass="form-control" ID="drpYearPassing" runat="server">
                 <asp:ListItem Value="0" Text="Passing Year" />
                </asp:DropDownList>
             </div>
             <div class="inline-div">
               <asp:DropDownList Height="35px" AppendDataBoundItems="true" CssClass="form-control"  ID="drpPositions" runat="server">
               <asp:ListItem Value="0" Text="Select Position" /> 

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
                             <asp:ListItem Value="HR Executive/Manager" Text="HR Executive" />
                             <asp:ListItem Value="Intern" Text="Intern" />
                             <asp:ListItem Value="Management Trainee" Text="Management Trainee" />
                              <asp:ListItem Value="Business Analyst" Text="Business Analyst" />
                              <asp:ListItem Value="Project Lead / Manager" Text="Project Lead / Manager" />
               
            </asp:DropDownList>
             </div>
             <div class="inline-div">
               <asp:DropDownList Height="35px" AppendDataBoundItems="true" CssClass="form-control"  ID="drpExperience" runat="server">
                  <asp:ListItem Value="0" Text="Experience" />
               </asp:DropDownList>
            </div> 
             <div class="inline-div">
               <asp:DropDownList Height="35px" AppendDataBoundItems="true" CssClass="form-control"  ID="drpType" runat="server">        
                    <asp:ListItem Value="0" Text="Select Type" /> 
                          <asp:ListItem Value="I" Text="I" />
                    <asp:ListItem Value="O" Text="O" />
               </asp:DropDownList>
            </div> 
             <div class="inline-div">
               <asp:DropDownList Height="35px" AppendDataBoundItems="true" CssClass="form-control"  ID="drpstatus" runat="server">
                
                    <asp:ListItem Value="0" Text="Select Status" /> 
         
               </asp:DropDownList>
            </div>
             <div class="inline-div">
               <asp:TextBox ID="txtSkills" runat="server" CssClass="form-control"  placeholder="Enter Your Skills" />   
            </div>
             <div class="inline-div" style="width:80px;">
                 <asp:Button ID="btnSearch" Text="Search" runat="server" CssClass="btn btn-custom" style="margin-right:50px;"  OnClick="btnSearch_Click"></asp:Button>
             </div> 
             <div class="inline-div">
                <asp:Button ID="btnAddCandidate" Text="Add Candidate" runat="server" CssClass="btn btn-custom" OnClick="btnAddCandidate_Click"/>
             </div>
         </div>

    <ul class="nav nav-tabs" style="margin-top:10px;">
  <li class="active"><a href="#tabs-1" data-toggle="tab">ALL</a></li>
  <li><a href="#tabs-2" data-toggle="tab">HOLD</a></li>
  <li><a href="#tabs-3" data-toggle="tab">NOT INTERESTED</a></li>
</ul>

<div class="tab-content">
  <div class="tab-pane fade in active" id="tabs-1">
    <asp:GridView ID="grvCandidatesDetail" OnRowCommand="grvCandidatesDetail_RowCommand" AutoGenerateColumns="false" runat="server"
            DataKeyNames="CANDIDATE_CODE,FULLNAME" EmptyDataText="No records has been added."
            AllowPaging="true" PageSize="5"  PagerSettings-Mode="NumericFirstLast" PagerStyle-HorizontalAlign="Right" PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" Visible="true" OnPageIndexChanging="grvCandidatesDetail_PageIndexChanging" OnDataBound="grvCandidatesDetail_DataBound" ShowFooter="true" OnRowCreated="grvCandidatesDetail_RowCreated" BorderStyle="None" AlternatingRowStyle-BackColor="white"  AlternatingRowStyle-ForeColor="black" CssClass="table table-borderless gridview-table" FooterStyle-CssClass="footer" >

            <PagerStyle HorizontalAlign = "Right" CssClass = "GridPager" BorderColor="White"/>

            <Columns>
<%--                <asp:HyperLinkField DataTextField="CANDIDATE_CODE" ControlStyle-CssClass="CANDIDATE_CODE" 
    ItemStyle-ForeColor="Black" ControlStyle-ForeColor="Black" DataNavigateUrlFields="CANDIDATE_CODE" 
    DataNavigateUrlFormatString="~/Profiles.aspx?REGNO={0}" HeaderText="RegNo" />--%>

               <%-- <asp:HyperLinkField DataTextField="CANDIDATE_CODE" ControlStyle-CssClass="CANDIDATE_CODE" ItemStyle-ForeColor="Black" ControlStyle-ForeColor="Black" DataNavigateUrlFields="CANDIDATE_CODE" DataNavigateUrlFormatString="~/CandidatesReportCard.aspx?Id={0}" HeaderText="RegNo" />--%>

                <%--<asp:BoundField DataField="CANDIDATE_CODE" HeaderText="RegNo"   />--%>
                <asp:BoundField DataField="UPDATEDDATE" DataFormatString="{0:dd/MM/yy}" HeaderText="Applied-Date" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None"/>
              
                
              
                <asp:TemplateField HeaderText="Name" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                    <ItemTemplate>

                         <asp:LinkButton ID="lnkView" Text ='<%# Eval("FULLNAME") %>' ForeColor="Blue" CssClass="gridview-item" CommandArgument='<%# Eval("RESUME") %>' runat="server" OnClick="OnView" ></asp:LinkButton>
  
                        



                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Name" />
                    </FooterTemplate>
                </asp:TemplateField>
               <%-- <asp:BoundField DataField="FULLNAME" ItemStyle-CssClass="FULLNAME" HeaderText="Name" />--%>


              <%--  <asp:BoundField DataField="GENDER" HeaderText="Gender" />--%>
                <asp:TemplateField HeaderText="Gender" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                    <ItemTemplate>
                          <asp:Label Text='<%# Eval("Gender") %>'  CssClass="gridview-item" runat="server" />

                    </ItemTemplate>
                    <FooterTemplate>
                       <%-- <asp:TextBox ID="txtGender" runat="server" Width="40px" Height="35px" placeholder="Gender" />--%>
                        <asp:DropDownList ID="drpGender" runat="server" CssClass="form-control" Height="35px" >
                            <asp:ListItem Text="M" Value="M" />
                            <asp:ListItem Text="F" Value="F" />

                        </asp:DropDownList>
                    </FooterTemplate>
                </asp:TemplateField>


             <%--   <asp:BoundField DataField="DOB" HeaderText="DOB" />--%>
                
                   <asp:TemplateField HeaderText="Exp" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                    <ItemTemplate>
                          <asp:Label Text='<%# Eval("YEARSEXPERIENCE") %>' CssClass="gridview-item" runat="server" />

                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtExp" runat="server" CssClass="form-control" placeholder="Exp" />
                    </FooterTemplate>
                </asp:TemplateField>

             <%--   <asp:BoundField DataField="PACKAGE" HeaderText="Package" />--%>

                 
                   <asp:TemplateField HeaderText="PACKAGE" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                    <ItemTemplate>
                          <asp:Label Text='<%# Eval("PACKAGE") %>' CssClass="gridview-item"  runat="server" />

                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtPackage" CssClass="form-control" runat="server" Text="0" />
                    </FooterTemplate>
                </asp:TemplateField>


                <%-- <asp:BoundField DataField="NOTICEPERIOD" HeaderText="Notice" />--%>
                   <asp:TemplateField HeaderText="NOTICE" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                    <ItemTemplate>
                          <asp:Label Text='<%# Eval("NOTICEPERIOD") %>' CssClass="gridview-item" runat="server" />

                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNotice" runat="server" CssClass="form-control" Text="0" />
                    </FooterTemplate>
                </asp:TemplateField>


            <%--    <asp:BoundField DataField="MOBILENO" HeaderText="MobileNo" />--%>
                 <asp:TemplateField HeaderText="MOBILENO" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                    <ItemTemplate>
                          <asp:Label Text='<%# Eval("MOBILENO") %>' CssClass="gridview-item"  runat="server" />

                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox CssClass="form-control" ID="txtMob" runat="server" placeholder="Mobile" />
                    </FooterTemplate>
                </asp:TemplateField>


           <%--     <asp:BoundField DataField="EMAIL" ItemStyle-CssClass="email" HeaderText="EmailId" />--%>
                  <asp:TemplateField HeaderText="EMAIL" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                    <ItemTemplate>
                          <asp:Label Text='<%# Eval("EMAIL") %>' CssClass="gridview-item"  runat="server" />

                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" placeholder="Email"  />
                    </FooterTemplate>
                </asp:TemplateField>

                <%--     <asp:BoundField DataField="SKILLS" ItemStyle-Font-Size="Smaller" HeaderText="Skills" />--%>

                     <asp:TemplateField HeaderText="SKILLS" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                    <ItemTemplate>
                          <asp:Label Text='<%# Eval("SKILLS") %>' CssClass="gridview-item" runat="server" />

                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox CssClass="form-control" runat="server" placeholder="Skills" />
                    </FooterTemplate>
                </asp:TemplateField>


                <%--   <asp:BoundField DataField="POSITION_APPLIED" ItemStyle-Width="30px" HeaderText="Position" />--%>
                   <asp:TemplateField HeaderText="Position" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                    <ItemTemplate>
                          <asp:Label  Text='<%# Eval("POSITION_APPLIED") %>' CssClass="gridview-item"  runat="server" />

                    </ItemTemplate>
                    <FooterTemplate>
                        <%--<asp:TextBox Width="60px" Height="35px" ID="txtPosition" runat="server" />  --%>
                        <asp:DropDownList CssClass="form-control" ID="drpPosition"  runat="server">
                                <asp:ListItem Value="-1" Text="Select Position" /> 
            
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
                         
                    </FooterTemplate>
                </asp:TemplateField>


              <%--  <asp:BoundField DataField="QUALIFICATION"  HeaderText="Qualification" />--%>
                 <asp:TemplateField HeaderText="Qualification" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                    <ItemTemplate>
                          <asp:Label Text='<%# Eval("QUALIFICATION") %>' CssClass="gridview-item"  runat="server" />

                    </ItemTemplate>
                    <FooterTemplate>
                        <%--<asp:TextBox Width="70px" Height="35px" ID="txtQualification" runat="server" />--%>

                           <asp:DropDownList ID="drpQualifications" CssClass="form-control"  runat="server" required="true"  >
                           </asp:DropDownList>
                    </FooterTemplate>
                </asp:TemplateField>
                <%-- <asp:BoundField DataField="PASSINGYEAR" HeaderText="Pass-Year" />--%>


                 <asp:TemplateField HeaderText="Pass-Year" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                    <ItemTemplate>
                          <asp:Label Text='<%# Eval("PASSINGYEAR") %>' CssClass="gridview-item"  runat="server" />

                    </ItemTemplate>
                    <FooterTemplate>
            <%--            <asp:TextBox Width="40px" Height="35px" ID="txtPassingYear" runat="server" />
            --%>
                        <asp:DropDownList CssClass="form-control" ID="drpPassingYears"  runat="server" required="true" class="col-form-label"  >
                           
                              
                 <asp:ListItem>1992</asp:ListItem>
                             <asp:ListItem>1993</asp:ListItem>
                             <asp:ListItem>1994</asp:ListItem>
                            <asp:ListItem>1995</asp:ListItem>
                            <asp:ListItem>1996</asp:ListItem>
                            <asp:ListItem>1997</asp:ListItem>
                            <asp:ListItem>1998</asp:ListItem>
                            <asp:ListItem>1999</asp:ListItem>
                            <asp:ListItem>2000</asp:ListItem>
                            <asp:ListItem>2001</asp:ListItem>
                            <asp:ListItem>2002</asp:ListItem>
                            <asp:ListItem>2003</asp:ListItem>
                            <asp:ListItem>2004</asp:ListItem>
                            <asp:ListItem>2005</asp:ListItem>
                            <asp:ListItem>2006</asp:ListItem>
                            <asp:ListItem>2007</asp:ListItem>
                            <asp:ListItem>2008</asp:ListItem>
                            <asp:ListItem>2009</asp:ListItem>
                            <asp:ListItem>2010</asp:ListItem>
                            <asp:ListItem>2011</asp:ListItem>
                            <asp:ListItem>2012</asp:ListItem>
                            <asp:ListItem>2013</asp:ListItem>
                            <asp:ListItem>2014</asp:ListItem>
                            <asp:ListItem>2015</asp:ListItem>
                            <asp:ListItem>2016</asp:ListItem>
                            <asp:ListItem>2017</asp:ListItem>
                            <asp:ListItem>2018</asp:ListItem>
                            <asp:ListItem>2019</asp:ListItem>
                            <asp:ListItem>2020</asp:ListItem>
                             <asp:ListItem>2021</asp:ListItem>
                             <asp:ListItem>2022</asp:ListItem>

                         </asp:DropDownList>
            
                    </FooterTemplate>
                </asp:TemplateField>
                          
                
                    <asp:TemplateField HeaderText="Type" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                    <ItemTemplate>
                          <asp:Label  Text='<%# Eval("CAN_TYPE") %>' CssClass="gridview-item"  runat="server" />

                    </ItemTemplate>
                  <%--  <FooterTemplate>
                        <asp:TextBox Width="20px" ID="txtCanType" runat="server" />
                    </FooterTemplate>--%>
                </asp:TemplateField>

             
                         
        <asp:TemplateField HeaderText="Resume" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
            <ItemTemplate>

                <asp:LinkButton ID="lnkDownload" CssClass="gridview-item" Text ='<%# Eval("RESUME") %>' 
                    CommandArgument = '<%# Eval("RESUME") %>' runat="server" ForeColor="Blue"  OnClick="lnkDownload_Click"></asp:LinkButton>

               
                </ItemTemplate>
            <FooterTemplate>
                <asp:FileUpload Width="90px" Height="35px" ID="fResume" runat="server" />
            </FooterTemplate>
             
        </asp:TemplateField>
                
        <asp:TemplateField HeaderText="Edit" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                    <ItemTemplate>
    <asp:ImageButton ID="btnEdit" runat="server" CausesValidation="false" ToolTip="Edit"  ForeColor="Blue"  CommandName="btnEdit" Text="Edit" width="40px" Height="35px" ImageUrl="~/img/edit.png" />
  

                    </ItemTemplate>
            <FooterTemplate>
                <%--<asp:Button ID="btnAdd" Height="35px" width="60px" Text="ADD" runat="server" OnClick="btnAdd_Click" />--%>
                <asp:ImageButton ID="btnAdd" runat="server"
Text="ADD" CommandName="AddNew" OnClick="btnAdd_Click1" ValidationGroup="add" ImageUrl="Images/plus-icon-13071.png" Width="30px" Height="30px"/> 
            </FooterTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Goals" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
<ItemTemplate>
<%--<a href="#"  onclick='openPopup("<%# Eval("FULLNAME")%>")'>Comme</a>--%>
  <asp:LinkButton ID="btnViewGoals" CommandName="btnViewGoals" Text="Goals"  ForeColor="Blue"  ToolTip="View Goals" CausesValidation="false" CssClass="gridview-item" runat="server" />

</ItemTemplate>
</asp:TemplateField>

                 <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
<ItemTemplate>
<%--<a href="#"  onclick='openPopup("<%# Eval("FULLNAME")%>")'>Comme</a>--%>
  <asp:LinkButton ID="btnStatus" CommandName="btnStatus"   Text='<%# Eval("STATUS") %>' ForeColor="Blue"  ToolTip="Change Status" CausesValidation="false" CssClass="gridview-item" runat="server" />

</ItemTemplate>
</asp:TemplateField>

                                 <asp:TemplateField HeaderText="Assessment" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
<ItemTemplate>
<%--<a href="#"  onclick='openPopup("<%# Eval("FULLNAME")%>")'>Comme</a>--%>
  <asp:LinkButton ID="btnAssessment" CommandName="btnAssessments"   Text="Assements" ForeColor="Blue"  ToolTip="Assessments" CausesValidation="false" CssClass="gridview-item" runat="server" />

</ItemTemplate>
</asp:TemplateField>

               
             
             
            </Columns>
        </asp:GridView>
  </div>
  <div class="tab-pane fade" id="tabs-2">
    <p>No Records</p>
  </div>
  <div class="tab-pane fade" id="tabs-3">
    <p>No Records</p>
  </div>
</div>
    </div>
<script>
    $(function () {
        $("#tabs").tabs();
    });
</script>
</asp:Content>
