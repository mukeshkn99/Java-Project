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
margin-left:490px;
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
#tab{
border:1px solid black;
width:300px;
height:100px;
margin-left:100px;
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
#flow{
padding:10px;
overflow:auto;
}
#vie{
margin-left:510px;
margin-top:25px;
font-size:27px;
color:darkblue;
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
<a href="patient.html" id="pat">Patient</a>
<a href="Doctor.html" id="pat">Logout</a>
</li>
</ol>
<form action="#" method="post">
<div id="vie">View Patient Disease Details</div>
</form>
<table border="1" id="tab">
<tr>

<th id="age">Age</th>

<th id="gender">Gender</th>

<th id="pre">Blood Pressure</th>

<th id="cho">Cholestral</th>

<th id="sug">Fast Blood Sugar</th>

<th id="ele">Electrocardiograph</th>

<th id="rat">Heartrate</th>

<th id="ang">Exercise Angina</th>

<th id="st">ST Depression Exersise Rest</th>

<th id="sym">Symtoms</th>

<th id="dis">Disease</th>

</tr>
<%
Connection con=null;
ResultSet rs=null;
PreparedStatement ps=null;
Statement st=null;
try{
	
	String y=(String)session.getAttribute("id2");
	
	
	String s=(String)session.getAttribute("id3");
	
	
	String r=(String)session.getAttribute("id4");
	
	
	String o=(String)session.getAttribute("id5");
	
	
	String p=(String)session.getAttribute("id6");
	
	
	String n=(String)session.getAttribute("id7");
	
	
	String j=(String)session.getAttribute("id8");
	
	
	String d=(String)session.getAttribute("id9");
	
	
	String u=(String)session.getAttribute("id10");

	
	con=treatement.getconnection();
	st=con.createStatement(); 
	String sql="select* from upload where age='"+y+"' AND gender='"+s+"' AND pressure='"+r+"' AND cholestral='"+o+"' AND sugar='"+p+"' AND electrocardiograph='"+n+"'  AND heartrate='"+j+"'  AND angina='"+d+"'  AND strest='"+u+"'   AND symtoms Like'%"+request.getParameter("symtoms")+"%'  group by symtoms ";
	rs=st.executeQuery(sql);
	while(rs.next())
	{
		%>
		<tr id="flow">
		<td><%=rs.getString("age")%></td>
		<td><%=rs.getString("gender")%></td>
		<td><%=rs.getString("pressure")%></td>
		<td><%=rs.getString("cholestral")%></td>
		<td><%=rs.getString("sugar")%></td>
		<td><%=rs.getString("electrocardiograph")%></td>
		<td><%=rs.getString("heartrate")%></td>
		<td><%=rs.getString("angina")%></td>
		<td><%=rs.getString("strest")%></td>
		<td><%=rs.getString("symtoms")%></td>
		<td><a href="NewFile.jsp?id1=<%=rs.getString("disease")%>"><%=rs.getString("disease")%></a></td>
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