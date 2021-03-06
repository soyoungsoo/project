<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/bootstrap-theme.min.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/jQuery-Radiobtn/css/zInput_default_stylesheet.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/main.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/seat.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/register.css'/>">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="<c:url value='/resources/jQuery-Radiobtn/zInput.js'/>"></script>
<title>예매하기</title>
<style type="text/css">
.screen_tit ul li a {  }
</style>
<script>
		$(function(){			
			$('.screen_tit').hide();
			$('.select-age').hide();
			setInterval("howMuch()", 100);

			$(".zInput").click(function(){
				var target = $(this).children().children().text();
				if (!(target == "성인" || target == "청소년")) {				
					SerachGet();
				}
				
				});
				

		});
		function submitTest() {			
		    if($('.total-price').text() == "0") {
		        alert("표를 예매해주세요!");
		    }
		    else {
		        $('#reserv-form').submit();    
		    }		    
		}
		function selectedSeat(target) {			
			
			var cs = $(target).attr("class");			
			var sub_cs = cs.substring(7,8);						
		
			var title = $(target).attr("title");										   	
		    var sub_tno = title.substring(6,7);		    
		    var sub_seatno = title.substring(15,18);			     		   		
			var sub_scount = cs.substring(9,11);							
			if(sub_cs == 0){							
				var t_class = $(target).attr("class", 'p0 '+sub_seatno + ' 0 ' +'1');								    			
				var str ="";
				 str += '<input id="i_tno" name="tno" type="hidden" value="'+ sub_tno +'"> <br/>';
				 str += '<input id="i_seatno" name="seatno" type="hidden" value="'+ sub_seatno +'"> <br/>';
				 str += '<input id="i_scount" name="scount" type="hidden" value="'+ sub_scount +'"> <br/>';				
				$('#request').append(str);			
			}
		
			else if(sub_cs == 1){		
				var t_class = $(target).attr("class", 'p0 '+sub_seatno + ' ' +'0');
				$("#i_tno").remove();
				$("#i_seatno").remove();			
			}
							
		    var age = $("input:radio[name=age]:checked").val();					    	
		    var attachClass = age + "-seat-selected";
			
		    if ($(target).hasClass("adult-seat-selected") || $(target).hasClass("teen-seat-selected")) {
		        $(target).removeClass("adult-seat-selected");
		        $(target).removeClass("teen-seat-selected");
		        $(target).addClass(attachClass);		        
		    } else {
		        $(target).addClass(attachClass);
		    }
		}	
	
		function SerachGet() {									
			var selectElement = $("input:radio[name=day]:checked").val();								
			var inputVal = $("#i_mno").val();				
			$(".ajax-cover").empty();		  
			$(".seat_area").empty();									
			$.ajax({
				type: 'get',				
				url: 'http://localhost:8082/special/rest' + '/select?selectElement=' +selectElement +'&inputVal=' +inputVal,
				data: selectElement,
				processData: false,
				contentType: false ,
				cache: false,
				success: function(data, textStatus, xhr) {														
					$.each(data, function (key, value) {												// + key + '">'							
					     var eachrow = '<input type="hidden" id="ajax_scount" name="scount_a" value="'+ value.scount +'">' +
						    		'<ul class="ajax-button'+ key +'" id="'+ value.rdate +'">' +					    		 	
						    		  '<li style="text-align:center;" class="ajax-button' + key +'"><a title="'+value.tno+'" name="'+ value.scount +'"onclick="chk(this);" id="ajax-buttona" style="text-decoration:none; cursor:pointer">' + '<span id="tno">'+  value.tno +  '</span><span>관</span><br/>'+ 
						    		 '<span id="rdate">'+ '<em>' + value.rdate + ' ' + '</em>' + '</span><br/>' +						    		
					                  '</a></li>' + '</ul>'; 
					         
								                  			                  					                   	               						          
					        $('.ajax-cover').append(eachrow).trigger("create");	
					         $('.screen_tit').show();							 					     	 	 											  							
					}); // each	 					        						 					     	 	 											  																	
			}, // success
			error: function(error) {
				alert('실패');				
				alert(JSON.stringify(error));
			} // eeror
		});	// ajax
	} //시작

	
	function chk(target) {		 
		
		var inputVal = $("#i_mno").val();
		var dd = document.getElementById("area");					
		var pa = $(target).attr("name");
						
		if(dd.hasChildNodes()){			
			while(dd.hasChildNodes()){																		
				dd.removeChild(dd.firstChild);
			}
		}		
		var tno = $(target).attr("title");		
		var before_date = $(target).parents("ul").attr("id");			
		var rdate = before_date.substring(0,16);																 																								
			$.ajax({
				type: 'get',
				url: 'http://localhost:8082/special/rest' + '/seat?rdate='+rdate+'&mno='+inputVal +'&tno='+tno+'&scount='+pa,						
				data: false,
				processData: false,
				contentType: false,
				cache: false,				
				success: function(data) {							
			$.each(data , function(key, value) {								
				var htmlrow = 
					//  p0 
					'<a style="cursor:pointer" class="p0 '+ value.seatno +' 0 '+ value.scount +'" value="'+value.issue+'" data-seat="' + (key+1) +'" seat-group="grNum3"' + 
					'title="상영관 : ' + value.tno + ' 좌석 번호: '+ value.seatno + ' - 일반석"'+
					'seat-code="1A01" onclick="selectedSeat(this);">'+ (key+1) +'</a>'
				 
				  $('.seat_area').append(htmlrow).trigger("create");
					//var index = $('.seat_area a').attr("value");
					var index = $(".seat_area").children().eq(key).attr("value");							
					if (index == "1") {	
						 $(".seat_area").children().eq(key).addClass("already-selected");												
					}
					else if (index == "2") {
						$(".seat_area").children().eq(key).addClass("seat-broken");						
					}
				  $('.screen_tit').show();
				  $('.select-age').show();																					

			});		// each																													 			 						 			 						 			 			 			 						 			 					 			 		
			}, // 2 success
			//}); // ajax
			error: function(jqXHR, textStatus, errorThrown) {				 			 			
				alert("실패");		 			 									 			 											
			} //error
	}); 	// 2 ajax			
} // function
					


	
	
	function removeAll() {
		$(".p0").removeClass("adult-seat-selected");
		$(".p0").removeClass("teen-seat-selected");
	}


	function isBooked() {
		var index;

		for (var i = 0; i < 45; i++) {

			var index = $(".seat_area").children().eq(i).attr("value");			
			if (index==1) {
				$(index).addClass("already-selected");
			}
			else if ($(index[value= "2"])) {
				$(index).addClass("seat-broken");
			}
		}
	}
	
	function howMuch() {
		var adprice;
		var tenprice;

		var adult_index = $(".adult-seat-selected").length;
		var teen_index = $(".teen-seat-selected").length;
		$(".adult-count").text(adult_index);
		adprice = adult_index * 8000;
		$(".adult-price").text(adprice);

		$(".teen-count").text(teen_index);
		tenprice = teen_index * 6000;
		$(".teen-price").text(tenprice);

		$(".total-price").text(tenprice + adprice);
	}
	function getday(param){
		var date = new Date();	
		if(param == null){	
			var day =date.getDate();
		}else{
			var day =date.getDate()+param;
		}
		return day;
	}
	function getTimeStamp(param) {
		  var d = new Date();		
		  if(param == null){
		  var s =
		    leadingZeros(d.getFullYear(), 4) + '-' +
		    leadingZeros(d.getMonth() + 1, 2) + '-' +
		    leadingZeros(d.getDate(), 2);		 	
		  return s;
		  } else{
		  var s =
			leadingZeros(d.getFullYear(), 4)+ '-' +
			leadingZeros(d.getMonth() + 1, 2) + '-' +
			leadingZeros(d.getDate()+param, 2)	 	
		 return s;
		  }
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
		$(document).ready(function() {	
	         
	    });
	    
</script>
</head>
<body>				 	
	  <div class="frame">
        <div class="container">
            <div class="header">
                <div class="logo text-center"> <a href="<c:url value='/'/>">Movie Theater</a> </div>
            </div>
            <div class="content ">           
                   <div class="calendar text-center" id="testdd">
						<input type="radio" class="cal-radio" name="day" id="jan-13" title="토<br> 13"> 
						<input type="radio" class="cal-radio" name="day" id="jan-14" title="일<br> 14"> 
						<input type="radio" class="cal-radio" name="day" id="jan-15" title="월<br> 15"> 
						<input type="radio" class="cal-radio" name="day" value="2018-01-16" id="jan-16" title="화<br> 16">
						<input type="radio" class="cal-radio" name="day" value="2018-01-17" id="jan-17" title="수<br> 17"> 
						<input type="radio" class="cal-radio" name="day" value="2018-01-18" id="jan-18" title="목<br> 18"> 
						<input type="radio" class="cal-radio" name="day" value="2018-01-19" id="jan-19" title="금<br> 19"> 
						<input type="radio" class="cal-radio" name="day" value="2018-01-20" id="jan-20" title="토<br> 20">
						<input type="radio" class="cal-radio" name="day" value="2018-01-21" id="jan-21" title="일<br> 21"> 
						<input type="radio" class="cal-radio" name="day" value="2018-01-22" id="jan-22" title="월<br> 22">
					</div>
					<script>
					var week = new Array('일', '월', '화', '수', '목', '금', '토','일','월','화');			
					var todays = new Date();
					var today = todays.getDay();			
					var todayLabel = week[today];	
					var expression = 24*60*60*1000;	
					// 0 일 6 토		
					 $('#jan-13').attr("title",week[today]+'<br> '+ getday());	
			         $('#jan-14').attr("title",week[new Date(todays.valueOf()+(expression)).getDay()]+'<br> '+ getday(1));	
			         $('#jan-15').attr("title",week[new Date(todays.valueOf()+(expression*2)).getDay()]+'<br> '+ getday(2));	
			         $('#jan-16').attr("title",week[new Date(todays.valueOf()+(expression*3)).getDay()]+'<br> '+ getday(3));	
			         $('#jan-17').attr("title",week[new Date(todays.valueOf()+(expression*4)).getDay()]+'<br> '+ getday(4));	
			         $('#jan-18').attr("title",week[new Date(todays.valueOf()+(expression*5)).getDay()]+'<br> '+ getday(5));
			         $('#jan-19').attr("title",week[new Date(todays.valueOf()+(expression*6)).getDay()]+'<br> '+ getday(6));
			         $('#jan-20').attr("title",week[new Date(todays.valueOf()+(expression*7)).getDay()]+'<br> '+ getday(7));
			         $('#jan-21').attr("title",week[new Date(todays.valueOf()+(expression*8)).getDay()]+'<br> '+ getday(8));
			         $('#jan-22').attr("title",week[new Date(todays.valueOf()+(expression*9)).getDay()]+'<br> '+ getday(9));	
			         	
			         $('#jan-13').val(getTimeStamp());	
			         $('#jan-14').val(getTimeStamp(1));	
			         $('#jan-15').val(getTimeStamp(2));	
			         $('#jan-16').val(getTimeStamp(3));	
			         $('#jan-17').val(getTimeStamp(4));	
			         $('#jan-18').val(getTimeStamp(5));
			         $('#jan-19').val(getTimeStamp(6));	
			         $('#jan-20').val(getTimeStamp(7));	
			         $('#jan-21').val(getTimeStamp(8));	
			         $('#jan-22').val(getTimeStamp(9));	
					</script>
                <form action="/special/movie/ticket" method="post" id="reserv-form">
            	<div class="theater-container">
					<h2>- 상영관</h2>		
				</div>
				<div class="seat-container">
					<div class="screen_box">
						<div class="select-age text-center">
							<input type="radio" class="age-radio" name="age" value="adult"
								id="adult" title="성인"> <input type="radio" 
								class="age-radio" name="age" value="teen" id="teen" title="청소년">
						</div>
						<strong class="screen_tit">Screen</strong>
						<div class = "ajax-cover">												
						</div>
						<div class="seat_Barea" id="Barea">
							<div class = "seat_area" style="height: 184px; margin-left: 308.5px;" id = "area">							
							</div>
						</div>
						<div class="pay-container">
									<hr style="border: 0.5px solid gray;">
									<ul>									
										<li>
											<h3>- 요금</h3>
										</li>
										<li>성인 : <strong class="adult-count">0</strong> 매 / <strong
											class="adult-price">0</strong> 원
										</li>
										<li>청소년 : <strong class="teen-count">0</strong> 매 / <strong
											class="teen-price">0</strong> 원
										</li>
										<li>
											<h4>
												총 금액 : <strong class="total-price">0</strong> 원
											</h4> <input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}"> <a href="javascript:{}"
											onclick="submitTest();" class="reg-btn">예매 하기</a> <a
											href="javascript:{}" onclick="removeAll();" class="reg-btn">리셋</a>
										</li>
										<li id = "request"></li>
									</ul>
								</div>
							<div id="request">
								<input id="i_mno" name="mno" type="hidden" value="${mno}">																												
		<%-- 						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">						 --%>
							</div> 
						</div>
					</div>	
				</form>		
			</div>
		</div>
		<div class="footer">
            <p class="copyright">&copy;copyright reserved larl</p>
        </div>
	</div>
    <script>
		$(".calendar").zInput();
		$(".select-age").zInput();
	</script>
	<script src="<c:url value='/resources/bootstrap/js/jquery-1.12.4.min.js'/>"></script>
	<script src="<c:url value='/resources/bootstrap/js/bootstrap.min.js'/>"></script>
</body>
</html>