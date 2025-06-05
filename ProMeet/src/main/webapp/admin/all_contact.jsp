 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="promeet_web.dao.*,promeet_web.beans.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Details</title>
<%@include file="/common_html/all_css.html"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
    body {
        font-family: 'Roboto', sans-serif;
        background-color: #f8f9fa;
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }
    .container {
        max-width: 90%;
        flex: 1;
    }
    .table {
        border-radius: 10px;
        overflow: hidden;
    }
    .table thead {
        background-color: #343a40;
        color: white;
    }
    .table-hover tbody tr:hover {
        background-color: #f1f1f1;
    }
    h2 {
        font-weight: bold;
        color: #dc3545;
        margin-top: 20px;
    }
    .footer {
        margin-top: auto;
    }
    .modal-content {
        background-color: #343a40;
        color: white;
    }
</style>
</head>
<body>
<%@include file="/admin/admin_header.html"%>

<div class="container mt-5">
    <div class="text-center text-danger">
        <h3>Contact Details</h3>
    </div>
    
    <% AdminDao dao = new AdminDao();
       ArrayList<Contact> contactList = dao.viewAllContacts();
       if (contactList.size() > 0) { %>
       <form action="/ProMeet/DeleteContact" method="post">
        
        <h2 class="text-center">All Contact List</h2>
        <div class="table-responsive">
            <table class="table table-striped table-hover table-bordered shadow-lg text-center">
                <thead>
                    <tr>
                    <th>Select</th>
                        <th>Serial Number</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Query</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Contact c : contactList) { %>
                    <tr>
                    <th><input type="checkbox" name="chk" class="form-check-input" value="<%=c.getId()%>"></th>
                        <td><%= c.getId() %></td>
                        <td><%= c.getName() %></td>
                        <td><%= c.getEmail() %></td>
                        <td>
                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modal<%= c.getId() %>">
                                View Query
                            </button>
                        </td>
                        <td><%= c.getDate() %></td>
                    </tr>
                    <!-- Modal -->
                    <div class="modal fade" id="modal<%= c.getId() %>" tabindex="-1" aria-labelledby="modalLabel<%= c.getId() %>" aria-hidden="true">
                        <div class="modal-dialog modal-md">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="modalLabel<%= c.getId() %>">Query Details</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <p><strong>Question:</strong> <%= c.getQuery() %></p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </tbody>
            </table>
            <div class="text-center">
            <button class="btn btn-danger" id="btndelete">
                <i class="fa fa-lock"></i> Submit
            </button>
            </div>
            </div>
            </form>
            
            
        </div>
    <% } else { %>
        <h2 class="text-center text-muted">No Contacts Found</h2>
    <% } %>
<script>
let flag=0
let btn=document.getElementById("btndelete")
btn.addEventListener("click",function(event){
event.preventDefault()//Prevent From  FORM Submission
/* alert("hello") */
let checkBoxArray=document.getElementsByName("chk")
for (let i=0;i<checkBoxArray.length;i++)
{
if (checkBoxArray[i].checked==true)
	{
	flag=1
	break;
	}
	

}//for close
if (flag==1)
	document.forms[0].submit()
	else
		//alert("Please Select Atleast One CheckBox To Delete Contact ")
		 Swal.fire({
			  title: "Format Error",
			  text: "Please Select Atleast One CheckBox To Delete Contact ",
			  icon: "error"
			});
		

})//event listener close



</script>    

<br><br>
<div class="footer">
    <%@include file="/WEB-INF/common/footer.html" %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
