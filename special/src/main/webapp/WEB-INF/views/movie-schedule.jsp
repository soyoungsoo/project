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
	<h1>영화 상영시간 추가</h1>
	<form action="schedule" method="post">
		<label>상영관</label> 		
		<input id="tnoNum" type="number" name="tno" list="defaultNumbers">
		<span class="validity"></span>

		<datalist id="defaultNumbers">
		  <option value="10045678">
		  <option value="103421">
		  <option value="11111111">
		  <option value="12345678">
		  <option value="12999922">
		</datalist>
		
		<input type="date" name="runDay">
		<input type="time" name="runTime">
		<input type="submit" value="제출">
		<input type="hidden" name="mno" value="${mno}">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
</body>
</html>