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
	String b=request.getParameter("age");
	String c=request.getParameter("gender");
	String d=request.getParameter("pressure");
	String e=request.getParameter("cholestral");
	String f=request.getParameter("sugar");
	String g=request.getParameter("electrocardiograph");
	String h=request.getParameter("heartrate");
	String i=request.getParameter("angina");
	String j=request.getParameter("strest");
	String y="";
	String[] k=request.getParameterValues("symtoms");
	for(int m=0;m<k.length;m++){
		y+=k[m]+"";
	}
	String l=request.getParameter("disease");
    Connection con=treatement.getconnection();
    Statement st=con.createStatement();
   	int sql=st.executeUpdate("Insert into upload(age,gender,pressure,cholestral,sugar,electrocardiograph,heartrate,angina,strest,symtoms,disease) values('"+b+"','"+c+"','"+d+"','"+e+"','"+f+"','"+g+"','"+h+"','"+i+"','"+j+"','"+y+"','"+l+"')");
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