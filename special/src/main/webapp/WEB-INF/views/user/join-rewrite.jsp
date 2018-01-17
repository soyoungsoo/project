<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
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
                    if ($('.reg-name').val() === "") {
                        alert("이름을 입력해주세요!");
                        return false;
                    } else if ($('.reg-id').val() === "") {
                        alert("아이디를 입력해주세요!");
                        return false;
                    } else if ($('.reg-pwd').val() === "") {
                        alert("비밀번호를 입력해주세요!");
                        return false;
                    } else if ($('.reg-email').val() === "") {
                        alert("이메일을 입력해주세요!");
                        return false;
                    } else if ($('.reg-birth').val() === "") {
                        alert("생년월일을 입력해주세요!");
                        return false;
                    } else {
                        $('#joinForm').submit();
                    }
                    
                    return true;
        }
        function Cancel(){
			if(confirm("가입하지 않고 나가시겠습니까?")){
				location.href="../special/movie/list.do";
			}
		}
	function ValueCheck(){
					 
			 var val = document.userInfo;
			 var pw = val.pwd.value;
			 var num = pw.search(/[0-9]/g);
			 var eng = pw.search(/[a-z]/ig);
			 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

			if (pw != val.pwdcheck.value) {
					alert("비밀번호를 동일하게 입력해주세요."); 							
					return false;										
			}					
			 if(pw.length < 8 || pw.length > 20){
				  alert("8자리 ~ 20자리 이내로 입력해주세요.");			  
				  return false;
			 }
			 if(pw.search(/₩s/) != -1){
				  alert("비밀번호는 공백없이 입력해주세요.");
				  return false;
			 } 
			 if(num < 0 || eng < 0 || spe < 0 ){
				  alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
				 return false;
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
				<form action="/special/newUser" method="post" name="userInfo"
					onsubmit="return ValueCheck()" id="joinForm">
					<table class="table-join">
						<tr>
							<th colspan="2" class="text-center"><h3>회원가입</h3></th>
						</tr>
						<tr>
							<th class="text-right">- 이름</th>
							<td class="text-center"><input type="text" id="sname"
								name="name" class="reg-name" autofocus value=""></td>
						</tr>
						<tr>
							<th class="text-right">- 아이디</th>
							<td class="text-center"><input type="text" id="sname"
								class="reg-id" name="id" value=""></td>
						</tr>
						<tr>
							<th class="text-right">- 비밀번호</th>
							<td class="text-center"><input type="password" id="sname"
								class="reg-pwd" name="pwd" value=""></td>
						</tr>
						<tr>
							<th class="text-right">- 비밀번호 확인</th>
							<td class="text-center"><input type="password" id="sname"
								class="reg-pwdcheck" value="" name="pwdcheck"></td>
						</tr>
						<tr>
							<th class="text-right">- 이메일</th>
							<td class="text-center"><input type="email" id="sname"
								class="reg-email" name="email" value=""></td>
						</tr>
						<tr>
							<th class="text-right">- 생년월일</th>
							<td class="text-center"><input type="date" id="sname"
								name="birth" class="reg-birth" value=""></td>
						</tr>

						<tr>
							<th colspan="2" class="text-center"><a href="javascript:{}"
								onclick="submitTest();" class="reg-btn">회원가입</a></th>
							<th><a href="#" onclick="Cancel()" class="reg-btn">메인화면으로 이동</a></th>
							<td><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"></td>
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