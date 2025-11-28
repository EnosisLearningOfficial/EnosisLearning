<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="VacanyDetails.aspx.cs" Inherits="ENOSISLEARNING.VacanyDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
   
<style>
     *
 {
     font-family: 'Montserrat', sans-serif;
 } 
    @media (min-width: 1200px) {
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            width: 100%;
            height: 100%;
        }
        .container
{
 width: 95%;
 height: 100%;
 margin-top: 5px;
 margin: auto;
 font-family: 'Montserrat', sans-serif;
 background-color:#F8F9FA;
}
   .containerSearch {
    border-radius: 20px;
    width:95%;
    height: 470px;
    margin: 20px 50px 20px 50px; /* Adjust margin as needed */
    display: flex;
    justify-content: space-between; /* Distribute space between columns */
    align-items: stretch; /* Make sure all columns have the same height */
    
}

.colOne, .colThree {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 20px;
    height: 100%; /* Full height of container */   
    /*margin-right:20px;
    margin-left:20px;*/
   background-color:white;
}


.colOne {
    width: 48%;
}

.colThree {
    width: 48%;
}

.child
{
 box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
 border-radius: 20px;
 height: 100%;   
 margin-left:20px;
 height:48%;
 margin-bottom:20px;
 background-color:white;
}
.set{
    margin-top: 15px;
    margin-left: 15px;
    margin-right: 15px;
}
.txt{
    /*width: 500px;*/
    border: none;
    font-size: large;
    margin-left: 40px;
    width: 500px;
}
.lbl{
    color:black;
    font-size:15px;
}
.co{
    color:#1d96b2;
}
.auto{
    width: 450px;
    height: auto;
    padding-left: 10px;
}
.expbtn{
    background-color: #1d96b2;
    height: 40px;
    color: white;
    border-radius: 15px;
    border-style: none;
    width: 130px;
}
    }
    @media (min-width: 992px) and (max-width: 1199.98px) {
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            width: 100%;
            height: 100%;
        }
        .container
{
 width: 95%;/*1265px*/
 height: 100%;
 margin-top: 5px;
 margin: auto;
 font-family: 'Montserrat', sans-serif;
 background-color:#F8F9FA;
}
   .containerSearch {
    border-radius: 20px;
    width:95%;
    height: 470px;
    margin: 20px 50px 20px 50px; /* Adjust margin as needed */
    display: flex;
    justify-content: space-between; /* Distribute space between columns */
    align-items: stretch; /* Make sure all columns have the same height */
    
}

.colOne, .colThree {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 20px;
    height: 100%; /* Full height of container */   
    /*margin-right:20px;
    margin-left:20px;*/
   background-color:white;
}


.colOne {
    width: 48%;
}

.colThree {
    width: 48%;
}

.child
{
 box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
 border-radius: 20px;
 height: 100%;   
 margin-left:20px;
 height:48%;
 margin-bottom:20px;
 background-color:white;
}
.set{
    margin-top: 15px;
    margin-left: 15px;
    margin-right: 15px;
}
.txt{
    /*width: 500px;*/
    border: none;
    font-size: large;
    margin-left: 40px;
    width: 200px;
}
.lbl{
    color:black;
    font-size:15px;
}
.co{
    color:#1d96b2;
}
.auto{
    width: 380px;
    height: auto;
    padding-left: 10px;
}
.expbtn{
    background-color: #1d96b2;
    height: 40px;
    color: white;
    border-radius: 15px;
    border-style: none;
    width: 130px;
}
    }
    @media (min-width: 768px) and (max-width: 991.98px) {
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            width: 100%;
            height: 100%;
        }
        .container
{
 width: 95%;/*1265px*/
 height: 100%;
 margin-top: 5px;
 margin: auto;
 font-family: 'Montserrat', sans-serif;
 background-color:#F8F9FA;
}
   .containerSearch {
    border-radius: 20px;
    width:95%;
    height: 470px;
    margin: 20px 50px 20px 50px; /* Adjust margin as needed */
    display: flex;
    justify-content: space-between; /* Distribute space between columns */
    align-items: stretch; /* Make sure all columns have the same height */
    
}

.colOne, .colThree {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 20px;
    height: 100%; /* Full height of container */   
    /*margin-right:20px;
    margin-left:20px;*/
   background-color:white;
}


.colOne {
    width: 48%;
}

.colThree {
    width: 48%;
}

