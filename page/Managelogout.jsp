<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PAZURU</title>
	<span style="font-size:18px;"> <span style="font-size:24px;"><meta http-equiv="refresh" content="2;URL=Managelogin.jsp">
	<span style="font-size:24px;">
    <style>
     
     body{
        margin: 0px;
     }
	
	
     
    </style>
    <link rel="stylesheet" href="../css/all.css">
    <link rel="stylesheet" href="../css/goods.css">
</head>
<body>
    <header id="top">
        <p>PAZURU</p>     <!--名字-->
    </header>
    <nav>
        <a href="#landscape">風景拼圖</a> 
        <a href="#painting">古典畫作</a> 
        <a href="#others">其他</a> 
    </nav>
    
    <main class="card">
        
    </main>

<%
 session.removeAttribute("mgid");
 out.print("登出成功!");
%>
    <footer>  
        <p>連絡電話：02-21345678</p>
        <p>服務時間：10:00～20：00</p>
        <p>客服信箱：abc@gmail.com</p>
        <blockquote class="blockquote text-right">
            <p><a href="#top">回頂部</a></p>
            <p>可刷卡</p> 
        </blockquote>
        
    </footer>
</body>
</html>