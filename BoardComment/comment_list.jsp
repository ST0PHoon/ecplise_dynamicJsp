<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록</title>
</head>
<body>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo37");
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT id, title, date from boardComment ORDER BY id DESC";
		
		ResultSet rset = stmt.executeQuery(sql);
	%>
	<h2>게시판</h2>
	<table cellspacing = 1  border = 1 width=600>
		<tr align=center>
			<td width = 50>번호</td>
			<td width = 500>제목</td>
			<td width = 100>등록일</td>
		</tr>
		<%
			while (rset.next()) {
				out.println("<tr align=center>");
				out.println("<td>" + rset.getInt(1) + "</td>");
				out.println("<td><a href='comment_view.jsp?key="+ rset.getInt(1) +"'>" + rset.getString(2) + "</a></td>");
				out.println("<td>" + rset.getString(3) + "</td>");
				out.println("</tr>");
			}
		%>
	</table>
	<button onclick="location.href='comment_insert.jsp'">신규</button>
</body>
</html>