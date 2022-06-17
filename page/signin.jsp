<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PAZURU</title>
    <style>
     
     body{
        margin: 0px;
     }
	
	
     
    </style>
    <link rel="stylesheet" href="../assets/css/all.css">
        <link rel="stylesheet" href="../assets/css/goods.css">
</head>
<style>

</style>
<body>
    <header id="top">
        <p>PAZURU</p>     <!--名字-->
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
    <section><form name="form1" method="post" action="register.jsp" >
        <div class="card">
            <div class="window">
            
             <p>會員註冊</p>
           
                  <div class="form-group">
                    <div align="center"> 姓名 <input  class="form-control"  type="username" name="USERNAME" id="usename"/></div>
                  </div>
                  <div class="form-group">
                  <div align="center"> 設定帳號(Email)<input  class="form-control"  type="email" name="MAIL" id="mail" /></div>
                  </div>
                  <div class="form-group">
                  <div align="center">  設定密碼 <input  class="form-control" type="password" name="PASSWORD"id="password" /></div>
                  </div>
                 <br> <input type="submit" value="註冊" style="color: rgb(0, 0, 0);margin-bottom: 30px; padding: 10px 15px 10px 15px; border: #8eff72 2px solid; background-color: rgb(239, 255, 188);border-radius: 10px;"/>
            </div>
        </div>
               </form>
        </div>
      </div>
      </form></section>

    <div id="scrollUp"><i class="far fa-angle-double-up"></i></div><!-- Optional JavaScript -->
    <!-- jQuery first,then Popper.js,then Bootstrap JS -->
    <script src="../assets/js/jquery-3.4.1.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/metisMenu.min.js"></script>
    <script src="../assets/js/script.js"></script>
    
    </body>

</html>

