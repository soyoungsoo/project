<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 탈퇴</title>
<script type="text/javascript">
	function message(){
			if (confirm("정말 탈퇴하시겠습니까?")) {
				location.href="/user/delete";	
			}
		}
</script>
</head>
<body>
	<h1>정말로 탈퇴하시겠습니까?</h1>
	<form action='<c:url value='/user/delete'/>' method="post" onsubmit="return message()">
		<label>비밀번호 <input type="password" name="password"></label>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="submit" value='탈퇴하기'>
	</form>
</body>
</html>