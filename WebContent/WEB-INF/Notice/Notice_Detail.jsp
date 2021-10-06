<%@page import="notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Notice noticeOne = (Notice)request.getAttribute("noticeOne");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 포맷태그 식별 태그라이브러리  -->
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세페이지</title>
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="../assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="../assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="../assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="../assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="../assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="../assets/css/style.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<title>공지사항 상세페이지</title>
<style>
#search {
	margin-left: 30px;
}

#main-title {
	margin-top: 2%;
	width: 100%;
	height: 100px;
	padding: 1.5%;
}

#main-title h1 {
	color: #1d284b;
	/* margin-left: 15%; */
	font-weight: bolder;
	line-height: 50px;
	text-align: center;
}

#main-content {
	/* margin-top : 5%; */
	margin-left: 15%;
	margin-right: 15%;
	margint-bottom: 15%;
	/* display: flex; */
	justify-content: center;
	vertical-align: middle;
}

table.p-table {
	border-collapse: separate;
	border-spacing: 1px;
	line-height: 1.5;
	/* margin: 20px 10px; */
}

table.p-table th {
	width: 700px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #fff;
	background: #165992;
	text-align: center;
}

table.p-table td {
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #fff;
}

table.p-table td:nth-child(1) {
	width: 10%;
}

table.p-table td:nth-child(2) {
	width: 90%;
}

#back-btn {
	margin-left: 10%;
	margin-right: 10%;
	text-align: right;
}

button {
	background-color: #1d284b;
	color: white;
	border-style: none;
	font-family: "Raleway", sans-serif;
	font-weight: 600;
	font-size: 14px;
	letter-spacing: 1px;
	display: inline-block;
	padding: 12px 32px;
	border-radius: 5px;
	transition: 0.3s;
	line-height: 1;
	-webkit-animation-delay: 0.8s;
	animation-delay: 0.8s;
	margin-top: 6px;
	border: 2px solid #1d284b;
}

button:hover {
	background: #006fbe;
	color: #fff;
	text-decoration: none;
}

.pop-layer .pop-container {
	padding: 20px 25px;
}

.pop-laeyr p.ctxt {
	color: #666;
	line-height: 25px;
}

.pop-layer .btn-r {
	width: 100%;
	margin: 10px 0 20px;
	padding-top: 10px;
	border-top: 1px solid #ddd;
	text-align: right;
}

