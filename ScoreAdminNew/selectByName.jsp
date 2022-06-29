<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.ctc.kopo37.domain.ScoreItem"%>
<%@page import="kr.ac.kopo.ctc.kopo37.service.ScoreItemServiceImpl"%>
<%@page import="kr.ac.kopo.ctc.kopo37.service.ScoreItemService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%
	String getName = request.getParameter("name");
	ScoreItemService scoreItemService = new ScoreItemServiceImpl();
	List<ScoreItem> scoreItems = scoreItemService.selectScoreItemsByName(getName);
	pageContext.setAttribute("scoreItems", scoreItems);
	pageContext.setAttribute("name", getName);
%>

	<jsp:include page="menu.jsp"></jsp:include>
	<div class="container mt-3">
	  <h2><c:out value= "${name}"/> 성적 조회</h2>   
	
		<table class="table table-striped text-center">
			<thead>
				<tr>
					<th>이름</th>
					<th>학번</th>
					<th>국어</th>
					<th>영어</th>
					<th>수학</th>
				</tr>
	    	</thead>
		    <tbody>
				<c:forEach var="scoreItem" items="${scoreItems}">
					<c:url var="url" value = "/selectByName.jsp">
						<c:param name = "name" value = "${scoreItem.name}"/>
					</c:url>
					<tr height=80px align=center>
						<td><a href= <c:out value="${url}"/>><c:out value= "${scoreItem.name}"/></a></td>
						<td><c:out value="${scoreItem.studentId}"/></td>
						<td><c:out value="${scoreItem.kor}"/></td>
						<td><c:out value="${scoreItem.eng}"/></td>
						<td><c:out value="${scoreItem.mat}"/></td>
					<tr>
			    </c:forEach>  
		    </tbody>
		</table>
	</div>

</body>
</html>