<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link REL="StyleSheet" TYPE="text/css" HREF="Format.css"> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to bullhorn</title>
</head>
<body>
<h2>Login successfull</h2>
<% UserCheck.User u = (UserCheck.User) session.getAttribute("user");%>
<ul> 

<li>First Name:<%=u.getName()%></li>
</ul>
</body>
</html>