<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/bootstrap-theme.min.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/main.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/register.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/preview.css'/>">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- <script src="../lightslider-master/src/js/lightslider.js"></script>-->
<title>Untitled Document</title>
<script>
	$(function() {
		$("#star-output").hide();
	});
	function deleteCheck() {
		if (confirm("삭제 하시겠습니까?")) {
			location.href = "/special/movie/remove.do?mno=${item.mno}";
		} else {
			alert("삭제 취소 되었습니다.");
			return;
		}
	}
	function submitTest() {
		if ($("#star-count").text() === "0" || $(".reply-box").val() === "") {
			alert("댓글과 별점을 입력해주세요!");
			return false;
		} else {
			$('#starForm').submit();
		}
	}
</script>
</head>

<body>
	<%
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("cn", "\n");
		pageContext.setAttribute("crcn", "\r\n");
		pageContext.setAttribute("br", "<br/>");
	%>
	<div class="frame">
		<div class="container-fluid">
			<div class="header">
				<div class="logo">
					<a href="<c:url value='/'/>"> Movie Theater </a>
				</div>
			</div>
			<div class="prev-content">
				<div class="video">
					<iframe width="1000" height="400"
						src="https://www.youtube.com/embed/zaz-ZsnutnM" frameborder="0"
						gesture="media" allow="encrypted-media" allowfullscreen></iframe>
				</div>
				<div class="prev">
					<div class="prev-top">
						<div class="thumb">
							<img src="<c:url value='/resources/image/black.JPG'/>"> <a class="ticketing-btn"
								href="/special/movie/ticket?mno=${item.mno}">예매하기</a>
						</div>
						<div class="top-ex">
							<h2 class="mov-title">${ item.title }</h2>
							<ul class="ranking">
								<li><strong>예매율</strong> <span> <em>1</em> 위 (42.1%)
								</span></li>
								<li><p class="star_rating">
										<a class="on">★</a> <a class="on">★</a> <a class="on">★</a> <a
											class="on">★</a> <a>★</a>
									</p></li>
								<li>(총 9,888,000 명)</li>
							</ul>
							<ul class="mov-grade">
								<li>[장르] ${ item.genre }</li>
								<li>[국내] ${ item.grade }</li>
								<li>[상영 시간] ${ item.mrun }</li>
								<li>[상영일] <fmt:formatDate value="${ item.sdate }"
										pattern="yyyy-MM-dd" />
								</li>
								<li>[종영일] <fmt:formatDate value="${ item.edate }"
										pattern="yyyy-MM-dd" />
								</li>
								<!-- <li>출연진 : <strong class="actors">홍진호</strong>,<strong
									class="actors">홍진호</strong>,<strong class="actors">홍진호</strong></li> -->
								<c:if test="${ !empty post }">
									<li>[첨부 파일] <a
										href="<c:url value='/download.do?filename=${ item.post }'/>">${ post }</a></li>
								</c:if>
							</ul>
							<!-- <ul id="img-slider" class="cs-hidden">
                                <li class="pic-1"><img src="image/black.JPG"></li>
                                <li class="pic-2"><img src="image/2.jpg"></li>
                                <li class="pic-3"><img src="image/2.jpg"></li>
                                <li class="pic-4"><img src="image/2.jpg"></li>
                                <li class="pic-5"><img src="image/2.jpg"></li>
                            </ul>-->
						</div>
					</div>
					<div class="prev-text">
						<h2>시놉시스</h2>
						<p>${fn:replace(item.content,crcn,"<br/>") }</p>
					</div>
					<hr>
				</div>
<<<<<<< HEAD
					<div class="admin-menu">
						<ul>
							<c:forEach var="list" items="${ member.userTypes }">
								<c:choose>
									<c:when test="${list.type == 'ADMIN'}">
										<li><a class = "reg-btn" href="/special/movie/modify.do?mno=${item.mno}">수정하기</a></li>
										<li><a class = "reg-btn" href="/special/movie/schedule.do?mno=${item.mno}">상영시간 추가하기</a></li>
										<li><a class = "reg-btn" href="javascript:deleteCheck();">삭제하기</a></li>
									</c:when>
								</c:choose>
							</c:forEach>
=======
			</div>
			<div class="star-box">
				<form action="#" method="post" id="starForm">
					<span class="star-input"> <span class="input"> <input
							type="radio" name="star-input" value="1" id="p1"> <label
							for="p1">1</label> <input type="radio" name="star-input"
							value="2" id="p2"> <label for="p2">2</label> <input
							type="radio" name="star-input" value="3" id="p3"> <label
							for="p3">3</label> <input type="radio" name="star-input"
							value="4" id="p4"> <label for="p4">4</label> <input
							type="radio" name="star-input" value="5" id="p5"> <label
							for="p5">5</label>
					</span> <output for="star-input" id="star-output">
							<b id="star-count">0</b>점
						</output>
					</span>
					<div class="input-area">
						<h4 class="user-name">user</h4>
						<textarea name="write-area" style="resize: none" class="reply-box"
							id="repl" placeholder=" ex) 재미있어요!"> </textarea>
						<a href="javascript:{}" onclick="submitTest();" class="reg-btn"
							id="repl-btn">댓글 입력</a>
					</div>
					<hr style="position: relative; top: 20px;">

					<div class="repl-box text-center">
						<ul class="repl-list">
							<li>
								<p class="star_rating">
									<a href="#" class="on">★</a> <a href="#" class="on">★</a> <a
										href="#" class="on">★</a> <a href="#" class="on">★</a> <a
										href="#">★</a>
								</p>

								<p>
									<strong class="rep-user-name">aaaa2222</strong>진짜 재밌어요!
								</p>

							</li>
							<li>
								<p class="star_rating">
									<a href="#" class="on">★</a> <a href="#" class="on">★</a> <a
										href="#" class="on">★</a> <a href="#">★</a> <a href="#">★</a>
								</p>

								<p>
									<strong class="rep-user-name">a3332</strong>진짜 감동적임..
								</p>

							</li>
>>>>>>> branch 'master' of https://github.com/soyoungsoo/project.git
						</ul>
					</div>
				</form>
			</div>
			<div class="admin-menu">
				<ul>
					<c:forEach var="list" items="${ member.userTypes }">
						<c:choose>
							<c:when test="${list.type == 'ADMIN'}">
								<li><a class="reg-btn"
									href="/special/movie/modify.do?mno=${item.mno}">수정하기</a></li>
								<li><a class="reg-btn" href="javascript:deleteCheck();">삭제하기</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="footer">
			<p class="copyright">&copy;copyright reserved larl</p>
		</div>
	</div>
	<script src="<c:url value='/resources/bootstrap/js/jquery-1.12.4.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery-1.11.3.min.js'/>"></script>
	<script src="<c:url value='/resources/js/star.js'/>"></script>
	<script src="<c:url value='/resources/bootstrap/js/bootstrap.min.js'/>"></script>
</body>
</html>