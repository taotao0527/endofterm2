<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>add</title>
</head>
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
           sql="use productdata";
           con.createStatement().execute(sql);
		   request.setCharacterEncoding("UTF-8"); 
           String del=request.getParameter("delprodt");
		  
//Step 4: 執行 SQL 指令	
			con.createStatement().execute("USE `productdata`");
		    sql="DELETE FROM `product` WHERE `PROID` = '"+del+"'";
			out.println(sql);
			           		   
			con.createStatement().execute(sql);
            con.createStatement().executeUpdate(sql);

//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
		 response.sendRedirect("Manageproduct.jsp");
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
