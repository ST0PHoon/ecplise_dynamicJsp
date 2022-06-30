<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page errorPage = "viewErrorMessage.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF8" />
<title>Insert title here</title>
<%
	String ckey = request.getParameter("key");
	request.setCharacterEncoding("UTF-8");
	
	String cId = request.getParameter("id");
	String cTitle = request.getParameter("title");
	String cEA = request.getParameter("EA");
	String cFirstDate = request.getParameter("firstDate");
	String cCheckDate = request.getParameter("checkDate");
	String cContent = request.getParameter("content");
	String cItemImage = request.getParameter("itemImage");
	String imageAdd= "";
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo37");
	Statement stmt = conn.createStatement();
	
	String sql="";
	
	if (ckey == null || "null".equals(ckey)) {
		ckey = "1";
	}
	
	if (ckey.equals("INSERT")) {
		
		try {
			 // 이미지 등록
	        String path = request.getRealPath("./asset");
	        String str, filename, original_filename;
			
			MultipartRequest multi = new MultipartRequest(request, path, 1024 * 1024 * 5, "UTF-8", new DefaultFileRenamePolicy());
			
			Enumeration files = multi.getFileNames();
	        str = (String)files.nextElement();
	        filename = multi.getFilesystemName(str);
	        original_filename = multi.getOriginalFileName(str);
	        imageAdd = "asset/" + filename;
			
			cId = multi.getParameter("id");
			cTitle = multi.getParameter("title");
			cEA = multi.getParameter("EA");
			cFirstDate = multi.getParameter("firstDate");
			cCheckDate = multi.getParameter("checkDate");
			cContent = multi.getParameter("content");
			cItemImage = multi.getParameter("itemImage");
			
		} catch (Exception e) {
			e.getStackTrace();
		}
		
		sql = "insert into stock (id, itemTitle, itemEA, first_date, check_date, content, itemImage) values " +
				"(" + cId + 
				", '" + cTitle + 
				"', " + cEA +
				", '" + cFirstDate +
				"', now()" +
				", '" + cContent +
				"', '" + imageAdd + "')";
		
		stmt.execute(sql);
	} else {
		sql = "update stock set " +
				"itemEA = '" + cEA + "', " +
				"check_date = now() " +
				"where id = " + cId;
		
		stmt.execute(sql);
	}
%>

</head>
<body>
	<h2>DS 마트 재고 현황 - 상품등록</h2>
	<h3>상품이 등록/수정되었습니다.</h3>
	<button onclick = "location.href = 'twice_list.jsp'">재고현황</button>
</body>
</html>