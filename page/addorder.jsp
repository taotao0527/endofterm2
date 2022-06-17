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
           
		   request.setCharacterEncoding("UTF-8");
		   
		   
           String new_name="";
		   
		   
		   new_name=session.getAttribute("USERNAME").toString();
		   sql="use user";
		   con.createStatement().execute(sql);
		   sql="SELECT * FROM `cart` WHERE `USERNAME`='"+user+"'";           
           ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
           String orderp="";
		  
		   sql="use productdata";
		   con.createStatement().execute(sql);
		   double sum=0;
		   int num=0;
		   int stock=0;
           while(rs.next()){
			   orderp+=rs.getString(2)+rs.getString(3);
			   String product=rs.getString(2);
			   sql="SELECT*FROM product WHERE PROID='"+product+"'";
				ResultSet rs2=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);		  
			   rs2.next();
			   stock=Integer.valueOf(rs2.getString("Stock"))-Integer.valueOf(rs.getString(3));   
			   sql="UPDATE `product` SET `Stock`='"+stock+"' WHERE `PROID` = '"+product+"'";
			   con.createStatement().execute(sql);
			   int n=Integer.valueOf(rs.getString(3));
			   num+=n;
			   int p=Integer.valueOf(rs2.getString(5));
			   sum+=(n*p);			   
		   }
		   
		   java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());
//Step 4: 執行 SQL 指令	
		   sql="use user";
           con.createStatement().execute(sql);
           sql="INSERT memborder"+"(`USERNAME`,`purchase`,`orderday`,`product`) ";
		   sql+="VALUES ('" + new_name + "', ";
		   sql+=sum+",";
		   sql+="'"+new_date+"',";
		   sql+="'"+orderp+"')";
out.print(sql);		   
			
           con.createStatement().execute(sql);
//Step 6: 關閉連線
           con.close();

		 
		  response.sendRedirect("refreshcart.jsp");
       
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
