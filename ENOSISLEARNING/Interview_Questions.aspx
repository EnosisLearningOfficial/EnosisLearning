<%@ Page Title="" Language="C#" MasterPageFile="~/LEARNING.Master" AutoEventWireup="true" CodeBehind="Interview_Questions.aspx.cs" Inherits="ENOSISLEARNING.Csharp_Question_Paper" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

  <%-- <link href="css/bootstrap.css" rel="stylesheet" />--%>
  
   <style>
       *{
           font-family: 'thin-regular' !important;
       }

  /* ===== GENERAL PANEL STYLING ===== */
  #lblcourse{
      color:white;
  }
    .panel {
        border-radius: 16px;
        border: none;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        overflow: hidden;
        margin-bottom: 30px;
    }

    .panel-info {
        background-color: #fff;
    }

    .panel-heading {
        background: linear-gradient(135deg, #173151, #1f3a6e);
        color: #fff !important;
        padding: 15px 25px;
    }

    .panel-title {
        font-weight: 600;
    }

   /* ======= PANEL HEADER LAYOUT FIX ======= */
.quesheader {
    font-weight: 600;
    color: #173151;
}

/* Right side buttons area */
.panel-title .col-md-6:last-child {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    flex-wrap: wrap;
    gap: 10px;
    position: static !important;
    float: none !important;
    width: auto !important;
}

/* ======= BUTTONS STYLE ======= */
.topbtn {
    font-size: 14px;
    padding: 8px 16px;
    border-radius: 8px;
    transition: all 0.3s ease;
}

.topbtn:hover {
    transform: scale(1.05);
    opacity: 0.9;
}

/* ======= SHARE IMAGE ======= */
.imgDownload {
    height: 40px;
    width: 40px;
    cursor: pointer;
    transition: transform 0.3s ease;
}

.imgDownload:hover {
    transform: scale(1.1);
}

/* ======= DROPDOWN STYLE ======= */
.dropdown13 {
    position: relative;
    display: inline-block;
}

.dropbtnn {
    background-color: #173151;
    color: #fff;
    padding: 8px 14px;
    font-size: 14px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.3s ease;
}

.dropbtnn:hover {
    background-color: #0f244b;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0,0,0,0.15);
    border-radius: 8px;
    min-width: 160px;
    z-index: 1000;
    padding: 8px 0;
}

.dropdown-content a {
    color: #333;
    padding: 6px 12px;
    text-decoration: none;
    display: flex;
    align-items: center;
    font-size: 14px;
}

.dropdown-content a:hover {
    background-color: #f5f5f5;
}

.dropdown13:hover .dropdown-content {
    display: block;
}

/* ======= Q&A SECTION ======= */
.ques {
    font-size: 1.8rem;
    font-weight: 600;
    color: #173151;
    margin-top: 10px;
}

.ans {
    font-size: 1.5rem;
    color: #333;
    line-height: 1.6;
    margin-top: 5px;
}

/* ======= PAGINATION BUTTONS ======= */
.page_enabled {
    display: inline-block;
    padding: 8px 14px;
    margin: 3px;
    border-radius: 50%;
    background-color: #173151;
    color: #fff !important;
    text-align: center;
}

.page_disabled {
    display: inline-block;
    padding: 8px 14px;
    margin: 3px;
    border-radius: 50%;
    background-color: #ccc;
    color: #666 !important;
    cursor: not-allowed;
}

/* ======= RESPONSIVE FIX ======= */
@media (max-width: 768px) {
    .panel-title .col-md-6:last-child {
        justify-content: center;
    }
    .topbtn {
        width: 100%;
        margin: 4px 0;
    }
    .imgDownload {
        margin: 8px auto;
        display: block;
    }
}

    /* ===== RESPONSIVE ===== */
    @media (max-width: 768px) {
        .panel-title .col-md-6 {
            width: 100%;
            text-align: center;
            margin-bottom: 10px;
        }

        .panel-title span {
            display: block;
            text-align: center;
        }

/* ==== BUTTONS ==== */
.topbtn {
    font-size: 14px;
    padding: 8px 14px;
    border-radius: 8px;
    transition: all 0.3s ease;
}

.topbtn:hover {
    transform: scale(1.05);
    opacity: 0.9;
}

/* ==== IMAGE ==== */
.imgDownload {
    height: 40px;
    width: 40px;
    cursor: pointer;
    transition: transform 0.3s ease;
}

.imgDownload:hover {
    transform: scale(1.1);
}

/* ==== DROPDOWN ==== */
.dropdown13 {
    position: relative;
    display: inline-block;
}

.dropbtnn {
    background-color: #173151;
    color: #fff;
    padding: 8px 14px;
    font-size: 14px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.3s ease;
}

.dropbtnn:hover {
    background-color: #0f244b;
}

.dropdown-content {
    display: none;
    position: absolute;
    right:200px;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0,0,0,0.15);
    border-radius: 8px;
    min-width: 160px;
    z-index: 1000;
    padding: 8px 0;
}

.dropdown-content a {
    color: #333;
    padding: 6px 12px;
    text-decoration: none;
    display: flex;
    align-items: center;
    font-size: 14px;
}

.dropdown-content a:hover {
    background-color: #f5f5f5;
}

.dropdown13:hover .dropdown-content {
    display: block;
}

/* ==== SOCIAL ICONS ==== */
.icon-social {
    width: 20px;
    height: 20px;
    margin-right: 6px;
}

/* ==== RESPONSIVE ==== */
@media (max-width: 768px) {
    .col-md-6.d-flex {
        justify-content: center;
        flex-direction: column;
    }

    .topbtn {
        width: 100%;
        margin: 4px 0;
    }

    .imgDownload {
        margin: 8px 0;
    }

    .dropdown13 {
        margin-top: 6px;
    }
}
}

   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     
    <div class="container-fluid" style=" margin-top: 10px;">
   <div class="row">
      <div class="col-md-12">
         <div class="panel  panel-info"  >
            <div class="panel-heading " >
               <div class="panel-title row h1">
                  <span class="h4 col-md-6 quesheader" style="color:white;">
                     <asp:Label ID="lblcourse"  runat="server" style="color:white;"/>
                     Interview Questions
                  </span>
