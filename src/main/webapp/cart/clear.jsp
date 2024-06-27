<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="cart.*"
    pageEncoding="UTF-8"%>
<%
	CartService service = new HJCartService(new ListCartDAO());

	if (service.clear()) {
		response.sendRedirect(request.getContextPath() + "/cart/main.jsp");
	} else {
		response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?cartClearErr=1");
	}
%>