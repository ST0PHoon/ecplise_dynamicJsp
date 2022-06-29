<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<%@page import="java.util.Date" %><%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고 수정</title>
<script type="text/javascript">
	function submitForm() {
		var myform = document.fm;
		myform.action = "twice_write.jsp";
	}

</script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String cId = request.getParameter("id");
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo37");
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT * FROM stock where id = " + cId;
		
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
	<h2>(주) DS 마트 재고 현황 - 재고 수정</h2>
	<form method=POST name='fm' accept-charset="utf-8">
		<table width=650 border=1 cellspacing=1>
			<tr>
				<td><b>상품 번호</b></td>
				<td>
					<input type=text name=id size=70 maxlength=70 value=<%=id %> readonly>
				</td>
			</tr>
			<tr>
				<td><b>상품명</b></td>
				<td>
					<input type=text name=title size=70 maxlength=70 value=<%=itemTitle %> readonly>
				</td>
			</tr>
			<tr>
				<td><b>재고현황</b></td>
				<td>
					<input type=number name=EA size=70 maxlength=70 value=<%=itemEA %> required='required' min='0'>
				</td>
			</tr>
			<tr>
				<td><b>상품 등록일</b></td>
				<td>
					<input type=text name=firstDate size=70 maxlength=70 value=<%=firstDate %> readonly>
				</td>
			</tr>
			<tr>
				<td><b>재고 등록일</b></td>
				<td>
					<input type=text name=checkDate size=70 maxlength=70 value=<%=checkDate %> readonly>
				</td>
			</tr>
			<tr>
				<td><b>상품설명</b></td>
				<td>
					<input type=text name=content size=70 maxlength=70 value=<%=content %> readonly>
				</td>
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
				<td><input type=button value="뒤로가기" onclick="location.href='twice_view.jsp?key=<%=id %>'"></td>
				<td><input type=submit value="재고 수정" onclick="submitForm()"></td>
			</tr>
		</table>
	
	</form>
</body>
</html>