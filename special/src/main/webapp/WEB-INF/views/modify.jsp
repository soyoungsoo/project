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
<link rel="stylesheet" type="text/css" href="css/register.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<title>Untitled Document</title>
<script>
	function submitTest() {
		$('#joinForm').submit();
	}
	function Cancel() {
		if (confirm("가입하지 않고 나가시겠습니까?")) {
			location.href = "../special/movie/list.do";
		}
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
				<form action="/special/movie/modify.do" method="post"
					enctype="multipart/form-data" id="joinForm">
					<table class="table-join">
						<tr>
							<th colspan="2" class="text-center"><h3>수정하기</h3></th>
						</tr>
						<tr>
							<th class="text-right">- 제목</th>
							<td class="text-center"><input type="text" name="title"
								value="${item.title}" id="sname"></td>
						</tr>
						<tr>
							<th class="text-right">- 시놉시스</th>
							<td class="text-center"><textarea name="content">${item.content}</textarea></td>
						</tr>
						<tr>
							<th class="text-right">- 장르</th>
							<td class="text-center"><input type="text" name="genre"
								value="${item.genre}" id="sname"></td>
						</tr>
						<tr>
							<th class="text-right">- 관람 등급</th>
							<td class="text-center"><input type="text" name="grade"
								value="${item.grade}" id="sname"></td>
						</tr>
						<tr>
							<th class="text-right">- 상영 시간</th>
							<td class="text-center"><input type="text" name="mrun"
								value="${item.mrun}" id="sname"></td>
						</tr>
						<tr>
							<th class="text-right">- 개봉일</th>
							<td class="text-center"><input type="date" name="sdate"
								value="${item.sdate}" id="sname"></td>
						</tr>
						<tr>
							<th class="text-right">- 종영일</th>
							<td class="text-center"><input type="date" name="edate"
								value="${item.edate}" id="sname"></td>
						</tr>
						<tr>
							<th class="text-right">- 영화 포스터</th>
							<td class="text-center"><input type="file" name="post"
								multiple="multiple"></td>
						</tr>
						<tr>
							<th><input type="hidden" name="mno" value="${item.mno}"></th>
							<th colspan="2" class="text-center"><a href="javascript:{}"
								onclick="submitTest();" class="reg-btn">수정완료</a></th>
							<th><a href="#" onclick="Cancel()" class="reg-btn">메인화면으로
									이동</a></th>
							<th><input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}"></th>
						</tr>
					</table>
				</form>
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