<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PAZURU</title>
    <script>
        function disp_alert()
        {
            alert("如果您尚未註冊，要先註冊哦");
        }
            </script>
    <link rel="stylesheet" href="../assets/css/all.css">
    <link rel="stylesheet" href="../assets/css/login.css">
</head>
<style>
.background{
	background-color:#b096a7b8;
	padding:20px;
	text-align:center;
}
h2,h3,h4{
	color:white;
	font-weight: 200;
	
}
h1{
	font-weight:300;
}
</style>

<body>
    <header id="top">
        <div class="container">
    <p ><a class="name" href="../index.html">PAZURU</a></p>     <!--名字-->
        
        </div>
        
        
    </header>
    <nav><!--選單!!!大幅度更改!!!-->
        <div class="container">
        <ul>
            <li><a href="../index.jsp">PAZURU</a></li>
            <li><a href="landscape.jsp">商品</a>
            <ul>
                <li><a href="../page/landscape.jsp">風景拼圖</a>
                <ul>
                    <li><a href="../page/landscape4.jsp">義大利</a></li>
                    <li><a href="../page/landscape3.jsp">日本富士山</a></li>
                    <li><a href="../page/landscape6.jsp">老街</a></li>
                    <li><a href="../page/landscape1.jsp">色彩繽紛的小鎮</a></li>
                    <li><a href="../page/landscape2.jsp">愛丁堡馬戲團巷</a></li>
                    <li><a href="../page/landscape5.jsp">瓦胡島</a></li>
                </ul>
                </li>
                <li><a href="../page/painting.jsp">古典畫作</a>
                    <ul>
                        <li><a href="../page/painting1.jsp">清明上河圖</a></li>
                        <li><a href="../page/painting2.jsp">拾穗者</a></li>
                        <li><a href="../page/painting3.jsp">戴珍珠耳環的少女</a></li>
                        <li><a href="../page/painting4.jsp">吶喊</a></li>
                        <li><a href="../page/painting5.jsp">星空</a></li>
                        <li><a href="../page/painting6.jsp">自由引導人民</a></li>
                    </ul>
                </li>
                <li><a href="../page/stars.jsp">星空</a>
                    <ul>
                        <li><a href="../page/star1.jsp">雪</a></li>
                        <li><a href="../page/star2.jsp">生存</a></li>
                        <li><a href="../page/star3.jsp">嚮往</a></li>
                        <li><a href="../page/star4.jsp">盡頭</a></li>
                        <li><a href="../page/star5.jsp">凌晨</a></li>
                        <li><a href="../page/star6.jsp">銀河</a></li>
                    </ul>
                </li>
            </ul>
            </li>
            <li><a href="../page/memberprofile.jsp">會員專區</a>
            <ul>
            <li><a href="../page/signin.jsp">註冊</a></li>
            <li><a href="../page/login.jsp">登入</a></li>
            <li><a href="../page/shoppingCar.jsp">購物車</a></li>
            </ul>
            </li>
            <li><a href="../page/aboutUs.html">關於我們</a></li>
            <li><img class="shoppingCar" src="../assets/img/shoppingCar.png"></li>
        </div>
    </nav>

<%
try{
Class.forName("com.mysql.jdbc.Driver");
try{
String url="jdbc:mysql://localhost";
Connection con=DriverManager.getConnection(url,"root","1234");
String sql="use user";
con.createStatement().execute(sql);
%>
<%	 
  if(session.getAttribute("MAIL") != null ){
	 sql = "SELECT*FROM `member`WHERE `MAIL`='"+session.getAttribute("MAIL")+"'";
	 ResultSet rs=con.createStatement().executeQuery(sql);
	 String  USERNAME="",MAIL="",PASSWORD="";
	 while(rs.next()){
		 USERNAME=rs.getString("USERNAME");
		MAIL=rs.getString("MAIL");
		 PASSWORD=rs.getString("PASSWORD");		 
	 }
	 con.close();
	%>
<h3><font color="gray"><div align="center">您好! <%=USERNAME%> <br></div>
<div class="background"><h3><font color="white">請修改會員資料：<br>
<form action="update.jsp" method="POST">
<h4><font color="white">您的帳號：<input type="text" class="form-control" name="MAIL" value="<%=MAIL%>" />
<h4><font color="white">您的密碼：<input type="password" class="form-control" name="PASSWORD" value="<%=PASSWORD%>"/><br><br><br>
<div align="center"><input type="submit"  value="更新資料" style="color: rgb(255, 255, 255);margin-bottom: 30px; padding: 10px 15px 10px 15px; border: #989bfb 3px solid; background-color: rgb(84, 132, 246);border-radius: 10px;"></form></div>


</div>

<%
}
else{
	
	con.close();//結束資料庫連結
%>
<div align="center">
<h1><font color="red">您尚未登入，請先登入！</font></h1></div>
<form action="check.jsp" method="POST">
<h5>帳號：<input type="text" class="form-control"name="MAIL" /><br />
密碼：<input type="password" class="form-control"name="PASSWORD" /><br />
<div align="center"><input type="submit" name="b1" value="登入"style="color: rgb(255, 118, 118);margin-bottom: 30px; padding: 10px 15px 10px 15px; border: #ff7272 2px solid; background-color: rgb(255, 233, 233);border-radius: 10px;"/>
</form>
<%
}
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
	
%>	

</body>
</html>