<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link REL="StyleSheet" TYPE="text/css" HREF="Format.css"> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to Bullhorn</title>
</head>
<body>
<center>
<h2>Login Successfull</h2>
<% model.Bhuser u = (model.Bhuser) session.getAttribute("user");%>
<ul> 
<li>Welcome  <%= u.getUsername()%> </li>
</ul>
<form action="LoginServlet" method="post">
 <textarea name="message" rows="10" cols="30" maxlength="141">
Enter your text here
</textarea>
<input type="submit" value="Submit" id="submit">
</form>
<br/>
<table class="table table-bordered" border="1">
<head>
<title> Posts Summary </title>
</head>	
    <thead>
        <tr><th>User</th><th>Post</th><th>Date</th></tr>
    </thead>
    <tbody>
    
    <c:forEach var="post" items="${posts}">
        <tr><td><c:out value="${post.bhuser.useremail}"/></td>
        <td><c:out value="${post.posttext}"/></td>
        <td><fmt:formatDate value="${post.postdate}" pattern="dd-MMM-yy"/></td>
        </tr>
    </c:forEach>
    </tbody>
    </table>
</center>
</body>
</html>