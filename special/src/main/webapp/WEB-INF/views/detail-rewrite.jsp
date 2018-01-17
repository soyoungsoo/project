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
<link rel="stylesheet" type="text/css"
	href="../lightslider-master/src/css/lightslider.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/preview.css">
<!-- <script src="../lightslider-master/src/js/lightslider.js"></script>-->
<title>Untitled Document</title>
<script>
	function deleteCheck() {
		if (confirm("삭제 하시겠습니까?")) {
			location.href = "/special/movie/remove.do?mno=${item.mno}";
		} else {
			alert("삭제 취소 되었습니다.");
			return;
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
					<div id="carousel-example-generic" class="carousel slide"
						data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0"
								class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
							<li data-target="#carousel-example-generic" data-slide-to="3"></li>
						</ol>

						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<img src="image/2.jpg" width="100%">
								<div class="carousel-caption"></div>
							</div>
							<div class="item">
								<img src="image/2.jpg" width="100%">
								<div class="carousel-caption"></div>
							</div>
							<div class="item">
								<img src="image/2.jpg" width="100%">
								<div class="carousel-caption"></div>
							</div>
							<div class="item">
								<img src="image/2.jpg" width="100%">
								<div class="carousel-caption"></div>
							</div>
						</div>

						<!-- Controls -->
						<a class="left carousel-control" href="#carousel-example-generic"
							role="button" data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a> <a class="right carousel-control"
							href="#carousel-example-generic" role="button" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"
							aria-hidden="true"></span> <span class="sr-only">Next</span>
						</a>
					</div>
					<div class="prev-top">
						<div class="thumb">
							<img src="image/black.JPG"> <a class="ticketing-btn"
								href="/special/movie/ticket?mno=${item.mno}">예매하기</a>
						</div>
						<div class="top-ex">
							<h2 class="mov-title">${ item.title }</h2>
							<ul class="ranking">
								<li><strong>예매율</strong> <span> <em>1</em> 위 (42.1%)
								</span></li>
								<li>평점 ★★★★★ (10/10)</li>
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
								<li>
									<h4>감독 :</h4> 배리 젠킨스
								</li>
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

					<div class = "admin-menu">
					<ul>
						<c:forEach var="list" items="${ member.userTypes }">
							<c:choose>
								<c:when test="${list.type == 'ADMIN'}">
									<li><a href="/special/movie/modify.do?mno=${item.mno}">수정하기</a></li>
									<li><a href="javascript:deleteCheck();">삭제하기</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
						</ul>
					</div>
				</div>

			</div>
		</div>
		<div class="footer">
			<p class="copyright">&copy;copyright reserved larl</p>
		</div>
	</div>
	<script src="bootstrap/js/jquery-1.12.4.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>