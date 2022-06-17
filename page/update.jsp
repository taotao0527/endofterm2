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
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost";
Connection con=DriverManager.getConnection(url,"root","1234");
String sql="use user";
con.createStatement().execute(sql);
%>
<%
 if(session.getAttribute("MAIL")!= null ){
	 if(request.getParameter("MAIL")!=null){
		 String new_mail=request.getParameter("MAIL");
	    String new_password=request.getParameter("PASSWORD");
		sql="SELECT * FROM `member` ";
		ResultSet rs=con.createStatement().executeQuery(sql);
		//String old_password=rs.getString(3);
	
		if(new_mail.equals("")||new_mail==null)
		{
        out.print("<h2>帳號不能為空!!    請<a href='member.jsp'><u>按此</u></a>重新填寫");
		
		}
		else if(new_password.equals("")||new_password==null){
			out.print("<h2>密碼不能為空!!    請<a href='member.jsp'><u>按此</u></a>重新填寫");
		}
		
		else{
        sql = "UPDATE `member` SET `MAIL`='"+request.getParameter("MAIL")+"' WHERE `MAIL`='"+session.getAttribute("MAIL")+"'";
	    con.createStatement().execute(sql);
        sql = "UPDATE `member` SET `PASSWORD`='"+request.getParameter("PASSWORD")+"' WHERE `MAIL`='"+session.getAttribute("MAIL")+"'";
	    con.createStatement().execute(sql);
		con.close();//結束資料庫連結
		
   out.print("<h2>更新成功!!"+"<br>");
   out.print("您更新的資料如下:"+"<br>"+"帳號:"+new_mail+"<br>"+"密碼:"+new_password+"<br>");
   out.print(" 請<a href='login.jsp'><u>按此</u></a>重新登入");
   session.removeAttribute("USERNAME");
   session.removeAttribute("MAIL");
		}
		      
		}
		  
	   
	  
 else{
	        con.close();//結束資料庫連結
	        out.print("更新失敗!! 請填寫完整!");
	  }
}

else{	
	con.close();//結束資料庫連結
	 }
%>


</body>
</html>


