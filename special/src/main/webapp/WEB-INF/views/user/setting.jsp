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
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/register.css'/>">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="frame">
		<div class="container">
			<div class="header">
				<div class="logo">
					<a href="<c:url value='/'/>"> Movie Theater </a>
				</div>
			</div>
			<div class ="nav">
                <ul class = "nav-list">
                    <c:if test="${member.id ne null}">
						<li class ="nav-item">${member.id} 님</li>
						<li class ="nav-item"><a class="nav-link" href="../logout">로그아웃</a></li>
						<li class ="nav-item"><a class="nav-link" href="../user/setting">회원정보수정</a></li>
					</c:if>
                </ul>
            </div>
			<div class="content">
				<table class="table-join" id = "table-setting">
					<tr>
						<th><h3>회원 정보 수정</h3></th>
					</tr>
					<tr>
						<th><a href="<c:url value='/user/modify'/>" class="reg-btn">회원
								수정</a></th>
					</tr>
					<tr>
						<th><a href="<c:url value='/user/delete'/>" class="reg-btn">회원
								탈퇴</a></th>
					</tr>
					<tr>
						<th><a href="<c:url value='/'/>" class="reg-btn">홈으로</a></th>
					</tr>
				</table>
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