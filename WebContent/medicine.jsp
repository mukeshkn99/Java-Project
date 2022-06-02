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
	String b=request.getParameter("disease");
	String choosemedicine="";
	String[] medicine=request.getParameterValues("medicine");
	for(int i=0;i<medicine.length;i++)
	{
		choosemedicine+=medicine[i]+",";
	}
	
	
	Connection con=treatement.getconnection();
    Statement st=con.createStatement();
   	int i=st.executeUpdate("Insert into med(disease,medicine) values('"+b+"','"+choosemedicine+"')");
   	%>
	<script>
	alert("success");
	window.location="medicine.html"
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