<div class="col-md-6 d-flex flex-wrap justify-content-end align-items-center gap-2">
    <asp:Button 
        ID="btndownload" 
        runat="server"  
        Text="Download PDF"   
        CssClass="btn btn-danger topbtn" 
        CausesValidation="False" 
        OnClick="btndownload_Click"  
    />

    <asp:Button 
        ID="btnaddques" 
        CssClass="btn btn-danger topbtn" 
        runat="server" 
        Text="Ask Your Question to Our Experts" 
    />

    <asp:Image 
        runat="server" 
        ImageUrl="~/Images/share-icon.png" 
        AlternateText="Share" 
        CssClass="imgDownload" 
    />

    <div class="dropdown13">
        <button class="dropbtnn">Share</button>
        <div class="dropdown-content" style="position:absolute;left:-100px;margin-top:5px;">
            <a href="https://api.whatsapp.com/send?text=https://www.enosislearning.com/Interview_Questions.aspx?lag=SQL%20Server">
                <img src="Images/whatsapp1.png" alt="WhatsApp" class="icon-social" width="20" height="20"/> WhatsApp
            </a>
            <a href="https://www.facebook.com/enosis.learning?mibextid=tPfjzR">
                <img src="Images/facebook1.png" alt="Facebook" class="icon-social" width="20" height="20"/> Facebook
            </a>
            <a href="https://www.instagram.com/enosislearning?igsh=Z2R3OXpiZjhjbmQ0">
                <img src="Images/instagram1.png" alt="Instagram" class="icon-social" width="20" height="20"/> Instagram
            </a>
        </div>
    </div>
