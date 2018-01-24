<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
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

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="<c:url value='/resources/jQuery-Radiobtn/zInput.js'/>"></script>

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
		var bookedLen = $(".adult-seat-selected").length
				+ $(".teen-seat-selected").length;
		if ($(target).hasClass("adult-seat-selected")
				|| $(target).hasClass("teen-seat-selected")) {
			$(target).removeClass("adult-seat-selected");
			$(target).removeClass("teen-seat-selected");
			$("input[title=" + $(target).attr("title") + "]").remove();
			$(target).addClass(attachClass);

		}
		if (bookedLen < 4) {
			if ($(target).hasClass("already-selected")) {
				$(target).removeClass("adult-seat-selected");
				$(target).removeClass("teen-seat-selected");
				$("input[title=" + $(target).attr("title") + "]").remove();
			} else {
				$(target).addClass(attachClass);
				$(".seat_area").append(
						'<input type = "hidden" class = "select-seat" name = "select-seat" value = '
								+ $(target).attr("title") + ' >');
			}
		} else {
			alert("최대 4개의 표 까지만 예매가 가능합니다!");
		}

	}

	function removeAll() {
		$(".p0").removeClass("adult-seat-selected");
		$(".p0").removeClass("teen-seat-selected");
	}

	function isBooked() {

		var index;

		for (var i = 0; i < 45; i++) {

			var index = $(".seat_area").children().eq(i);

			if ($(index[value = "1"])) {
				$(index).addClass("already-selected");
			}

		}

	}
</script>
</head>

