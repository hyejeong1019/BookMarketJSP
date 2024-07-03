<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="member.*"
	import="cart.*"
    pageEncoding="UTF-8"%>
<%@ include file = "/common/isLoggedIn.jsp" %>
<%
	String mobile = request.getParameter("mobile");
	String email = request.getParameter("email");
	String address = request.getParameter("address");

	if (mobile == null || email == null || address == null) {
		response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?orderError=1");
		return;
	}
	
	if (mobile.isEmpty() || email.isEmpty() || address.isEmpty()) {
		response.sendRedirect("orderPage.jsp");
		return;
	}
	
	// 회원정보수정
	if (request.getParameter("modifyMember") != null) {
		MemberService memberService = new HJMemberService(new OracleMemberDAO());
		memberService.editAdditionInfo(memberNo, mobile, email, address);
	}
		
	// Cart에서 주문 아이템 삭제
	CartService cartService = new HJCartService(new OracleCartDAO());
	if (cartService.clear(memberNo)) {
		response.sendRedirect(request.getContextPath() + "/index.jsp?order=1");
	};
%>