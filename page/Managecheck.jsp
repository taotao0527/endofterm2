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
	
	 h4{
		 color:red;
		 text-align:center;
	 }
	 a{
		 text-align:center;
		 background-color:none;
	 }
     
    </style>

</head>
<body>
    
	<%
	String managid="lin1234";
	String mpassword="0123a";
	
	String checkid=request.getParameter("id");
	String checkpw=request.getParameter("password");
	
	if(checkid.equals("")||checkpw.equals("")){
		out.print("<h4>帳號密碼不可為空<a href='Managelogin.jsp'>點此回到後台登入頁面</a></h4>");
	}
	else if(checkid.equals(managid)&&checkpw.equals(mpassword))
	{
		session.setAttribute("mgid",request.getParameter("id"));
		response.sendRedirect("manage.html");
	}
	else
	{
		out.print("<h4>管理者帳號密碼錯誤<a href='Managelogin.jsp'>點此回到後台登入頁面</a></h4>");
		
	}
	%>

	
    </article>
        
</form>
    </main>


</body>
</html>