.pop-layer {
	display: none;
	position: absolute;
	top: 50%;
	left: 50%;
	width: 410px;
	height: auto;
	background-color: #fff;
	border: 5px solid #3571B5;
	z-index: 10;
}
</style>
</head>
<body>
<header id="header" class="fixed-top">
		<div
			class="container d-flex align-items-center justify-content-between">
		<!-- 여기에 로고 사진 추가 -->
     	<h1 class="logo"><a href="/index.jsp"> Sportogether </a></h1>
       <nav id="navbar" class="navbar">
        <ul>
          <li><a class="active" href="/sports/list">종목</a></li>
          <li><a href="/board/list">자유게시판</a></li>
          <li><a href="/support/list">후원</a></li>
          <li><input type="search" placeholder="검색" size="10" id="search"></li>
          <li>
          	<c:if test="${sessionScope.userId eq null }">
				<a href="/member/login">Login</a>
			</c:if> 
			<c:if test="${sessionScope.userId ne null }">
				<a href="/member/logout">Logout</a>
			</c:if></li>
          <li class="dropdown"><a href="#"><span>SIDE MENU</span> <i class="bi bi-chevron-down"></i></a>
          <ul>
             <li><a href="/notice/list">공지사항</a></li>     
             <li><a href="/mypage/main">마이페이지</a></li>
             <li><a href="/qna/list">1:1문의</a></li>
              <c:if test="${sessionScope.userCode eq 'G'}"><li><a href="/admin/main">관리자 페이지</a></li></c:if>
          </ul>
          </li>
        </ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- .navbar -->

		</div>
	</header>
	<!-- End Header -->



	<main id="main">
		<section>
			<div id="main-title">
				<h1>공지사항</h1>
			</div>
		</section>
		<div id="main-content">
			<table class="p-table">
				<thead>
					<tr>
						<th scope="cols">제목</th>
						<th scope="cols"><%=noticeOne.getNoticeTitle() %></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>작성일</td>
						<td><fmt:formatDate pattern = "yyyy-MM-dd hh:mm" value="${noticeOne.noticeDate}"/></td>
					</tr>
					<tr>
						<td>글쓴이</td>
						<td><%=noticeOne.getNoticeWriter() %></td>
					</tr>
					<tr>
						<td colspan="2"><%= noticeOne.getNoticeContents() %></td>
					</tr>
				</tbody>
			</table>
		</div>
		<section>
			<div id="back-btn">
			<c:if test="${sessionScope.userCode eq 'G'}">
				<a href="#layer" class="check-btn"><button>삭제</button></a> 
				<a href="/notice/modify?noticeNo=<%=noticeOne.getNoticeNo()%>"><button>수정</button></a> 
			</c:if>
				<a href="/notice/list"><button>목록</button></a>
			</div>
		</section>
			<div id="layer" class="pop-layer">
				<div class="pop-container">
					<div class="pop-conts">
						<!-- 내용 -->
						<p class="ctxt mb20">정말로 삭제하시겠습니까?</p>
						<div class="btn-r">
						
							<a href="/notice/remove?noticeNo=<%=noticeOne.getNoticeNo()%>" ><button class="btn-layerClose" onclick="deleteNotice()">삭제</button></a> <a
								href="#" class="btn-layerClose"><button >취소</button></a>
						</div>
						<!--  // 내용 끝 -->
					</div>
				</div>
			</div>

	</main>

	<!-- footer 옆으로 넘어감 방지 -->
	<div style="clear: both;"></div>
	<footer id="footer">
		<div class="container">
			<h3>SPORTOGETHER</h3>
			<!-- 넣을 말 추가 -->
			<p>모두 모아 그리고 모두 모여 함께 즐깁시다.</p>
			<select name="sitezip"
				onchange="if(this.value) window.open(this.value);">
				<option value="">관련 사이트 바로가기</option>
				<option value="https://www.sports.or.kr/index.do">대한체육회</option>
				<option value="https://www.kspo.or.kr/kspo/main/main.do">국민체육진흥공단</option>
				<option value="https://www.koreanpc.kr/index.do">대한장애인체육회</option>
				<option value="https://www.gb.go.kr/2021sports/sports.html">전국체육대회</option>
				<option value="http://k-scf.co.kr/">한국체육지도자연맹</option>
				<option value="http://www.kahperd.or.kr/">한국체육학회</option>
				<option
					value="https://www.sports.re.kr/front/main/main.do?menu_seq=0">한국정책과학원</option>
			</select> <br>
			<br>
			<div class="copyright">
				&copy; Copyright <strong><span>SPORTOGETHER</span></strong>. All
				Rights Reserved
			</div>
			<div class="credits">
				<!-- All the links in the footer should remain intact. -->
				<!-- You can delete the links only if you purchased the pro version. -->
				<!-- Licensing information: https://bootstrapmade.com/license/ -->
				<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/family-multipurpose-html-bootstrap-template-free/ -->
				Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
			</div>
		</div>
	</footer>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>
	<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>
	<script src="assets/js/jquery-1.12.3.min.js"></script>
	<script src="assets/js/jquery.counterup.min.js"></script>
	<script src="assets/js/waypoints.min.js"></script>

	<!-- 삭제 경고창 -->
	<script>
	$(".check-btn").click(function(){
        var $href = $(this).attr("href");
        layer_popup($href);
    });
    function layer_popup(el){

        var $el = $(el);    //레이어의 id를 $el 변수에 저장
        var isDim = $el.prev().hasClass("dimBg"); //dimmed 레이어를 감지하기 위한 boolean 변수

        isDim ? $(".dim-layer").fadeIn() : $el.fadeIn();

        var $elWidth = ~~($el.outerWidth()),
            $elHeight = ~~($el.outerHeight()),
            docWidth = $(document).width(),
            docHeight = $(document).height();

        // 화면의 중앙에 레이어를 띄운다.
        if ($elHeight < docHeight || $elWidth < docWidth) {
            $el.css({
                marginTop: -$elHeight /2,
                marginLeft: -$elWidth/2
            })
        } else {
            $el.css({top: 0, left: 0});
        }

        $el.find("a.btn-layerClose").click(function(){
            isDim ? $(".dim-layer").fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
            return false;
        });

        $(".layer .dimBg").click(function(){
            $(".dim-layer").fadeOut();
            return false;
        });

    }
	</script>
</body>
</html>