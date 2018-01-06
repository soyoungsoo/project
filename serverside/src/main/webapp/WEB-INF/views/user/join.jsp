<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 화면</h1>
	<form action="/special/newUser" method="post">
		
			<label>아이디 <input type="text" name="id"></label>
			<label>비밀번호 <input type="password" name="pwd"></label>
			<label>이름 <input type="text" name="name"></label>
			<label>생일 <input type="date" name="birth"></label>
			<label>이메일 <input type="email" name="email"></label>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="submit" value="회원가입">
		<input type="reset">
	</form>
</body>
</html>