.child
{
 box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
 border-radius: 20px;
 height: 100%;   
 margin-left:20px;
 height:48%;
 margin-bottom:20px;
 background-color:white;
}
.set{
    margin-top: 15px;
    margin-left: 15px;
    margin-right: 15px;
}
.txt{
    /*width: 500px;*/
    border: none;
    font-size: large;
    margin-left: 40px;
    width: 200px;
}
.lbl{
    color:black;
    font-size:15px;
}
.co{
    color:#1d96b2;
}
.auto{
    width: 330px;
    height: auto;
    padding-left: 10px;
}
.expbtn{
    background-color: #1d96b2;
    height: 40px;
    color: white;
    border-radius: 15px;
    border-style: none;
    width: 130px;
}
    }
    @media (min-width: 576px) and (max-width: 767.98px) {
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            width: 100%;
            height: 100%;
        }
        .container        
        {
         width: 95%;/*1265px*/
         height: 100%;
         margin-top: 5px;
         margin: auto;
         font-family: 'Montserrat', sans-serif;
         background-color:#F8F9FA;
        }
   .containerSearch {
    border-radius: 20px;
    width:95%;
    height: 470px;
    margin: 20px 50px 20px 50px; /* Adjust margin as needed */
    display: flex;
    justify-content: space-between; /* Distribute space between columns */
    align-items: stretch; /* Make sure all columns have the same height */
    
}

.colOne, .colThree {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 20px;
    height: 100%; /* Full height of container */   
    /*margin-right:20px;
    margin-left:20px;*/
   background-color:white;
}


.colOne {
    width: 48%;
}

.colThree {
    width: 48%;
}

