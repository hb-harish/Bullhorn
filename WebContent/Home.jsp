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
<li>Welcome : <%= u.getName()%></li>
</ul>
<form action="LoginServlet" method="post">
 <textarea name="message" rows="10" cols="30" maxlength="141">
Enter your text here
</textarea><br/>
<input type="submit" value="Submit" id="submit">
</form>
</body>
</html>