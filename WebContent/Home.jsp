<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to Bullhorn</title>
<jsp:include page="Bootstrap.jsp"></jsp:include>
<script>
$(document).ready(function() {
    var text_max = 141;
    $('#textarea_feedback').html(text_max + ' characters remaining');

    $('#posttext').keyup(function() {
        var text_length = $('#posttext').val().length;
        var text_remaining = text_max - text_length;

        $('#textarea_feedback').html(text_remaining + ' characters remaining');
    });
});

function validate(form) {
    valid = true;
    if ($('#posttext').val().length==0){
        alert("You may not submit an empty post.");
        valid = false;
    }
    return valid;
}
</script>
</head>
<body>
	<jsp:include page="Navbar.jsp"></jsp:include>
	<center>
		<h2>Login Successfull</h2>
		<% model.Bhuser u = (model.Bhuser) session.getAttribute("user");%>
		<ul>
			<li>Welcome <%= u.getUsername()%>
			</li>
		</ul>
		<form role="form" action="HomeServlet" method="post"
			onsubmit="return validate(this);">
			<div class="form-group">
				<label for="post">Create New Post (141 char):</label>
				<br/>
				<textarea name="posttext" id="posttext" class="form-control"
					rows="2" placeholder="Express yourself!" maxlength="141"></textarea>

				<div id="textarea_feedback"></div>
			</div>
			<div class="form-group">
				<input type="submit" value="Submit" id="submit" /> <input
					type="reset" value="Clear" />
			</div>
		</form>
		<br />
		<h2>Posts Summary</h2>
		<div class="container">

<table class="table table-bordered table-striped table-hover">
    <thead>
        <tr><th>User</th><th>Post</th><th>Date</th></tr>
    </thead>
    <tbody>
    <c:forEach var="post" items="${posts}">
        <tr><td><a href="ProfileServlet?action=viewprofile&userid=<c:out value="${post.bhuser.bhuserid}"/>"><c:out value="${post.bhuser.useremail}"/></a></td>
        <td><c:out value="${post.posttext}"/></td>
        <td><fmt:formatDate value="${post.postdate}" pattern="dd-MMM-yy"/></td>
        </tr>
    </c:forEach>
    </tbody>
    </table>
    </div>
	</center>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>