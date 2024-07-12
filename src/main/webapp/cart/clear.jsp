<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="cart.*"
    pageEncoding="UTF-8"%>
<%@ include file = "/common/isLoggedIn.jsp" %>
<%
	//CartService service = new HJCartService(new ListCartDAO());
	//** CartService service = new HJCartService(new OracleCartDAO());
	CartService service = new HJCartService(new HashMapCartDAO());

	if (service.clear(memberNo)) {
		response.sendRedirect(request.getContextPath() + "/cart/main.jsp");
	} else {
		response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?cartClearErr=1");
	}
%>