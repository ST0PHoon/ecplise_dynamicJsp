<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제완료</title>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo37");
	Statement stmt = conn.createStatement();
	// 삭제할 id 받아오기
	String id = request.getParameter("id");
	// id의 relevel 받아오기
	String sql = "SELECT rootId, reLevel + 1, reLevel, reCnt, reGroupId FROM boardComment2 where id = " + id;
	ResultSet rset = stmt.executeQuery(sql);

	rset.next();
	String rootId = rset.getString(1);
	String reLevelPlus = rset.getString(2);
	String reLevel = rset.getString(3);
	int reCntCheck = rset.getInt(4);
	String reGroupId = rset.getString(5);
	rset.close();
	
	// 리스트 가져오기
	String sqlRootId = "SELECT * from boardComment2 where rootId = " + rootId + " and reLevel >= " + reLevel + " and reCnt >  " + reCntCheck + " ORDER BY reCnt ASC ";
	int cnt = 1;
	String lastReCnt = "";
	// 리스트 돌면서 
	ResultSet rsetRootId = stmt.executeQuery(sqlRootId);
	
	while(rsetRootId.next()) {
		int currentReLevel = rsetRootId.getInt(3);
		int currentReCnt = rsetRootId.getInt(5);
		// 댓글이 나보다 대댓글 이면 삭제해라
		if (currentReLevel > Integer.parseInt(reLevel)) {
			// 삭제해라
			Statement stmt2 = conn.createStatement();
			stmt2.execute("delete from boardComment2 where reCnt = " + currentReCnt);
			stmt2.close();
			cnt++;
		} else {
			lastReCnt = rsetRootId.getString(5);
			break;
		}
	}
	
	rsetRootId.close();

	// 원글 일 때 자기자신 삭제
	Statement stmt3 = conn.createStatement();
	stmt3.execute("delete from boardComment2 where id = " + id);
	stmt3.close();
	// reCnt가 높은 댓글들의 reCnt 조정
	if (!lastReCnt.equals("")) {
		stmt.execute("update boardComment2 set reCnt = reCnt - " + cnt +" where reCnt >= " + lastReCnt + " and rootId = " + rootId);
	}
%>

</head>
<body>
	<script>
		alert("삭제 완료");
		window.location="comment_list.jsp";
	</script>
</body> 
</html>