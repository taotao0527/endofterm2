<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PAZURU</title>
    <link rel="stylesheet" href="../assets/css/all.css">
    <link rel="stylesheet" href="../assets/css/product.css">
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
    <h4 class="title">古典畫作拼圖</h4>
  
<%
try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
           sql="USE `productdata`";
           con.createStatement().execute(sql);
//Step 4: 顯示結果 第一行
           sql="SELECT * FROM `product` WHERE `Classification` ='世界名畫1'";
			ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
           rs.last();		   
		   rs=con.createStatement().executeQuery(sql);
		   out.print("<figure>");
		   while(rs.next())
                {
                 out.println("<div class='card'><img class='goods_s' src='../assets/img/product/"+rs.getString(7)+"'><div><a href='"+rs.getString(6)+"'>"+rs.getString(2)+"</a></div></div>");                
          }
		  out.println("</figure>");
		  sql="SELECT * FROM `product` WHERE `Classification` ='世界名畫2'";
			ResultSet ns=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
           ns.last();		   
		   ns=con.createStatement().executeQuery(sql);
		   out.print("<figure>");
		   while(ns.next())
                {
                 out.println("<div class='card'><img class='goods_s' src='../assets/img/product/"+ns.getString(7)+"'><div><a href='"+ns.getString(6)+"'>"+ns.getString(2)+"</a></div></div>");                
          }
		  out.print("</figure>");
//Step 6: 關閉連線
          con.close();
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

       <!-- <div class="card">
            <img class="goods_s" src="../assets/img/landscape/landscape_city.jpg" >
            <div>
                <a href="../page/goods_city.html">義大利</a>
            </div>
        </div> 
        <div class="card">
            <img class="goods_s" src="../assets/img/landscape/landscape_fuji.jpg" >
            <div>
                <a href="../page/goods_fuji.html">日本富士山</a>
            </div>
        </div> 
        <div class="card">
            <img class="goods_s" src="../assets/img/landscape/landscape_river.jpg" >
            <div>
                <a href="../page/goods_river.html">色彩繽紛的小鎮</a>
            </div>
        </div> 

    </figure>
    <figure> 
        <div class="card">
            <img class="goods_s" src="../assets/img/landscape/landscape_sea.jpg" >
            <div>
                <a href="../page/goods_sea.html">瓦胡島</a>
            </div>
        </div> 
        <div class="card">
            <img class="goods_s" src="../assets/img/landscape/landscape_street.jpg" >
            <div>
                <a href="../page/goods_street.html">愛丁堡馬戲團巷</a>
            </div>
        </div> 
        <div class="card">
            <img class="goods_s" src="../assets/img/landscape/old.jpg" >
            <div>
                <a href="../page/goods_sun.html">老街</a>
            </div>
        </div> -->

    
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