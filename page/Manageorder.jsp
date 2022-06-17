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
	
	 .checkbox{
		 float:left;
		 width:100px;
		 
	 }
	 td{
		 width:10%;
	 }
     .formadd{
		 width:90%;
		 margin:20px
	 }
    </style>
   <link rel="stylesheet" href="../assets/css/all.css">
    <link rel="stylesheet" href="../assets/css/goods.css">
</head>
<body>
    <header id="top">
        <p>PAZURU</p>     <!--名字-->
    </header>
    <nav><!--頁頂連結-->
        <a href="Manageboard.jsp">留言板管理</a>
        <a href="Manageuser.jsp">會員資料管理</a> 
        <a href="Manageproduct.jsp">商品管理</a> 
        <a href="Manageorder.jsp">客戶訂單管理</a> 
        <a href="Managelogout.jsp">登出後台系統</a> 
    </nav>
<%
if(session.getAttribute("mgid")!=null)
{
	

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
		   
		   sql="SELECT * FROM `memborder`";//算出共幾筆留言
           
           ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
           rs.last();
           int total_content=rs.getRow();
           out.print("共"+total_content+"筆訂單<p>");
           rs=con.createStatement().executeQuery(sql);
//  逐筆顯示, 直到沒有資料(最多還是5筆)
		   out.println("<form action='delorder.jsp' method='post'>");
           out.println("<table width=90% black'><tr><td></td><td>訂單編號</td><td>用戶名稱</td><td>總價</td><td>日期</td><td>商品+數量</td></tr>");
		   while(rs.next())
                {
                 
				 out.println("<tr><td><input name='del' type='checkbox' class='checkbox' value='"+rs.getString(5)+"'></td><td name='mebid'>"+rs.getString(5)+"</td><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td></tr>");
          }
		  out.println("</table><input type='submit' value='刪除'></form><br>");
		  
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