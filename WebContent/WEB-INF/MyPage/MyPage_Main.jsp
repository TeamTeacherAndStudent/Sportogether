<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
	font-weight: bolder;
	line-height: 50px;
	text-align: center;
}

#main-content {
	margin-left: 15%;
	margin-right: 15%;
	margint-bottom: 15%;
	vertical-align: middle;
	justify-content: center;
}

.floor {
	vertical-align: middle;
	justify-content: center;
	margin: 5%;
	display: flex;
}

.mybox {
	float: left;
	height: 400px;
	width: 350px;
	border-radius: 15px;
	margin: 5%;
	justify-content: center;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

.title {
	margin: 15px;
	padding: 3%;
	height: 50px;
	text-align: left;
	font-size: 35px;
	font-weight: bolder;
	color: #1d284b;
	letter-spacing: 1px;
	line-height: 50px;
	-webkit-transition: 0.5s; /*사파리 & 크롬*/
	-moz-transition: 0.5s; /*파이어폭스*/
	-ms-transition: 0.5s; /*인터넷 익스플로러*/
	-o-transition: 0.5s; /*오페라*/
	transition: 0.5s;
	border-radius: 15px 15px 0 0;
}

.content {
	height: 50%;
	padding: 25px;
	letter-spacing: 1px;
	align-items: center;
	line-height: 30px;
	color: #165992;
}

.button {
	margin: 15px;
	padding: 1%;
	font-size: 20px;
	text-align: right;
	line-height: 35px;
	letter-spacing: 1px;
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
</style>
</head>
<body>
<!-- ======= Header ======= -->
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
       <!--    <li><input type="search" placeholder="검색" size="10" id="search"></li> -->
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

	<!-- === Main ===  -->
	<main>
		<!-- 텍스트가 안나온다..? -->
		<section>
			<div id="main-title">
				<h1>My Page</h1>
			</div>
		</section>
		<div id="main-content">
			<!-- 프로필, 후원 내역 -->
			<section>
				<div class="floor">
					<div class="mybox">
						<div class="title">프로필</div>
						<div class="content">
							<!-- 회원 정보 공간 -->
							닉네임 : ${member.userNickName} <br> 
							전화번호 : ${member.userPhone} <br> 
							이메일 : ${member.userEmail} <br>
							<c:if test="${sessionScope.userPlayer eq 'Y'}">선수인증: 인증완료</c:if>
							<c:if test="${sessionScope.userPlayer eq 'N'}">선수인증: 인증 전</c:if>
						</div>
						<div class="button">
							<a href="/mypage/modify"><button>수정</button></a>
						</div>
					</div>
					<div class="mybox">
						<div class="title">후원내역</div>
						<div class="content">
							<!-- 회원 정보 공간 -->
							김연경 (배구) : 1000원
						</div>
						<div class="button">
							<a href="/Mypage_html/Mypage_Support.html"><button>더보기</button></a>
						</div>
					</div>
				</div>
			
			<!-- 선수인증, 활동차트 -->
			
				<div class="floor">
					<div class="mybox">
						<div class="title">선수 인증</div>
						<div class="content">
							<!-- 회원 정보 공간 -->
							* 선수인 경우 인증 가능
						</div>
						<div class="button">
							<a href="/Player/Mypage_Player.html"><button>인증</button></a>
						</div>
					</div>
					<div class="mybox">
						<div class="title">활동 차트</div>
						<div class="content">
							<!-- 회원 정보 공간 -->
							방문 횟수 : 10회 <br> 주요 후원 종목 : 배구
						</div>
						<div class="button">
							<a href="/Mypage_html/Mypage_Chart.html"><button>더보기</button></a>
						</div>
					</div>
				</div>
			
			<!-- 내가 쓴 게시글, 스크랩 내역 -->
			
				<div class="floor">
					<div class="mybox">
						<div class="title">내가 쓴 게시글</div>
						<div class="content"></div>
						<div class="button">
							<a href="/mypage/mypost"><button>보기</button></a>
						</div>
					</div>
					<div class="mybox">
						<div class="title">나의 스크랩 내역</div>
						<div class="content"></div>
						<div class="button">
							<a href="/Mypage_html/Mypage_Scrap.html"><button>보기</button></a>
						</div>
					</div>
				</div>
			</section>
		</div>
	</main>



	<!-- footer 옆으로 넘어감 방지 -->
	<div style="clear: both;"></div>

	<!-- ======= Footer ======= -->
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
			</select> <br> <br>
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

</body>
</html>