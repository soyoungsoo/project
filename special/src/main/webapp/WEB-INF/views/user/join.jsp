<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function Cancel(){
			if(confirm("진행중인것을 그만두고 나가시겠습니까?")){
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
				  alert("비밀번호는 공백업이 입력해주세요.");
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
	<h1>회원가입 화면</h1>
	<form action="/special/newUser" method="post" name="userInfo" onsubmit="return ValueCheck()">		
		<div>
			<label>아이디 <input type="text" name="id"></label>
		</div>
		<div>
			<p>비밀번호 조건 : 영문,숫자,특수문자 혼합하여 8자리~20자리 이내</p>
		</div>
		<div>
			<label>비밀번호<input type="password" name="pwd"></label>
		</div>
		<div>
			<label>비밀번호 확인 <input type="password" name="pwdcheck"></label>
		</div>
		<div>
			<label>이름 <input type="text" name="name"></label>
		</div>
		<div>
			<label>생일 <input type="date" name="birth"></label>
		</div>
		<div>
			<label>이메일 <input type="email" name="email"></label>
		</div>						
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="submit" value="회원가입">
		<input type="reset">
		<a href="#" onclick="Cancel()">메인화면으로 이동</a>
	</form>
</body>
</html>