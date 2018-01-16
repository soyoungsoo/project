<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>   
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>

	function deleteCheck(){ 
		if (confirm("삭제 하시겠습니까?")){ 
			location.href="/special/movie/remove.do?mno=${item.mno}";		
		}else{ 
			alert("삭제 취소 되었습니다."); 
		return; 
		} 
	} 
</script>
</head>
<body>
<% 
	pageContext.setAttribute("cr","\r");
	pageContext.setAttribute("cn","\n");
	pageContext.setAttribute("crcn","\r\n");
	pageContext.setAttribute("br","<br/>");
%>
	<h1>영화 정보</h1>	
	<dl>					
		<dt>제목</dt>
		<dd>${ item.title }</dd>
		<dt>시놉시스</dt>
		<dd>${fn:replace(item.content,crcn,"<br/>") }
		<dt>장르</dt>
		<dd>${ item.genre }</dd>
		<dt>관람등급</dt>
		<dd>${ item.grade }</dd>
		<dt>상영시간</dt>
		<dd>${ item.mrun }</dd>
		<dt>상영일</dt>
		<dd><fmt:formatDate value="${ item.sdate }" pattern="yyyy-MM-dd"/></dd>		
		<dt>종영일</dt>
		<dd><fmt:formatDate value="${ item.edate }" pattern="yyyy-MM-dd"/></dd>
		
		<c:if test="${ !empty post }">
			<dt>첨부파일</dt>
			<dd><a href="<c:url value='/download.do?filename=${ item.post }'/>">${ post }</a></dd>
		</c:if>
	</dl>			
	<c:forEach var="list" items="${ member.userTypes }">
		<c:choose>
	       <c:when test="${list.type == 'ADMIN'}">
	         <a href="/special/movie/modify.do?mno=${item.mno}">수정하기</a>
			<a href="javascript:deleteCheck();">삭제하기</a>
	       </c:when>	      
	   </c:choose>	
	</c:forEach>	
	<a href="/special/movie/ticket?mno=${item.mno}">예매하러가기</a>
	<a href="/special/movie/list.do">메인으로 돌아가기</a>
</body>
</html>