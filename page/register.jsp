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

<%
if(session.getAttribute("USERNAME")!=null)
{
	response.sendRedirect("memberprofile.jsp");
}
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
			// out.print("連線建立成功");
		}
//Step 3: 選擇資料庫   
           sql="USE `user`";
           con.createStatement().execute(sql);
		   request.setCharacterEncoding("UTF-8"); 
		   String new_name=request.getParameter("USERNAME");
		  
           String new_mail=request.getParameter("MAIL");
		 
		   String new_password=request.getParameter("PASSWORD");
		 
        if(new_name.equals("")||new_name==null){
          out.print("<h2>用戶名稱不能為空!!    請<a href='signin.jsp'><u>按此</u></a>重新填寫");

		   
            }
       else if(new_mail.equals("")||new_mail==null){
        out.print("<h2>帳號不能為空!!    請<a href='signin.jsp'><u>按此</u></a>重新填寫");
       }
 
      else if(new_password.equals("")||new_password==null){
      out.print("<h2>密碼不能為空!!    請<a href='signin.jsp'><u>按此</u></a>重新填寫");
 
      }
 
 else
 {   
		try{
 
//Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet	
           sql="INSERT`member`(`USERNAME`,`MAIL`,`PASSWORD`,`LEVEL`)";
           sql+="VALUES ('" + new_name + "', ";
           sql+="'"+new_mail+"\', ";
		   sql+="'"+new_password+"\', ";
           sql+="'青銅會員')";      
           con.createStatement().execute(sql);
	       out.print("<h2>註冊成功!!    歡迎你成為PAZURU會員");
		   response.setHeader("refresh","3;URL=login.jsp") ;
		   
  }
  
  catch(SQLException sExec) {
		 out.print("<h2>抱歉!   此帳號已存在了");
	     }
    }

//Step 6: 關閉連線
          con.close();
      
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
		   
    }
}
catch (ClassNotFoundException err) {
      out.println("class錯誤"+err.toString());
}
%>
  
</html>