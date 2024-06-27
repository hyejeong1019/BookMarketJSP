<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li><a href="<%= request.getContextPath() %>/member/main.jsp">회원관리</a></li>
		<li><a href="<%= request.getContextPath() %>/book/main.jsp">도서관리</a></li>
	</ul>
</body>
</html>