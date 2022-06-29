<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 삭제</title>
<%
	String id = request.getParameter("id");
	String cTitle = request.getParameter("title");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo37");
	Statement stmt = conn.createStatement();
	
	String sql="delete from stock where id = " + id;  			

	stmt.execute(sql);
%>
</head>
<body>
	<h2>DS 마트 재고 현황 - 상품삭제</h2>
	<h3>[<%=cTitle %>] 상품이 삭제되었습니다.</h3>
	<button onclick = "location.href = 'twice_list.jsp'">재고현황</button>
</body>
</html>