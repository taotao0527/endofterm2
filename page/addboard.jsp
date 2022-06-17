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
           sql="use MEBboard";
           con.createStatement().execute(sql);
		   request.setCharacterEncoding("UTF-8");
		
		   
           String new_name="";
		   new_name=session.getAttribute("USERNAME").toString();
		   String new_content=request.getParameter("content");
		   String c=request.getParameter("product");
		   if(new_name==null||new_name.equals("")){
			  response.sendRedirect("alertboard.jsp");
		  } 
		  else if(c==null||c.equals("")){
			  response.sendRedirect("alertboard2.jsp");
		  }
		  else if(new_content==null||new_content.equals("")){
			  response.sendRedirect("alertboard.jsp");
		  }else{
           java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());
//Step 4: 執行 SQL 指令	
           sql="INSERT guestbookp01"+"(`MEBName`, `product`,`Content`, `Putdate`) ";
		   sql+="VALUES ('" + new_name + "', ";
		   sql+="'"+c+"', ";   
           sql+="'"+new_content+"', ";   
           sql+="'"+new_date+"')";      

           con.createStatement().execute(sql);
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
		  
		 
		  if(c.equals("p01")){
			  response.sendRedirect("landscape1.jsp?page=1");
		  }
		  else if(c.equals("p02")){
			  response.sendRedirect("landscape2.jsp?page=1");
		  }
		  else if(c.equals("p03")){
			  response.sendRedirect("landscape3.jsp?page=1");
		  }
		  else if(c.equals("p04")){
			  response.sendRedirect("landscape4.jsp?page=1");
		  }
		  else if(c.equals("p05")){
			  response.sendRedirect("landscape5.jsp?page=1");
		  }
		  else if(c.equals("p06")){
			  response.sendRedirect("landscape6.jsp?page=1");
		  }
		  else if(c.equals("p07")){
			  response.sendRedirect("painting1.jsp?page=1");
		  }
		  else if(c.equals("p08")){
			  response.sendRedirect("painting2.jsp?page=1");
		  }
		  else if(c.equals("p09")){
			  response.sendRedirect("painting3.jsp?page=1");
		  }
		  else if(c.equals("p10")){
			  response.sendRedirect("painting4.jsp?page=1");
		  }
		  else if(c.equals("p11")){
			  response.sendRedirect("painting5.jsp?page=1");
		  }
		  else if(c.equals("p12")){
			  response.sendRedirect("painting6.jsp?page=1");
		  }
		  else if(c.equals("p13")){
			  response.sendRedirect("stars1.jsp?page=1");
		  }
		  else if(c.equals("p14")){
			  response.sendRedirect("stars2.jsp?page=1");
		  }
		  else if(c.equals("p15")){
			  response.sendRedirect("stars3.jsp?page=1");
		  }
		  else if(c.equals("p16")){
			  response.sendRedirect("stars4.jsp?page=1");
		  }
		  else if(c.equals("p17")){
			  response.sendRedirect("stars5.jsp?page=1");
		  }
		  else if(c.equals("p18")){
			  response.sendRedirect("stars6.jsp?page=1");
		  }
          else{
			  out.println("<p>錯誤</p>");
		  } 
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
}else{
	response.sendRedirect("login.jsp");
}
%>
</body>
</html>
