<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PAZURU</title>
    <link rel="stylesheet" href="../assets/css/all.css">
    <link rel="stylesheet" href="../assets/css/login.css">
</head>
<body>
    <header id="top">
        <div class="container">
    <p><a class="name" href="../index.html">PAZURU</a></p>     <!--名字-->
        
        </div>
                
    </header>
    
<body>
<%
try{
Class.forName("com.mysql.jdbc.Driver");
try{
String url="jdbc:mysql://localhost";
Connection con=DriverManager.getConnection(url,"root","1234");
String sql="use `user`";
con.createStatement().execute(sql);
%>
<%

     String new_mail=request.getParameter("MAIL");
		 
	 String new_password=request.getParameter("PASSWORD");
		 
      if(new_mail.equals("")||new_mail==null){
         out.print("<h2>帳號不能為空!!    請<a href='login.jsp'><u>按此</u></a>重新填寫");
       }
 
      else if(new_password.equals("")||new_password==null){
        out.print("<h2>密碼不能為空!!    請<a href='login.jsp'><u>按此</u></a>重新填寫");
      }
	
       else if(request.getParameter("MAIL")!=null&&!request.getParameter("MAIL").equals("")&&request.getParameter("PASSWORD")!=null&&!request.getParameter("PASSWORD").equals("")){

    sql = "SELECT * FROM `member` WHERE MAIL=? AND PASSWORD=?";

    PreparedStatement pstmt = null;
	pstmt=con.prepareStatement(sql);
    pstmt.setString(1,request.getParameter("MAIL"));
    pstmt.setString(2,request.getParameter("PASSWORD"));
	
	ResultSet rs = pstmt.executeQuery();


     if(rs.next())
    {
	    session.setAttribute("MAIL",request.getParameter("MAIL"));
		session.setAttribute("USERNAME",rs.getString("username"));
	    out.print("<h2>歡迎您來到PAZURU!");
	    response.setHeader("refresh","2;URL=memberprofile.jsp");
     }
   
    else
	 {
	out.print("<h2>您輸入的帳號密碼不正確!    請<a href='login.jsp'><u>按此</u></a>重新登入");
    con.close();//結束資料庫連結
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