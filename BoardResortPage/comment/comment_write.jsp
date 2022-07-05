<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성완료</title>
<%
	request.setCharacterEncoding("UTF-8");
	String ckey = request.getParameter("key");
	String cid = request.getParameter("id");
	String cTitle = request.getParameter("title");
	String cContent = request.getParameter("content");
	String cRootId = request.getParameter("rootId");
	String cReLevel = request.getParameter("reLevel");
	String cReCnt = request.getParameter("reCnt");
	String cReGroupId = request.getParameter("reGroupId");
	
	// update는 key를 보내지 않아서 널값일때 값을 넣어준다.
	if (ckey == null || "null".equals(ckey)) {
		ckey = "UPDATE";
	}
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo37");
	Statement stmt = conn.createStatement();
	
	String sql="";
	
	if (ckey.equals("INSERT")) {
		sql = "insert into boardComment (rootId, reLevel, reGroupId, reCnt, viewCnt, title, date, content) values " +
				"((select (ifnull(max(rootId) + 1, 1)) from boardComment as b) " +
				", 0" +
				", (select (ifnull(max(id) + 1, 1)) from boardComment as b)" +
				", 0" +
				", 0" +
				", '" + cTitle + 
				"', now()" + 					
				", '" + cContent + "')";
	} else if (ckey.equals("REINSERT")) {
		String addReCntSql = "update boardComment set reCnt = reCnt + 1 where rootId = " + cRootId + " and reCnt >= " + cReCnt;
		
		stmt.execute(addReCntSql);
		
		String reRe = "";
		for (int i = 0; i < Integer.parseInt(cReLevel); i++) {
			reRe += "└>";
		}
		
		sql = "insert into boardComment (rootId, reLevel, reGroupId, reCnt, viewCnt, title, date, content) values " +
				"(" + cRootId +
				", " + cReLevel +
				", " + cReGroupId +
				", " + cReCnt +
				", 0" + 
				", '" + reRe + cTitle +
				"', now()" + 					
				", '" + cContent + "')";
		
	} else {
		sql = "update boardComment set " +
				"title = '" + cTitle + "', " +
				"date = now(), " +
				"content = '" + cContent + "' " +
				"where id = " + cid;
	}

	stmt.execute(sql);
%>
</head>
<body>
	<script>
		alert("작성/수정 완료");
		window.location="comment_list.jsp";
	</script>
</body>
</html>