<body onload="isBooked();">
	<div class="frame">
		<div class="container">
			<div class="header">
				<div class="logo text-center">
					<a href="/">Movie Theater</a>
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
									<a class="p0 grNum3 a1" data-seat="A1" seat-group="grNum3"
										title="좌석 번호: A-1 - 일반석" seat-code="1A01"
										onclick="selectedSeat(this);">1</a> <a class="p0 grNum3 a2"
										data-seat="A2" seat-group="grNum3" title="좌석 번호: A-2 - 일반석"
										seat-code="1A02 " onclick="selectedSeat(this);">2</a> <a
										class="p0 grNum4 a3" data-seat="A3" seat-group="grNum4"
										title="좌석 번호: A-3 - 일반석" seat-code="1A03"
										onclick="selectedSeat(this);">3</a> <a class="p0 grNum4 a4"
										data-seat="A4" seat-group="grNum4" title="좌석 번호: A-4 - 일반석"
										seat-code="1A04" onclick="selectedSeat(this);">4</a> <a
										class="p0 grNum4 a5" data-seat="A5" seat-group="grNum4"
										title="좌석 번호: A-5 - 일반석" seat-code="1A05 "
										onclick="selectedSeat(this);">5</a> <a class="p0 grNum4 a6"
										data-seat="A6" seat-group="grNum4" title="좌석 번호: A-6 - 일반석"
										seat-code="1A06 " onclick="selectedSeat(this);">6</a> <a
										class="p0 grNum4 a7" data-seat="A7" seat-group="grNum4"
										title="좌석 번호: A-7 - 일반석" seat-code="1A07"
										onclick="selectedSeat(this);">7</a> <a class="p0 grNum4 a8"
										data-seat="A8" seat-group="grNum4" title="좌석 번호: A-8 - 일반석"
										seat-code="1A08" onclick="selectedSeat(this);">8</a> <a
										class="p0 grNum4 a9" data-seat="A9" seat-group="grNum4"
										title="좌석 번호: A-9 - 일반석" seat-code="1A09"
										onclick="selectedSeat(this);">9</a> <a class="p0 grNum5 a10"
										data-seat="A10" seat-group="grNum5" title="좌석 번호: A-10 - 일반석"
										seat-code="1A10" onclick="selectedSeat(this);">10</a> <span
										class="seat_tit" style="left: -30px; top: 27px;">B</span> <a
										class="p0 grNum6 b1" data-seat="B1" seat-statuscode="0"
										block-code="p0" seat-group="grNum6" title="좌석 번호:B-1 - 일반석"
										seat-code="1B01" onclick="selectedSeat(this);">1</a> <a
										class="p0 grNum6 b2" data-seat="B2" seat-statuscode="0"
										block-code="p0" seat-group="grNum6" title="좌석 번호:B-2 - 일반석"
										seat-code="1B02" onclick="selectedSeat(this);">2</a> <a
										class="p0 grNum7 b3" data-seat="B3" seat-statuscode="0"
										block-code="p0" seat-group="grNum7" title="좌석 번호:B-3 - 일반석"
										seat-code="1B03" onclick="selectedSeat(this);">3</a> <a
										class="p0 grNum7 b4" data-seat="B4" seat-statuscode="0"
										block-code="p0" seat-group="grNum7" title="좌석 번호:B-4 - 일반석"
										seat-code="1B04" onclick="selectedSeat(this);">4</a> <a
										class="p0 grNum7 b5" data-seat="B5" seat-statuscode="0"
										block-code="p0" seat-group="grNum7" title="좌석 번호:B-5 - 일반석"
										seat-code="1B05" onclick="selectedSeat(this);">5</a> <a
										class="p0 grNum7 b6" data-seat="B6" seat-statuscode="0"
										block-code="p0" seat-group="grNum7" title="좌석 번호:B-6 - 일반석"
										seat-code="1B06" onclick="selectedSeat(this);">6</a> <a
										class="p0 grNum7 b7" data-seat="B7" seat-statuscode="0"
										block-code="p0" seat-group="grNum7" title="좌석 번호:B-7 - 일반석"
										seat-code="1B07" onclick="selectedSeat(this);">7</a> <a
										class="p0 grNum7 b8" data-seat="B8" seat-statuscode="0"
										block-code="p0" seat-group="grNum7" title="좌석 번호:B-8 - 일반석"
										seat-code="1B08" onclick="selectedSeat(this);">8</a> <a
										class="p0 grNum7 b9" data-seat="B9" seat-statuscode="0"
										block-code="p0" seat-group="grNum7" title="좌석 번호:B-9 - 일반석"
										seat-code="1B09" onclick="selectedSeat(this);">9</a> <a
										class="p0 grNum8 b10" data-seat="B10" seat-statuscode="0"
										block-code="p0" seat-group="grNum8" title="좌석 번호:B-10 - 일반석"
										seat-code="1B10" onclick="selectedSeat(this);">10</a> <span
										class="seat_tit" style="left: -30px; top: 54px;">C</span> <a
										class="p0 grNum9 c1" data-seat="C1" seat-statuscode="0"
										block-code="p0" seat-group="grNum9" title="좌석 번호:C-1 - 일반석"
										seat-code="1C01" onclick="selectedSeat(this);">1</a> <a
										class="p0 grNum9 c2" data-seat="C2" seat-statuscode="0"
										block-code="p0" seat-group="grNum9" title="좌석 번호:C-2 - 일반석"
										seat-code="1C02" onclick="selectedSeat(this);">2</a> <a
										class="p0 grNum10 c3" data-seat="C3" seat-statuscode="0"
										block-code="p0" seat-group="grNum10" title="좌석 번호:C-3 - 일반석"
										seat-code="1C03" onclick="selectedSeat(this);">3</a> <a
										class="p0 grNum10 c4" data-seat="C4" seat-statuscode="0"
										block-code="p0" seat-group="grNum10" title="좌석 번호:C-4 - 일반석"
										seat-code="1C04" onclick="selectedSeat(this);">4</a> <a
										class="p0 grNum10 c5" data-seat="C5" seat-statuscode="0"
										block-code="p0" seat-group="grNum10" title="좌석 번호:C-5 - 일반석"
										seat-code="1C05" onclick="selectedSeat(this);">5</a> <a
										class="p0 grNum10 c6" data-seat="C6" seat-statuscode="0"
										block-code="p0" seat-group="grNum10" title="좌석 번호:C-6 - 일반석"
										seat-code="1C06" onclick="selectedSeat(this);">6</a> <a
										class="p0 grNum10 c7" data-seat="C7" seat-statuscode="0"
										block-code="p0" seat-group="grNum10" title="좌석 번호:C-7 - 일반석"
										seat-code="1C07" onclick="selectedSeat(this);">7</a> <a
										class="p0 grNum10 c8" data-seat="C8" seat-statuscode="0"
										block-code="p0" seat-group="grNum10" title="좌석 번호:C-8 - 일반석"
										seat-code="1C08" onclick="selectedSeat(this);">8</a> <a
										class="p0 grNum11 c9" data-seat="C9" seat-statuscode="0"
										block-code="p0" seat-group="grNum11" title="좌석 번호:C-9 - 일반석"
										seat-code="1C09" onclick="selectedSeat(this);">9</a> <a
										class="p0 grNum11 c10" data-seat="C10" seat-statuscode="0"
										block-code="p0" seat-group="grNum11" title="좌석 번호:C-10 - 일반석"
										seat-code="1C10" onclick="selectedSeat(this);">10</a> <span
										class="seat_tit" style="left: -30px; top: 82px;">D</span> <a
										class="p0 grNum12 d1" data-seat="D1" seat-statuscode="0"
										block-code="p0" seat-group="grNum12" title="좌석 번호:D-1 - 일반석"
										seat-code="1D01" onclick="selectedSeat(this);">1</a> <a
										class="p0 grNum12 d2" data-seat="D2" seat-statuscode="0"
										block-code="p0" seat-group="grNum12" title="좌석 번호:D-2 - 일반석"
										seat-code="1D02" onclick="selectedSeat(this);">2</a> <a
										class="p0 grNum13 d3" data-seat="D3" seat-statuscode="0"
										block-code="p0" seat-group="grNum13" title="좌석 번호:D-3 - 일반석"
										seat-code="1D03" onclick="selectedSeat(this);">3</a> <a
										class="p0 grNum13 d4" data-seat="D4" seat-statuscode="0"
										block-code="p0" seat-group="grNum13" title="좌석 번호:D-4 - 일반석"
										seat-code="1D04" onclick="selectedSeat(this);">4</a> <a
										class="p0 grNum13 d5" data-seat="D5" seat-statuscode="0"
										block-code="p0" seat-group="grNum13" title="좌석 번호:D-5 - 일반석"
										seat-code="1D05" onclick="selectedSeat(this);">5</a> <a
										class="p0 grNum13 d6" data-seat="D6" seat-statuscode="0"
										block-code="p0" seat-group="grNum13" title="좌석 번호:D-6 - 일반석"
										seat-code="1D06" onclick="selectedSeat(this);">6</a> <a
										class="p0 grNum13 d7" data-seat="D7" seat-statuscode="0"
										block-code="p0" seat-group="grNum13" title="좌석 번호:D-7 - 일반석"
										seat-code="1D07" onclick="selectedSeat(this);">7</a> <a
										class="p0 grNum13 d8" data-seat="D8" seat-statuscode="0"
										block-code="p0" seat-group="grNum13" title="좌석 번호:D-8 - 일반석"
										seat-code="1D08" onclick="selectedSeat(this);">8</a> <a
										class="p0 grNum14 d9" data-seat="D9" seat-statuscode="0"
										block-code="p0" seat-group="grNum14" title="좌석 번호:D-9 - 일반석"
										seat-code="1D09" onclick="selectedSeat(this);">9</a> <a
										class="p0 grNum14 d10" data-seat="D10" seat-statuscode="0"
										block-code="p0" seat-group="grNum14" title="좌석 번호:D-10 - 일반석"
										seat-code="1D10" onclick="selectedSeat(this);">10</a> <span
										class="seat_tit" style="left: -30px; top: 109px;">E</span> <a
										class="p0 grNum16 e1" data-seat="E1" seat-statuscode="0"
										block-code="p0" seat-group="grNum16" title="좌석 번호:E-1 - 일반석"
										seat-code="1E01" onclick="selectedSeat(this);">1</a> <a
										class="p0 grNum16 e2" data-seat="E2" seat-statuscode="0"
										block-code="p0" seat-group="grNum16" title="좌석 번호:E-2 - 일반석"
										seat-code="1E02" onclick="selectedSeat(this);">2</a> <a
										class="p0 grNum18 e3" data-seat="E3" seat-statuscode="0"
										block-code="p0" seat-group="grNum18" title="좌석 번호:E-3 - 일반석"
										seat-code="1E03" onclick="selectedSeat(this);">3</a> <a
										class="p0 grNum18 e4" data-seat="E4" seat-statuscode="0"
										block-code="p0" seat-group="grNum18" title="좌석 번호:E-4 - 일반석"
										seat-code="1E04" onclick="selectedSeat(this);">4</a> <a
										class="p0 grNum18 e5" data-seat="E5" seat-statuscode="0"
										block-code="p0" seat-group="grNum18" title="좌석 번호:E-5 - 일반석"
										seat-code="1E05" onclick="selectedSeat(this);">5</a>

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
	<script src="<c:url value='/resources/bootstrap/js/jquery-1.12.4.min.js'/>"></script>
	<script src="<c:url value='/resources/bootstrap/js/bootstrap.min.js'/>"></script>
</body>


</html>
