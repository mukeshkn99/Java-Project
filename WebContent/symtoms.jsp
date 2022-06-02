
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
<script type="text/javascript">
function validation(){
	if((document.form.symtoms[0].checked==false)&&(document.form.symtoms[1].checked==false)
			&&(document.form.symtoms[2].checked==false)&&(document.form.symtoms[3].checked==false)
			&&(document.form.symtoms[4].checked==false)&&(document.form.symtoms[5].checked==false)
			&&(document.form.symtoms[6].checked==false)&&(document.form.symtoms[7].checked==false)
			&&(document.form.symtoms[8].checked==false)&&(document.form.symtoms[9].checked==false)
			&&(document.form.symtoms[10].checked==false)&&(document.form.symtoms[11].checked==false)
			&&(document.form.symtoms[12].checked==false)&&(document.form.symtoms[13].checked==false)
			&&(document.form.symtoms[14].checked==false)&&(document.form.symtoms[15].checked==false)
			&&(document.form.symtoms[16].checked==false)&&(document.form.symtoms[17].checked==false))
			{
		alert("please select symtoms");
		document.form.symtoms.focus;
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
#sym{
margin-left:250px;
margin-top:10px;
font-size:20px;
color:;
}
#chest{
margin-left:250px;
font-size:20px;
color:blue;
}
#pre{
margin-left:80px;
font-size:20px;
color:blue;
}
#tig{
margin-left:80px;
font-size:20px;
color:blue;
}
#fe{
margin-left:30px;
font-size:20px;
color:blue;
}
#cau{
margin-left:250px;
font-size:20px;
color:blue;
}
#abd{
margin-left:250px;
font-size:20px;
color:blue;
}
#wei{
margin-left:113px;
font-size:20px;
color:blue;
}
#fat{
margin-left:102px;
font-size:20px;
color:blue;
}
#skin{
margin-left:91px;
font-size:20px;
color:blue;
}
#sne{
margin-left:30px;
font-size:20px;
color:blue;
}

#swe{
margin-left:122px;
font-size:20px;
color:blue;
}
#whe{
margin-left:33px;
font-size:20px;
color:blue;
}
#stu{
margin-left:45px;
font-size:20px;
color:blue;
}
#sho{
margin-left:250px;
font-size:20px;
color:blue;
}

#vom{
margin-left:114px;
font-size:20px;
color:blue;
}
#eye{
margin-left:75px;
font-size:20px;
color:blue;
}
#joi{
margin-left:250px;
font-size:20px;
color:blue;
}
#rab{
margin-left:86px;
font-size:20px;
color:blue;
}

#chi{
margin-left:95px;
font-size:20px;
color:blue;
}
#thr{
margin-left:33px;
font-size:20px;
color:blue;
}
#pne{
margin-left:250px;
font-size:20px;
color:blue;
}
#per{
margin-left:74px;
font-size:20px;
color:blue;
}

#nau{
margin-left:44px;
font-size:20px;
color:blue;
}
#sub{
border: 1px solid balck;
width:60px;
height:28px;
margin-top: 10px;
background-color:blue;
color:white;
margin-left:560px;
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
String d=(String)session.getAttribute("id9");
String b=request.getParameter("strest");
session.setAttribute("id10",b);
%>

<form name="form" action="view.jsp" method="post" onsubmit="return validation()">
<div id="que1">
10)what is your symtoms?
</div>
<div id="sym">
<input type="checkbox" name="symtoms" id="chest" value="chest pain">chest pain
<input type="checkbox" name="symtoms" id="pre" value="chest pressure">chest pressure
<input type="checkbox" name="symtoms" id="tig" value="chest tightness">chest tightness
<input type="checkbox" name="symtoms" id="fe" value="fever">fever<br/>
<input type="checkbox" name="symtoms" id="cau" value="caugh">caugh
<input type="checkbox" name="symtoms" id="wei" value="weight loss">weight loss
<input type="checkbox" name="symtoms" id="fat" value="fatique">fatique
<input type="checkbox" name="symtoms" id="skin" value="skin problems">skin problems<br/>
<input type="checkbox" name="symtoms" id="abd" value="abdominal pain">abdominal pain`
<input type="checkbox" name="symtoms" id="sne" value="sneezing">sneezing
<input type="checkbox" name="symtoms" id="swe" value="swellon eyes">swellon eyes
<input type="checkbox" name="symtoms" id="stu" value="stuffy nose">stuffy nose<br/>
<input type="checkbox" name="symtoms" id="sho" value="shortness breath">shortness breath
<input type="checkbox" name="symtoms" id="whe" value="wheezing">wheezing
<input type="checkbox" name="symtoms" id="vom" value="vomiting">vomiting
<input type="checkbox" name="symtoms" id="eye" value="pain eyes">pain eyes<br/>
<input type="checkbox" name="symtoms" id="joi" value="joint pain">joint pain
<input type="checkbox" name="symtoms" id="rab" value="rabid breath">rabid breath
<input type="checkbox" name="symtoms" id="chi" value="fever and chill">fever and chill
<input type="checkbox" name="symtoms" id="thr" value="thick throat">thick throat<br/>
<input type="checkbox" name="symtoms" id="pne" value="pneumonia">pneumonia
<input type="checkbox" name="symtoms" id="per" value="persistent diarrhea">persistent diarrhea
<input type="checkbox" name="symtoms" id="nau" value="nausea">nausea
</div>
<input type="submit" value="submit" id="sub"> 
</form>

</body>
</html>
