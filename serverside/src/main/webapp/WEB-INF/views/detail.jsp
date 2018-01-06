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
	<h1>영화 정보</h1>
	<dl>
		<dt>번호</dt>
		<dd>${ item.mno }</dd>
		<dt>제목</dt>
		<dd>${ item.title }</dd>
		<dt>시놉시스</dt>
		<dd>${ item.content }</dd>
		<dt>장르</dt>
		<dd>${ item.genre }</dd>
		<dt>관람등급</dt>
		<dd>${ item.grade }</dd>
		<dt>상영시간</dt>
		<dd>${ item.mrun }</dd>
		<dt>상영일</dt>
		<dd>${ item.sdate }</dd>
		
		<dt>종영일</dt>
		<dd>${ item.edate }</dd>
		<c:if test="${ !empty post }">
			<dt>첨부파일</dt>
			<dd><a href="<c:url value='/download.do?filename=${ item.post }'/>">${ post }</a></dd>
		</c:if>
	</dl>	
	<a href="/special/movie/modify.do?mno=${item.mno}">수정하기</a>
</body>
</html>