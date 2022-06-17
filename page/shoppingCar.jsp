<!DOCTYPE html>
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PAZURU</title>
    <link rel="stylesheet" href="../assets/css/all.css">
    <link rel="stylesheet" href="../assets/css/car.css">

</head>
<style>
.Row{

	text-align:center;
	margin:50px;
	background-color:#B096A5;
	padding:30px;
}
h3{
	color:white;
}
h2{
	text-align:center;
	color:red;
}
.check{
	
	display:block;
	text-align:center;
	border:white, solid;
}
h4{
	margin-bottom:5px;
	color:white;
}
.total{
	text-align:right;
	color:black;
	margin:30px;
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
            <li><a href="#">商品</a>
            <ul>
                <li><a href="../page/landscape.jsp">風景拼圖</a>
                <ul>
                    <li><a href="../page/landscape4.jsp">義大利</a></li>
                    <li><a href="../page/landscape3.jsp">日本富士山</a></li>
                    <li><a href="../page/landscape6.jsp">老街</a></li>
                    <li><a href="../page/landscape1.jsp">色彩繽紛的小鎮</a></li>
                    <li><a href="../page/landscape2.jsp">愛丁堡馬戲團巷</a></li>
                    <li><a href="../page/landscape3.jsp">瓦胡島</a></li>
                </ul>
                </li>
                <li><a href="../page/painting.jsp">古典畫作</a>
                    <ul>
                        <li><a href="../page/painting1.jsp">清明上河圖</a></li>
                        <li><a href="../page/painting2.jsp">拾穗者</a></li>
                        <li><a href="../page/paniting3.jsp">戴珍珠耳環的少女</a></li>
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
    <main>
        <article><!--購物車-->
<%
if(session.getAttribute("USERNAME")!=null){
	String user=session.getAttribute("USERNAME").toString();
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
           sql="use user";
           con.createStatement().execute(sql);
		   request.setCharacterEncoding("UTF-8");
		   
		   
		   
          
		   
		   sql="SELECT*FROM cart WHERE USERNAME='"+user+"'";		   
		   ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
		   sql="use productdata";
		   con.createStatement().execute(sql);
		   double sum=0;
		   while(rs.next()){
			   String product=rs.getString(2);
			   sql="SELECT*FROM product WHERE PROID='"+product+"'";
				ResultSet rs2=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);		  
			   rs2.next();
			   out.println("<div class='Row'><div class='row-left'><a href='"+rs2.getString("page")+"'><img class='goods_s' src='../assets/img/product/"+rs2.getString(7)+"'></a></div>");
			   out.println("<div class='row-left'><h3>"+rs2.getString(2)+"</h3>");
               out.println("<h4>數量:"+rs.getString(3)+"</h4></div>");
			   int n=Integer.valueOf(rs.getString(3));
			   int p=Integer.valueOf(rs2.getString(5));
			   sum+=(n*p);
               out.print("<h4>NT"+(n*p)+"</h4>");
			   out.println("<br><form method='post' action='delcart.jsp'><input type='hidden' name='del' value='"+rs2.getString(1)+"'><input type='hidden' name='name' value='"+rs.getString(1)+"'><input type='submit' value='刪除'></form></div></div>");                
			   
			   
		   }
		   rs.last();
		   int total_cart=rs.getRow();
		   if(total_cart==0)
		   {
			   out.print("<h2>您的購物車還空空的喔，快去逛一逛吧^^</h2>");
		   }else{
			   
			   out.println("<p class='total'>共NT"+sum+"元</p><a class='check' href='checkout.jsp'>結帳去</a>");
		   
		   }
		   			   
		   
		   
		   
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
}
else{
	response.sendRedirect("login.jsp");
}
%>
       
    </article>

    <script>
        function minusNUM(){
            let value = Number(document.getElementById('num').value);
            if(value!=1){
                document.getElementById('num').value=value-1;
            }
            
        }
        function addNUM(){
            let value = Number(document.getElementById('num').value);
            document.getElementById('num').value=value+1;
            
        }

        function de(){

        }
    </script>
    </main>
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