<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="View_Certificate.aspx.cs" Inherits="ENOSISLEARNING.View_Certificate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
         *
 {
     font-family: 'Montserrat', sans-serif;
 } 
     .container
     {
         width:95%;
         height:100%;
         margin-top :5px;
         margin:auto;
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
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
            <h4>Certificate Details</h4>
            <div class="gridview-area">
                <asp:GridView ID="grvCandidatescertificate"  AutoGenerateColumns="false" runat="server" EmptyDataText="No records has been added." DataKeyNames="cert_id" AllowPaging="true"  PageSize="12" PagerSettings-Mode="NumericFirstLast" OnPageIndexChanging="grvCandidatescertificate_PageIndexChanging"  PagerStyle-HorizontalAlign="Right"  PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" Visible="true" BorderStyle="None" AlternatingRowStyle-BackColor="white"  AlternatingRowStyle-ForeColor="black" CssClass="table table-hover table-borderless gridview-table" FooterStyle-CssClass="footer" FooterStyle-BorderColor="White">
                    <PagerStyle HorizontalAlign="left" ForeColor="Black" CssClass ="right-pagination" BorderColor="Transparent"/>
                    <Columns>
                        <asp:TemplateField HeaderText="cert_id" Visible="false">
                           <ItemTemplate>
                               <asp:Label id="lblcert_id" runat="server" Text='<%# Eval("cert_id") %>'></asp:Label>
                           </ItemTemplate>
                  </asp:TemplateField> 
                  <asp:TemplateField HeaderText="Course" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" ItemStyle-CssClass="gridview-item" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                           <ItemTemplate>
                               <asp:Label id="lblCourse" runat="server" Text='<%# Eval("course") %>' CssClass="gridview-item"></asp:Label>
                           </ItemTemplate>
                 </asp:TemplateField>
                <asp:TemplateField HeaderText="CANDIDATE_CODE" visible="false" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-CssClass="gridview-item">
                             <ItemTemplate>
                                  <asp:Label id="lblCANDIDATE_CODE" runat="server" Text='<%# Eval("CANDIDATE_CODE") %>' CssClass="gridview-item"></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                       <asp:TemplateField HeaderText="FULL NAME" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-CssClass="gridview-item">
                           <ItemTemplate>
                               <asp:Label id="lblFULLNAME" runat="server" Text='<%# Eval("FULLNAME") %>' CssClass="gridview-item"></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField> 
                       <asp:TemplateField HeaderText="GENDER" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-CssClass="gridview-item">
                       <ItemTemplate>
                           <asp:Label id="lblGENDER" runat="server" Text='<%# Eval("GENDER") %>' CssClass="gridview-item"></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField> 
                   <asp:TemplateField HeaderText="DOB" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-CssClass="gridview-item">
                       <ItemTemplate>
                          <asp:Label id="lblDOB" runat="server" Text='<%# Eval("DOB", "{0:MM/dd/yyyy}") %>' CssClass="gridview-item"></asp:Label>

                       </ItemTemplate>
                   </asp:TemplateField>  
                   <asp:TemplateField HeaderText="MOBILE NO" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-CssClass="gridview-item">
                       <ItemTemplate>
                           <asp:Label id="lblMOBILENO" runat="server" Text='<%# Eval("MOBILENO") %>' CssClass="gridview-item"></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField> 
                   <asp:TemplateField HeaderText="EMAIL" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-CssClass="gridview-item">
                       <ItemTemplate>
                           <asp:Label id="lblEMAIL" runat="server" Text='<%# Eval("EMAIL") %>' CssClass="gridview-item"></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField> 
                   <asp:TemplateField HeaderText="CANDIDATE_CODE" ShowHeader="false" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-CssClass="gridview-item">
                       <ItemTemplate>
                           <asp:Label id="lblcandidate_id" runat="server" Enabled="false" Text='<%# Eval("CANDIDATE_CODE") %>' CssClass="gridview-item"></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="View Certificate" ShowHeader="false" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-CssClass="gridview-item">
                       <ItemTemplate>
                            <asp:LinkButton ID="lblviewcertificate" CommandArgument = '<%# Eval("certificate") %>' OnClick="lblviewcertificate_Click" ForeColor="Red" runat="server"  Text='<%# Eval("certificate") %>' CssClass="gridview-item"/>
                       </ItemTemplate>
                   </asp:TemplateField>  
                    </Columns>
                </asp:GridView>
            </div>
        </div>
</asp:Content>
