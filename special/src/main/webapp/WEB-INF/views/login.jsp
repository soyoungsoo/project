<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/bootstrap-theme.min.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/main.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/login.css'/>">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<title>Untitled Document</title>
<script>
        function submitTest() {
                    if ($('.login-id').val() === "") {
                        alert("아이디를 입력해주세요!");
                        return false;
                    } else if ($('.login-pwd').val() === "") {
                        alert("비밀번호를 입력해주세요!");
                        return false;
                    } else {
                        $('#loginForm').submit();
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
					<a href="<c:url value='/'/>"> Movie Theater </a>
				</div>
			</div>
			<div class="content">
				<c:if test="${member.id eq null}">
					<form action="<c:url value="/login-processing"/>" method="post"
						id="loginForm">
						<c:if test="${ param.action == 'error' }">
							<p>아이디 혹은 비밀번호를 잘못 입력하였습니다.</p>
						</c:if>
						<table class="table-login">
							<tr>
								<th class="text-right">- 아이디</th>
								<td class="text-center"><input type="text" id="sname"
									class="login-id" name="id" value="" placeholder="아이디" required></td>
							</tr>
							<tr>
								<th class="text-right">- 비밀번호</th>
								<td class="text-center"><input type="password" id="sname"
									class="login-pwd" name="pwd" value="" placeholder="비밀번호" required></td>
							</tr>
							<tr>
								<th colspan="2" class="text-center"><a href="javascript:{}"
									onClick="submitTest();" class="login-btn">로그인</a> <a
									href="<c:url value='/join'/>" class="reg-btn">회원 가입</a></th>
							</tr>
							<tr>
								<td><input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}"></td>
							</tr>

						</table>
					</form>
				</c:if>
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