</div>

               </div>
            </div>

            <!-- /.box-header -->
            <div class="panel-body" id="panel1" runat="server">
               <asp:Repeater ID="rpquesdetails"   runat="server">
                  <ItemTemplate>
                     <h4 class="ques">
                        
                        <asp:Label ID="lblno" runat="server" Text='<%#Eval("RowNumber") %>' />
                        . 
                        <asp:Label ID="lblques" runat="server" Text='<%#Eval("Question") %>' CssClass="ques"/>
                     </h4>
                      <br />
                     <p class="ans"> 
                        <asp:Label ID="lblans" Text='<%#Eval("Answer") %>' runat="server" CssClass="ans"/>
                     </p>
                     <hr style="margin-top:10px;margin-bottom:10px;"/>
                  </ItemTemplate>
               </asp:Repeater>
            </div>
            <div class="panel-footer" id="Div1" >
               <asp:Repeater ID="rptPager" runat="server">
                  <ItemTemplate>
                     <asp:LinkButton ID="lnkPage" runat="server" CausesValidation="False" OnClick="lnkPage_Click" Text='<%#Eval("Text") %>' CommandArgument='<%# Eval("Value") %>'
                        CssClass='<%# Convert.ToBoolean(Eval("Enabled")) ? "page_enabled" : "page_disabled" %>'  
                        OnClientClick='<%# !Convert.ToBoolean(Eval("Enabled")) ? "return false;" : "" %>'></asp:LinkButton>
                  </ItemTemplate>
               </asp:Repeater>
            </div>
         </div>
      </div>
      <div class="col-md-12">
         <div class="panel panel-info">
            <div class="panel-heading">
               <h3 class="panel-title">Post Question Details</h3>
            </div>
            <!-- /.box-header -->
            <div class="panel-body">
               <div class="form-group">
                  <asp:Repeater ID="rppostques"   runat="server">
                     <ItemTemplate>
                        <h4 class="ques">
                           Ques. 
                           <asp:Label ID="lblques" runat="server" Text='<%#Eval("Ques") %>' />
                           <p class="ans" style="float:right;color:navy;font-size:14px;">
                              Posted On:
                              <asp:Label ID="lblans" Text='<%#Eval("Posted_On") %>' runat="server" />
                           </p>
                        </h4>
                        <br />
                     </ItemTemplate>
                  </asp:Repeater>
               </div>
            </div>
            <div class="panel-footer" id="btndiv" >
               <asp:Repeater ID="rppostquestpager" runat="server">
                  <ItemTemplate>
                     <asp:LinkButton ID="lnkPage" CausesValidation="False" runat="server"  OnClick="lnkPage_Click1" Text='<%#Eval("Text") %>' CommandArgument='<%# Eval("Value") %>'
                        CssClass='<%# Convert.ToBoolean(Eval("Enabled")) ? "page_enabled" : "page_disabled" %>'  
                        OnClientClick='<%# !Convert.ToBoolean(Eval("Enabled")) ? "return false;" : "" %>'></asp:LinkButton>
                  </ItemTemplate>
               </asp:Repeater>
            </div>
         </div>
      </div>
   </div>
</div>
<div id="dialog" class="container-fluid" style="display: none" >
   <div class="row">
      <div class="form-group">
         <asp:Label id="Label1" runat="server" CssClass="col-md-3 " >Course:</asp:Label>
         <div class="col-md-9" >
            <asp:Label ID="txtselectcourse" Height="50px" ReadOnly="True"  CssClass="form-control" runat="server" />
         </div>
      </div>
      <div class="clearfix"><br /></div>
      <div class="form-group">
         <asp:Label id="lblemail" runat="server" CssClass="col-md-3 " >Your Email Id:<span style="color:red;">*</span></asp:Label>
         <div class="col-md-9" >
            <asp:TextBox ID="txtemail" Height="50px" MaxLength="100" CssClass="form-control" runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter email id" ForeColor="Red" ControlToValidate="txtemail" Display="Dynamic"></asp:RequiredFieldValidator>
            <br />
            <asp:RegularExpressionValidator ID="reemail" ControlToValidate="txtemail" Display="Dynamic" runat="server" ForeColor="Red"  ErrorMessage="Please Enter Valid Email Id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
         </div>
      </div>
      <div class="clearfix"><br /></div>
      <div class="form-group">
         <asp:Label id="lblques" runat="server" CssClass="col-md-3"  >Question:<span style="color:red;">*</span></asp:Label>
         <div class="col-md-9" >
            <asp:TextBox ID="txtpost" runat="server" CssClass="form-control" MaxLength="1000" Height="100px"  TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfques" ControlToValidate="txtpost" runat="server" ErrorMessage="Please enter the question" ForeColor="Red" Display="Dynamic" />
         </div>
      </div>
      <div class="clearfix"><br /></div> 
      <div class="form-group">
         <div class="col-md-3"></div>
         <div class="col-md-9">
            <asp:Button ID="btnpost" runat="server"  Text="Post Question" CssClass="btn btn-danger mybtncss" OnClick="btnpost_Click"  />
         </div>
      </div>
   </div>
</div>

   <script src="Scripts/ajax-libs-jquery-1.7.2-jquery.min.js"></script>
   <script src="Scripts/ajax-jquery.ui-1.8.9-jquery-ui.js"></script>
   <link href="Scripts/ajax-jquery.ui-1.8.9-themes-start-jquery-ui.css" rel="stylesheet" />
   <script type="text/javascript">
       $("[id*=btnaddques]").live("click", function () {
           $("#dialog").dialog({
               title: "Enter Your Question Details",
               height: 600,
               width: 700,

               modal: true,
               open: function (type, data) {
                   $(this).parent().appendTo("form");
               }
           });
           return false;
       });

   </script>
   <br />
   <br />
</asp:Content>