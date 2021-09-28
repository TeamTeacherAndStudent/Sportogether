<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- +페이징 처리/ 테이블 정렬 css/ tr하나 클릭시 후원사이트로 이동  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 후원 결제 관리</title>
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="../assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="../assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="../assets/css/style.css" rel="stylesheet">
  <style>
  		/*제목*/
	h1{
	    vertical-align:middle;
	    line-height:30px;
   		color: rgb(140, 158, 91);
	    text-align: center;
	}
		.ulTable {
		margin-top:10px;
		text-align: center;
		list-style: none;
	}
	
	.ulTable > li:first-child > ul > li {
		list-style: none;
		background-color:#c9c9c9;
		font-weight:bold;
		text-align:center;
		height: 40px;
		line-height: 40px;
		font-size : 15px;
	}
	
	.ulTable > li > ul {
		list-style: none;
		clear:both;
		padding:0px auto;
		position:relative;
		min-width:50px;
	}
	.ulTable > li > ul > li {
		float:left;
		font-size:10pt;
		border-bottom:1px solid #ededed;
		vertical-align:baseline;
	}
	.ulTable > li > ul > li:first-child                {width:10%;} /*No 열 크기*/
	.ulTable > li > ul > li:first-child +li            {width:15%;} /*아이디 열 크기*/
	.ulTable > li > ul > li:first-child +li+li         {width:10%;} /*선수이름 열 크기*/
	.ulTable > li > ul > li:first-child +li+li+li      {width:35%;} /*후원금액 열 크기*/
	.ulTable > li > ul > li:first-child +li+li+li+li   {width:15%;} /*후원 종목 열 크기*/
	.ulTable > li > ul > li:first-child +li+li+li+li+li{width:15%;} /*후원일 열 크기*/
	
	#divPaging {
		clear:both;
		margin:0 auto;
		width:220px;
		height:50px;
	}
	
	#divPaging > div {
		float:left;
		width: 30px;
		margin:0 auto;
		text-align:center;
	}
	.link {
		text-align: right;
		margin-right: 100px;
	}
  </style>
</head>
<body>
	<!-- ======= Header ======= -->
  	<header id="header" class="fixed-top">
    <div class="container d-flex align-items-center justify-content-between">
		<!-- 여기에 로고 사진 추가 -->
      <h1 class="logo"><a href="../index.html"> Sportogether </a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="active" href="sports.html">종목</a></li>
          <li><a href="freeboard.html">자유게시판</a></li>
          <li><a href="support.html">후원</a></li>
          <li><input type="search" placeholder="검색" size="5"></li>
          <li class="dropdown"><a href="#"><span>SIDE MENU</span> <i class="bi bi-chevron-down"></i></a>
          <ul>
             <li><a href="notice.html">공지사항</a></li>     
             <li><a href="adminPage.html">관리자 페이지</a></li>
             <li><a href="qna">1:1문의</a></li>
          </ul>
          </li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav>
      <!--navbar 메뉴 -->
     </div>
 	</header><!-- End Header -->
 	<br><br>
 	<main id="main">
  		<section id="supportManage">
      		<div class="container">
	       		<h1>후원 결제 관리</h1><br><br>
	       		<ul class="ulTable">
        			<li>
						<ul>
							<li>회원번호</li>
							<li>후원 아이디</li>
							<li>후원 선수</li>
							<li>후원 금액</li>
							<li>후원 종목</li>
							<li>후원일</li>
						</ul>
					</li>
					<li>
						<ul>
							<li>1</li>
							<li>admin</li>
							<li>김연경</li>
							<li>10,000</li>
							<li>배구</li>
							<li>2021.09.26</li>
						</ul>
					</li>
				</ul>
			</div>
			<br>
			<div id="divPaging">
				<div>◀</div>
				<div><b>1</b></div>
				<div>2</div>
				<div>3</div>
				<div>4</div>
				<div>5</div>
				<div>▶</div>
			</div>
			<!-- 링크를 오른쪽 하단에 재배치 -->
			<div class="link">
				<a href = "support_chart.html">종목별 비율 차트 보기</a><br>
			</div>
		</section>
	</main>
	<br><br><br>
<!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="container">
      <h3>SPORTOGETHER</h3>
      <!-- 넣을 말 추가 -->
      <p>모두 모아 그리고 모두 모여 함께 즐깁시다.</p>
      <select name="sitezip" onchange="if(this.value) window.open(this.value);">
      	<option value="">관련 사이트 바로가기</option>
      	<option value="https://www.sports.or.kr/index.do">대한체육회</option>
      	<option value="https://www.kspo.or.kr/kspo/main/main.do">국민체육진흥공단</option>
      	<option value="https://www.koreanpc.kr/index.do">대한장애인체육회</option>
      	<option value="https://www.gb.go.kr/2021sports/sports.html">전국체육대회</option>
      	<option value="http://k-scf.co.kr/">한국체육지도자연맹</option>
      	<option value="http://www.kahperd.or.kr/">한국체육학회</option>
      	<option value="https://www.sports.re.kr/front/main/main.do?menu_seq=0">한국정책과학원</option>
      </select>
      <br><br>
      <div class="copyright">
        &copy; Copyright <strong><span>SPORTOGETHER</span></strong>. All Rights Reserved
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
<!-- Vendor JS Files -->
	<script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>