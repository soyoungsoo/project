<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화등록</title>
</head>
<body>
	<h1>영화등록하기</h1>
	<form action="<c:url value='/new.do'/>" method="post"
		enctype="multipart/form-data">
		<div>영화번호</div>
		<div>
			<label>제목 <input type="text" name="title"></label>
		</div>
		<div>
			<label>시놉시스<textarea name="content"></textarea></label>
		</div>
		<div>
			<label>장르 <input type="text" name="genre"></label>
		</div>
		<div>
			<label>관람등급 <input type="text" name="grade"></label>
		</div>
		<div>
			<label>상영시간 <input type="text" name="mrun"></label>
		</div>
		<div>
			<label>개봉일 <input type="date" name="sdate"></label>
		</div>
		<div>
			<label>종영일 <input type="date" name="edate"></label>
		</div>
		<div>
			<label>첨부파일 <input type="file" name="post" multiple="multiple"></label>
		</div>		
<%-- 		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
		<input type="submit">
		<input type="reset">
	</form>
</body>
</html>