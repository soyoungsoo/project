<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
    function add() {         
        $('#fileview').append(
                '<tr><td>'+
                '<label>이름</label><input type="text" name="name">' +
				'<label>직업</label><input type="text" name="job">'+
				'<label>사진</label><input type="file" name="photo">'+                
                '</td></tr>');      
}
</script>
<body>
	<h3>출연진 추가하기</h3>	
	<input type="button" id="addFile" value="add more" onclick="add();">
	<form method="post" action="/special/movie/insert_actors" enctype="multipart/form-data">
		<table id="fileview">
			<tr>
				<td>
					<label>이름</label><input type="text" name="name">
					<label>직업</label><input type="text" name="job">
					<label>사진</label><input type="file" name="photo">
				</td>	
			</tr>			
		</table>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="hidden" name="mno" value="${param.mno}">
		<input type="submit" value="등록"/>
	</form>
</body>
</html>