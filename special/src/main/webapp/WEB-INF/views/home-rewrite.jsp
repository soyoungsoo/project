<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<title>메인화면</title>
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
								<li><a href="/special/movie/new.do" class="nav-link">영화
										등록 하기</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
					<li class="nav-item"><a href="" class="nav-link"> 로그인 </a></li>
					<li class="nav-item"><a href="" class="nav-link"> 회원가입 </a></li>
				</ul>
			</div>
			<div class="nav_right">
				<ul class="nav_right-list">
					<li class="nav_right-item"><a href="" class="nav_right-link">
							Hello World </a></li>
					<li class="nav_right-item"><a href="" class="nav_right-link">
							Hello JAVA </a></li>
					<li class="nav_right-item"><a href="" class="nav_right-link">
							Hello HTML </a></li>
					<li class="nav_right-item"><a href="" class="nav_right-link">
							Hello C Language </a></li>
					<li class="nav_right-item"><a href="" class="nav_right-link">
							Hello JavaScript </a></li>
					<li class="nav_right-item"><a href="" class="nav_right-link">
							Hello Chicken </a></li>
				</ul>
			</div>
			<div class="content">
				<ul>
					<c:forEach items="${ list }" var="item">
						<li><img class="inner-content-imgs" src="${item.post}">
							<div class="view">
								<div>
									<a href="#">예매 하기</a> <a
										href="<c:url value='/movie/detail.do?mno=${ item.mno }'/>">상세
										보기 <input type="hidden" name="id" value="${item.mno}">
									</a>
								</div>
							</div></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="footer">
			<p class="copyright">&copy;copyright reserved larl</p>
		</div>
	</div>
	<script src="bootstrap/js/jquery-1.12.4.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>

</html>