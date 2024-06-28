<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="member.*"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String nickname = request.getParameter("nickname");
	
	if (id == null || password == null || nickname == null) { // request parameter 자체가 없는 경우
		response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?joinError=1");
		
	} else if (id.isEmpty() || password.isEmpty() || nickname.isEmpty()) { // request parameter는 있는데 값이 없는 경우
		response.sendRedirect(request.getContextPath() + "/member/joinPage.jsp?joinError=1");
	
	} else {
		MemberService service = new HJMemberService(new OracleMemberDAO());
		Member member = new Member(id, password, nickname);
		if (service.regist(member)) {
			response.sendRedirect(request.getContextPath() + "/member/loginPage.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?joinError=2");
		}
	}
%>