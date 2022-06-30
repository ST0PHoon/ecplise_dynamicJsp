<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 현황</title>
<style type="text/css"> 
   a { text-decoration:none } 
</style>
</head>
<body>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo37");
		Statement stmt = conn.createStatement();
		
		//Pagination
		String cPage = request.getParameter("page");   //page로 현재 페이지 받아오기
      
		if (cPage == null || "null".equals(cPage)) {
		  cPage = "1";
		}
		
		int totalCount = 0; // 총자료개수
		ResultSet rset2 = stmt.executeQuery("select count(*) from stock;");
		while (rset2.next()) {
		  totalCount = rset2.getInt(1);
		}
		rset2.close(); // 파일 내용 닫기
		
		int cPageInt = Integer.parseInt(cPage); // 현재 페이지 정수형
		
		int countPerPage = 20;   //페이지당 출력 자료 개수
		int pageSize = 10;   //출력될 페이지 개수 
		
		//총페이지 계산
		int totalPage = (int) Math.ceil(totalCount / (double) countPerPage);
		if (totalPage != Math.ceil(totalCount / (double) countPerPage)) {
		   totalPage++;
		}
		
		// 현재페이지에 불가능한 값을 넣었을 경우 처리
		if (cPageInt > totalPage) {
		   cPageInt = totalPage;
		}
		if (cPageInt < 1) {
		   cPageInt = 1;
		}
		
		//페이지 묶음의 시작과 끝 페이지
		int startPage;
		
		if (cPageInt % pageSize == 0) {
		   startPage = ((cPageInt - 1) / pageSize) * pageSize + 1;
		} else {
		   startPage = (cPageInt / pageSize) * pageSize + 1;
		}
		int lastPage = startPage + pageSize - 1;
		
		
		// 만약 끝 값이 총 페이지보다 크다면 총페이지만 나오도록
		
		if (lastPage > totalPage) {
		   lastPage = totalPage;
		}
		
		// 이전 페이지열 계산
		int pPage;
		if (startPage == 1) {
		   pPage = 1;
		} else {
		   pPage = startPage - 1;
		}
		
		
		// 다음 페이지열 계산
		int nPage;
		if (lastPage == totalPage) {
		   nPage = totalPage;
		} else {
		   nPage = lastPage + 1;
		}
		
		String sql = "select * from stock limit " + (countPerPage * (cPageInt - 1)) + "," + countPerPage + " ;";
		
		ResultSet rset = stmt.executeQuery(sql);
	%>
	
	<h2>(주) DS 마트 재고 현황 - 전체현황</h2>
	<h4>현재페이지 <%=cPageInt %>p</h4>
	<table cellspacing = 1  border = 1 >
		<tr align=center>
			<td width = 80>상품번호</td>
			<td width = 200>제목</td>
			<td width = 100>현재 재고수</td>
			<td width = 100>상품등록일</td>
			<td width = 100>재고파악일</td>
		</tr>
		<%
			while (rset.next()) {
				out.println("<tr align=center>");
				out.println("<td><a href='twice_view.jsp?key="+ rset.getInt(1) +"'>" + rset.getInt(1) + "</a></td>");
				out.println("<td><a href='twice_view.jsp?key="+ rset.getInt(1) +"'>" + rset.getString(2) + "</a></td>");
				out.println("<td>" + rset.getString(3) + "</td>");
				out.println("<td>" + rset.getString(4) + "</td>");
				out.println("<td>" + rset.getString(5) + "</td>");
				out.println("</tr>");
			}
		%>
	</table>
	<table width= border=0>
		<tr>
			<td width = 600 align=center>
				<b><a href = 'twice_list.jsp?page=<%=pPage %>'> &lt&lt </a></b>
				<%
					for (int i = startPage; i <= lastPage; i++) {
						if(i == cPageInt) {
				            out.print("<b><u><a href = 'twice_list.jsp?page=" + i +"'> " + i + " </a></u></b>");
				         } else {
				            out.print("<b><a href = 'twice_list.jsp?page=" + i +"'> " + i + " </a></b>");
				         }
					}
				%>
				<b><a href = 'twice_list.jsp?page=<%=nPage %>'> &gt&gt </a></b>
			</td>
		</tr>
	</table>
	
	<button onclick="location.href='twice_insert.jsp'">신규</button>
	
</body>
</html>

