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
           sql="use user";
           con.createStatement().execute(sql);
		   request.setCharacterEncoding("UTF-8"); 
           String del=request.getParameter("del");
		  
//Step 4: 執行 SQL 指令	
			con.createStatement().execute("USE `user`");
		    sql="DELETE FROM `memborder` WHERE `orderNo` = '"+del+"'";
			
			           		   
			con.createStatement().execute(sql);
            con.createStatement().executeUpdate(sql);

//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
		 response.sendRedirect("Manageorder.jsp");
       }
    }
    catch (SQLException sExec) {
           out.print("尚未選取要刪除的資料");
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
%>
</body>
</html>
