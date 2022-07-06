<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성완료</title>
<%
	request.setCharacterEncoding("UTF-8");
	String ckey = request.getParameter("id");
	String cTitle = request.getParameter("title");
	String cContent = request.getParameter("content");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo37");
	Statement stmt = conn.createStatement();
	
	String sql="";
	
	if (ckey.equals("INSERT")) {
		sql = "insert into gongji2 (title, date, content) values " +
				"('" + cTitle + 
				"', now()" + 					
				", '" + cContent + "')";
	} else {
		sql = "update gongji2 set " +
				"title = '" + cTitle + "', " +
				"date = now(), " +
				"content = '" + cContent + "' " +
				"where id = " + ckey;
	}

	stmt.execute(sql);
%>
</head>
<body>
	<script>
		alert("작성/수정 완료");
		window.location="gongji_list.jsp";
	</script>
</body>
</html>