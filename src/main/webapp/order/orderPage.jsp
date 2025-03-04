<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="cart.*"
	import="book.*"
	import="member.*"
	import="java.util.List"
    pageEncoding="UTF-8"%>
<%@ include file = "/common/isLoggedIn.jsp" %>
<%
	//** CartService cartService = new HJCartService(new OracleCartDAO());
	CartService cartService = new HJCartService(HashMapCartDAO.getInstance());
	BookService bookService = new HJBookService(new OracleBookDAO());
	MemberService memberService = new HJMemberService(new OracleMemberDAO());
	
	List<CartItem> itemList = cartService.listAll(memberNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 페이지</title>
<style>
	table {
		border-collapse : collapse;
		text-align : center;
	}
	td {
		padding : 5px;
	}
	
</style>
</head>
<body>
<%@ include file = "/common/header.jsp" %>
	<h2>주문하기</h2>
	<h4>주문할 도서 목록</h4>
	<table border=1>
		<tr><th>순번</th><th>책제목</th><th>가격</th><th>수량</th></tr>
	<% 
		int numItems = 0, totalPrice = 0, i = 0;
		for (CartItem item : itemList) { 
			Book book = bookService.detail(item.getBookId());
			numItems += item.getQuantity();
			totalPrice += book.getPrice() * item.getQuantity();
			i++;
	%>
		<tr><td><%= i %></td>
			<td><%= book.getTitle() %></td>
			<td><%= book.getPrice() %></td>
			<td><%= item.getQuantity() %></td>
		</tr>
	<% } %>
	</table>
	<p>총 상품가격 : <%= String.format("%,d", totalPrice) %>원 (총 <%= numItems %>권)</p>
	<%
		Member member = memberService.read(memberNo);
	%>
	<h4>배송 정보</h4>
	이름 : <%= member.getNickname() %><br>
	<form action="order.jsp" method="post">
		<input type="hidden" name="memberNo" value="<%= memberNo %>">
		모바일 : <input type="text" name="mobile" value="<%= member.getMobile() == null ? "" : member.getMobile() %>"><br>
		이메일주소 : <input type="text" name="email" value="<%= member.getEmail() == null ? "" : member.getEmail() %>"><br>
		주소 : <input type="text" name="address" value="<%= member.getAddress() == null ? "" : member.getAddress() %>"><br>
		<input type="checkbox" name="modifyMember">회원정보수정<br>
		<input type="submit" value="주문">
		<a href="<%= request.getContextPath() %>/cart/main.jsp"><input type="button" value="취소"></a>
	</form>
</body>
</html>