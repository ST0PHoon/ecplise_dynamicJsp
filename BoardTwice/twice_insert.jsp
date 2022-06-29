<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<%@page import="java.util.Date" %><%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<script type="text/javascript">
	function submitForm(mode) {
		var myform = document.fm;
		if (mode == 1) {
			myform.action = "twice_list.jsp";
		}
		if (mode == 2) {
			myform.action = "twice_write.jsp?key=INSERT";
		}
	}

</script>
</head>
<body>
	<%
		Date now = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sf2 = new SimpleDateFormat("yyyyMMdd");
		String today = sf.format(now);
		String today2 = sf2.format(now);
	%>

	<h2>DS 마트 - 상품 등록</h2>
	<form method=POST name='fm' enctype= multipart/form-data>
		<table width=650 border=1 cellspacing=1 >
			<tr>
				<td width=100><b>상품 번호</b></td>
				<td>
					<input type=number name=id  min='0' size=70 maxlength=70 required='required'>
				</td>
			</tr>
			<tr>
				<td><b>상품명</b></td>
				<td>
					<input type=text name=title size=70 maxlength=70 required='required' pattern='^[가-힣a-zA-Z0-9\s]*'>
				</td>
			</tr>
			<tr>
				<td><b>재고현황</b></td>
				<td>
					<input type=number name=EA min='0' size=70 maxlength=70 required='required'>
				</td>
			</tr>
			<tr>
				<td><b>상품 등록일</b></td>
				<td>
					<input type=text name=firstDate1 size=70 maxlength=70 value=<%=today %> readonly>
					<input type=hidden name=firstDate size=70 maxlength=70 value=<%=today2 %> readonly>
				</td>
			</tr>
			<tr>
				<td><b>재고 등록일</b></td>
				<td>
					<input type=text name=checkDate size=70 maxlength=70 value=<%=today %> readonly>
				</td>
			</tr>
			<tr>
				<td><b>상품설명</b></td>
				<td>
					<input type=text name=content size=70 maxlength=100 required='required'>
				</td>
			</tr>
			<tr>
				<td><b>상품사진</b></td>
				<td>
					이미지 : <input type="file" name="itemImage" required='required' accept=".png, .jpg, .jpeg" ><br>
				</td>
			</tr>
		</table>
		<table width=650>
			<tr>
				<td width=600 />
				<td>
					<input type = button value="취소" onclick="location.href='twice_list.jsp">
				</td>
				<td>
					<input type = submit value="작성" onclick="submitForm(2)">
				</td>
			</tr>
		</table>
		
	</form>
</body>
</html>