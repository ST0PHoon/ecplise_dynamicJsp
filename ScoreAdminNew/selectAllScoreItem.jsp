<%@page import="kr.ac.kopo.ctc.kopo37.dto.Pagination"%>
<%@page import="kr.ac.kopo.ctc.kopo37.domain.ScoreItem"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.ctc.kopo37.service.ScoreItemServiceImpl"%>
<%@page import="kr.ac.kopo.ctc.kopo37.service.ScoreItemService"%>
<%@page import="kr.ac.kopo.ctc.kopo37.dao.ScoreItemDaoImpl"%>
<%@page import="kr.ac.kopo.ctc.kopo37.dao.ScoreItemDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show All Score</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<%
	ScoreItemDao scoreItemDao = new ScoreItemDaoImpl();
	ScoreItemService scoreItemService = new ScoreItemServiceImpl();
	
	String cPage = request.getParameter("cPage");
	if (cPage == null || "null".equals(cPage)) {
	    cPage = "1";
	  }
	
	int cPageInt = Integer.parseInt(cPage);
	int totalCount = scoreItemDao.selectTotalCount();
	
	
	List<ScoreItem> scoreItems = scoreItemDao.selectAll(cPageInt, 10);
	pageContext.setAttribute("scoreItems", scoreItems);
	
	
	Pagination pagination = scoreItemService.getPagination(cPageInt, 10, 10, totalCount);
	pageContext.setAttribute("pagination", pagination);
%>

<jsp:include page="menu.jsp"></jsp:include>

<div class="container mt-3">
  <h2>전체 성적 조회</h2>          
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
  
<br>	
	<div class="text-center">
		<c:url var="urlppPage" value="/selectAllScoreItem.jsp" >
			<c:param name="cPage" value="${pagination.ppPage}"/>
		</c:url>
		
		<c:url var="urlpPage" value="/selectAllScoreItem.jsp">
			<c:param name="cPage" value="${pagination.pPage}"/>
		</c:url>
		
		<c:url var="urlnnPage" value="/selectAllScoreItem.jsp">
			<c:param name="cPage" value="${pagination.nnPage}"/>
		</c:url>
		
		<c:url var="urlnPage" value="/selectAllScoreItem.jsp">
			<c:param name="cPage" value="${pagination.nPage}"/>
		</c:url>
		
		
		<c:if test="${ppPage ne 0 && pPage ne 0}">
		  <a href=<c:out value="${urlppPage}"/>><c:out value="<<"/></a>
		  <a href=<c:out value="${urlppPage}"/>><c:out value="<"/></a>
		</c:if>
		
		<c:forEach var="i" begin="${pagination.startPage}" end="${pagination.lastPage}">
		  <b><a href = 'selectAllScoreItem.jsp?cPage=${i}'>${i}</a></b>
		</c:forEach>
		      
		<c:if test="${nnPage ne 0 && nPage ne 0}">
			<a href=<c:out value="${urlnPage}"/>><c:out value=">"/></a>
			<a href=<c:out value="${urlnnPage}"/>><c:out value=">>"/></a>
		</c:if>
	</div>
</div>

</body>
</html>