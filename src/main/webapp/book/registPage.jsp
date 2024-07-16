<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/common/isAdminLogged.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "/common/header.jsp" %>
	<h3>도서 등록</h3>
	<form action="regist.jsp" method="post" onsubmit="return validateForm()">
		<input type="text" name="title" placeholder="제목 입력" required><br>
		<input type="text" name="author" placeholder="저자 입력" required ><br>
		<input type="text" name="publisher" placeholder="출판사 입력" required><br>
		<input type="number" name="price" placeholder="가격 입력" required><br>
		<input type="number" name="instock" placeholder="재고량 입력" required><br>
		<br>
		<input type="submit" value="도서 등록">
		<a href="main.jsp"><input type="button" value="취소"></a>
	</form>
<%@ include file = "/common/footer.jsp" %>
<script>
	function validateForm() {
		const price = document.querySelector('input[name="price"]').value;
		if (price <= 0) {
			alert("책 가격은 0보다 큰 금액을 입력해야 합니다.");
			return false;
		}
		if (document.querySelector('input[name="instock"]').value <= 0) {
			alert("도서 재고량은 0보다 커야 합니다.")
			return false;
		}
	}
</script>
</body>
</html>