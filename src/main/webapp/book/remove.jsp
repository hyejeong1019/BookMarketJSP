<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="book.*"
	import="book.hyejeong.*"
	import="book.oracle.*"
    pageEncoding="UTF-8"%>
<%@ include file = "/common/isAdminLogged.jsp" %>    
<%
	String idStr = request.getParameter("idStr");
	if (idStr == null) {
		response.sendRedirect("main.jsp");
	} else {
		BookService service = new HJBookService(new OracleBookDAO());
		if (service.remove(Integer.parseInt(idStr))) {
			response.sendRedirect("main.jsp");
		} else {
			response.sendRedirect("detailPage.jsp?id=" + idStr);
		}
	}
%>