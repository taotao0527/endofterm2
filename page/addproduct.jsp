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
           sql="use `productdata`";
           con.createStatement().execute(sql);
		   request.setCharacterEncoding("UTF-8"); 
		   String id1=request.getParameter("proid");
           String name=request.getParameter("name");
		   String clas=request.getParameter("classification");
		   String productpage=request.getParameter("page");
		   String photo=request.getParameter("photo");
		   String row=request.getParameter("class2");
		   String number=request.getParameter("num");
		   int i = Integer.valueOf(number);
		   String price=request.getParameter("price");
		   int j = Integer.valueOf(price);
		   
		   if(id1==null||id1.equals("")||name==null||name.equals("")||photo==null||photo.equals("")||number==null||number.equals("")||price==null||price.equals("")||row==null||row.equals("")){
		   out.print("添加失敗，有必填欄位尚未填寫<a href='Manageproduct.jsp'>返回</a>");}
		   else{
			   
		   
//Step 4: 執行 SQL 指令	
           sql="INSERT INTO `product`";
		   sql+="VALUES('"+id1+"',";
		   sql+="'"+name+"', ";   
           sql+="'"+clas+row+"', ";   
           sql+="'"+i+"',";    
		   sql+="'"+j+"',";
		   sql+="'"+productpage+".jsp',";
		   sql+="'"+photo+".jpg')";    		   

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
