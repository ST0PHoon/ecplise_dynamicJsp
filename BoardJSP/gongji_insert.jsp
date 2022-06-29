<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<%@page import="java.util.Date" %><%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 글 입력</title>
<script type="text/javascript">
	function submitForm(mode) {
		var myform = document.fm;
		if (mode == 1) {
			myform.action = "gongji_list.jsp";
		}
		if (mode == 2) {
			myform.action = "gongji_write.jsp?id=INSERT";
		}
	}

</script>
</head>
<body>
	<%
		Date now = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sf.format(now);
	%>

	<h2>새 글 입력</h2>
	<form method=post name='fm'>
		<table width=650 cellspacing = 1  border = 1>
			<tr>
				<td>번호</td>
				<td>
					자동부여
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type=text name=title size=70 maxlength=70>
				</td>
			</tr>
			<tr>
				<td>일자</td>
				<td>
					<%=today %>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea style='width:550px; height:250px; resize:none;' name =content cols=70 row=600></textarea>
				</td>
			</tr>
		</table>
		<table width=650>
			<tr>
				<td width=600 />
				<td>
					<input type = submit value="취소" onclick="submitForm(1)'">
				</td>
				<td>
					<input type = submit value="작성" onclick="submitForm(2)">
				</td>
			</tr>
		</table>
		
	</form>
</body>
</html>