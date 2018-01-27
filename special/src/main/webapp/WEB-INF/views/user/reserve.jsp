<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>나의 예매 내역</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script type="text/javascript">
	
	function SerachReserve(){
		var selectElement = $("#select-key")[0].value;
		
		var dd = document.getElementById("test-div");										
		if(dd.hasChildNodes()){			
			while(dd.hasChildNodes()){																		
				dd.removeChild(dd.firstChild);
			}
		}
		$.ajax({
			type: 'get',				
			url: 'http://localhost:8082/special/rest' + '/reserve',
			data: 'd=' + selectElement ,
			contentType: 'application/json',
			dataType: 'json',
			processData: false,			
			cache: false,
			success: function(data, textStatus, xhr) {							
				$.each(data, function (key, value) {																	
 						var str = 
 								'<li> 상영관 :'+ value.tno +'</li>'+
 								'<li> 영화 제목 :'+ value.title +'</li>'+
 								'<li> 좌석 :'+ value.seatno +'</li>'+
 								'<li> 예매일시 :'+ value.btime +'</li>'+
 								'<li> 상영일 :'+ value.rdate +'</li>';
 																	                   	               						         
 			         $('#test-div').append(str);	
					});
			},
				error: function(error) {
					alert('실패');
					alert(JSON.stringify(error));
				} // eeror
			});	// ajax
	}
</script>
<body>
	<a href="/special/movie/list.do">홈으로</a>
	<h3>나의 예매 내역</h3>
	<p>예매내역 조회 : 최대 6개월까지 조회가능</p>
		 <select id="select-key" onchange="SerachReserve()">
				<option selected="selected">선택</option>
				<option id="o1" value="-1">1개월</option>
				<option id="o2" value="-3">3개월</option>
				<option id="o3" value="-6">6개월</option>
		</select>
		<div id="test-div"></div>
</body>
</html>