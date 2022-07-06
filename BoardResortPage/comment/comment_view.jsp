<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 확인</title>
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
	
	String sql = "SELECT * FROM boardComment where id = " + ckey;
	String sql2 = "UPDATE boardComment set viewCnt = viewCnt + 1 where id = " + ckey;
	
	stmt.execute(sql2)  ;
	ResultSet rset = stmt.executeQuery(sql);
	
	rset.next();
	String id = rset.getString(1);
	String rootId = rset.getString(2);
	String reLevel = rset.getString(3);
	String reGroupId = rset.getString(4);
	String reCnt = rset.getString(5);
	String viewCnt = rset.getString(6);
	String title = rset.getString(7);
	String date = rset.getString(8);
	String content = rset.getString(9);
%>
	<center>
	<h3>이용후기</h3>
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
					<td><b>조회수</b></td>
					<td><%=viewCnt  %></td>
				</tr>
				<tr>
					<td><b>내용</b></td>
					<td>
						<textarea style='width:550px; height:250px; resize:none;' name =content cols=70 row=600 readonly><%= content %></textarea>
					</td>
				</tr>
				<tr>
					<td><b>원글</b></td>
					<td><%=rootId %></td>
				</tr>
				<tr>
					<td><b>댓글위치</b></td>
					<td><%=reLevel%>     댓글내 순서<%=reCnt%></td>
					<input type="hidden" value = <%=reGroupId %>>
				</tr>
			</table>
			<table>
				<tr>
					<td></td>
					<td><input type = button value = "목록" onclick = "location.href='comment_list.jsp'"></td>
					<td><input type = button value = "수정" onclick = "location.href='comment_update.jsp?id=<%=id %>'"></td>
					<td><input type = button value = "삭제" onclick = "location.href='comment_delete.jsp?id=<%=id %>'"></td>
					<td><input type = button value = "댓글" onclick = "location.href='comment_reInsert.jsp?id=<%=id %>'"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>