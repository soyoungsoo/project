<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/bootstrap-theme.min.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/main.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/register.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reserve-search.css'/>">
<title>나의 예매 내역</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script type="text/javascript">

	function del(param){		
		var rno = param
		if (confirm("정말 취소하시겠습니까?")) {
			$("#ticket-info"+rno).submit();
		}
	}
		function getTimeStamp() {
		  var d = new Date();		
		  var s =
		    leadingZeros(d.getFullYear(), 4) + '-' +
		    leadingZeros(d.getMonth() + 1, 2) + '-' +
		    leadingZeros(d.getDate(), 2) + ' ' +		
		    leadingZeros(d.getHours(), 2) + ':' +
		    leadingZeros(d.getMinutes(), 2) + ':' +
		    leadingZeros(d.getSeconds(), 2);		
		  return s;
		}		
				
		function leadingZeros(n, digits) {
		  var zero = '';
		  n = n.toString();
		
		  if (n.length < digits) {
		    for (i = 0; i < digits - n.length; i++)
		      zero += '0';
		  }
		  return zero + n;
		}
	
	function SerachReserve(){
		var selectElement = $("#select-key")[0].value;		
		var dd = document.getElementById("test-div");										
		if(dd.hasChildNodes()){			
			while(dd.hasChildNodes()){																		
				dd.removeChild(dd.firstChild);
			}
		}		
		if(selectElement != "선택"){
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
					var curtime = new Date(getTimeStamp());					
					var rdate = new Date(value.rdate);					
					if(curtime<rdate){ 	 																														 															
 						var str='<form action="/special/movie/ticket-del" method="post" id="ticket-info'+value.rno +'">'+
 	 							'<ul class = "my-reserve">' + 
 								'<li class = "reserve-place"> 상영관 :'+ value.tno +'</li>'+
 								'<li> 영화 제목 :'+ value.title +'</li>'+
 								'<li> 좌석 :'+ value.seatno +'</li>'+
 								'<li> 예매일시 :'+ value.btime +'</li>'+
 								'<li> 상영일 :'+ value.rdate +'</li>'+ 
 								'<li><input type="button" onclick="del('+value.rno+');" value="예매취소"></li>'+	
 								'<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">'+
 								'<input type="hidden" name="rno" value="'+value.rno+'">'+
 								'<input type="hidden" name="tno" value="'+value.tno+'">'+
 								'<input type="hidden" name="scount" value="'+value.scount+'">'+
 								'<input type="hidden" name="seatno" value="'+value.seatno+'">'+							
 								'</ul>';
				}else{
					var str ='<ul class = "my-reserve">' + 
						'<li class = "reserve-place"> 상영관 :'+ value.tno +'</li>'+
						'<li> 영화 제목 :'+ value.title +'</li>'+
						'<li> 좌석 :'+ value.seatno +'</li>'+
						'<li> 예매일시 :'+ value.btime +'</li>'+
						'<li> 상영일 :'+ value.rdate +'</li>'+ 													
						'</ul>';
				}      	               						         
 			         $('#test-div').append(str);	
					});
			},
				error: function(error) {
					alert('실패');					
					alert(JSON.stringify(error));
				} // eeror
			});	// ajax
		}
	}
</script>
<body>
	  <div class="frame">
        <div class="container">
            <div class="header">
                <div class="logo">
                    <a href="<c:url value='/'/>"> Movie Theater </a>
                </div>
            </div>
            <div class ="nav">
                <ul class = "nav-list">
                    <c:if test="${member.id ne null}">
						<li class ="nav-item">${member.id} 님</li>
						<li class ="nav-item"><a class="nav-link" href="../logout">로그아웃</a></li>
						<li class ="nav-item"><a class="nav-link" href="../user/setting">회원정보수정</a></li>
					</c:if>
                </ul>
            </div>
            <div class="content">            
                <h3>나의 예매 내역</h3>
                <p>예매내역 조회 : 최대 6개월까지 조회가능</p>
                <div class="select-cover">
                    <select id="select-key" class="form-control" onchange="SerachReserve()">
								<option selected="selected">선택</option>
								<option id="o1" value="-1">1개월</option>
								<option id="o2" value="-3">3개월</option>
								<option id="o3" value="-6">6개월</option>
						</select>
                </div>
                <div id="test-div">
                </div>
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