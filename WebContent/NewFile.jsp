<%@page import="application.treatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body{
background-image: url("images/machine12.png");
background-repeat: no-repeat;
background-size:cover;
}
#title{
margin-left:450px;
margin-top:10px;
font-size:30px;
width:1200px;
font-family:fantasy;
color:green;
}
#box{
list-style:none;
margin-left:250px;
margin-bottom:10px;
margin-top:50px;
}
#home{
text-decoration: none;
font-size:20px;
padding:10px;
color:#FFFFFF;
border:1px solid black;
width:200px;
height:30px;
border-radius:10px;
margin-left: 5px;
background-color: brown;
}
#doc{
text-decoration: none;
font-size:20px;
padding:10px;
color:#FFFFFF;
border:1px solid black;
width:200px;
height:30px;
border-radius:10px;
margin-left: 5px;
background-color: brown;
}
#pat{
text-decoration: none;
font-size:20px;
padding:10px;
color:#FFFFFF;
border:1px solid black;
width:300px;
height:10px;
border-radius:10px;
margin-left: 5px;
background-color: brown;
}
#sym{
border:1px solid black;
width:400px;
height:20px;
margin-left:350px;
margin-top: 10px;
}
#dis{
border:1px solid black;
width:400px;
height:20px;
margin-left:350px;
margin-top: 10px;
}
#text{
margin-left:440px;
margin-top:20px;
width:250px;
}
#det{
margin-left:570px;
margin-top:30px;
font-size:27px;
color:darkblue;
}
#tab{
border:1px solid black;
width:500px;
height:100px;
margin-left:530px;
margin-top: 20px;
}
#tab,th{
padding:20px;
text-align:left;
background-color:chocolate;
color:#FFFFFF;
border:1px solid black;
border-collapse:collapse;
width:200px;
}
#sub{
margin-left:700px;
margin-bottom:05px;
}
</style>
</head>
<body>
<div id="title">
TAILORED TREATEMENT RECOMMENDATION
</div>
<ol id="box">
<li>
<a href="Doctor.html" id="doc">Doctor</a>
<a href="chart.jsp" id="pat">Disease Based Gender Analyze</a>
<a href="agechart.jsp" id="pat">Age Based Disease Analyze</a>
<a href="Doctor.html" id="pat">Logout</a>
</li>
</ol>
<form action="#" method="post">

<div id="det">
Medicine Details
</div>
</form>
<table border="1" id="tab">
<tr>  

<th id="dis">Disease</th>

<th id="med">Medicine</th>

</tr>
<%
Connection con=null;
Statement st=null;
ResultSet rs=null;
PreparedStatement ps=null;

try{
String v=request.getParameter("id1");
con=treatement.getconnection();
st=con.createStatement();
String sql="select* from med where disease='"+v+"'";
rs=st.executeQuery(sql);
while(rs.next())
{
	%>
	<tr>
	<td><%=rs.getString("disease")%></td>
	<td><%=rs.getString("medicine")%></td>
	</tr>
	<%
}
}
catch(Exception e)
{
	out.print(e);
}
%>
</table>
</body>
</html>