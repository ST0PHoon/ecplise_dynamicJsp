<%@page import="kr.ac.kopo.ctc.kopo37.domain.ScoreItem"%>
<%@page import="kr.ac.kopo.ctc.kopo37.service.ScoreItemServiceImpl"%>
<%@page import="kr.ac.kopo.ctc.kopo37.service.ScoreItemService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	request.setCharacterEncoding("UTF-8");
	ScoreItemService scoreItemService = new ScoreItemServiceImpl();
	ScoreItem scoreItemOutput = scoreItemService.scoreItemSelectById(Integer.parseInt(request.getParameter("searchid")));
	pageContext.setAttribute("scoreItemOutput", scoreItemOutput);
%>

<jsp:include page="menu.jsp"></jsp:include>

<div class="container mt-3">
  <h2>삭제 정보</h2>
  <form method="post" action='deleteScoreItemResult.jsp'>
	  <table class="table table-striped text-center">
		<thead>
			<tr class="text-center">
				<th colspan="2">정보</th>
			</tr>
		</thead>
		<tbody>
			<tr>
			  <td>이름</td>
			  <td>
			  	<input type="text" name="name" id='namee' required='required' value="${scoreItemOutput.name}" readonly class="form-control text-center">
			  </td>
			</tr>
			<tr>
			  <td>학번</td>
			  <td>
			  	<input type='number' name='studentid' value="${scoreItemOutput.studentId}" readonly class="form-control text-center">
			  </td>
			</tr>
			<tr>
				<td>국어</td>
				<td>
				  <input type='number' name='korean' value="${scoreItemOutput.kor}" readonly class="form-control text-center">
				</td>
			</tr>
			<tr>
				<td>영어</td>
				<td>
				  <input type='number' name='english' value="${scoreItemOutput.eng}" readonly class="form-control text-center">
				</td>
			</tr>
			<tr>
				<td>수학</td>
				<td>
				  <input type='number' name='mathmatic' value="${scoreItemOutput.mat}" readonly class="form-control text-center">
				</td>
			</tr>
		</tbody>
	  </table>
	<input type="submit" value="삭제">
  </form>
</div>


</body>
</html>