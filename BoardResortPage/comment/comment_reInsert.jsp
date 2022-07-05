<%@page import="java.util.Date"%><%@page
	import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 달기</title>
<script type="text/javascript">
		function submitForm(mode) {
			var myform = document.fm;
			if (mode == 1) {
				myform.action = "comment_list.jsp";
			}
			if (mode == 2) {
				myform.action = "comment_write.jsp?key=REINSERT";
			}
		}
	</script>
</head>
<body>
	<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo37");
	Statement stmt = conn.createStatement();

	// 날짜
	Date now = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sf.format(now);

	//선택한 글의 원글번호, 댓글레벨 추출
	String id = request.getParameter("id");
	
	String sql = "SELECT rootId, reLevel + 1, reLevel, reCnt, reGroupId FROM boardComment where id = " + id;
	ResultSet rset = stmt.executeQuery(sql);

	rset.next();
	String rootId = rset.getString(1);
	String reLevelPlus = rset.getString(2);
	String reLevel = rset.getString(3);
	int reCnt = rset.getInt(4);
	int reCntCheck = rset.getInt(4);
	String reGroupId = rset.getString(5);
	rset.close();
	// 리스트 가져오기
	String sqlRootId = "SELECT * from boardComment where rootId = " + rootId + " ORDER BY reCnt ASC ";
	String breakId = "";
	
	ResultSet rsetRootId = stmt.executeQuery(sqlRootId);
	while(rsetRootId.next()) {
		String currentReLevel = rsetRootId.getString(3);
		String currentGroupId = rsetRootId.getString(4);
		int currentReCnt = rsetRootId.getInt(5);

		if (reLevel.equals(currentReLevel) && currentReCnt > reCnt) {
			breakId = rsetRootId.getString(1);

			if(reGroupId.equals(currentGroupId)) {
				reCnt = currentReCnt;
			}
			
			break;
		}
	}
	
	rsetRootId.close();
	
	String sqlReCnt = "";

	if (reLevelPlus.equals("1")) {	// 댓글은 무조건 제일 아래 추가
		sqlReCnt = "select max(reCnt) + 1 FROM boardComment where rootId = " + rootId;
	} else if (reCntCheck == reCnt) {	// 해당 댓글레벨의 마지막 댓글인 경우
		sqlReCnt = "select ifnull((select (max(reCnt) + 1) from boardComment as b where reGroupId = " + id + 
						"), (select reCnt + 1 from boardComment as a where id = "+ id +")) FROM boardComment";
	} else { // 중간 댓글인 경우
		sqlReCnt = "select reCnt FROM boardComment where id = " + breakId;
	}

	ResultSet rsetReCnt = stmt.executeQuery(sqlReCnt);

	rsetReCnt.next();

	String NewReCnt = rsetReCnt.getString(1);

	rsetReCnt.close();
	%>
	<h2>댓글 작성</h2>
	<form method=POST name='fm'>
		<table width=650 border=1 cellspacing=1>
			<tr>
				<td><b>번호</b></td>
				<td>자동부여</td>
			</tr>
			<tr>
				<td><b>제목</b></td>
				<td><input type=text name=title size=70 maxlength=70
					required='required'></td>
			</tr>
			<tr>
				<td><b>일자</b></td>
				<td><%=today%></td>
			</tr>
			<tr>
				<td><b>내용</b></td>
				<td><textarea
						style='width: 550px; height: 250px; resize: none;' name=content
						cols=70 row=600 required='required'></textarea></td>
			</tr>
			<tr>
				<td><b>원글</b></td>
				<td><input type=text name=rootId value=<%=rootId%> readonly>
				</td>
			</tr>
			<tr>
				<td><b>댓글위치</b></td>
				<td>
					<input type=text name=reLevel value=<%=reLevelPlus%> readonly>
					댓글내 순서<input type=text name=reCnt value=<%=NewReCnt%> readonly>
					<input type=hidden name=reGroupId value=<%=id%>>
				</td>
			</tr>
		</table>
		<table width=650>
			<tr>
				<td width=600 />
				<td><input type=submit value="취소" onclick="submitForm(1)'">
				</td>
				<td><input type=submit value="작성" onclick="submitForm(2)">
				</td>
			</tr>
		</table>

	</form>
</body>
</html>