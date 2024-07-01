<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="book.*"
	import="book.hyejeong.*"
	import="book.oracle.*"
    pageEncoding="UTF-8"%>
<%@ include file = "/common/isAdminLogged.jsp" %>
<%
	String idStr = request.getParameter("id");
	System.out.println("remove.jsp에 들어왔음");
	if (idStr == null || idStr.isEmpty()) {
		response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?removeError=1"); 
	} else {
		BookService service = new HJBookService(new OracleBookDAO());
		if (service.remove(Integer.parseInt(idStr))) {
			response.sendRedirect("main.jsp");
		} else {
			response.sendRedirect("detailPage.jsp?id=" + idStr);
		}
	}
%>