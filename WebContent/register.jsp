
<%@page import="java.sql.Statement"%>
<%@page import="application.treatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
	String a=request.getParameter("username");
	String b=request.getParameter("qualification");
	String c=request.getParameter("mobilenumber");
	String d=request.getParameter("age");
	String e=request.getParameter("gender");
	String f=request.getParameter("address");
	String g=request.getParameter("location");
	String h=request.getParameter("email");
	String i=request.getParameter("password");
    Connection con=treatement.getconnection();
    Statement st=con.createStatement();
   	int sql=st.executeUpdate("Insert into file(username,qualification,mobilenumber,age,gender,address,location,email,password) values('"+a+"','"+b+"','"+c+"','"+d+"','"+e+"','"+f+"','"+g+"','"+h+"','"+i+"')");
	%>
	<script>
	alert("success");
	window.location="Doctor.html"
	</script>
	<%
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>