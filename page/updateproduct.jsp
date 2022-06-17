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
           String update_data=request.getParameter("updata");
		   String data=request.getParameter("content");
		   String Pid=request.getParameter("id");
		   if(Pid==null||Pid.equals("")||data==null||data.equals("")){
			  out.println("產品編號或要修改的內容尚未填寫喔");
		  } 
		  else if(update_data==null||update_data.equals("")){
			  out.println("尚未選擇要修改的欄位");
		  }
		 
		  else{
          
//Step 4: 執行 SQL 指令	
           sql="UPDATE `product` SET `"+update_data+"`= '"+data+"'WHERE`PROID`='"+Pid+"'";	    

           con.createStatement().execute(sql);
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
		  
			response.sendRedirect("Manageproduct.jsp");
		  
       }
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
