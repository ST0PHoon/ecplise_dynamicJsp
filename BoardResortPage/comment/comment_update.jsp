<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<%@page import="java.util.Date" %><%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
<script type="text/javascript">
	function submitForm(mode) {
		var myform = document.fm;
		if (mode == 1) {
			myform.action = "comment_list.jsp";
		}
		if (mode == 2) {
			myform.action = "comment_write.jsp";
		}
		if (mode == 3) {
			myform.action = "comment_delete.jsp";
		}
		
	}

</script>
	<style>
	  	h3 {
	  		margin:0px 0px 4px 0px;
	  	}
	</style>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");	
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo37");
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT title, content FROM boardComment where id = " + id;
		
		ResultSet rset = stmt.executeQuery(sql);
		rset.next();
		
		String cTitle = rset.getString(1);
		String cContent = rset.getString(2);
	
		Date now = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sf.format(now);
	%>
	<center>
	<h3>이용후기 수정</h3>

	<form method=post name='fm'>
		<table width=650 border=1 cellspacing=1>
			<tr>
				<td><b>번호</b></td>
				<td>
					<input type=text name=id size=70 maxlength=70 value=<%=id %> readonly>
				</td>
			</tr>
			<tr>
				<td><b>제목</b></td>
				<td>
					<input type=text name=title size=70 maxlength=70 required='required' value="<%=cTitle %>" >
				</td>
			</tr>
			<tr>
				<td><b>일자</b></td>
				<td>
					<%=today %>
				</td>
			</tr>
			<tr>
				<td><b>내용</b></td>
				<td>
					<textarea style='width:550px; height:250px; resize:none;' name =content cols=70 row=600 required='required'><%=cContent %></textarea>
				</td>
			</tr>
		</table>
				<table width=650>
			<tr>
				<td width=600 />
				<td>
					<input type = submit value="취소" onclick="submitForm(1)">
				</td>
				<td>
					<input type = submit value="수정" onclick="submitForm(2)">
				</td>
				<td>
					<input type = submit value="삭제" onclick="submitForm(3)">
				</td>
			</tr>
		</table>
	</form>
	</center>
</body>
</html>