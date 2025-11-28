<%@ Page Title="" Language="C#" MasterPageFile="~/LEARNING.Master" AutoEventWireup="true" CodeBehind="clients.aspx.cs" Inherits="ENOSISLEARNING.clients" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .clients-section {
    padding: 50px 20px;
    background: transparent;
    text-align: center;
}

.client-head h1 {
    font-family: 'Source Sans Pro', sans-serif;
    font-size: 28px;
    color: #006495;
    text-decoration: underline;
    margin-bottom: 40px;
}

.clients-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
    gap: 25px;
    align-items: center;
    justify-items: center;
}

.client-box {
    background: #fff;
    padding: 15px;
    border-radius: 12px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    transition: transform 0.3s, box-shadow 0.3s;
}

.client-box:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 25px rgba(0,0,0,0.2);
}

.client-pic {
    width: 120px;
    height: 80px; /* ya square: 120px */
    display: flex;
    align-items: center;
    justify-content: center;
    overflow: hidden;
}

.client-pic img {
    max-width: 100%;
    max-height: 100%;
    object-fit: contain;
}


.client-box:hover .client-pic img {
    transform: scale(1.1);
}

.client-name {
    font-family: 'Source Sans Pro', sans-serif;
    font-weight: 600;
    font-size: 16px;
    color: #333;
}
  /* Hover animation */
.training-program h3 i:hover {
  transform: scale(1.2) rotate(8deg);
  color: #4fd1c5; /* soft cyan on hover */
}
@keyframes pulse {
  0%, 100% { transform: scale(1); opacity: 1; }
  50% { transform: scale(1.2); opacity: 0.7; }
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container-fluid">
           <div class="row">
 <div class="col-lg-12 col-sm-12">
                     <div class="training-program"><h3><i class="fa-solid fa-handshake me-2 text-primary" style="color:#004C9F;animation: pulse 1.5s infinite;font-size:2.5rem"></i>
<span style="color:#FFA521;"> &nbsp;Our Trusted Clients</span></h3></div>
 </div>
</div>
    <section class="clients-section" styl="background-color:white;">
    <div class="clients-grid">
        <div class="client-box">
            <a href="http://www.capita.co.in/" target="_blank">
                <div class="client-pic">
                    <img src="Images/clients_images/capita_1.jpg" alt="Capita"/>
                </div>
                <div class="client-name">Capita</div>
            </a>
        </div>

        <div class="client-box">
            <a href="https://www.datamatics.com/" target="_blank">
                <div class="client-pic">
                    <img src="Images/clients_images/datamatrics_1.png" alt="Datamatics"/>
                </div>
                <div class="client-name">Datamatics</div>
            </a>
        </div>

        <div class="client-box">
            <a href="https://www.datamatics.com/" target="_blank">
                <div class="client-pic">
                    <img src="Images/clients_images/minecare.png" alt="Modular"/>
                </div>
                <div class="client-name">Modular</div>
            </a>
        </div>

        <div class="client-box">
            <a href="https://www.brintons.net/" target="_blank">
                <div class="client-pic">
                    <img src="Images/clients_images/brintons.jpg" alt="Brintons"/>
                </div>
                <div class="client-name">Brintons</div>
            </a>
        </div>

        <div class="client-box">
            <a href="http://www.halliburton.com/en-US/default.page" target="_blank">
                <div class="client-pic">
                    <img src="Images/clients_images/halliburton.png" alt="Halliburton"/>
                </div>
                <div class="client-name">Halliburton</div>
            </a>
        </div>

        <div class="client-box">
            <a href="https://www.axa.co.uk/home.aspx" target="_blank">
                <div class="client-pic">
                    <img src="Images/clients_images/axa_1.png" alt="Axa"/>
                </div>
                <div class="client-name">Axa</div>
            </a>
        </div>

        <div class="client-box">
            <a href="https://www.maerskline.com/" target="_blank">
                <div class="client-pic">
                    <img src="Images/clients_images/maersk.png" alt="Maerskline"/>
                </div>
                <div class="client-name">Maerskline</div>
            </a>
        </div>

        <div class="client-box">
            <a href="http://www.nihilent.com/" target="_blank">
                <div class="client-pic">
                    <img src="Images/clients_images/nihilent.jpg" alt="Nihilent"/>
                </div>
                <div class="client-name">Nihilent</div>
            </a>
        </div>

        <div class="client-box">
            <a href="https://gallagher-service-center.ajg.com/" target="_blank">
                <div class="client-pic">
                    <img src="Images/clients_images/gallagher.png" alt="Gallagher"/>
                </div>
                <div class="client-name">Gallagher</div>
            </a>
        </div>

        <div class="client-box">
            <a href="https://www.holtecasia.com/" target="_blank">
                <div class="client-pic">
                    <img src="Images/clients_images/holtecasia.png" alt="Holtecasia"/>
                </div>
                <div class="client-name">Holtecasia</div>
            </a>
        </div>

        <div class="client-box">
            <a href="http://caerusitconsulting.com/" target="_blank">
                <div class="client-pic">
                    <img src="Images/clients_images/caerus.png" alt="Caerus"/>
                </div>
                <div class="client-name">Caerus</div>
            </a>
        </div>
    </div>
</section>
   </div>

</asp:Content>
