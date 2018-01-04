<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Movie list</title>
</head>
<body>
	<h1>영화 목록</h1>	
	<a href="<c:url value='/'/>">홈으로</a>
	
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>영화포스터</th>			
		</tr>
		<c:forEach items="${ list }" var="item">
			<tr>					
				<!-- 자바스크립트로 value에 detail or reservation 넣기 -->
				<td><a href="<c:url value='/detail.do?mno=${ item.mno }'/>">상세보기<input type="hidden" name="id" value="${item.mno}"></a>				
				</td>				
				<td>${item.title}</td>
				<td>${item.post}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>