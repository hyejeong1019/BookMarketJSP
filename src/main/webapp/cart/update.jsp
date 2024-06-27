<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="cart.*"
    pageEncoding="UTF-8"%>
<%
	String idStr = request.getParameter("id");
	String quanStr = request.getParameter("quantity");
	
	if (idStr == null || idStr.isEmpty() || quanStr == null || quanStr.isEmpty()) {
		response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?cartUpdateErr=1");
		return;
	}
	
	CartService service = new HJCartService(new ListCartDAO());
	if (service.update(Integer.parseInt(idStr), Integer.parseInt(quanStr))) {
		response.sendRedirect(request.getContextPath() + "/cart/main.jsp");
	} else {
		response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?cartUpdateErr=2");
	}
		

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>