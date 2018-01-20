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
								
			$.ajax({
				type: 'get',				
				url: 'http://localhost:8082/special/rest' + '/select?selectElement=' +selectElement +'&inputVal=' +inputVal,
				data: selectElement,
				processData: false,
				contentType: false ,
				cache: false,
				success: function(data, textStatus, xhr) {					
					//alert(JSON.stringify(data));				
					$.each(data, function (key, value) {														
					    var eachrow ='<ul class="ajax-button'+ key +'" id="'+ value.rdate +'">' +
						    		  '<li class="ajax-button' + key +'">' + '<span id="tno">'+  value.tno +  '</span>'+ 
						    		 '<span id="rdate">'+ '<em>' + value.rdate + ' ' + '</em>' + '</span>' +
						    		  '<span>'+ '<em>' +  value.d + '/'+ value.f + '</em>' + '</span>' +
					                  '</li>' + '</ul>' + '<input type="button" id="ajax-button'+ key +'" value="좌석보기">'+
					                   '<input type="hidden" name="ajax-button'+ key +'" value="'+ value.tno +'">'+
					                   '<input type="hidden" name="ajax-button'+ key +'" value="'+ value.rdate +'">';
								                  			                  					                   	               						          
					         $('#test').append(eachrow);	
					         
					         $("input[id='ajax-button']").unbind('click');
							 $("input[id='ajax-button"+ key + "']").click(function(e) {
								
								var tno = $("#tno").text();
								var before_date = $("#rdate").text();																		
								var rdate = before_date.substring(0,16);								
								
								alert(rdate);								
		 			 			$.ajax({
		 			 				type: 'get',
		 			 				url: 'http://localhost:8082/special/rest' + '/seat?rdate='+rdate+'&mno='+inputVal +'&tno='+tno,						
		 			 				data: false,
		 			 				processData: false,
		 			 				contentType: false,
		 			 				cache: false,				
		 			 				success: function(data, textStatus, xhr) {
									alert("성공");
		 			 				},
		 			 				error: function(jqXHR, textStatus, errorThrown) {
			 			 				alert("ㅇ실패");		 			 											
		 			 				}
		 			 			});
							}); 				
					   });
															 											  								
				},
				error: function(error) {
					alert('실패');
					alert(JSON.stringify(error));
				}
			});
		}	
		
	
</script>
<style>
	#test table{
		display:inline-block;
	}
</style>
</head>
<body>
	<form action="/movie/ticket" method="post" id="ctrl">		
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
		</div>		
		<div id="test">			 				
		</div>
		<input id="mno" type="hidden" value="${mno}">		
	</form>
</body>
</html>