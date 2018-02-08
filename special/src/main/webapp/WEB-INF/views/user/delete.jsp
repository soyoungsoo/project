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
<title>회원 탈퇴</title>
<script type="text/javascript">
	function message() {
		if (confirm("정말 탈퇴하시겠습니까?")) {
			location.href = "/user/delete";
		}
	}
	function Cancel() {
		if (confirm("진행중인것을 그만두고 나가시겠습니까?")) {
			location.href = "/special/movie/list.do";
		}
	}
	function submitTest() {
		if ($('.reg-pwd').val() === "") {
			alert("비밀번호를 입력해주세요!");
			return false;
		} else {
			$('#joinForm').submit();
		}

		return true;
	}
</script>
</head>
<body>
	<div class="frame">
		<div class="container">
			<div class="header">
				<div class="logo">
					<a href="<c:url value='/'/>" onclick="Cancel();"> Movie Theater </a>
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
				<form action='<c:url value='/user/delete'/>' method="post"
					onsubmit="return message()" id="joinForm">
					<table class="table-join">
						<tr>
							<th colspan="2" class="text-center"><h3>회원 탈퇴</h3></th>
						</tr>
						<tr>
							<th class="text-right">- 비밀번호</th>
							<td class="text-center"><input type="password"
								name="password" class="reg-pwd" value = ""></td>
						</tr>
						<tr>
							<th colspan="2" class="text-center"><a href="javascript:{}"
								onclick="submitTest();" class="reg-btn">탈퇴하기</a></th>
							<th><a href="#" onclick="Cancel()" class="reg-btn">메인화면으로
									이동</a></th>
							<td><input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}"></td>
						</tr>
					</table>
				</form>
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