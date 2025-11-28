<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="PhotoClickByCamera.aspx.cs" Inherits="ENOSISLEARNING.PhotoClickByCamera" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">
           
    .box-container-wrapper {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: center;
     }

         *
     {
        font-family: 'Montserrat', sans-serif;
     }
      .container-fluid
     {
        width:95%;
        height:100%;
        margin-top :5px;
        margin:auto;
     }  
     .head
     {
         width:100%;
         height:100px;
         border:0px solid green;
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
    .gridview-item:hover 
    {
         background-color: rgba(0, 0, 0, 0.03);
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
         background-color: #388e3c;
     }
      .footer
    {
        border-bottom:0.5px solid lightgrey;
        border-top:none;
        border-right:none;
        border-left:none;
    }
     .font{
         font-size: 14px;
     }
     .vacancy-top-tab {
    text-align: center;
 
    background-color: #1d96b2;  
    border-radius:15px;
    }
     .br
    {
        border-radius: 15px;     
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
    .box-container {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        border-radius: 50px;
        width: 100%;
        height: 100%;
        min-height: 200px; /* Minimum height for better visibility */
        border: 2px solid #007bff; /* Customize border color and width */
        border-radius: 15px; /* Rounded corners */
        padding: 10px; /* Adjust padding for inner spacing */
        box-sizing: border-box; /* Ensures padding is included in the total width and height */
        margin: 17px; /* Center the box and add vertical margin */
        background-color: #f8f9fa; /* Light background color */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Shadow effect */
        transition: all 0.3s ease; /* Smooth transition for hover effect */
    }

        .box-container:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Enhanced shadow on hover */
        }

    .button-container {
        display: flex;
        flex-direction: row;
        justify-content: center;
        margin-top: 20px;
    }

    button {
        margin: 5px;
    }

    #successMessage {
        color: green;
        margin-top: 20px;
        text-align: center;
    }

    .custom-textbox {
        height: 35px;
        width: 300px;
        border-radius: 10px;
        border: 1px solid black;
        padding: 5px 10px;
        font-size: 14px;
        text-align: center;
    }

        .custom-textbox:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
            outline: none;
        }

    .label-margin-right {
        margin-right: -14%;
    }

    .btn-success {
        margin-left: 1%;
        height: 35px;
        width: 80px;
        border-color: #007bff;
        border-radius: 10px;
    }

    .btn-primary {
        margin-right: 11%;
        height: 35px;
        width: 80px;
        border-color: #007bff;
        border-radius: 10px;
    }

    .aspButton {
        background-color: #007bff;
        border: none;
        color: white;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 5px 2px;
        cursor: pointer;
        border-radius: 15px;
        transition-duration: 0.4s;
    }

    .margin-left {
        margin-left: 90px; /* Adjust the value as needed */
    }


    .aspButton:hover {
        background-color: #0056b3;
        color: white;
    }

    .custom-button {
        border: 2px solid black;
        border-radius: 50px;
        padding: 10px 20px;
        background-color: #1d96b2; /* Light background color */
        color: white; /* Text color */
        cursor: pointer;
        border-style: none;
    }

        .custom-button:hover {
            background-color: #e0e0e0; /* Slightly darker background on hover */
        }

    .GridPager a, .GridPager span {
        display: block;
        height: 25px;
        width: 25px;
        font-weight: bold;
        text-align: center;
        text-decoration: none;
        border-radius: 10px;
    }

    .GridPager a {
        background-color: #f5f5f5;
        color: #969696;
        border: 1px solid #969696;
    }

    .GridPager span {
        background-color: #1d96b2;
        color: #000;
        border: 1px solid #3AC0F2;
    }

    .modal-header {
        border-style: none;
        color: black;
        border-top-left-radius: 18px;
        border-top-right-radius: 18px;
    }

    .modal-footer {
        border-style: none;
        border-bottom-left-radius: 18px;
        border-bottom-right-radius: 18px;
    }

    .modal-title {
        margin-left: 37%;
    }

    .modal-dialog-circular {
        border-radius: 50%;
        overflow: hidden;
        max-width: 600px;
        margin: auto;
    }

    .modal-content-circular {
        border-radius: 3%;
    }

    .form-control {
        border-radius: 50px;
        border: 1px solid #1d96b2;
        width: 40%;
        text-align: center;
    }

    .bg-primary {
        height: 35px;
        width: 95px;
        border-color: black;
        border-radius: 10px;
    }

    .btn-info {
        height: 35px;
        width: 51px;
        border-color: #007bff;
        border-radius: 10px;
    }

    .btn-danger {
        height: 35px;
        width: 51px;
        border-color: #007bff;
        border-radius: 10px;
    }

    .btn-warning {
        height: 35px;
        width: 51px;
        border-color: #007bff;
        border-radius: 10px;
    }

    .labeName {
        margin-left: 39%;
        color: black;
    }

    .circular-button {
        display: inline-block;
        border-radius: 50%;
        overflow: hidden;
        width: 50px; /* Increase the width */
        height: 50px; /* Increase the height */
        background-color: white; /* Background color */
        text-align: center;
        vertical-align: middle;
        border: 1px solid #ccc; /* Optional border */
        padding: 7px; /* Remove padding */
    }

        .circular-button img {
            border-radius: 50%;
            width: 60%; /* Reduce the width of the image */
            height: 60%; /* Reduce the height of the image */
            margin-top: 20%; /* Adjust to center the image */
            margin-left: 20%; /* Adjust to center the image */
        }
    /* GridView container to center the grid and add margins */
    .gridview-container {
        display: flex;
        justify-content: center;
    }

   

    .table-style {
        display: flex;
        justify-content: center;
    }

    .table-container {
        width: 60%; /* Make the GridView take full width of the container */
        height: 70px; /* Set a specific height for the GridView */
        border-radius: 60px; /* Rounded corners */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Shadow effect */
        overflow-y: auto; /* Scroll if content exceeds height */
        margin-left: 38px; /* Left margin */
        margin-right: 38px; /* Right margin */
        margin-top: 10px;
    }

    .br {
        border-radius: 50px;
    }

   
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="container-fluid">
      <div class="vacancy-top-tab" >
   <div class="row">
       <table style="border-collapse: separate; border-spacing: 15px;">
           <tr>
               <td>
                    <asp:Label ID="LblName" Style="color: white;" runat="server" Text="Name" Font-Size="Large" ForeColor="white" ></asp:Label>
               </td>
               <td>
                    <asp:TextBox ID="TxtName" runat="server" CssClass="custom-textbox" placeholder="Search Name" Style="border-radius: 50px; border-color: #1d96b2;" ></asp:TextBox>
               </td>
               <td>
                    <asp:ImageButton ID="BtnSearchh" runat="server" ToolTip="Search" ImageUrl="~/img/View.png" Width="45" Height="45" CssClass="circular-button" BackColor="white" OnClick="BtnSearchh_Click" />
               </td>
               <td>
                    <asp:Button ID="Btnclear" runat="server" Text="Clear" CssClass="btn-primary" Style="color: White; border-radius: 50px; background-color: green;" ForeColor="White" OnClick="Btnclear_Click" />
               </td>
               <td>
                    <a id="btnRDemo" href="#" class="btn btn-danger br" style="box-shadow: 1px 1px 3px 1px gray;width: 160px;height: 35px;" data-toggle="modal" data-target="#mycamModal" target="_parent"> <img src="../img/Add4.png"  title="Add" height="25" width="25" />Open Webcam</a>
               </td>
           </tr>
       </table>

       </div>
          </div>

    

       <div id="tabs" style="height:100%; border-radius: 15px;" class="gridview-area">  
        <asp:GridView ID="GridView1" runat="server" ForeColor="black" AutoGenerateColumns="false" DataKeyNames="id"
            OnRowEditing="GridView1_RowEditing" 
            OnRowCancelingEdit="GridView1_RowCancelingEdit"
            OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting"
            HeaderStyle-Font-Size="Small" Font-Bold="true" HeaderStyle-ForeColor="White"
            HeaderStyle-BackColor="#1d96b2" AllowPaging="true" PageSize="10" PagerSettings-Mode="NumericFirstLast" PagerStyle-HorizontalAlign="Right" PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" Visible="true" OnPageIndexChanging="GridView1_PageIndexChanging" PagerStyle-ForeColor="Black"
            PagerStyle-Font-Size="Small" PagerStyle-Font-Underline="true" EditRowStyle-ForeColor="Black" ViewStateMode="Enabled"
          BorderStyle="None" AlternatingRowStyle-BackColor="white"   CssClass="table table-borderless gridview-table" FooterStyle-CssClass="footer">
             <PagerStyle HorizontalAlign="Right" CssClass="GridPager"  ForeColor="black" />

            <Columns>

                <asp:TemplateField HeaderText="Name" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                    <ItemTemplate>
                       <asp:Label ID="lblName" Text='<%# Eval("Name") %>' CssClass="gridview-item" runat="server" ForeColor="Black" Font-Size="Small" />
                    </ItemTemplate>
                    <EditItemTemplate>
                            <asp:TextBox ID="txtName" Text='<%# Eval("Name") %>' runat="server" CssClass="form-control" />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="ImagePath"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                    <ItemTemplate>
                        <asp:Label ID="lblImagePath" Text='<%# Eval("ImagePath") %>' CssClass="gridview-item" runat="server" ForeColor="Black" Font-Size="Small" />
                    </ItemTemplate>
                    <EditItemTemplate>
                            <asp:TextBox ID="txtImagePath" Text='<%# Eval("ImagePath") %>' runat="server" CssClass="form-control" />

                    </EditItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Action" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                    <ItemTemplate>

                        <asp:ImageButton ID="View" runat="server"  ToolTip="View Image" ImageUrl="~/img/admin.png" Width="30" Height="30" CommandName="View" OnClientClick='<%# "return openFullscreen(\"" + ResolveClientUrl(Eval("ImagePath").ToString()) + "\")" %>' />


                        <asp:ImageButton ID="Edit" runat="server" CommandName="Edit"
                            AlternateText="Edit" ToolTip="Edit" ImageUrl="~/img/Edit1.png" Width="28" Height="28" />


                        <asp:ImageButton ID="Delete" runat="server" ToolTip="Delete" ImageUrl="~/img/Delete3.png" Width="28" Height="28" CommandName="Delete" />
                    </ItemTemplate>
                    <EditItemTemplate>

                        <asp:ImageButton ID="Update" runat="server" CommandName="Update"
                            AlternateText="Update" ToolTip="Update" ImageUrl="~/img/Add4.png" Width="28" Height="28" />


                        <asp:ImageButton ID="Cancel" runat="server" CommandName="Cancel"
                            AlternateText="Cancel" ToolTip="Cancel" ImageUrl="~/img/cancel2.png" Width="28" Height="28" />
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle />
<HeaderStyle Font-Bold="True" BackColor="#1D96B2" ForeColor="White"></HeaderStyle>
<PagerStyle BackColor="#1d96b2" ForeColor="White" HorizontalAlign="Center" />
<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
<SortedAscendingCellStyle BackColor="#E9E7E2" />
<SortedAscendingHeaderStyle BackColor="#506C8C" />
<SortedDescendingCellStyle BackColor="#FFFDF8" />
<SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    </div>
      
   
    <!-- WebCam dialog -->
    <div class="modal fade" id="mycamModal" tabindex="-1" role="dialog" aria-labelledby="cameraModalLabel" aria-hidden="true" style="background-color: aliceblue;">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content modal-content-circular modal-dialog-circulac" style="background-color: MintCream; border-radius: 50px;">

                <div class="modal-header">
                    <h5 class="modal-title" id="cameraModalLabel"><b style="color: #1d96b2;">Capture Images </b></h5>
                     <button type="button" class="close text-danger" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body">
                    <div id="cameraContainer" class="box-container-wrapper">
                        <div class="box-container" style="border-radius: 50px">
                            <video id="webcam" autoplay style="width: 100%; height: 100%; object-fit: cover;"></video>
                        </div>

                        <div class="box-container" style="border-radius: 50px">
                            <center>
                                <img id="capturedImage" alt="Captured Image" style="width: 100%; height: 100%; object-fit: cover;"></center>
                        </div>
                    </div>

                    <b>
                        <asp:Label class="labeName" Style="color: Black; font-size: Large; color: #1d96b2;" ID="Lblnam" runat="server" Text="Add Name" Font-Size="Large" ForeColor="Black"></asp:Label></b>

                    <center>
                        <asp:TextBox ID="txtnam" CssClass="form-control" placeholder="Enter Name" runat="server" /></center>

                </div>
                <div class="modal-footer button-container">
                    <button type="button" id="startCameraButton" class="custom-button">Start Webcam</button>

                    <button type="button" class="custom-button" onclick="captureImage()">Capture Image</button>

                    <button type="button" class="custom-button" onclick="stopWebcam()">Stop Webcam</button>


                    <asp:Button ID="BtnSaveImage" runat="server" Text="Save Image" CssClass="custom-button" data-dismiss="modal" OnClientClick="saveImage(); return false;" />

                </div>
            </div>
        </div>
    </div>

    <div id="successMessage"></div>
        </div>
       
    <script type="text/javascript">

        function openFullscreen(imagePath) {
            var fullImageUrl = imagePath.indexOf("Images") !== -1 ? imagePath : "Images/" + imagePath;

            var fullScreenWindow = window.open('', '_blank');
            var htmlContent = '<html><body style="margin: 55px; background-color: white; text-align: center;"><img src="' + fullImageUrl + '" style="max-width: 100%; max-height: 100%;"/></body></html>';

            fullScreenWindow.document.open();
            fullScreenWindow.document.write(htmlContent);
            fullScreenWindow.document.close();

            return false; // Prevents default behavior of the button
        }

        var video;
        var webcamStream;
        var imageDataUrl;

        function openCameraModal() {
            $('#cameraModal').modal('show');
        }

       function startWebcam() {
            video = document.querySelector("#webcam");

            navigator.mediaDevices.getUserMedia({ video: true })
                .then(function (stream) {
                    webcamStream = stream;
                    video.srcObject = stream;
                })
                .catch(function (error) {
                    console.log("Something went wrong!", error);
                });
        }

        function stopWebcam() {
            if (webcamStream) {
                webcamStream.getTracks().forEach(function (track) {
                    track.stop();
                });
                video.srcObject = null;
            }
        }

        function captureImage() {
            var canvas = document.createElement("canvas");
            canvas.width = video.videoWidth;
            canvas.height = video.videoHeight;
            var context = canvas.getContext("2d");
            context.drawImage(video, 0, 0, canvas.width, canvas.height);

            var imageElement = document.getElementById("capturedImage");
            imageDataUrl = canvas.toDataURL("image/jpeg");
            imageElement.src = imageDataUrl;
        }

        function saveImage() {

            var name = document.getElementById("<%= txtnam.ClientID %>").value;

            if (!name) {
                alert("Please enter a name before saving the image.");
                return; // Stop further execution if name is empty
            }

            if (imageDataUrl) {
                var data = {
                    imageData: imageDataUrl,
                    name: name
                };

                $.ajax({
                    type: "POST",
                    url: "PhotoClickByCamera.aspx/SaveImage",
                    data: JSON.stringify(data),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {

                        $('#successMessage').html("Image saved successfully!");
                        stopWebcam();
                        setTimeout(function () {
                            $('#successMessage').html("");
                        }, 5000);

                        // Clear input fields
                        document.getElementById('capturedImage').src = '';
                        document.getElementById('<%=txtnam.ClientID%>').value = '';

                        bindGridView(response.d)
                    },
                    error: function (error) {

                        console.log("Error saving image: ", error);
                    }
                });
            }
        }

        function bindGridView(data) {
            var table = $("#<%= GridView1.ClientID %>");
            table.find("tr:gt(0)").remove(); // Clear previous data

            $.each(JSON.parse(data), function (index, item) {
                var row = $("<tr/>").attr('id', 'row-' + item.id);
                row.append($("<td/>").text(item.Name));
                row.append($("<td/>").text(item.ImagePath));

                var str = item.ImagePath;
                var path = str.split("/");
                var lastString = path[path.length - 1];

                // Creating buttons for View, Edit, Delete
                var buttonsHtml = "<td>" +
                    "<input type='image' class='view-button' src='img/admin.png' alt='View' title='View' onclick='openFullscreen(\"" + lastString + "\"); return false;' style='height: 30px; width: 30px;' />" +

                    "<input type='image' class='edit-button' src='img/Edit1.png' alt='Edit' title='Edit' onclick='editItem(\"" + item.id + "\", \"" + item.Name + "\", \"" + item.ImagePath + "\"); return false;' style='height: 28px; width: 28px; margin-left: 5px;' />" +

                    "<input type='image' class='delete-button' src='img/Delete3.png' alt='Delete' title='Delete' onclick='deleteItem(\"" + item.id + "\"); return false;' style='height: 28px; width: 28px; margin-left: 5px;' />" +
                    "</td>";

                row.append($(buttonsHtml));
                table.append(row);
            });
        }

        function editItem(id, name, imagePath) {
            var row = $('#row-' + id);

            // Check if the row exists
            if (row.length === 0) {
                console.error('Row not found: #row-' + id);
                return;
            }

            // Store the original content in a data attribute
            var originalContent = row.html();
            row.data('originalContent', originalContent);

            // Create the input fields for editing with inline CSS for centering text
            var nameInput = "<div style='display: flex; justify-content: center;'><input type='text' id='edit-name-" + id + "' value='" + name + "' style='text-align: center; width: 40%; padding: 5px;' class='form-control' /></div>";
            var imagePathInput = "<div style='display: flex; justify-content: center;'><input type='text' id='edit-imagePath-" + id + "' value='" + imagePath + "' style='text-align: center; width: 40%; padding: 5px;' class='form-control' /></div>";

            // Create the Update and Cancel buttons
            var updateButton = "<input type='image' src='img/Add4.png' alt='Update' title='Update' onclick='saveEditItem(\"" + id + "\");return false;' style='height: 28px; width: 28px; margin-left: 5px;'/>";
            var cancelButton = "<input type='image' src='img/cancel2.png' alt='Cancel' title='Cancel' onclick='cancelEdit(\"" + id + "\");' style='height: 28px; width: 28px; margin-left: 5px;'/>";

            // Set the row's HTML content to the input fields and buttons
            row.html("<td>" + nameInput + "</td><td>" + imagePathInput + "</td><td>" + updateButton + cancelButton + "</td>");
            row.data('originalContent', originalContent);
        }


        function saveEditItem(id) {

            var editedName = $('#edit-name-' + id).val();
            var editedImagePath = $('#edit-imagePath-' + id).val();

            var data = {
                ID: id,
                Name: editedName,
                ImagePath: editedImagePath
            };

            $.ajax({
                type: "POST",
                url: "PhotoClickByCamera.aspx/UpdateImage",
                data: JSON.stringify(data),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {

                    if (response.d) {
                        $('#successMessage').html("Image updated successfully!");
                        setTimeout(function () {
                            $('#successMessage').html("");
                        }, 5000);
                        bindGridView(response.d); // Refresh the GridView with updated data
                        event.preventDefault();
                    } else {
                        $('#successMessage').html("Failed to update image.");
                        setTimeout(function () {
                            $('#successMessage').html("");
                        }, 5000);
                    }
                },
                error: function (error) {
                    console.log("Error updating image: ", error);
                }
            });
        }

        function deleteItem(id) {
            if (confirm('Are you sure you want to delete this item?')) {
                console.log("Deleting item with ID: " + id);

                // Perform AJAX call to delete the item on the server
                $.ajax({
                    type: "POST",
                    url: "PhotoClickByCamera.aspx/DeleteImage", // Adjust to your endpoint
                    data: JSON.stringify({ ID: id }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        console.log("Response from server: ", response);
                        $('#successMessage').html("Image deleted successfully!");
                        setTimeout(function () {
                            $('#successMessage').html("");
                        }, 5000);
                        bindGridView(response.d); // Refresh the GridView with updated data
                    },
                    error: function (error) {
                        console.error("Error deleting image: ", error);
                        alert("An error occurred while deleting the image. Please try again.");
                    },
                    complete: function () {
                        alert("Deletion process completed.");
                    }
                });
            }
        }


        function cancelEdit(id) {
            var row = $('#row-' + id);

            // Restore the original content
            var originalContent = row.data('originalContent');
            row.html(originalContent);
        }

        document.getElementById("startCameraButton").addEventListener("click", startWebcam);
    </script>
</asp:Content>
