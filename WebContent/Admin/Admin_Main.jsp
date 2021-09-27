<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
<title>Admin Page</title>
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  <style>
    h1 {
    	font-size : 22px;
    	font-weight : bold;
    }
    .card {
    	height: 400px;
		width: 350px;
		border-radius: 15px;
		display: inline-block;
		margin-top: 50px;
		margin-left: 50px;
		margin-bottom: 50px;
		position: relative;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
		overflow: hidden;
    }
    card-header {
		-webkit-transition: 0.5s; /*사파리 & 크롬*/
	    -moz-transition: 0.5s;  /*파이어폭스*/
	    -ms-transition: 0.5s;	/*인터넷 익스플로러*/
	    -o-transition: 0.5s;  /*오페라*/
	    transition: 0.5s;
		width: 100%;
		height: 600px;
		border-radius: 15px 15px 0 0;
	}
	.card:hover .card-header  {
		opacity: 0.8;
	}
    .card-body {
    	background-image : url("");
		background-size: 100% 280px;
		background-repeat: no-repeat;	
    }
    
    .card:hover {
    	opacity: 1;
	    -webkit-transition: .5s ease-in-out;
	    -moz-transition: .5s ease-in-out;
	    -ms-transition: .5s ease-in-out;
	    -o-transition: .5s ease-in-out;
	    transition : .5s ease-in-out;
  	}
  </style>
</head>
<body>
	<!-- ======= Header ======= -->
  	<header id="header" class="fixed-top">
    <div class="container d-flex align-items-center justify-content-between">
		<!-- 여기에 로고 사진 추가 -->
      <h1 class="logo"><a href="index.html"> Sportogether </a></h1>
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
  <section id="main-contents">
  <h1>관리자 전용 메인 페이지</h1>
 	<div class="row">
 		<div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
		<a href="admin/reposted_page.jsp">
			<div class="card">
				<div class="card-header">
					<h1>신고 게시물/댓글/응원댓글 목록</h1>
				</div>
				<div class="card-body">
				
				</div>
			</div>
		</a>
		<a href="admin/support_approval.jsp">
			<div class="card">
				<div class="card-header">
					<h1>승인 대기 캠페인 목록</h1>
				</div>
				<div class="card-body">
				
				</div>
			</div>
		</a>
		<a href="admin/support_delete.jsp">
			<div class="card">
				<div class="card-header">
					<h1>캠페인 관리</h1>
				</div>
				<div class="card-body">
				
				</div>
			</div>
		</a>
		<a href="admin/member_manage.jsp">
			<div class="card">
				<div class="card-header">
					<h1>회원 관리</h1>
				</div>
				<div class="card-body">
				
				</div>
			</div>
		</a>
		<a href="admin/support_manage.jsp">
			<div class="card">
				<div class="card-header">
					<h1>후원 결제 관리</h1>
				</div>
				<div class="card-body">
				
				</div>
			</div>
		</a>
		<a href="admin/sports_manage.jsp">
			<div class="card">
				<div class="card-header">
					<h1>종목 관리</h1>
				</div>
				<div class="card-body">
				
				</div>
			</div>
		</a>
		</div>
	</div>
  </section>
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
  </footer><!-- End Footer -->
  
 
  <!-- Vendor JS Files -->
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>