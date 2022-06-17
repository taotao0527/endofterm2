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
	 String  USERNAME="",MAIL="",PASSWORD="",LEVEL="";
	 while(rs.next()){
		 USERNAME=rs.getString("USERNAME");
		MAIL=rs.getString("MAIL");
		 PASSWORD=rs.getString("PASSWORD");	
		 LEVEL=rs.getString("LEVEL");
	 }
	 String messege="";
	 if(LEVEL.equals("青銅會員"))
	 {
		 messege="總花費1000元可升級為白金會員，享有商品九折優惠";
	 }
	 if(LEVEL.equals("白金會員")){
		  messege="總花費7000元可升級為星鑽會員，可選擇任一1080元拼圖做為贈品";
	 }
	 if(LEVEL.equals("星鑽會員")){
		  messege="總花費15000元可升級為傳說會員，可選擇任一2000元以下拼圖做為贈品，並享有優先預定特權";
	 }
	 if(LEVEL.equals("傳說會員")){
		   messege="傳說會員享有每月一次優先預定服務，感謝您選擇PUZURU。";
	 }
	 double sum=0;
	 double money=0;
	 sql="use user";
	 con.createStatement().execute(sql);
	 sql="SELECT*FROM memborder WHERE USERNAME='"+USERNAME+"'";
	 ResultSet rs1=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
     while(rs1.next()){
		 money=Integer.valueOf(rs1.getString("purchase"));
		 sum+=money;
	 }
	 rs1.last();
	 int total=rs1.getRow();	 
	 con.close();
	%>
<h1 style="text-align:center ;">會員資料</h1>
<div class="background"><h2> <font color="white"><div align="center"> <%=USERNAME%>您好! 您現在是<%=LEVEL%><br></div>
<h4> <font color="white"><div align="center"> <%=messege%><br></div></h4>
<h4> <font color="white"><div align="center">您的帳號：  <%=MAIL%> <br></div></h4>
<h4> <font color="white"><div align="center">您的密碼：  <%=PASSWORD%> <br></div></h4>
<h4> <font color="white"><div align="center">您目前有<%=total%>筆訂單，總價<%=sum%>元<br></div></h4>
<div   align="right"><a  href="logout.jsp"><font color="white"><u>登出</u></a></div></div>

   <h5 style="text-align:right;"> <a href="member.jsp">>>>>>想要修改資料?</a> </h5>


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
 <footer>  
        <p>連絡電話：02-21345678</p>
        <p>服務時間：10:00～20：00</p>
        <p>客服信箱：abc@gmail.com</p>
        <blockquote class="blockquote text-right">
            <p><a href="#top">回頂部</a></p>
            <p>可刷卡</p>
			<a href="Managelogin.jsp" style="background-color:#B096A7;">進入系統後台</a>
        </blockquote>
        
    </footer>
</body>
</html>