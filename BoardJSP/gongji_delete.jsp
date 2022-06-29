<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제완료</title>
<%
	String id = request.getParameter("id");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo37");
	Statement stmt = conn.createStatement();
	
	String sql="delete from gongji where id = " + id;  			

	stmt.execute(sql);
%>

</head>
<body>
	<script>
		alert("삭제 완료");
		window.location="gongji_list.jsp";
	</script>
</body>
</html>