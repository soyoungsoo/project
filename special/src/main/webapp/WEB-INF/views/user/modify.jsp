<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사용자 정보 수정</title>
<script type="text/javascript">
	function Cancel(){
			if(confirm("수정하지 않고 나가시겠습니까?")){
				location.href="../movie/list.do";
			}
		}
	function ValueCheck(){
					 
			 var val = document.userInfo;
			 var pw = val.newPassword.value;
			 var num = pw.search(/[0-9]/g);
			 var eng = pw.search(/[a-z]/ig);
			 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

			if (val.newPassword.value != val.newPasswordcheck.value) {
					alert("비밀번호를 동일하게 입력해주세요."); 
					val.reset();										
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
	<h1>수정</h1>
	<form action='<c:url value='/user/modify'/>' method="post" name="userInfo" onsubmit="return ValueCheck()">			
		<div>
			<label>현재 비밀번호  <input type="password" name="oldPassword" autofocus="autofocus" required="required"></label>
		</div>
		<div>
			<label>새 비밀번호 <input type="password" name="newPassword" required="required" ></label>			
		</div>
		<div>
			<label>새 비밀번호 확인<input type="password" name="newPasswordcheck" required="required"></label>
		</div>
		<div>
			<label>이름 <input type="text" name="name" value="${ item.name }" required="required"></label>
		</div>
		<div>
			<label>생일 <input type="date" name="birth" value="${ item.birth }"></label>
		</div>
		<div>
			<label>이메일 <input type="email" name="email" value="${ item.email }" required="required"></label>
		</div>		
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="submit">
		<input type="reset">
		<a href="#" onclick="Cancel()">메인화면으로 이동</a>
	</form>
</body>
</html>