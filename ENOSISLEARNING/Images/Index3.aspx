<%@ Page Language="C#" AutoEventWireup="true" Async="true" MasterPageFile="~/LEARNING.Master" CodeBehind="index3.aspx.cs" Inherits="ENOSISLEARNING.Index3" %>

 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Best .Net Training in Pune</title>
        <link rel="stylesheet" href="css/main1.css" type="text/css" />
        <link rel="stylesheet" href="css/Minislider.css" type="text/css" />
      <link rel="stylesheet" href="css/gridview.css" type="text/css" />
        <script src="scripts/modernizr.js" type="text/javascript" language="javascript">
        </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="msgboxpanel" runat="server"></div>
    <div class="main mar0 clearfix"><!--main starts-->
    	<div class="mainLT fl-lt mar-bt"><!--main left starts-->
        	<div class="somebox fl-lt"><!--view courses starts-->
            <h2> Courses Offered</h2>
                <div id="slideshow-wrap"> <!-- mini slider -->
                    <input type="radio" id="button-1" name="controls" checked="checked"/>
                    <label for="button-1"></label>
                    <input type="radio" id="button-2" name="controls"/>
                    <label for="button-2"></label>
                    <input type="radio" id="button-3" name="controls"/>
                    <label for="button-3"></label>
                    <input type="radio" id="button-4" name="controls"/>
                    <label for="button-4"></label>
                    <input type="radio" id="button-5" name="controls"/>
                    <label for="button-5"></label>
                    <label for="button-1" class="arrows" id="arrow-1">></label>
                    <label for="button-2" class="arrows" id="arrow-2">></label>
                    <label for="button-3" class="arrows" id="arrow-3">></label>
                    <label for="button-4" class="arrows" id="arrow-4">></label>
                    <label for="button-5" class="arrows" id="arrow-5">></label>
                    <div id="slideshow-inner">
            <ul>
                <li id="slide1">
                    <img src="sliderImg/sl1.png" />
                </li>
                <li id="slide2">
                    <img src="sliderImg/sl2.png" />
                </li>
                <li id="slide3">
                    <img src="sliderImg/html-1.jpg" />
                </li>
                <li id="slide4">
                    <img src="sliderImg/sl3.png" />
                </li>
                <li id="slide5">
                    <img src="sliderImg/sl2.png" />
                </li>
               
            </ul>
        </div>
    </div>
            	<%--<img src="images/view-courses-icon.png" width="119" height="117" alt="Enosis Learning courses"/>
            	<h2>View Courses</h2>
                <p class="pad1">See detail information about courses here</p>
                <h4 class="pad1"><a href="Courses.aspx">Read more</a></h4>--%>
            </div>
            <div class="somebox fl-rt"><!--Register now starts-->
            	<a href="RegistrationForm.aspx"><img src="images/register-now-icon.png" width="119" height="119" alt="Enosis Learning courses"/></a>
            	<h2>To Enroll Today</h2>
                <p class="pad1">See detail information about courses here</p>
                <h4 class="pad1"><a href="Courses.aspx">Read more</a></h4>
            </div>
            <div class="pad3 clearfix">
            <p class="blue">Why ENOSIS LEARNING</p>
            <p class="pad1 lineH">Enosis Learning is a Professional IT Training Academy with a vision to provide pragmatic & industry based training to professionals and nurture them to achieve their goals.
Enosis Learning was formed to cater the need of Software Professionals around world, where there is huge gap of Trained Professionals. Enosis focuses on providing 360 deqree learning curve to professionals and making them industry ready. </p>
            </div>
        </div><!--main left ends-->
        
        <div class="mainRT fl-rt mar-lt"><!--main right starts-->
          

        	<div class="somebox1">
          		<h2 class="mar-1a">Schedule Of New Batches</h2>
                <h5 class="mar-2a textcolor">Register For Any Of the Batch Online, Click On Register Now</h5>
                <h5 class="mar-2a textcolor">Pay Registration Fees(Rs 100) By Net Banking, Credit Card or Debit Card</h5>
                <p class="mar-2a textcolor">
                    <asp:GridView ID="GridView1" CssClass="EU_DataTable" runat="server" 
                        OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="349px">
                        <Columns>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/register-now-btn.png" ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                </p>
                <!--Batch one ends-->
                
                <!--Batch two ends-->
                
                <!--Batch one three-->
            </div>
        </div><!--main right ends-->
    </div><!--main ends-->

</asp:Content>
