<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예매하기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
	
		function searchGet() {			
			
			var selectElement = $("#select-key")[0].value;
			var inputVal = $("#mno").val();
			alert(inputVal);
			alert(selectElement);
			$.ajax({
				type: 'get',				
				url: 'http://localhost:8082/special/rest' + '/select?selectElement=' +selectElement +'&inputVal=' +inputVal,
				data: selectElement,
				processData: false,
				contentType: false ,
				cache: false,
				success: function(data, textStatus, xhr) {
					alert('성공');																								 
							  							  							  											
				},
				error: function(error) {
					alert('실패');
					alert(JSON.stringify(error));
				}
			});
		}	
</script>
</head>
<body>
<input type="button" value="클릭" onclick="searchGet()">

	<form action="/movie/ticket" method="post">		
		<div>		
		<dl>
			<dt>날짜 선택</dt>
				<dd>
					<select id="select-key" onchange="searchGet()">
						<option selected="selected">선택</option>
						<option id="d" value="2018-01-16">16일</option>
						<option id="d"value="2018-01-17">17일</option>
						<option id="d"value="2018-01-18">18일</option>				
					</select>
				</dd>					
		</dl>		
			<table border="1">
				<tr>
					<th>상영관</th>				
				</tr>					
				<tr>
					<th>시간</th>				
				</tr>					
				<tr>
					<th>좌석</th>				
				</tr>					
			
			</table>
		</div>
		<input id="mno" type="hidden" value="${mno}">
	</form>
</body>
</html>