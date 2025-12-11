<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AjaxDemoTutorial.aspx.cs" Inherits="ENOSISLEARNING.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">
        <%-- Declare script manager always on top --%>
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <%-- Add Modal --%>
        <div class="modal fade" id="studentModal" tabindex="-1" aria-labelledby="StudentModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 id="StudentModalLabel" class="modal-title">Add Student</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <label for="Name" class="form-label">Name</label>
                        <input id="Name" type="text" class="form-control"/>
                        <%-- Email --%>
                        <label for="Email" class="form-label">Email</label>
                        <input id="Email" type="text" class="form-control"/>
                        <%-- Course --%>
                        <label for="Course" class="form-label">Course</label>
                        <input id="Course" type="text" class="form-control"/>
                    </div>
                    <div class="modal-footer">
                        <button id="saveBtn" type="button" class="btn btn-success">Save</button>
                        <button id="updateBtn" type="button" class="btn btn-info" style="display:none;">Update</button>
                    </div>
                </div>
            </div>
        </div>
        <%-- Button For Add popup Modal --%>
        <button id="modalBtn" class="btn btn-primary" type="button" data-bs-target="#studentModal" data-bs-toggle="modal">Open Add Modal</button>


    </form>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <script>
        //Add Student
        $('#saveBtn').click(function () {
            //Save data
            var name = $('#Name').val().trim();
            var email = $('#Email').val().trim();
            var course = $('#Course').val().trim();
            //console.log(name);
            //console.log(email);
            //console.log(course);
            //Check all fields are there

            if (name == "" || email == "" || course == "") {
                alert("Please fill All the Fields.");
                return;
            }
            $.ajax({
                "url": "AjaxDemoTutorial.aspx/InsertStudent",
                "type": "POST",
                "data": JSON.stringify({ name: name, email: email, course: course }),
                "contentType":"application/json; charset=utf-8",
                "dataType": "json",
                success: function (response) {
                    if (response.d == "success") {
                        alert("Record Inserted successfully");
                        $('#Name').val('');
                        $('#Email').val('');
                        $('#Course').val('');
                        $('#studentModal').modal('hide');
                    }
                    else {
                        alert("Insertion Failed..!");
                    }
                },
                error: function () {
                    alert("Error Server Calling");
                }
            });
        });
    </script>
</body>
</html>
