<%@page import="create.chart"%>
<%@page import="java.util.ArrayList"%>
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
background-image: url("images/machine2.jpg");
background-repeat:no-repeat;
background-size:cover;
}
#title{
margin-left:430px;
margin-top:10px;
font-size:30px;
width:1200px;
font-family:fantasy;
color:green;
}
#box{
list-style:none;
margin-left:320px;
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
#h2{
margin-left:500px;
margin-top:20px;
}
#vie{
margin-left:440px;
margin-top:25px;
font-size:27px;
color:darkblue;
}
#cont{
margin-left:420px;
margin-top:20px;
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
<div id="vie">View Age Based Disease Analyze</div>
<div id="h2">
<input type="text" name="age" id="reg">		
<% 
Connection con2=null;
ResultSet rs2=null;
PreparedStatement ps2=null;
Statement st2=null;
try{
	String a=request.getParameter("age");
	con2=treatement.getconnection();
	st2=con2.createStatement();
	String sql1="select* from upload where age='"+a+"' ";
	rs2=st2.executeQuery(sql1);
	while(rs2.next()){
		%>
		
		 <% 
	}
}
catch(Exception ex)
{
	out.println(ex);
}
%>
<input type="submit" value="submit" id="sub"></div>
<div id="cont">
<%
String aa=null;
Integer bb=0;
String privacydata=null;
ArrayList<chart> list=new ArrayList <chart>();
String s="";

Connection con=null;
ResultSet rs=null;
PreparedStatement ps=null;
Statement st=null;
try{
	String g=request.getParameter("age");
	con=treatement.getconnection();
	st=con.createStatement();
	String sql="select disease,count(disease) as numbers ,age,gender,pressure,cholestral,sugar,electrocardiograph,heartrate,angina,strest,symtoms from upload where age='"+g+"' group by disease";
	rs=st.executeQuery(sql);
		while(rs.next()){
			g=rs.getString("age");
			aa=rs.getString("disease");
			System.out.println("server:"+aa);
		    bb=rs.getInt("numbers");
			System.out.println("count:"+bb);
			chart f=new chart();
			f.setform(aa);
			f.setvalue(bb);
			list.add(f);
		}
		for(Integer i=0;i<list.size(); i++){
			chart d=list.get(i);
			s=s+"{label:\""+d.getform()+"\",y:"+d.getvalue()+"},";
			System.out.println("s==============="+s);
		}
	}
	catch(Exception e){
		out.println(e);
	}
	%>
	<script src="js/canvasjs.min.js"></script>
	<script type="text/javascript">
	window.onload = function () {
		var chart = new CanvasJS.Chart("chartContainer", {
			theme: "theme2",//theme1
			title:{
				text: "Age Based DiseaseAnalzye"              
			},
			animationEnabled: false,   // change to true
			data: [              
			{
				// Change type to "bar", "area", "spline", "pie",etc.
				type: "pie",
				dataPoints: [
				             <%=s%>
				]
			}
			]
		});
		chart.render();
	}
	</script>
	<div id="chartContainer" style="height: 400px; width:500px;background-color:orange"></div>   
	</div>
</form>
</body>
</html>