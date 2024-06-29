<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="member.*"
    pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("MemberId") == null
		&& session.getAttribute("AdminId") == null) {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
			return;
	}
%>
<%
	String noStr = request.getParameter("no");
	if (noStr == null || noStr.isEmpty()) {
		response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?removeError=1");
	} else {
		MemberService service = new HJMemberService(new OracleMemberDAO()); 
		if (service.remove(Integer.parseInt(noStr))) {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?removeError=2");
		}
	}
%>