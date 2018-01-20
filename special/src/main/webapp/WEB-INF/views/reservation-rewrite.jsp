<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="jQuery-Radiobtn/css/zInput_default_stylesheet.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/seat.css">
<link rel="stylesheet" type="text/css" href="css/register.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="jQuery-Radiobtn/zInput.js"></script>

<meta charset="UTF-8">
<title>Untitled Document</title>
<script>
	$(function() {
		$(".preserv-folded").hide();
		$(".screen_box").hide();
		setInterval("howMuch()", 100);
	});

	function submitTest() {
		if ($('.total-price').text() == "0") {
			alert("표를 예매해주세요!");
		} else {
			$('#reserv-form').submit();
		}

	}

	function showSeat() {
		$(".screen_box").show();
	}

	function searchGet() {

		var selectElement = $("#select-key")[0].value;
		var inputVal = $("#mno").val();
		alert(inputVal);
		alert(selectElement);
		$.ajax({
			type : 'get',
			url : 'http://localhost:8082/special/rest'
					+ '/select?selectElement=' + selectElement + '&inputVal='
					+ inputVal,
			data : selectElement,
			processData : false,
			contentType : false,
			cache : false,
			success : function(data, textStatus, xhr) {
				alert('성공');

			},
			error : function(error) {
				alert('실패');
				alert(JSON.stringify(error));
			}
		});
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

	function selectedSeat(target) {
		var age = $("input:radio[name=age]:checked").val();

		var attachClass = age + "-seat-selected";

		if ($(target).hasClass("adult-seat-selected")
				|| $(target).hasClass("teen-seat-selected")) {
			$(target).removeClass("adult-seat-selected");
			$(target).removeClass("teen-seat-selected");
			$(target).addClass(attachClass);
		} else if ($(target).hasClass("already-selected")) {
			$(target).removeClass("adult-seat-selected");
			$(target).removeClass("teen-seat-selected");
		} else {
			$(target).addClass(attachClass);
		}
	}

	function removeAll() {
        $(".p0").removeClass("adult-seat-selected");
        $(".p0").removeClass("teen-seat-selected");
    }
</script>
</head>

<body>
	<div class="frame">
		<div class="container">
			<div class="header">
				<div class="logo text-center">
					<a href="Movies_Main.html">Movie Theater</a>
				</div>
			</div>
			<div class="content ">
				<form action="/movie/ticket" method="post" id="reserv-form">
					<div class="calendar text-center">
						<input type="radio" class="cal-radio" name="day"
							value="2018-01-13" id="jan-13" title="토<br> 13"> <input
							type="radio" class="cal-radio" name="day" value="2018-01-14"
							id="jan-14" title="일<br> 14"> <input type="radio"
							class="cal-radio" name="day" value="2018-01-15" id="jan-15"
							title="월<br> 15"> <input type="radio" class="cal-radio"
							name="day" value="2018-01-16" id="jan-16" title="화<br> 16">
						<input type="radio" class="cal-radio" name="day"
							value="2018-01-17" id="jan-17" title="수<br> 17"> <input
							type="radio" class="cal-radio" name="day" value="2018-01-18"
							id="jan-18" title="목<br> 18"> <input type="radio"
							class="cal-radio" name="day" value="2018-01-19" id="jan-19"
							title="금<br> 19"> <input type="radio" class="cal-radio"
							name="day" value="2018-01-20" id="jan-20" title="토<br> 20">
						<input type="radio" class="cal-radio" name="day"
							value="2018-01-21" id="jan-21" title="일<br> 21"> <input
							type="radio" class="cal-radio" name="day" value="2018-01-22"
							id="jan-22" title="월<br> 22">
					</div>
					<div class="theater-container">
						<h2>- 상영관</h2>
						<h4>
							현재 영화 :
							<p class="movie-title">문 라이트</p>
						</h4>
						<div class="preserv-folded">
							<hr class="hr">
							<div class="preserv-time">
								<ul>
									<li><a href="#" onclick="showSeat();"> <span
											class="cine-place"> 1관 </span> <span class="cine-time">
												14:20 <span> ~ 15:50 </span>
										</span> <span class="cine-seat"> <em class="seat-text"
												title="좌석 확인">44</em> 석 / 45석
										</span>
									</a></li>
									<li><a href="#" onclick="showSeat();"> <span
											class="cine-place"> 1관 </span> <span class="cine-time">
												16:20 <span> ~ 17:50 </span>
										</span> <span class="cine-seat"> <em class="seat-text"
												title="좌석 확인">21</em> 석 / 45석
										</span>
									</a></li>
									<li><a href="#" onclick="showSeat();"> <span
											class="cine-place"> 2관 </span> <span class="cine-time">
												12:30 <span> ~ 14:00 </span>
										</span> <span class="cine-seat"> <em class="seat-text"
												title="좌석 확인">43</em> 석 / 45석
										</span>
									</a></li>
									<li><a href="#" onclick="showSeat();"> <span
											class="cine-place"> 4관 </span> <span class="cine-time">
												02:20 <span> ~ 03:50 </span>
										</span> <span class="cine-seat"> <em class="seat-text"
												title="좌석 확인">35</em> 석 / 45석
										</span>
									</a></li>
								</ul>
							</div>
						</div>

					</div>
					<div class="seat-container">
						<div class="screen_box">
							<div class="select-age text-center">
								<input type="radio" class="age-radio" name="age" value="adult"
									id="adult" title="성인"> <input type="radio"
									class="age-radio" name="age" value="teen" id="teen" title="청소년">
							</div>
							<strong class="screen_tit">Screen</strong>
							<div class="seat_Barea">
								<div class="seat_area"
									style="height: 184px; margin-left: 308.5px;">
									<span class="seat_tit" style="left: -30px; top: 0px;">A</span>
									<a class="p0 grNum3" data-seat="A1" seat-group="grNum3"
										style="left: 22px; top: 0px;" title="좌석 번호: A1 - 일반석"
										seat-code="1A01" onclick="selectedSeat(this);">1</a> <a
										class="p0 grNum3" data-seat="A2" seat-group="grNum3"
										style="left: 48px; top: 0px;" title="좌석 번호: A2 - 일반석"
										seat-code="1A02" onclick="selectedSeat(this);">2</a> <a
										class="p0 grNum4" data-seat="A3" seat-group="grNum4"
										style="left: 89px; top: 0px;" title="좌석 번호: A3 - 일반석"
										seat-code="1A03" onclick="selectedSeat(this);">3</a> <a
										class="p0 grNum4" data-seat="A4" seat-group="grNum4"
										style="left: 115px; top: 0px;" title="좌석 번호: A4 - 일반석"
										seat-code="1A04" onclick="selectedSeat(this);">4</a> <a
										class="p0 grNum4" data-seat="A5" seat-group="grNum4"
										style="left: 169px; top: 0px;" title="좌석 번호: A5 - 일반석"
										seat-code="1A05 " onclick="selectedSeat(this);">5</a> <a
										class="p0 grNum4" data-seat="A6" seat-group="grNum4"
										style="left: 169px; top: 0px;" title="좌석 번호: A6 - 일반석"
										seat-code="1A06 " onclick="selectedSeat(this);">6</a> <a
										class="p0 grNum4" data-seat="A7" seat-group="grNum4"
										style="left: 196px; top: 0px;" title="좌석 번호: A7 - 일반석"
										seat-code="1A07" onclick="selectedSeat(this);">7</a> <a
										class="p0 grNum4" data-seat="A9" seat-group="grNum4"
										style="left: 249px; top: 0px;" title="좌석 번호: A9 - 일반석"
										seat-code="1A09" onclick="selectedSeat(this);">9</a> <a
										class="p0 grNum4" data-seat="A10" seat-group="grNum4"
										style="left: 276px; top: 0px;" title="좌석 번호: A10 - 일반석"
										seat-code="1A10" onclick="selectedSeat(this);">10</a> <a
										class="p0 grNum5" data-seat="A11" seat-group="grNum5"
										style="left: 316px; top: 0px;" title="좌석 번호: A11 - 일반석"
										seat-code="1A11" onclick="selectedSeat(this);">11</a> <a
										class="p0 grNum5" data-seat="A12" seat-group="grNum5"
										style="left: 343px; top: 0px;" title="좌석 번호: A12 - 일반석"
										seat-code="1A12" onclick="selectedSeat(this);">12</a> <span
										class="seat_tit" style="left: -30px; top: 27px;">B</span> <a
										class="p0 grNum6" data-seat="B1" seat-statuscode="0"
										block-code="p0" seat-group="grNum6"
										style="left: 22px; top: 27px;" title="좌석 번호:B1 - 일반석"
										seat-code="1B01" onclick="selectedSeat(this);">1</a> <a
										class="p0 grNum6" data-seat="B2" seat-statuscode="0"
										block-code="p0" seat-group="grNum6"
										style="left: 48px; top: 27px;" title="좌석 번호:B2 - 일반석"
										seat-code="1B02" onclick="selectedSeat(this);">2</a> <a
										class="p0 grNum7" data-seat="B3" seat-statuscode="0"
										block-code="p0" seat-group="grNum7"
										style="left: 89px; top: 27px;" title="좌석 번호:B3 - 일반석"
										seat-code="1B03" onclick="selectedSeat(this);">3</a> <a
										class="p0 grNum7" data-seat="B4" seat-statuscode="0"
										block-code="p0" seat-group="grNum7"
										style="left: 115px; top: 27px;" title="좌석 번호:B4 - 일반석"
										seat-code="1B04" onclick="selectedSeat(this);">4</a> <a
										class="p0 grNum7" data-seat="B6" seat-statuscode="0"
										block-code="p0" seat-group="grNum7"
										style="left: 169px; top: 27px;" title="좌석 번호:B6 - 일반석"
										seat-code="1B06" onclick="selectedSeat(this);">6</a> <a
										class="p0 grNum7" data-seat="B7" seat-statuscode="0"
										block-code="p0" seat-group="grNum7"
										style="left: 196px; top: 27px;" title="좌석 번호:B7 - 일반석"
										seat-code="1B07" onclick="selectedSeat(this);">7</a> <a
										class="p0 grNum7" data-seat="B9" seat-statuscode="0"
										block-code="p0" seat-group="grNum7"
										style="left: 249px; top: 27px;" title="좌석 번호:B9 - 일반석"
										seat-code="1B09" onclick="selectedSeat(this);">9</a> <a
										class="p0 grNum7" data-seat="B10" seat-statuscode="0"
										block-code="p0" seat-group="grNum7"
										style="left: 276px; top: 27px;" title="좌석 번호:B10 - 일반석"
										seat-code="1B10" onclick="selectedSeat(this);">10</a> <a
										class="p0 grNum8" data-seat="B11" seat-statuscode="0"
										block-code="p0" seat-group="grNum8"
										style="left: 316px; top: 27px;" title="좌석 번호:B11 - 일반석"
										seat-code="1B11" onclick="selectedSeat(this);">11</a> <a
										class="p0 grNum8" data-seat="B12" seat-statuscode="0"
										block-code="p0" seat-group="grNum8"
										style="left: 343px; top: 27px;" title="좌석 번호:B12 - 일반석"
										seat-code="1B12" onclick="selectedSeat(this);">12</a> <span
										class="seat_tit" style="left: -30px; top: 54px;">C</span> <a
										class="p0 grNum9" data-seat="C1" seat-statuscode="0"
										block-code="p0" seat-group="grNum9"
										style="left: 22px; top: 54px;" title="좌석 번호:C1 - 일반석"
										seat-code="1C01" onclick="selectedSeat(this);">1</a> <a
										class="p0 grNum9" data-seat="C2" seat-statuscode="0"
										block-code="p0" seat-group="grNum9"
										style="left: 48px; top: 54px;" title="좌석 번호:C2 - 일반석"
										seat-code="1C02" onclick="selectedSeat(this);">2</a> <a
										class="p0 grNum10" data-seat="C3" seat-statuscode="0"
										block-code="p0" seat-group="grNum10"
										style="left: 89px; top: 54px;" title="좌석 번호:C3 - 일반석"
										seat-code="1C03" onclick="selectedSeat(this);">3</a> <a
										class="p0 grNum10" data-seat="C4" seat-statuscode="0"
										block-code="p0" seat-group="grNum10"
										style="left: 115px; top: 54px;" title="좌석 번호:C4 - 일반석"
										seat-code="1C04" onclick="selectedSeat(this);">4</a> <a
										class="p0 grNum10" data-seat="C6" seat-statuscode="0"
										block-code="p0" seat-group="grNum10"
										style="left: 169px; top: 54px;" title="좌석 번호:C6 - 일반석"
										seat-code="1C06" onclick="selectedSeat(this);">6</a> <a
										class="p0 grNum10" data-seat="C7" seat-statuscode="0"
										block-code="p0" seat-group="grNum10"
										style="left: 196px; top: 54px;" title="좌석 번호:C7 - 일반석"
										seat-code="1C07" onclick="selectedSeat(this);">7</a> <a
										class="p0 grNum10" data-seat="C9" seat-statuscode="0"
										block-code="p0" seat-group="grNum10"
										style="left: 249px; top: 54px;" title="좌석 번호:C9 - 일반석"
										seat-code="1C09" onclick="selectedSeat(this);">9</a> <a
										class="p0 grNum10" data-seat="C10" seat-statuscode="0"
										block-code="p0" seat-group="grNum10"
										style="left: 276px; top: 54px;" title="좌석 번호:C10 - 일반석"
										seat-code="1C10" onclick="selectedSeat(this);">10</a> <a
										class="p0 grNum11" data-seat="C11" seat-statuscode="0"
										block-code="p0" seat-group="grNum11"
										style="left: 316px; top: 54px;" title="좌석 번호:C11 - 일반석"
										seat-code="1C11" onclick="selectedSeat(this);">11</a> <a
										class="p0 grNum11" data-seat="C12" seat-statuscode="0"
										block-code="p0" seat-group="grNum11"
										style="left: 343px; top: 54px;" title="좌석 번호:C12 - 일반석"
										seat-code="1C12" onclick="selectedSeat(this);">12</a> <span
										class="seat_tit" style="left: -30px; top: 82px;">D</span> <a
										class="p0 grNum12" data-seat="D1" seat-statuscode="0"
										block-code="p0" seat-group="grNum12"
										style="left: 22px; top: 82px;" title="좌석 번호:D1 - 일반석"
										seat-code="1D01" onclick="selectedSeat(this);">1</a> <a
										class="p0 grNum12" data-seat="D2" seat-statuscode="0"
										block-code="p0" seat-group="grNum12"
										style="left: 48px; top: 82px;" title="좌석 번호:D2 - 일반석"
										seat-code="1D02" onclick="selectedSeat(this);">2</a> <a
										class="p0 grNum13" data-seat="D3" seat-statuscode="0"
										block-code="p0" seat-group="grNum13"
										style="left: 89px; top: 82px;" title="좌석 번호:D3 - 일반석"
										seat-code="1D03" onclick="selectedSeat(this);">3</a> <a
										class="p0 grNum13" data-seat="D4" seat-statuscode="0"
										block-code="p0" seat-group="grNum13"
										style="left: 115px; top: 82px;" title="좌석 번호:D4 - 일반석"
										seat-code="1D04" onclick="selectedSeat(this);">4</a> <a
										class="p0 grNum13" data-seat="D6" seat-statuscode="0"
										block-code="p0" seat-group="grNum13"
										style="left: 169px; top: 82px;" title="좌석 번호:D6 - 일반석"
										seat-code="1D06" onclick="selectedSeat(this);">6</a> <a
										class="p0 grNum13" data-seat="D7" seat-statuscode="0"
										block-code="p0" seat-group="grNum13"
										style="left: 196px; top: 82px;" title="좌석 번호:D7 - 일반석"
										seat-code="1D07" onclick="selectedSeat(this);">7</a> <a
										class="p0 grNum13" data-seat="D9" seat-statuscode="0"
										block-code="p0" seat-group="grNum13"
										style="left: 249px; top: 82px;" title="좌석 번호:D9 - 일반석"
										seat-code="1D09" onclick="selectedSeat(this);">9</a> <a
										class="p0 grNum13" data-seat="D10" seat-statuscode="0"
										block-code="p0" seat-group="grNum13"
										style="left: 276px; top: 82px;" title="좌석 번호:D10 - 일반석"
										seat-code="1D10" onclick="selectedSeat(this);">10</a> <a
										class="p0 grNum14" data-seat="D11" seat-statuscode="0"
										block-code="p0" seat-group="grNum14"
										style="left: 316px; top: 82px;" title="좌석 번호:D11 - 일반석"
										seat-code="1D11" onclick="selectedSeat(this);">11</a> <a
										class="p0 grNum14" data-seat="D12" seat-statuscode="0"
										block-code="p0" seat-group="grNum14"
										style="left: 343px; top: 82px;" title="좌석 번호:D12 - 일반석"
										seat-code="1D12" onclick="selectedSeat(this);">12</a> <span
										class="seat_tit" style="left: -30px; top: 109px;">E</span> <a
										class="p0 grNum16" data-seat="E3" seat-statuscode="0"
										block-code="p0" seat-group="grNum16"
										style="left: 89px; top: 109px;" title="좌석 번호:E3 - 일반석"
										seat-code="1E03" onclick="selectedSeat(this);">3</a> <a
										class="p0 grNum16" data-seat="E4" seat-statuscode="0"
										block-code="p0" seat-group="grNum16"
										style="left: 115px; top: 109px;" title="좌석 번호:E4 - 일반석"
										seat-code="1E04" onclick="selectedSeat(this);">4</a> <a
										class="p0 grNum18" data-seat="E7" seat-statuscode="0"
										block-code="p0" seat-group="grNum18"
										style="left: 196px; top: 109px;" title="좌석 번호:E7 - 일반석"
										seat-code="1E07" onclick="selectedSeat(this);">7</a> <a
										class="p0 grNum18" data-seat="E9" seat-statuscode="0"
										block-code="p0" seat-group="grNum18"
										style="left: 249px; top: 109px;" title="좌석 번호:E9 - 일반석"
										seat-code="1E09" onclick="selectedSeat(this);">9</a> <a
										class="p0 grNum18" data-seat="E10" seat-statuscode="0"
										block-code="p0" seat-group="grNum18"
										style="left: 276px; top: 109px;" title="좌석 번호:E10 - 일반석"
										seat-code="1E10" onclick="selectedSeat(this);">10</a>

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
											onclick="submitTest();" class="reg-btn">예매 하기</a>
											 <a href="javascript:{}" onclick="removeAll();" class="reg-btn">리셋</a>
										</li>
									</ul>
								</div>
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
	<script src="bootstrap/js/jquery-1.12.4.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>


</html>
