<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css"
	href="../jQuery-Radiobtn/css/zInput_default_stylesheet.css">
<link rel="stylesheet" type="text/css" href="../css/main.css">
<link rel="stylesheet" type="text/css" href="../css/seat.css">
<link rel="stylesheet" type="text/css" href="../css/register.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<title>예매하기</title>
<script>
		function selectedSeat(target) {
		    var age = $("input:radio[name=age]:checked").val();			
		    var attachClass = age + "-seat-selected";
		    
		    var title = $(target).attr("title");			   	   
		    var sub_tno = title.substring(6,7);
		    var sub_seatno = title.substring(15,18);						    		   
		    alert(sub_tno);
		    alert(sub_seatno);
		    if ($(target).hasClass("adult-seat-selected") || $(target).hasClass("teen-seat-selected")) {
		        $(target).removeClass("adult-seat-selected");
		        $(target).removeClass("teen-seat-selected");
		        $(target).addClass(attachClass);		        
		    } else {
		        $(target).addClass(attachClass);
		    }
		}


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
					                  '</li>' + '</ul>' + '<input type="button" id="ajax-button'+ key +'" value="좌석보기">';
								                  			                  					                   	               						          
					         $('.screen_tit').append(eachrow);	
					         
					         $("input[id='ajax-button']").unbind('click');
							 $("input[id='ajax-button"+ key + "']").click(function(e) {
								
								var tno = $("#tno").text();
								var before_date = $("#rdate").text();								 															
								var rdate = before_date.substring(0,16);								
																
		 			 			$.ajax({
		 			 				type: 'get',
		 			 				url: 'http://localhost:8082/special/rest' + '/seat?rdate='+rdate+'&mno='+inputVal +'&tno='+tno,						
		 			 				data: false,
		 			 				processData: false,
		 			 				contentType: false,
		 			 				cache: false,				
		 			 				success: function(data) {				 
																	
									$.each(data , function(key, value) {
																
										var htmlrow = 
											'<a value="'+ value.issue +' data-seat="' + (key+1) +'" seat-group="grNum3"' + 
											'title="상영관 : ' + value.tno + ' 좌석 번호: '+ value.seatno + ' - 일반석"'+
											'seat-code="1A01" onclick="selectedSeat(this);">'+ (key+1) +'</a>'
											
										  $('.seat_Barea').append(htmlrow).trigger("create");													
									});								
									//var key = Object.keys(data["list"][2]); // id , pw , addr , tel 의 키값을 가져옴
									 			 						 			 						 			 		
		 			 						 			 					 			 			
		 			 			}, // 2 success
		 			 			error: function(jqXHR, textStatus, errorThrown) {
		 			 				alert("실패");		 			 											
	 			 				} //error
							}); 	// 2 ajax			
					   }); // function
															 											  								
					}); // each				
			}, // success
			error: function(error) {
				alert('실패');
				alert(JSON.stringify(error));
			} // eeror
		});	// ajax
	} //시작
	
</script>
<style>
#test table {
	display: inline-block;
}
</style>
</head>
<body>

				<dl>
					<dt>날짜 선택</dt>
					<dd>
						<select id="select-key" onchange="searchGet()">
							<option selected="selected">선택</option>
							<option id="d" value="2018-01-16">16일</option>
							<option id="d" value="2018-01-17">17일</option>
							<option id="d" value="2018-01-18">18일</option>
						</select>
					</dd>
				</dl>
				
	  <div class="frame">
        <div class="container">
            <div class="header">
                <div class="logo text-center"> <a href="Movies_Main.html">Movie Theater</a> </div>
            </div>
            <div class="content ">
                <form action="special/movie/ticket" method="post" id="reserv-form">
                    <div class="calendar text-center">
                        <input type="radio" class="cal-radio" name="day" value="2018-01-13" id="jan-13" title="토<br> 13">
                        <input type="radio" class="cal-radio" name="day" value="2018-01-14" id="jan-14" title="일<br> 14">
                        <input type="radio" class="cal-radio" name="day" value="2018-01-15" id="jan-15" title="월<br> 15">
                        <input type="radio" class="cal-radio" name="day" value="2018-01-16" id="jan-16" title="화<br> 16">
                        <input type="radio" class="cal-radio" name="day" value="2018-01-17" id="jan-17" title="수<br> 17">
                        <input type="radio" class="cal-radio" name="day" value="2018-01-18" id="jan-18" title="목<br> 18">
                        <input type="radio" class="cal-radio" name="day" value="2018-01-19" id="jan-19" title="금<br> 19">
                        <input type="radio" class="cal-radio" name="day" value="2018-01-20" id="jan-20" title="토<br> 20">
                        <input type="radio" class="cal-radio" name="day" value="2018-01-21" id="jan-21" title="일<br> 21">
                        <input type="radio" class="cal-radio" name="day" value="2018-01-22" id="jan-22" title="월<br> 22">
                    </div>
               
            <div class="theater-container">
                 <h2>- 상영관</h2>										
			</div>		
					<strong class="screen_tit">Screen</strong>
					<div class="seat_Barea"></div>
					<input id="mno" type="hidden" value="${mno}">
					<input type="submit" value="예매하기">		
				</form>
	
	
			</div>
		</div>
	</div>
	
	
		 <div class="footer">
            <p class="copyright">&copy;copyright reserved larl</p>
        </div>
</body>
</html>