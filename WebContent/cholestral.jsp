
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
<script type="text/javascript">
function validation(){
	var a=document.form.cholestral.value;
	if(a=="")
		{
		alert("please enter cholestral level");
		document.form.cholestral.focus();
		return false;
		}
}
</script>
<style type="text/css">
body{
background-image: url("images/machine10.jpg");
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
#in{
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
#ent{
margin-left:590px;
margin-top:50px;
font-size: 27px;
color:darkblue;
}
#que1{
margin-left:440px;
margin-top:20px;
font-size: 27px;
color:orangered;
}
#cho{
margin-left:300px;
margin-top:10px;
}
#cholestral{
margin-left:240px;
margin-top:5px;
}
#sub{
border: 1px solid balck;
width:60px;
height:28px;
margin-top: 10px;
background-color:blue;
color:white;
margin-left:600px;
}
</style>
</head>
<body>
<div id="title">
TAILORED TREATEMENT RECOMMENDATION
</div>
<ol id="box">
<li>
<a href="patient.html" id="pat">Patient</a>
<a href="Doctor.html" id="doc">Doctor</a>
<a href="Doctor.html" id="in">Logout</a></li>
</ol>
<div id="ent">
Patient Details
</div>
<% 
String s=(String)session.getAttribute("id3");
String t=request.getParameter("pressure");
session.setAttribute("id4",t);
%>

<form name="form"action="sugar.jsp" method="post" onsubmit="return validation()">
<div id="que1">
4)How much cholestral level?(126-564)
</div>
<div id="cho">
<input type="text" name="cholestral" id="cholestral" >
</div>
<input type="submit" value="submit" id="sub"> 
</form>
</body>
</html>