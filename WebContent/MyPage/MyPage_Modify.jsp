<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 정보 수정</title>
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
	display: flex;
	justify-content: center;
	vertical-align: middle;
}

.mybox {
	width: 80%;
	height: 500px;
	border: 1px solid #165992;
	border-radius: 10px;
	background-color: white;
	letter-spacing: 1px;
	justify-content: center;
	display: flex;
}

.content {
	height: 100%;
	width: 60%;
	margin: 20px;
	letter-spacing: 1px;
	align-items: center;
	line-height: 1.5em;
	color: #165992;
	float: left;
	align: left;
}

.side {
	height: 100%;
	width: 30%;
	margin: 20px;
	float: left;
	align: right;
}

.side-top {
	height: 70%;
	width: 100%;
	/* align-items: center; */
}

#photo {
	/* margin : 1%; */
	width: inherit;
	height: 75%;
	border: 1px solid black;
}

.side-top>button {
	margin: 2%;
	float: right;
}

.button {
	height: 20%;
	margin: 2%;
	text-aligh: right;
	float: right;
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

#withdraw {
	background: #B2B2B2;
	border: 2px solid #B2B2B2;
}

#withdraw:hover {
	background: #DB4455;
}

#search {
	margin-left: 30px;
}
</style>
</head>
<body>
	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top">
		<div
			class="container d-flex align-items-center justify-content-between">
			<!-- 여기에 로고 사진 추가 -->
			<h1 class="logo">
				<a href="../index.html"> Sportogether </a>
			</h1>
			<nav id="navbar" class="navbar">
				<ul>
					<li><a class="active" href="../Sports/sportsList.jsp">종목</a></li>
					<li><a href="../Board/board_main.jsp">자유게시판</a></li>
					<li><a href="../Support/support_main.jsp">후원</a></li>
					<li><input type="search" placeholder="검색" size="10"
						id="search"></li>
					<li><a href="../login_registration/login.jsp">Login</a></li>
					<li class="dropdown"><a href="#"><span>SIDE MENU</span> <i
							class="bi bi-chevron-down"></i></a>
						<ul>
							<li><a href="/notice/list">공지사항</a></li>
							<li><a href="../MyPage/Mypage_Main.html">마이페이지</a></li>
							<li><a href="/qna/list">1:1문의</a></li>
						</ul></li>
				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- .navbar -->

		</div>
	</header>
	<!-- End Header -->

	<!-- === Main ===  -->
	<main>
		<section>
			<div id="main-title">
				<h1>나의 정보 수정</h1>
			</div>
		</section>


		<!-- section : 프로필 수정-->
		<section>
			<div id="main-content">
				<form action="/mypage/modify" method="post">
				<div class="mybox">
					<div class="content">
						<!-- 회원 정보 공간 -->
						아이디 : <input type="text" name="user-id" value="${requestScope.member.userId}" readonly> <br>
						<br> 닉네임 : <input type="text" size=16 name="user-nickName" value="${member.userNickName}"> <br>
						<br> 이름 : <input type="text" size=16 name="user-name" value="${member.userName}" readonly> <br>
						<br> 성별 : <input type="text" size=16 name="user-gender" value="${member.userGender}" readonly> <br>
						<br> 생년월일 : <input type="text" size=16 name="user-birthDate" value="${member.userBirthDate}" readonly> <br>
						<br> 비밀번호 : <input type="password" name="user-pw" value="${member.userPw}"> <br>
						<br> 이메일 : <input type="email" name="user-email" value="${member.userEmail}"> <br>
						<br> 전화번호 : <input type="text" name="user-phone" value="${member.userPhone}"> <br>
					</div>

					<div class="side">
						<div class="side-top">
							<div id="photo"></div>
							<button>변경</button>
						</div>
						<br>
						<div class="button">
							<button id="withdraw">회원탈퇴</button>
							<button type="submit">수정</button>
							<button href="/MyPage/MyPage_Main.jsp">마이페이지</button>
						</div>
					</div>
				</div>
			</form>	
			</div>
		</section>

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

</body>
</html>