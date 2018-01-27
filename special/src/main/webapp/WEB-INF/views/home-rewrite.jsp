<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/bootstrap-theme.min.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/main.css'/>">
<title>메인화면</title>
<script>	
</script>
</head>

<body>
	<div class="frame">
		<div class="container">
			<div class="header">
				<div class="logo">
					<a href="<c:url value='/'/>"> Movie Theater </a>
				</div>
			</div>
			<div class="nav">
				<ul class="nav-list">
					<c:forEach var="list" items="${ member.userTypes }">
						<c:choose>
							<c:when test="${list.type == 'ADMIN'}">
								<li class ="nav-item"><a href="/special/movie/new.do" class="nav-link">영화
										등록 하기</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${member.id ne null}">
						<li class ="nav-item">${member.id} 님</li>
						<li class ="nav-item"><a class="nav-link" href="../logout">로그아웃</a></li>
						<li class ="nav-item"><a class="nav-link" href="../user/setting">회원정보수정</a></li>
						<li class ="nav-item"><a class="nav-link" href="../user/reserve">내 예매 내역 보기</a></li>
					</c:if>
					<c:if test="${member.id eq null }">
						<li class="nav-item"><a href="../login" class="nav-link"> 로그인 </a></li>
						<li class="nav-item"><a href="../join" class="nav-link"> 회원가입 </a></li>
					</c:if>
				</ul>
			</div>
			<div class="content">
				<ul>							
					<c:forEach items="${ list }" var="item">
						<li><img class="inner-content-imgs" src="<c:url value="../../img/${item.post}"/>"/>
						<li><img class="inner-content-imgs" src="<c:url value="${item.post}"/>"/>											
							<div class="view">
								<div>
									<a href="/special/movie/ticket?mno=${item.mno}">예매 하기</a> <a
										href="<c:url value='/movie/detail.do?mno=${ item.mno }'/>">상세
										보기 <input type="hidden" name="id" value="${item.mno}">
									</a>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>									
			</div>
		</div>
		</div>
		<div class="footer">
			<p class="copyright">&copy;copyright reserved larl</p>
		</div>
	</div>
	<script src="<c:url value='/resources/bootstrap/js/jquery-1.12.4.min.js'/>"></script>
	<script src="<c:url value='/resources/bootstrap/js/bootstrap.min.js'/>"></script>
</body>

</html>