.child
{
 box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
 border-radius: 20px;
 height: 100%;   
 margin-left:20px;
 height:48%;
 margin-bottom:20px;
 background-color:white;
}
.set{
    margin-top: 15px;
    margin-left: 15px;
    margin-right: 15px;
}
.txt{
    /*width: 500px;*/
    border: none;
    font-size: large;
    margin-left: 40px;
    width: 350px;
}
.lbl{
    color:black;
    font-size:15px;
}
.co{
    color:#1d96b2;
}
.auto{
    width: 480px;
    height: auto;
    padding-left: 10px;
}
.expbtn{
    background-color: #1d96b2;
    height: 40px;
    color: white;
    border-radius: 15px;
    border-style: none;
    width: 130px;
}
    }       
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
 <%--<asp:UpdatePanel runat="server">
   <ContentTemplate>--%>
     <div class="container" >
   
         <asp:Repeater ID="rptJobDetails" runat="server">
                    <ItemTemplate>
                      <div class="containerSearch">
                        <div class="colOne">
                            <div class="set">
                            <h3 style="padding-bottom: 0px; margin-left: 33%;color: #1d96b2;font-weight: 500;">Position Details</h3>
                          
                            <asp:TextBox ID="txtJobID" Visible="false" runat="server" Text='<%# Eval("JOBCODE") %>' ReadOnly="True" CssClass="txt" /><br /><br />

                        
                                <asp:Literal ID="litTagIcon" runat="server" Text="<i class='fas fa-tags co'></i>" Visible="true"></asp:Literal> <asp:TextBox ID="txtPositionName" style="border: none;-webkit-text-stroke-width: medium; margin-left: 5%; width: 100px; font-size:15px;" runat="server" Text='<%# Eval("POSITIONNAME") %>' ReadOnly="True" /><br /><br />

                            <asp:Literal ID="litTagPRIMARYSKILLS" runat="server" Text="<i class='fas fa-star co'></i>" Visible="true"></asp:Literal>
                            <asp:Label ID="lblSkills" runat="server" CssClass="lbl" Text="Skills: " ></asp:Label>
                            <asp:TextBox ID="txtSkills" runat="server" Text='<%# Eval("PRIMARYSKILLS") %>' ReadOnly="True" CssClass="txt" /><br /><br />

                            <asp:Literal ID="litTagCOMPANYADDRESS" runat="server" Text="<i class='fas fa-map-marker-alt co'></i>" Visible="true"></asp:Literal>
                            <asp:Label ID="lblLocation" runat="server" CssClass="lbl" Text="Location: "></asp:Label>
                            <asp:TextBox ID="txtLocation" runat="server" Text='<%# Eval("JOBLOCATION") %>' ReadOnly="True" CssClass="txt" /><br /><br />
                    
                            <asp:Literal ID="litTagEXPERIENCE" runat="server" Text="<i class='fas fa-briefcase co'></i>" Visible="true"></asp:Literal>
                            <asp:Label ID="lblExperience" CssClass="lbl" runat="server" Text="Experience: "></asp:Label>
                            <asp:TextBox ID="txtExperience" runat="server" Text='<%# Eval("EXPERIENCE") %>' ReadOnly="True" CssClass="txt" /><br /><br />

                            <asp:Literal ID="litTagSALARY" runat="server" Text="<i class='fas fa-dollar-sign co'></i>" Visible="true"></asp:Literal>
                            <asp:Label ID="lblSalary" runat="server" CssClass="lbl" Text="Salary: "></asp:Label>
                            <asp:TextBox ID="txtSalary" runat="server" Text='<%# Eval("SALARY") %>' ReadOnly="True" CssClass="txt" /><br /><br />

                             <asp:Literal ID="litTagQUALIFICATION" runat="server" Text="<i class='fas fa-graduation-cap co'></i>" Visible="true"></asp:Literal>
                            <asp:Label ID="lblQualification" runat="server" CssClass="lbl" Text="Qualification: "></asp:Label>
                            <asp:TextBox ID="txtQualification" runat="server" Text='<%# Eval("QUALIFICATION") %>' ReadOnly="True" CssClass="txt" /><br /><br />
                            </div>
                        </div>
                        <div class="colThree">
                         <div class="set">
                               <h3 style="padding-bottom: 0px; margin-left: 33%;color: #1d96b2;font-weight: 500;">Company Details</h3>
                         
                             <asp:Literal ID="litTagCompanyName" runat="server" Text="<i class='fas fa-building co'></i>" Visible="true"></asp:Literal>
                            <asp:TextBox ID="txtCompanyName" runat="server" Text='<%# Eval("COMPANYNAME") %>' ReadOnly="True" CssClass="txt" style="border: none;-webkit-text-stroke-width: medium; margin-left: 5%; font-size: 15px;" /><br /><br />

                             <asp:Literal ID="litTagEmail" runat="server" Text="<i class='fas fa-envelope co'></i>" Visible="true"></asp:Literal>
                             <asp:Label ID="lblEMAILID" runat="server" CssClass="lbl" Text="Email Id:"></asp:Label>
                             <asp:TextBox ID="txtCONTACTEMAILID" runat="server" Text='<%# Eval("CONTACTEMAILID") %>' ReadOnly="True" CssClass="txt" /><br /><br />

                             <asp:Literal ID="litTagPhoneNo" runat="server" Text="<i class='fas fa-phone co'></i>" Visible="true"></asp:Literal>
                              <asp:Label ID="lblPHONENO" runat="server" CssClass="lbl" Text="Phone No:"></asp:Label>
                             <asp:TextBox ID="txtCOMPANYPHONENO" runat="server" Text='<%# Eval("COMPANYPHONENO") %>' ReadOnly="True" CssClass="txt" /><br /><br />

                             <asp:Literal ID="litTagWebsite" runat="server" Text="<i class='fas fa-link co'></i>" Visible="true"></asp:Literal>
                              <asp:Label ID="lblWEBSITE" runat="server" CssClass="lbl" Text="WebSite:"></asp:Label>
                             <asp:TextBox ID="txtCOMPANYWEBSITE" runat="server" Text='<%# Eval("COMPANYWEBSITE") %>' ReadOnly="True" CssClass="txt" /><br /><br />

                             <asp:Literal ID="litTagCompanyDetails" runat="server" Text="<i class='fas fa-info-circle co'></i>" Visible="true"></asp:Literal>
                              <asp:Label ID="lblJobDesc" runat="server" CssClass="lbl" Text="Full job description:"></asp:Label><br />
                                <asp:TextBox ID="txtJOBDESCRIPTION" runat="server" TextMode="MultiLine" Text='<%# Eval("JOBDESCRIPTION") %>' ReadOnly="True" CssClass="txt auto " />
                            <br /><br />

                             <div style="text-align: center;border: solid 1px;border-radius: 15px;border-color: orange;height: 40px;width: 230px;margin-left: 150px;">
                                 <span > 
          
                                <a href="https://www.enosislearning.com" target="_blank">
                                    <img src="../Images/enosislogo.PNG" loading="lazy" style="height: 35px;" />  <%--class="logoImage"--%>
                                    </a>

                                   
                                 </span>


                             </div>
                            </div>
                        </div>

                   
                          </div>
                    </ItemTemplate>
                </asp:Repeater>
<div class="btn" style="margin-left: 31px;">
   
    <asp:Button id="btnPDF" runat="server" Text="Export To PDF" OnClick="btnPDF_Click" class="expbtn" CausesValidation="false"/>
    <asp:Button id="btnImages" runat="server" Text="Export To Images" class="expbtn" OnClick="btnImages_Click"/>
   
    

</div>
     </div>
       

<%--   </ContentTemplate>
</asp:UpdatePanel>--%>

</asp:Content>



