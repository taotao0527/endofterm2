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
	<main class="card">
        
            <div class="container"><!--商品圖片&說明-->
                <div class="row">
                    <div class="row-left">
                        <img class="goods_s" src="../assets/img/product/stars_6.jpg" >
                    </div>
                    <div class="row-right">
					<h3>銀河</h3>
                        <p>
                        商品分類:星空<br>
<%try {
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
		   sql="SELECT*FROM `product`WHERE `PROID`='p18'";
		   ResultSet pd=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
		   pd.last();
		   
		   
		   out.println("價格:"+pd.getString(5)+"<br>庫存:"+pd.getString(4)+"<br></p>");
		   out.println("<form action='addcart.jsp' method='post'><div class='button'><input type='button' class='mun-button' value='-' id='btnOne' onclick='minusNUM()'>");
		   out.println("<input type='text' id='num' name='count' class='number' value='1'><input type='button' class='mun-button' value='+' id='btnTwo' onclick='addNUM()'>");
		   out.println("<input name='pid' type='hidden' name='pid' value='"+pd.getString(1)+"'><input type='submit' value='加入購物車'>");
	                           

//Step 6: 關閉連線
          con.close();
      }
    }
    catch (SQLException sExec) {
           out.println("不好意思，此項商品還在準備中喔~");
		   
    }
}
catch (ClassNotFoundException err) {
      out.println("class錯誤"+err.toString());
}

%>	                      
                        </div>
                    </div>
                </div>                 
            </div>
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
    <article>
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
           sql="USE `MEBboard`";
           con.createStatement().execute(sql);
//Step 4: 
           sql="SELECT * FROM `guestbookp01`WHERE `product`='p18'"; //算出共幾筆留言
           ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
           rs.last();
           int total_content=rs.getRow();
           out.print("共"+total_content+"筆留言<p>");
		   
		   
           
           int page_num=(int)Math.ceil((double)total_content/5.0); //無條件進位
           
           String page_string = request.getParameter("page");
           if (page_string == null) 
               page_string = "0";          
           int current_page=Integer.valueOf(page_string);
           if(current_page==0) //若未指定page, 令current_page為1
	          current_page=1;
	       //計算開始記錄位置   
//Step 5: 顯示結果 
           int start_record=(current_page-1)*5;
           sql="SELECT * FROM `guestbookp01` WHERE `product`='p18' ORDER BY `Putdate` DESC LIMIT ";
           sql+=start_record+",5";

           rs=con.createStatement().executeQuery(sql);
           while(rs.next())
                {
                 out.println("<div class='Row'><div class='Row-left'><h3  margin-bottom= '0px'>"+rs.getString(2)+"<br>"+"<div margin-top='0px'style='font-weight: lighter;font-size: 10pt;'>"+rs.getString(5)+"</h3></div>");
                 out.println("<div class='Row-left'>"+rs.getString(4)+"</div></div>");
          }
		  out.println("請選擇頁數");
           for(int i=1;i<=page_num;i++) //建立1,2,...頁超連結
			   out.print("<a href='view.jsp?page="+i+"'>"+i+"</a>&nbsp;"); //&nbsp;html的空白

           out.println("<a href='board2.html'>我要寫留言</a>");
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
			<a href="Managelogin.jsp" style="background-color:#B096A7;">進入系統後台</a> 
        </blockquote>
        
    </footer>
</body>
</html>