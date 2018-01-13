<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예매하기</title>
</head>
<body>
	<form action="/movie/ticket" method="post">
		<div>
		
		<dl>
			<dt>상영시간 선택</dt>
				<dd>
					<select>
						<option>1</option>
						<option>2</option>
						<option>3</option>				
					</select>
				</dd>
			<dt>상영관 선택</dt>
				<dd></dd>
			<dt>좌석 선택</dt>
				<dd></dd>
		</dl>		
		</div>
	</form>
</body>
</html>