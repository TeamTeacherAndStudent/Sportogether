<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>종목 리스트</title>
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
  	section a{
  		text-decoration:none;
  		size: 5px;
  	}
  	.col-md-2 p{
  		size: 5px;
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
             <li><a href="myinfo.html">마이페이지</a></li>
             <li><a href="qna">1:1문의</a></li>
          </ul>
          </li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->
  <br><br>
  <div>
	 <section class="container px-5">
	   	<div> <h2> 종목 </h2></div>
	 	<div class="row gy-2">
	 		<!-- 종목 목록 -->
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/golf/" target="_blank" style="text-decoration:none">
		 			<div style = "border: 0px; text-align: center">
		 				<img src="https://olympics.com/images/static/sports/pictograms/golf.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">골프</p>
								
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/modern-pentathlon/" target="_black">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/modern-pentathlon.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">근대5종</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/artistic-gymnastics/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/artistic-gymnastics.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">기계체조</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/nordic-combined/" class="link" style = "text-decoration: none; size:10px;">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/nordic-combined.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">노르딕 복합</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/basketball/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/basketball.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">농구</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/3x3-basketball/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/3x3-basketball.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">농구3X3</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/diving/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/diving.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">다이빙</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/rugby-sevens/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/rugby-sevens.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">럭비 세븐</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/wrestling/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/wrestling.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">레슬링</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/roller-speed-skating/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/roller-speed-skating.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">롤러 스피드 스케이팅</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/luge/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/luge.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">루지</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/rhythmic-gymnastics/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/rhythmic-gymnastics.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">리듬체조</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/marathon-swimming/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/marathon-swimming.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">마라톤 수영</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 			<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/biathlon/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/biathlon.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">바이애슬론</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/volleyball/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/volleyball.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">배구</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/badminton/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/badminton.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">배드민턴</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/boxing/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/boxing.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">복싱</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/bobsleigh/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/bobsleigh.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">봅슬레이</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 			
	 			<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/breaking/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/breaking.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">브레이킹</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/beach-handball/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/beach-handball.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">비치핸드볼</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/beach-volleyball/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/beach-volleyball.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">비치발리볼</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/shooting/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/shooting.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">사격</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/cycling-bmx-racing/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/cycling-bmx-racing.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">사이클 BMX 레이싱</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/cycling-bmx-freestyle/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/cycling-bmx-freestyle.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">사이클 BMX 프리스타일</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/cycling-road/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/cycling-road.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">로드 사이클</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/cycling-mountain-bike/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/cycling-mountain-bike.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">사이클 크로스 컨트리</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/cycling-track/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/cycling-track.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">사이클 트랙</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/surfing/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/surfing.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">서핑</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 			<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/short-track-speed-skating/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/short-track-speed-skating.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">쇼트트랙 스케이팅</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/water-polo/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/water-polo.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">수구</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/swimming/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/volleyball.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">수영</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/snowboard/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/snowboard.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">스노보드</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/skateboarding/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/skateboarding.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">스케이트보딩</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/skeleton/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/skeleton.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">스켈레톤</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/ski-mountaineering/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/ski-mountaineering.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">스키등반</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/ski-jumping/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/ski-jumping.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">스키점프</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/sport-climbing/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/sport-climbing.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">스포츠 클라이밍</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/speed-skating/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/speed-skating.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">스피드 스케이팅</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/equestrian/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/equestrian.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">승마</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/artistic-swimming/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/artistic-swimming.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">싱크로나이즈드 스위밍</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/ice-hockey/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/ice-hockey.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">아이스하키</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/acrobatic-gymnastics/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/acrobatic-gymnastics.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">아크로바틱 체조</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 			<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/alpine-skiing/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/alpine-skiing.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">알파인스키</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/baseball-softball/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/baseball-softball.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">야구/소프트볼</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/archery/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/archery.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">양궁</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/weightlifting/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/weightlifting.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">역도</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/sailing/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/sailing.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">요트</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/judo/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/judo.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">유도</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/athletics/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/athletics.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">육상</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/rowing/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/rowing.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">조정</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/football/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/football.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">축구</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/canoe-kayak-slalom/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/canoe-kayak-slalom.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">카누 슬라럼</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/canoe-kayak-flatwater/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/canoe-kayak-flatwater.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">카누/카약 정수</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/karate/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/karate.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">카라테</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/curling/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/curling.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">컬링</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 			<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/cross-country-skiing/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/cross-country-skiing.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">크로스컨트리 스키</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/table-tennis/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/table-tennis.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">탁구</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/taekwondo/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/taekwondo.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">태권도</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/tennis/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/tennis.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">테니스</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/triathlon/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/triathlon.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">트라이애슬론</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/trampoline-gymnastics/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/trampoline-gymnastics.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">트램펄린</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/fencing/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/fencing.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">펜싱</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/futsal/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/futsal.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">풋살</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/freestyle-skiing/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/freestyle-skiing.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">프리스타일 스키</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/figure-skating/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/figure-skating.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">피겨스케이팅</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/hockey/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/hockey.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">하키</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		<div class="col-md-2">
	 			<a href="https://olympics.com/ko/sports/handball/">
		 			<div class="card" style= "border: 0px; text-align: center">
		 				
		 				<img src="https://olympics.com/images/static/sports/pictograms/handball.svg" class="card-img-top" alt="...">
		 				<div class="card-body">
		 					<p class="card-text">핸드볼</p>
		 				</div>
		 			</div>
	 			</a>
	 		</div>
	 		
	 	</div>
	 </section>
  </div>

    

   

  
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
   <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  
  <!-- Vendor JS Files -->
  <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="../assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="../assets/vendor/php-email-form/validate.js"></script>
  <script src="../assets/vendor/swiper/swiper-bundle.min.js"></script>
  
  <!-- Template Main JS File -->
  <script src="../assets/js/main.js"></script>
  <script src = "../assets/js/jquery-1.12.3.min.js"></script>
  <script src = "../assets/js/jquery.counterup.min.js"></script>
  <script src = "../assets/js/waypoints.min.js"></script>
  
</body>
</html>