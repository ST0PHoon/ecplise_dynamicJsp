<%@page import="kr.ac.kopo.ctc.kopo37.service.ScoreItemServiceImpl"%>
<%@page import="kr.ac.kopo.ctc.kopo37.service.ScoreItemService"%>
<%@page import="kr.ac.kopo.ctc.kopo37.dao.ScoreItemDao"%>
<%@page import="kr.ac.kopo.ctc.kopo37.dao.ScoreItemDaoImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.ac.kopo.ctc.kopo37.domain.ScoreItem"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	ScoreItemService scoreItemService = new ScoreItemServiceImpl();
	scoreItemService.scoreItemUpdate(request.getParameter("name"), request.getParameter("studentid"),request.getParameter("korean"), request.getParameter("english"), request.getParameter("mathmatic"));
	ScoreItem scoreItemOutput = scoreItemService.scoreItemSelectById(Integer.parseInt(request.getParameter("studentid")));
	pageContext.setAttribute("scoreItemOutput", scoreItemOutput);
%>
<jsp:include page="menu.jsp"></jsp:include>

	<div class="container mt-3">
	  <h2>수정 완료</h2>
	  	  <table class="table table-striped text-center">
			<thead>
			  <tr class="text-center">
				<th colspan="2">수정 정보 확인</th>
			  </tr>
			</thead>
			<tbody>
			  <tr>
				<td>이름</td>
				<td>
				  <input type='text' name='name' value="${scoreItemOutput.name}" readonly class="form-control text-center" >
				</td>
			  </tr>
			  <tr>
				<td>학번</td>
				<td>
				  <input type='text' name='studentid' value="${scoreItemOutput.studentId}" readonly class="form-control text-center">
				</td>
			  </tr>
			  <tr>
				<td>국어</td>
				<td>
				  <input type='number' name='english' id='engg' value="${scoreItemOutput.kor}" readonly class="form-control text-center">
				</td>
			  </tr>
			  <tr>
				<td>영어</td>
				<td>
				  <input type='number'  name='english' id='engg' value="${scoreItemOutput.eng}" readonly class="form-control text-center">
				</td>
			  </tr>
			  <tr>
				<td>수학</td>
				<td>
				  <input type='number' name='mathmatic' id='matt' value="${scoreItemOutput.mat}" readonly class="form-control text-center">
				</td>
			  </tr>
			</tbody>
		</table>
	</div>

</body>
</html>