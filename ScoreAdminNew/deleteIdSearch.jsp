<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>

<div class="container mt-3">
  <h2>삭제 학번 조회</h2>
  <form action="deleteScoreItem.jsp">
    <div class="mb-3 mt-3">
      <input type="number" class="form-control" id="studentId" name='searchid' value="209901" min="209901">
    </div>
    <button type="submit" class="btn btn-primary">조회</button>
  </form>
</div>

</body>
</html>