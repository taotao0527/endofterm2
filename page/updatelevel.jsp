<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>add</title>
</head>
<body>
<%
if(session.getAttribute("USERNAME")!=null){
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
		   String user=session.getAttribute("USERNAME").toString();
           sql="use user";
           con.createStatement().execute(sql);
		   request.setCharacterEncoding("UTF-8"); 
           sql="SELECT*FROM `memborder` WHERE `USERNAME`='"+user+"'";
		   ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);		  
		   int sum=0;
		   while(rs.next()){
			   int n=Integer.valueOf(rs.getString(2));
			   sum+=n;
		   }
		   sql="use user";
			   con.createStatement().execute(sql);
			   sql="UPDATE `member` SET `totalpurchase`= '"+sum+"'WHERE`USERNAME`='"+user+"'";	
		   if(sum>1000&&sum<=7000){
			   sql="use user";
			   con.createStatement().execute(sql);
			   sql="UPDATE `member` SET `LEVEL`= '白金會員' WHERE`USERNAME`='"+user+"'";	
			   
		   }
		   else if(sum<=15000&&sum>7000){
			   sql="use user";
			   con.createStatement().execute(sql);
			   sql="UPDATE `member` SET `LEVEL`= '星鑽會員' WHERE`USERNAME`='"+user+"'";	
			   
		   }else if(sum>15000){
			   sql="use user";
			   con.createStatement().execute(sql);
			   sql="UPDATE `member` SET `LEVEL`= '傳說會員' WHERE`USERNAME`='"+user+"'";				   
		   }else{
			    sql="use user";
			   con.createStatement().execute(sql);
			   sql="UPDATE `member` SET `LEVEL`= '青銅會員' WHERE`USERNAME`='"+user+"'";				   
		   }
		   
          
//Step 4: 執行 SQL 指令	
             con.createStatement().execute(sql);
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
		  
			response.sendRedirect("memberprofile.jsp");
		  
       
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
</body>
</html>
