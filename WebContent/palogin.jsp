<%@page import="application.treatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
Connection con=null;
ResultSet rs=null;
PreparedStatement ps=null;
Statement st=null;
try{
	String aa=request.getParameter("username");
	String bb=request.getParameter("password");
	con=treatement.getconnection();
	st=con.createStatement();
	String sql="select* from login where username='"+aa+"' AND password='"+bb+"' ";
	rs=st.executeQuery(sql);
	if(rs.next()){
		%>
		<script>
		alert("correct");
		window.location="age.jsp"
		</script>
		<%
	}
	else{
		%>
		<script>
		alert("invalid username or password");
		window.location="patient.html"
		</script>
		<% 
	}
}
catch(Exception ex)
{
	out.print(ex);
}
%>
</body>
</html>