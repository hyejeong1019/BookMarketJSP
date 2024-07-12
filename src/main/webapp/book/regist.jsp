<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="book.*"
	import="book.hyejeong.*"
	import="book.oracle.*"
    pageEncoding="UTF-8"%>
<%@ include file = "/common/isAdminLogged.jsp" %>
<%
	String title = request.getParameter("title");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publisher");
	String priceStr = request.getParameter("price");
		
	//****** 이상함 priceStr과 instockStr을 null로 확인 문제가 생김	
	if (title == null || author == null || publisher == null || priceStr == "") {
		response.sendRedirect("registPage.jsp");
	} else {
		out.print(priceStr);
		BookService service = new HJBookService(new OracleBookDAO());
		if (service.regist(new Book(title, author, publisher, Integer.parseInt(priceStr)))) {
			response.sendRedirect("main.jsp");
		} else {
			response.sendRedirect("registPage.jsp");
		}
	}
	
%>