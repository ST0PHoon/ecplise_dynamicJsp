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
<jsp:include page="menu.jsp"></jsp:include>

<div class="container mt-3">
  <h2>성적 등록</h2>
  <form method="post" action='insertScoreItemResult.jsp'>
  	<input type="submit" value="추가">
	  <table class="table table-striped text-center">
		<thead>
			<tr class="text-center">
				<th colspan="2">입력</th>
			</tr>
		</thead>
		<tbody>
			<tr>
			  <td>이름</td>
			  <td><input type='text' name='name' value='' maxlength=20 required pattern='^[가-힣a-zA-Z]+$' title='이름은 이름형식만 가능합니다' class="form-control text-center"></td>
			</tr>
			<tr>
			  <td>학번</td>
			  <td>자동부여</td>
			</tr>
			<tr>
				<td>국어</td>
				<td>
				  <input type='number' min='0' max='100' name='korean' id = 'korr'  required='required' class="form-control text-center">
				</td>
			</tr>
			<tr>
				<td>영어</td>
				<td>
				  <input type='number' min='0' max='100' name='english' id = 'engg'  required='required' class="form-control text-center">
				</td>
			</tr>
			<tr>
				<td>수학</td>
				<td>
				  <input type='number' min='0' max='100' name='mathmatic' id = 'matt' required='required' class="form-control text-center">
				</td>
			</tr>
			
		</tbody>
	  </table>
  </form>
</div>

</body>
</html>