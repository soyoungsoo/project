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
        $('#Introview').append(
                '<tr><td>'+                           
				'<label>사진</label><input type="file" name="image">'+                				
                '</td></tr>');      
}
</script>
<body>
	<h3>출연진 추가하기</h3>	
	<input type="button" id="addFile" value="add more" onclick="add();">
	<form method="post" action="/special/movie/insert_Intro" enctype="multipart/form-data">
		<table id="Introview">
			<tr>			
				<td>
					<label>동영상</label><input type="text" name="video">
					<label>사진</label><input type="file" name="image">
				</td>	
			</tr>			
		</table>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="hidden" name="mno" value="${param.mno}">
		<input type="submit" value="등록"/>
	</form>
</body>
</html>