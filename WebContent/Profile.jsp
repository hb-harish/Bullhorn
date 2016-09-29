<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to the support page</title>
<jsp:include page="Bootstrap.jsp"></jsp:include>
<script>


function keyup() {
	var p1 = sp = document.getElementById('pass1').value;
	var p2 = sp = document.getElementById('pass2').value;

    	if (p1==p2)
    		{
            $('#pass_feedback').html('Passwords match');
    		}
    	else 
    		$('#pass_feedback').html('Error: Passwords do not match');

    }


function validate(form) {
	var p1 = sp = document.getElementById('pass1').value;
	var p2 = sp = document.getElementById('pass2').value;
    valid = true;
    if (p1==p2){
        alert("Passwords do not match.");
        valid = false;
    }
    return valid;
}
</script>
</head>
<body>
	<jsp:include page="Navbar.jsp"></jsp:include>

		<% model.Bhuser u = (model.Bhuser) session.getAttribute("user");%>
		<h2> Click on any of the details to change it</h2>
		<form role="form" action="ProfileServlet" method="post"
			onsubmit="return validate(this);">
			<div class="form-group">
		<ul>
			<li>User Name &nbsp &nbsp:&nbsp<%= u.getUsername()%> &nbsp <input type="text" name="name"  value =<%=u.getUsername()%>></li>
			<br/>
			<li>User password &nbsp &nbsp:&nbsp ************* &nbsp <br/>
			<input type="password" name="pass1" id ="pass1" value =<%=u.getUserpassword()%>> &nbsp&nbsp
			<input type="password" name="pass2" id ="pass2" onkeyup="keyup()" value =<%=u.getUserpassword()%>> &nbsp <div id="pass_feedback"></div></li>
			<br/>
			<li>User motto &nbsp &nbsp:&nbsp<%= u.getMotto()%> &nbsp <input type="text" name="motto" value =<%=u.getMotto()%> ></li>
			<br/>
			<li>User email &nbsp &nbsp:&nbsp<%= u.getUseremail()%> &nbsp <input type="text" name="email" value =<%=u.getUseremail()%> ></li>
			<br/>
			<li>User join date &nbsp:&nbsp<%= u.getJoindate()%> </li>
			<br/>
		</ul>
		<input type="submit" value="Submit" id="submit" /> <input
					type="reset" value="Clear" />
		</div>
		</Form>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>