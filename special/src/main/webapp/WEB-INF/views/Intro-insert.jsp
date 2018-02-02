<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/bootstrap-theme.min.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/main.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/register.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/actors.css'/>">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
    function add() {
        $('#Introview').append(
            '<tr><th class="text-right">- 동영상</th>'+
            '<td class="actors-input"><input class="detail-video" type="text" name="video" id="video-input"></td>'+
            '</tr><tr><th class="text-right">- 사진</th>'+
            '<td class="actors-input"><input class="insert-file detail-images" type="file" name="image"></td>'+'</tr>');
    }

    function submitTest() {
        if ($(".detail-video").val() === "") {
            alert("동영상의 주소를 입력해 주세요!");
            return false;
        } else if ($(".detail-images").val() === "") {
            alert("이미지를 넣어주세요!");
            return false;
        } else {
            $('#joinForm').submit();
        }
    }
    
    function Cancel() {
		if (confirm("진행중인것을 그만두고 나가시겠습니까?")) {
			location.href = "../special/movie/list.do";
		}
	}

</script>

<body>
    <div class="frame">
        <div class="container">
            <div class="header">
                <div class="logo">
                    <a href="<c:url value='/'/>" onclick="Cancel();"> Movie Theater </a>
                </div>
            </div>
            <div class="nav">
                <ul class="nav-list">
                    <c:if test="${member.id ne null}">
                        <li class="nav-item">${member.id} 님</li>
                        <li class="nav-item"><a class="nav-link" href="../logout">로그아웃</a></li>
                        <li class="nav-item"><a class="nav-link" href="../user/setting">회원정보수정</a></li>
                    </c:if>
                </ul>
            </div>
            <div class="content">
                <form method="post" action="/special/movie/insert_actors" enctype="multipart/form-data" id="joinForm">
                    <table id="Introview" class="table-join">
                        <tr>
                            <th class="text-center" colspan="2">
                                <h3>출연진 추가하기</h3>
                            </th>
                        </tr>
                        <tr>
                            <th class="text-right">- 동영상</th>
                            <td class="actors-input"><input class="detail-video" type="text" name="video" id="video-input"></td>
                        </tr>
                        <tr>
                            <th class="text-right">- 사진</th>
                            <td class="actors-input"><input class="insert-file detail-images" type="file" name="image"></td>
                        </tr>
                        <tr>
                           <th><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"></th>
                           <th><input type="hidden" name="mno" value="${param.mno}"></th>
                        </tr>
                    </table>
                    <ul>
                        <li><a href="#" onclick="submitTest();" class="reg-btn">등록완료</a></li>
                        <li><a href="#" onclick="Cancel()" class="reg-btn">메인화면으로 이동</a></li>
                        <li><a href="#" class = "reg-btn" id="addFile" value="add more" onclick="add();">추가하기</a></li>
                    </ul>
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
