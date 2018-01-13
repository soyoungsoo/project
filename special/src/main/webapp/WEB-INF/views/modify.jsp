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
	<h1>수정하기</h1>
	<form action="/special/movie/modify.do" method="post" enctype="multipart/form-data">	
		<div>
			<label>제목<input type="text" name="title" value="${item.title}"></label>
		</div>
		<div>
			<label>시놉시스<textarea name="content">${item.content}</textarea></label>			
		</div>
		<div>
			<label>장르<input type="text" name="genre" value="${item.genre}"></label>
		</div>
		<div>
			<label>관람등급<input type="text" name="grade" value="${item.grade}"></label>
		</div>
		<div>
			<label>상영시간<input type="text" name="mrun" value="${item.mrun}"></label>
		</div>
		<div>
			<label>개봉일<input type="date" name="sdate" value="${item.sdate}"></label>
		</div>
		<div>
			<label>종영일<input type="date" name="edate" value="${item.edate}"></label>
		</div>
		<div>
			<label>영화포스터<input type="file" name="post" multiple="multiple"></label>
		</div>		
		<input type="hidden" name="mno" value="${item.mno}">
		<input type="submit">
		<input type="reset">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">		
	</form>

</body>
</html>