<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="Bootstrap.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Log in page</title>
</head>
<body>
<center>
<h1><%=session.getAttribute("message")%></h1>
<form action="LoginServlet" method="post">
 First name:<br/>
 <input type="text" name="userid">
 <br/>
 Password:<br/>
 <input type="password" name="password">
 <br/>
 <input type="submit" value="Submit" id="submit">
</form>
</center>
</body>
</html>