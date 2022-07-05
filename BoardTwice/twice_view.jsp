<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세</title>
</head>
<body>
	<%
		String ckey = request.getParameter("key");
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo37");
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT * FROM stock where id = " + ckey;
		
		ResultSet rset = stmt.executeQuery(sql);
		rset.next();
		String id = rset.getString(1);
		String itemTitle = rset.getString(2);
		String itemEA = rset.getString(3);
		String firstDate = rset.getString(4);
		String checkDate = rset.getString(5);
		String content = rset.getString(6);
		String itemImage = rset.getString(7);
	%>
	<h2>(주) DS 마트 재고 현황 - 상세정보</h2>
	<form method=POST name='fm'>
		<table width=650 border=1 cellspacing=1 >
			<tr>
				<td><b>상품 번호</b></td>
				<td><%=id %></td>
			</tr>
			<tr>
				<td><b>상품명</b></td>
				<td><%= itemTitle %></td>
			</tr>
			<tr>
				<td><b>재고현황</b></td>
				<td><%= itemEA %></td>
			</tr>
			<tr>
				<td><b>상품 등록일</b></td>
				<td><%= firstDate %></td>
			</tr>
			<tr>
				<td><b>재고 등록일</b></td>
				<td><%= checkDate %></td>
			</tr>
			<tr>
				<td><b>상품설명</b></td>
				<td><%= content %></td>
			</tr>
			<tr>
				<td><b>상품사진</b></td>
				<td>
					<img src="<%=itemImage %>">
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td></td>
				<td><input type=button value="뒤로가기" onclick="location.href='twice_list.jsp'"></td>
				<td><input type=button value="상품 삭제" onclick="location.href='twice_delete.jsp?id=<%=id %>&title=<%= itemTitle %>'"></td>
				<td><input type = button value="상품 수정" onclick="location.href='twice_update.jsp?id=<%=id %>'"></td>
			</tr>
		</table>
	
	</form>

</body>
</html>