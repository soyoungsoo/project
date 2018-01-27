<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/bootstrap-theme.min.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/jQuery-Radiobtn/css/zInput_default_stylesheet.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/main.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/seat.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/register.css'/>">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<title>Insert title here</title>
<script>
function submitTest() {
		$('#joinForm').submit();
}
function Cancel() {
	if (confirm("진행중인것을 그만두고 나가시겠습니까?")) {
		location.href = "../special/movie/list.do";
	}
}

function alreadyBooked(target) {

	if ($(target).hasClass("seat-broken")) {
		$(target).removeClass("seat-broken");
	}
	else {
		$(target).addClass("seat-broken");
	}
	
	
}

</script>
</head>
<body>

	<div class="frame">
			<div class="container">
				<div class="header">
					<div class="logo">
						<a href="<c:url value='/'/>" onclick="Cancel();"> Movie Theater </a>
					</div>
				</div>
				<div class="content">
					<form action="schedule" method="post" id="joinForm">
					<div class="seat_Barea_another">
								<div class="seat_area"
									style="height: 184px; margin-left: 308.5px;">
									<span class="seat_tit" style="left: -30px; top: 0px;">A</span>
									<a class="p0 grNum3 A-1" data-seat="A1" seat-group="grNum3"
										title="좌석 번호: A-1 - 일반석" seat-code="1A01"
										onclick="alreadyBooked(this);" value="">1</a> 
										<a class="p0 grNum3 A-2"
										data-seat="A2" seat-group="grNum3" title="좌석 번호: A-2 - 일반석"
										seat-code="1A02 " onclick="alreadyBooked(this);" value="">2</a> 
										<a class="p0 grNum4 A-3" data-seat="A3" seat-group="grNum4"
										title="좌석 번호: A-3 - 일반석" seat-code="1A03"
										onclick="alreadyBooked(this);" value="">3</a> <a class="p0 grNum4 A-4"
										data-seat="A4" seat-group="grNum4" title="좌석 번호: A-4 - 일반석"
										seat-code="1A04" onclick="alreadyBooked(this);" value="">4</a> <a
										class="p0 grNum4 A-5" data-seat="A5" seat-group="grNum4"
										title="좌석 번호: A-5 - 일반석" seat-code="1A05 "
										onclick="alreadyBooked(this);" value="">5</a> <a class="p0 grNum4 A-6"
										data-seat="A6" seat-group="grNum4" title="좌석 번호: A-6 - 일반석"
										seat-code="1A06 " onclick="alreadyBooked(this);" value="">6</a> <a
										class="p0 grNum4 A-7" data-seat="A7" seat-group="grNum4"
										title="좌석 번호: A-7 - 일반석" seat-code="1A07"
										onclick="alreadyBooked(this);" value="">7</a> <a class="p0 grNum4 A-8"
										data-seat="A8" seat-group="grNum4" title="좌석 번호: A-8 - 일반석"
										seat-code="1A08" onclick="alreadyBooked(this);" value="">8</a> <a
										class="p0 grNum4 A-9" data-seat="A9" seat-group="grNum4"
										title="좌석 번호: A-9 - 일반석" seat-code="1A09"
										onclick="alreadyBooked(this);" value="">9</a> <a class="p0 grNum5 A-10"
										data-seat="A10" seat-group="grNum5" title="좌석 번호: A-10 - 일반석"
										seat-code="1A10" onclick="alreadyBooked(this);" value="">10</a> <span
										class="seat_tit" style="left: -30px; top: 27px;">B</span> <a
										class="p0 grNum6 B-1" data-seat="B1" seat-statuscode="0"
										block-code="p0" seat-group="grNum6" title="좌석 번호:B-1 - 일반석"
										seat-code="1B01" onclick="alreadyBooked(this);" value="">1</a> <a
										class="p0 grNum6 B-2" data-seat="B2" seat-statuscode="0"
										block-code="p0" seat-group="grNum6" title="좌석 번호:B-2 - 일반석"
										seat-code="1B02" onclick="alreadyBooked(this);" value="">2</a> <a
										class="p0 grNum7 B-3" data-seat="B3" seat-statuscode="0"
										block-code="p0" seat-group="grNum7" title="좌석 번호:B-3 - 일반석"
										seat-code="1B03" onclick="alreadyBooked(this);" value="">3</a> <a
										class="p0 grNum7 B-4" data-seat="B4" seat-statuscode="0"
										block-code="p0" seat-group="grNum7" title="좌석 번호:B-4 - 일반석"
										seat-code="1B04" onclick="alreadyBooked(this);" value="">4</a> <a
										class="p0 grNum7 B-5" data-seat="B5" seat-statuscode="0"
										block-code="p0" seat-group="grNum7" title="좌석 번호:B-5 - 일반석"
										seat-code="1B05" onclick="alreadyBooked(this);" value="">5</a> <a
										class="p0 grNum7 B-6" data-seat="B6" seat-statuscode="0"
										block-code="p0" seat-group="grNum7" title="좌석 번호:B-6 - 일반석"
										seat-code="1B06" onclick="alreadyBooked(this);" value="">6</a> <a
										class="p0 grNum7 B-7" data-seat="B7" seat-statuscode="0"
										block-code="p0" seat-group="grNum7" title="좌석 번호:B-7 - 일반석"
										seat-code="1B07" onclick="alreadyBooked(this);" value="">7</a> <a
										class="p0 grNum7 B-8" data-seat="B8" seat-statuscode="0"
										block-code="p0" seat-group="grNum7" title="좌석 번호:B-8 - 일반석"
										seat-code="1B08" onclick="alreadyBooked(this);" value="">8</a> <a
										class="p0 grNum7 B-9" data-seat="B9" seat-statuscode="0"
										block-code="p0" seat-group="grNum7" title="좌석 번호:B-9 - 일반석"
										seat-code="1B09" onclick="alreadyBooked(this);" value="">9</a> <a
										class="p0 grNum8 B-10" data-seat="B10" seat-statuscode="0"
										block-code="p0" seat-group="grNum8" title="좌석 번호:B-10 - 일반석"
										seat-code="1B10" onclick="alreadyBooked(this);" value="">10</a> <span
										class="seat_tit" style="left: -30px; top: 54px;">C</span> <a
										class="p0 grNum9 C-1" data-seat="C1" seat-statuscode="0"
										block-code="p0" seat-group="grNum9" title="좌석 번호:C-1 - 일반석"
										seat-code="1C01" onclick="alreadyBooked(this);" value="">1</a> <a
										class="p0 grNum9 C-2" data-seat="C2" seat-statuscode="0"
										block-code="p0" seat-group="grNum9" title="좌석 번호:C-2 - 일반석"
										seat-code="1C02" onclick="alreadyBooked(this);" value="">2</a> <a
										class="p0 grNum10 C-3" data-seat="C3" seat-statuscode="0"
										block-code="p0" seat-group="grNum10" title="좌석 번호:C-3 - 일반석"
										seat-code="1C03" onclick="alreadyBooked(this);" value="">3</a> <a
										class="p0 grNum10 C-4" data-seat="C4" seat-statuscode="0"
										block-code="p0" seat-group="grNum10" title="좌석 번호:C-4 - 일반석"
										seat-code="1C04" onclick="alreadyBooked(this);" value="">4</a> <a
										class="p0 grNum10 C-5" data-seat="C5" seat-statuscode="0"
										block-code="p0" seat-group="grNum10" title="좌석 번호:C-5 - 일반석"
										seat-code="1C05" onclick="alreadyBooked(this);" value="">5</a> <a
										class="p0 grNum10 C-6" data-seat="C6" seat-statuscode="0"
										block-code="p0" seat-group="grNum10" title="좌석 번호:C-6 - 일반석"
										seat-code="1C06" onclick="alreadyBooked(this);" value="">6</a> <a
										class="p0 grNum10 C-7" data-seat="C7" seat-statuscode="0"
										block-code="p0" seat-group="grNum10" title="좌석 번호:C-7 - 일반석"
										seat-code="1C07" onclick="alreadyBooked(this);" value="">7</a> <a
										class="p0 grNum10 C-8" data-seat="C8" seat-statuscode="0"
										block-code="p0" seat-group="grNum10" title="좌석 번호:C-8 - 일반석"
										seat-code="1C08" onclick="alreadyBooked(this);" value="">8</a> <a
										class="p0 grNum11 C-9" data-seat="C9" seat-statuscode="0"
										block-code="p0" seat-group="grNum11" title="좌석 번호:C-9 - 일반석"
										seat-code="1C09" onclick="alreadyBooked(this);" value="">9</a> <a
										class="p0 grNum11 C-10" data-seat="C10" seat-statuscode="0"
										block-code="p0" seat-group="grNum11" title="좌석 번호:C-10 - 일반석"
										seat-code="1C10" onclick="alreadyBooked(this);" value="">10</a> <span
										class="seat_tit" style="left: -30px; top: 82px;">D</span> <a
										class="p0 grNum12 D-1" data-seat="D1" seat-statuscode="0"
										block-code="p0" seat-group="grNum12" title="좌석 번호:D-1 - 일반석"
										seat-code="1D01" onclick="alreadyBooked(this);" value="">1</a> <a
										class="p0 grNum12 D-2" data-seat="D2" seat-statuscode="0"
										block-code="p0" seat-group="grNum12" title="좌석 번호:D-2 - 일반석"
										seat-code="1D02" onclick="alreadyBooked(this);" value="">2</a> <a
										class="p0 grNum13 D-3" data-seat="D3" seat-statuscode="0"
										block-code="p0" seat-group="grNum13" title="좌석 번호:D-3 - 일반석"
										seat-code="1D03" onclick="alreadyBooked(this);" value="">3</a> <a
										class="p0 grNum13 D-4" data-seat="D4" seat-statuscode="0"
										block-code="p0" seat-group="grNum13" title="좌석 번호:D-4 - 일반석"
										seat-code="1D04" onclick="alreadyBooked(this);" value="">4</a> <a
										class="p0 grNum13 D-5" data-seat="D5" seat-statuscode="0"
										block-code="p0" seat-group="grNum13" title="좌석 번호:D-5 - 일반석"
										seat-code="1D05" onclick="alreadyBooked(this);" value="">5</a> <a
										class="p0 grNum13 D-6" data-seat="D6" seat-statuscode="0"
										block-code="p0" seat-group="grNum13" title="좌석 번호:D-6 - 일반석"
										seat-code="1D06" onclick="alreadyBooked(this);" value="">6</a> <a
										class="p0 grNum13 D-7" data-seat="D7" seat-statuscode="0"
										block-code="p0" seat-group="grNum13" title="좌석 번호:D-7 - 일반석"
										seat-code="1D07" onclick="alreadyBooked(this);" value="">7</a> <a
										class="p0 grNum13 D-8" data-seat="D8" seat-statuscode="0"
										block-code="p0" seat-group="grNum13" title="좌석 번호:D-8 - 일반석"
										seat-code="1D08" onclick="alreadyBooked(this);" value="">8</a> <a
										class="p0 grNum14 D-9" data-seat="D9" seat-statuscode="0"
										block-code="p0" seat-group="grNum14" title="좌석 번호:D-9 - 일반석"
										seat-code="1D09" onclick="alreadyBooked(this);" value="">9</a> <a
										class="p0 grNum14 D-10" data-seat="D10" seat-statuscode="0"
										block-code="p0" seat-group="grNum14" title="좌석 번호:D-10 - 일반석"
										seat-code="1D10" onclick="alreadyBooked(this);" value="">10</a> <span
										class="seat_tit" style="left: -30px; top: 109px;">E</span> <a
										class="p0 grNum16 E-1" data-seat="E1" seat-statuscode="0"
										block-code="p0" seat-group="grNum16" title="좌석 번호:E-1 - 일반석"
										seat-code="1E01" onclick="alreadyBooked(this);" value="">1</a> <a
										class="p0 grNum16 E-2" data-seat="E2" seat-statuscode="0"
										block-code="p0" seat-group="grNum16" title="좌석 번호:E-2 - 일반석"
										seat-code="1E02" onclick="alreadyBooked(this);" value="">2</a> <a
										class="p0 grNum18 E-3" data-seat="E3" seat-statuscode="0"
										block-code="p0" seat-group="grNum18" title="좌석 번호:E-3 - 일반석"
										seat-code="1E03" onclick="alreadyBooked(this);" value="">3</a> <a
										class="p0 grNum18 E-4" data-seat="E4" seat-statuscode="0"
										block-code="p0" seat-group="grNum18" title="좌석 번호:E-4 - 일반석"
										seat-code="1E04" onclick="alreadyBooked(this);" value="">4</a> <a
										class="p0 grNum18 E-5" data-seat="E5" seat-statuscode="0"
										block-code="p0" seat-group="grNum18" title="좌석 번호:E-5 - 일반석"
										seat-code="1E05" onclick="alreadyBooked(this);" value="">5</a>
								</div>
							</div>
						<table class="table-join">
							<tr>
								<th class="text-right">- 상영관</th>
								<td class="text-center"><input id="sname" type = "number" name="tno"></td>
							</tr>
							<tr>
								<th class="text-right">- 상영일</th>
								<td class="text-center"><input id="sname" type="date" name="runDay"></td>
							</tr>
							<tr>
								<th class="text-right">- 상영시간</th>
								<td class="text-center"><input id="sname" type="time" name="runTime"></td>
							</tr>
							<tr>
								<td><input type="hidden" name="mno" value="${mno}"></td>
							</tr>
							<tr>
								<td><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"></td>
							</tr>			
						</table>
						<a href="#" onclick="submitTest();" class="reg-btn main-btn">등록완료</a>
						<a href="#" onclick="Cancel()" class="reg-btn main-btn">메인화면으로 이동</a>
					</form>
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