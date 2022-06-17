<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>refresh</title>
<span style="font-size:18px;"> <span style="font-size:24px;"><meta http-equiv="refresh" content="2;URL=updatelevel.jsp">
	<span style="font-size:24px;">
</head>
<style>
h3{
	text-align:center;
	color:red;
}
</style>
<body>
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
           sql="use user";
           con.createStatement().execute(sql);
		   request.setCharacterEncoding("UTF-8"); 
           
		   String user=session.getAttribute("USERNAME").toString();
		  
//Step 4: 執行 SQL 指令	
			con.createStatement().execute("USE `user`");
		    sql="DELETE FROM `cart` WHERE `USERNAME`='"+user+"'";
			
			con.createStatement().execute(sql);
            con.createStatement().executeUpdate(sql);

//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
		  
		 out.print("<h3>下單成功!!PUZURU感謝您的惠顧<h3>");
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
