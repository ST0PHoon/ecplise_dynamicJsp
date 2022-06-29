<%@page import="kr.ac.kopo.ctc.kopo37.domain.ScoreItem"%>
<%@page import="kr.ac.kopo.ctc.kopo37.service.ScoreItemService"%>
<%@page import="kr.ac.kopo.ctc.kopo37.service.ScoreItemServiceImpl"%>
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
	int getNewStudentId = scoreItemService.scoreItemInsert(request.getParameter("name"), request.getParameter("korean"), request.getParameter("english"), request.getParameter("mathmatic"));
	ScoreItem scoreItemOutput = scoreItemService.scoreItemSelectById(getNewStudentId);
	pageContext.setAttribute("scoreItemOutput", scoreItemOutput);
	
%>

<jsp:include page="menu.jsp"></jsp:include>

<div class="container mt-3">
  <h2>등록 확인</h2>          
  <table class="table table-striped text-center">
	<thead>
		<tr class="text-center">
			<th colspan="2">입력</th>
		</tr>
	</thead>
	<tbody>
		<tr>
		  <td>이름</td>
		  <td><input type='text' name='name'  value= "${scoreItemOutput.name}" class="form-control text-center" readonly></td>
		</tr>
		<tr>
		  <td>학번</td>
		  <td>
		  	<input type='text' name='studentid' value= "${scoreItemOutput.studentId}" class="form-control text-center" readonly>
		  </td>
		</tr>
		<tr>
			<td>국어</td>
			<td>
			  <input type='text' name='korean' value= "${scoreItemOutput.kor}" class="form-control text-center" readonly>
			</td>
		</tr>
		<tr>
			<td>영어</td>
			<td>
			  <input type='text' name='english' value="${scoreItemOutput.eng}" class="form-control text-center" readonly>
			</td>
		</tr>
		<tr>
			<td>수학</td>
			<td>
			  <input type='text' name='mathmatic' value="${scoreItemOutput.mat}" class="form-control text-center" readonly></p>
			</td>
		</tr>
		
	</tbody>
  </table>
</div>

</body>
</html>