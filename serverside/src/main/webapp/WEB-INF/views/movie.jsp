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
			<th>작성자</th>			
		</tr>
		<c:forEach items="${ list }" var="item">
			<tr>
				<td><a href="<c:url value='/board/detail.do?no=${ item.movie_no }'/>">${ item.movie_no }</a></td>
				<td>${ item.title}</td>
				<td>${ item.M_POST}</td>				
			</tr>
		</c:forEach>
	</table>
</body>
</html>