<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 페이지</title>
</head>
<body>
	오류가 발생했습니다. <a href="<%= request.getContextPath() %>/index.jsp"><button>홈으로 가기</button></a>
</body>
</html>