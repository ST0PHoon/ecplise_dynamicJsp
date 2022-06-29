<%@page import="kr.ac.kopo.ctc.kopo37.domain.ScoreItem"%>
<%@page import="kr.ac.kopo.ctc.kopo37.service.ScoreItemServiceImpl"%>
<%@page import="kr.ac.kopo.ctc.kopo37.service.ScoreItemService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 완료</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	ScoreItemService scoreItemService = new ScoreItemServiceImpl();
	int deletedId =  Integer.parseInt(request.getParameter("studentid"));
	scoreItemService.scoreItemDelete(deletedId);
%>

<jsp:include page="menu.jsp"></jsp:include>

<div class="container mt-3">
	<h2>삭제 완료</h2>
</div>

</body>
</html>