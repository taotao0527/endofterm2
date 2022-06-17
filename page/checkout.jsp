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
	
	 .all{
		 margin:50px;
		 
	 }
	 td{
		 width:40%;
	 }
	 table{
		 width:90%;
		 background-color:white;
		 color:black;
	 }
     .a{
		 display:block;
	 }
    </style>
    <link rel="stylesheet" href="../assets/css/all.css">
        <link rel="stylesheet" href="../assets/css/goods.css">
</head>
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
<%
if(session.getAttribute("USERNAME")!=null)
{
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
           sql="USE `user`";
           con.createStatement().execute(sql);
//Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet
		   
		   sql="SELECT * FROM `cart` WHERE `USERNAME`='"+user+"'";           
           ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
		   sql="SELECT * FROM `member` WHERE `USERNAME`='"+user+"'";           
           ResultSet rs3=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
		   con.createStatement().execute(sql);
           sql="use productdata";
		   con.createStatement().execute(sql);
		   double sum=0;
		   int num=0;
		   
		   out.print("<div class='all'>產品擁有七天鑑賞期，請確認以下資訊:<br><br>");
		   out.print("<table><tr><td>商品名稱</td><td>數量</td><td>單價</td></tr>");
           while(rs.next()){
			   String product=rs.getString(2);
			   sql="SELECT*FROM product WHERE PROID='"+product+"'";
				ResultSet rs2=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);		  
			   rs2.next();
			   out.print("<tr><td>"+rs2.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs2.getString(5)+"</td></tr>");
			   int n=Integer.valueOf(rs.getString(3));
			   num+=n;
			   int p=Integer.valueOf(rs2.getString(5));
			   sum+=(n*p);			   
		   }
		   out.println("</table><br>");
		  
		   out.print("共"+num+"件商品，總價NT"+sum+"元<br>");
		   double sale=0;
		   rs3.next();
		   if(rs3.getString("LEVEL").equals("白金會員")){
			   sale=sum*0.9;
			   out.print("您是白金會員，所以享有商品九折優惠喔");
			   out.print("折價後的商品總價為"+sale+"元");
		   }
		   if(rs3.getString("LEVEL").equals("星鑽會員")){
			   out.print("您是星鑽會員，所以享有一次挑選免費1080元拼圖優惠喔，詳情請洽詢0800-633254");
		   }
		   if(rs3.getString("LEVEL").equals("傳說會員")){
			    out.print("您是傳說會員，所以享有一次挑選免費2000元以下拼圖優惠以及每月優先預購特權喔，詳情請洽詢0800-633254");
		   }
		   
		   
		   session.setAttribute("sum",sum);
		   
		   out.print("<br>本店商品為預購商品，需到店取貨，採用到店付款方式付款</div>");
		   
		   out.print("<a class='a' href='addorder.jsp'>我檢查完了，下單!</a>");
		   
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
	response.sendRedirect("Managelogin.jsp");
}
%>
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
        </script>
	
    </article>
        
</form>
    </main>


    <footer>  
        <p>連絡電話：02-21345678</p>
        <p>服務時間：10:00～20：00</p>
        <p>客服信箱：abc@gmail.com</p>
        <blockquote class="blockquote text-right">
            <p><a href="#top">回頂部</a></p>
            <p>可刷卡</p>
			<p>已進入系統後台</p>
        </blockquote>
        
    </footer>
</body>
</html>