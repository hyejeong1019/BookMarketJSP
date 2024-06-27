<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="member.*"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String nickname = request.getParameter("nickname");
	
	if (id == null || password == null || nickname == null) {
		response.sendRedirect("registPage.jsp?error=1");
	} else {
		MemberService service = new HJMemberService(new OracleMemberDAO());
		Member member = new Member(id, password, nickname);
		if (service.regist(member)) {
			response.sendRedirect("main.jsp");
		} else {
			response.sendRedirect("registPage.jsp?error=2");
		}
	}
%>