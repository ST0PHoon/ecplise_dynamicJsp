<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소식 확인</title>
  <style>
  	h3 {
  		margin:0px 0px 4px 0px;
  	}
  </style>
</head>
<body>
<%
	String ckey = request.getParameter("key");

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo37");
	Statement stmt = conn.createStatement();
	
	String sql = "SELECT * FROM gongji where id = " + ckey;
	
	ResultSet rset = stmt.executeQuery(sql);
	rset.next();
	String id = rset.getString(1);
	String title = rset.getString(2);
	String date = rset.getString(3);
	String content = rset.getString(4);
%>
	<center>
		<h3>소식 상세정보</h3>
		<form method=POST name='fm'>
			<table width=650 border=1 cellspacing=1>
				<tr>
					<td><b>번호</b></td>
					<td>
						<input type=text name=id size=70 maxlength=70 value=<%=id %> readonly>
					</td>
				</tr>
				<tr>
					<td><b>제목</b></td>
					<td><%= title %></td>
				</tr>
				<tr>
					<td><b>일자</b></td>
					<td><%= date %></td>
				</tr>
				<tr>
					<td><b>내용</b></td>
					<td>
						<textarea style='width:550px; height:250px; resize:none;' name =content cols=70 row=600 readonly><%= content %></textarea>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td></td>
					<td><input type=button value="뒤로가기" onclick="location.href='gongji_list.jsp'"></td>
					<td><input type=button value="수정" onclick="location.href='gongji_update.jsp?id=<%=id %>'"></td>
					<td><input type = button value="삭제" onclick="location.href='gongji_delete.jsp?id=<%=id %>'"></td>
				</tr>
			</table>
		
		</form>
	</center>
	
</body>
</html>