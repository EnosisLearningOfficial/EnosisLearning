<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AjaxDemoTutorial.aspx.cs" Inherits="ENOSISLEARNING.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/2.3.5/css/dataTables.dataTables.min.css" rel="stylesheet" />
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
                        <input type="hidden" id="StudentID"/>
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

        <%-- Data table --%>
        <table id="tblStudent" class="table table-bordered">
           <thead>
               <tr>
                   <th>Student Id</th>
                   <th>Student Name</th>
                   <th>Student Email</th>
                   <th>Student Course</th>
                   <th>Actions</th>
               </tr>
           </thead>
            <tbody></tbody>
        </table>


    </form>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
     <script src="https://cdn.datatables.net/2.3.5/js/dataTables.min.js"></script>
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

    <%-- Load Data table --%>
    <script>
        $(document).ready(function () {
            //Initiale Datatable
            $('#tblStudent').DataTable({
                "ajax": {
                    "url": "AjaxDemoTutorial.aspx/GetAllStudents",
                    "type": "POST",
                    "contentType": "application/json; charset=utf-8",
                    "dataType": "json",
                    "data": function () { return JSON.stringify({}); },
                    "dataSrc": function (json) {
                        console.log(json);//Debugging
                        return json.d.data;
                    }
                },
                "columns": [
                    { "data": "Id" },
                    { "data": "Name" },
                    { "data": "Email" },
                    { "data": "Course" },
                    {
                        "data": null,
                        "render": function (data, type, row) {
                            return `
                            <a class="fa fa-pencil edit-btn" data-id='${row.Id}' href="#" data-bs-target="#studentModal" data-bs-toggle="modal"></a>
                            <a class="fa fa-trash text-danger delete-btn" data-id='${row.Id}'></a>
                            `;
                        },
                        "orderable": false,
                        "searchable":false
                    }
                ]
            });
        });
    </script>
    <%-- Get Student by Id --%>
    <script>
        //Edit Button Click
        $(document).on('click', '.edit-btn', function () {
            var id = $(this).data('id');
            console.log(id);
            $.ajax({
                "url": "AjaxDemoTutorial.aspx/GetStudentById",
                "type": "POST",
                "data": JSON.stringify({ id: id }),
                "contentType": "application/json; charset=utf-8",
                "dataType": "json",
                success: function (response) {
                    var s = response.d;
                    $('#StudentID').val(s.Id);
                    $('#Name').val(s.Name);
                    $('#Email').val(s.Email);
                    $('#Course').val(s.Course);
                    $('#StudentModalLabel').text("Edit Student");
                    $('#saveBtn').hide();
                    $('#updateBtn').show();
                    $('#studentModal').modal('show');
                },
                Error: function () {
                    alert("Failed to fetch Student Record");
                }
            });
        });


        //Update Method
        $('#updateBtn').click(function () {
            var id = $('#StudentID').val();
            var name = $('#Name').val().trim();
            var email = $('#Email').val().trim();
            var course = $('#Course').val().trim();

            $.ajax({
                "url": "AjaxDemoTutorial.aspx/UpdateStudent",
                "type": "POST",
                "data": JSON.stringify({ id: id, name: name, email: email, course: course }),
                "contentType": "application/json; charset=utf-8",
                "dataType": "json",
                success: function (response) {
                    if (response.d == "success") {
                        alert("Student Update Succssfully");
                        $('#Name').val('');
                        $('#Email').val('');
                        $('#Course').val('');
                        $('#studentModal').modal('hide');
                        //Refresh data table
                        $('#tblStudent').DataTable().ajax.reload();
                    }
                    else {
                        alert("Updation Failed..!");
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
