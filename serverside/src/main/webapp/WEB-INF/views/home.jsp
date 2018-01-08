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
	<div>
		<c:if test="${member.id ne null}">
		<h1>${member.id}</h1>
		<a href="../logout">로그아웃</a>
		<a href="../modify">회원정보수정</a>
		</c:if>				
	</div>
	
	<div>
		<c:if test="${member.id eq null}">
			<form action="<c:url value="/login-processing"/>" method="post">
				<c:if test="${ param.action == 'error' }">
					<p>이메일 혹은 비밀번호를 잘못 입력하였습니다.</p>
				</c:if>
				<c:if test="${ param.action == 'logout' }">
					<p>로그아웃 하였습니다.</p>
				</c:if>
		
				<input type="text" name="id" placeholder="아이디 입력" required>
				<input type="password" name="pwd" placeholder="비밀번호 입력" required>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="submit" value="로그인">
			</form>
			<a href="<c:url value='/join'/>">회원가입</a>
		</c:if>
	</div>
	<div>
		<c:forEach var="list" items="${ member.userTypes }">
			<c:choose>
		       <c:when test="${list.type == 'ADMIN'}">
		         <a href="/special/movie/new.do">영화등록하기</a>					
		       </c:when>	      
		   </c:choose>	
		</c:forEach>
	</div>	
	
	<h1>영화 목록</h1>	
	<a href="<c:url value='/movie/'/>">홈으로</a>
	
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>영화포스터</th>			
		</tr>
		<c:forEach items="${ list }" var="item">
			<tr>					
				<!-- 자바스크립트로 value에 detail or reservation 넣기 -->
				<td><a href="<c:url value='/movie/detail.do?mno=${ item.mno }'/>">상세보기<input type="hidden" name="id" value="${item.mno}"></a>				
				</td>				
				<td>${item.title}</td>
				<td>${item.post}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>