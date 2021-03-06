<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Sportogether</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
 <!-- <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
-->

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
  
  <!-- 추가 counter js, jquery-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <style>
   h2{
  		 color: rgb(140, 158, 91);
	    font-weight: bold;
   }
    #search{
    	margin-left: 30px;
    }
    #day-counter{
    	 display: flex;
    }
    #Eventcount1{
    	font-size : 20px;
    	width: 100%;
    	height: 200px;
    	background-color: rgb(197, 239, 247);
    	color: white;
    	text-align: center;
    	font-weight: bold;
    	border-radius : 10px;
    }
    #Eventcount2{
    	font-size : 20px;
    	width: 100%;
    	height: 200px;
    	background-color: rgb(65, 131, 215);
    	color: white;
    	text-align: center;
    	font-weight: bold;
    	border-radius :10px;
    }
    #Eventcount3{
    	background-color: rgb(83, 51, 237);
    	width: 100%;
    	height: 200px;
    	font-size : 20px;
    	color: white;
    	text-align: center;
    	font-weight: bold;
    	border-radius : 10px;
    }
  </style>

  <!-- =======================================================
  * Template Name: MeFamily - v4.5.0
  * Template URL: https://bootstrapmade.com/family-multipurpose-html-bootstrap-template-free/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<body>
<script>
		

//d-day 자바스크립트
	var Eventdday = new Date("October 8, 2021, 0:00:00").getTime();
	
	setInterval(function() {
	  var today = new Date().getTime();
	  var gap = Eventdday - today;
	  var day = Math.ceil(gap / (1000 * 60 * 60 * 24));
	  var hour = Math.ceil((gap % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	  var min = Math.ceil((gap % (1000 * 60 * 60)) / (1000 * 60));
	  var sec = Math.ceil((gap % (1000 * 60)) / 1000);

	  document.getElementById("Eventcount1").innerHTML = "<br>제 102회 전국체전<br>2021/10/08(Fri) - 2021/10/14(Thr)<br><br>D-day "+ day + "일 " + hour + "시간 " + min + "분 " + sec + "초";
	}, 1000);
 	
 	var Eventdday2 = new Date("September 10, 2022, 0:00:00").getTime();
		setInterval(function() {
		  var today = new Date().getTime();
		  var gap = Eventdday2 - today;
		  var day = Math.ceil(gap / (1000 * 60 * 60 * 24));
		  var hour = Math.ceil((gap % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
		  var min = Math.ceil((gap % (1000 * 60 * 60)) / (1000 * 60));
		  var sec = Math.ceil((gap % (1000 * 60)) / 1000);
  
		document.getElementById("Eventcount2").innerHTML = "<br>2022 Asian Games<br>2022/09/10(Sat) - 2022/09/25(Sun)<br><br>D-day " + day + "일 " + hour + "시간 " + min + "분 " + sec + "초";
	}, 1000);
	   
		
		var Eventdday3 = new Date("July 26, 2024, 0:00:00").getTime();
		setInterval(function() {
		  var today = new Date().getTime();
		  var gap = Eventdday3 - today;
		  var day = Math.ceil(gap / (1000 * 60 * 60 * 24));
		  var hour = Math.ceil((gap % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
		  var min = Math.ceil((gap % (1000 * 60 * 60)) / (1000 * 60));
		  var sec = Math.ceil((gap % (1000 * 60)) / 1000);
  
		document.getElementById("Eventcount3").innerHTML = "<br>2024 하계 올림픽<br>2024/07/26(Fri) - 2024/08/11(Sun)<br><br>D-day " + day + "일 " + hour + "시간 " + min + "분 " + sec + "초";
	}, 1000); 
		
	
		$(".people-counter").counterUp({
			delay: 20,
			time : 2000
		});
	
</script>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center justify-content-between">
      <h1 class="logo"><a href="/index.jsp"> Sportogether </a></h1>
      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="active" href="/Sports/sportsList.jsp">종목</a></li>
          <li><a href="/board/list">자유게시판</a></li>
          <li><a href="/support/list">후원</a></li>
          <li><input type="search" placeholder="검색" size="10" id="search"></li>
       	  <li>
       	  	<c:if test="${sessionScope.userId eq null }">
       	 		 <a href="login_registration/login.jsp">Login</a>
       	 	</c:if>
       	 	<c:if test = "${sessionScope.userId ne null }">
       	 		<a href="/member/logout">Logout</a>
       	 	</c:if>
       	  </li>
          <li class="dropdown"><a href="#"><span>SIDE MENU</span> <i class="bi bi-chevron-down"></i></a>
          <ul>
             <li><a href="/notice/list">공지사항</a></li>     
             <li><a href="../MyPage/MyPage_Main.jsp">마이페이지</a></li>
             <li><a href="/qna/list">1:1문의</a></li>
          </ul>
          </li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section : Main-Banner ======= -->
  <section id="hero">
    <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade" data-bs-ride="carousel">

      <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

      <div class="carousel-inner" role="listbox">

        <!-- Slide 1 -->
        <div class="carousel-item active" style="background-image: url(assets/img/slide/slide-1.jpg)">
        </div>

        <!-- Slide 2 -->
        <div class="carousel-item" style="background-image: url(assets/img/slide/slide-2.jpg)">
        </div>

        <!-- Slide 3 -->
        <div class="carousel-item" style="background-image: url(assets/img/slide/slide-3.jpg)">
        </div>

      </div>

      <a class="carousel-control-prev" href="#heroCarousel" role="button" data-bs-slide="prev">
        <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
      </a>

      <a class="carousel-control-next" href="#heroCarousel" role="button" data-bs-slide="next">
        <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
      </a>

    </div>
  </section><!-- End Hero : Main-Banner -->

  <main id="main">

    <!-- =======Section ======= -->
    <section id="front" id="day-counter">
     	 <div class="container">
              <div class="row">
	                <div class="col-sm-4">
	    	          <div id="Eventcount1"></div>
	    	        </div>
	    	        <div class="col-sm-4">
			    	  <div id="Eventcount2"></div>
			    	</div>
			        <div class="col-sm-4">
		              <div id="Eventcount3"></div>
		            </div>
 			 </div>
 		</div>
 	</section>
	<!--Start of counter-->
      <section id="counter">
   			<br><br>
          <div class="counter_img_overlay">
              <div class="container">
                  <div class="row">
                      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                               <div class="section-title">
						          <h2></h2>
						        </div>
                      </div>
                      <!--End of col-md-12-->
                  </div>
                  <!--End of row-->
                  <div class="row">
                      <div class="col-md-4">
                          <div class="counter_item text-center">
                              <div class="sigle_counter_item">
                                   <img src="img/tree.png" alt="">
                                  <div class="counter_text">
                                      <span class="people-counter">134</span>
                                      <p>일일 방문자 수</p>
                                  </div>
                              </div>
                          </div>
                      </div>
                      <div class="col-md-4">
                          <div class="counter_item text-center">
                              <div class="sigle_counter_item">
                                  <img src="img/hand.png" alt="">
                                  <div class="counter_text">
                                      <span class="people-counter">1458</span>
                                      <p>전체 방문자 수</p>
                                  </div>
                              </div>
                          </div>
                      </div>
                      <div class="col-md-4">
                          <div class="counter_item text-center">
                              <div class="sigle_counter_item">
                                  <img src="img/hand.png" alt="">
                                  <div class="counter_text">
                                      <span class="people-counter">1,458,000</span>
                                      <p>누적 후원 금액</p>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
                  <!--End of row-->
              </div>
              <!--End of container-->
          </div>
        </section>
        <!--end of counter-->
  <!-- =============== 인기글 / 최신글 ================ -->
    <section class="">
		<div class="container">
	        <div class="section-title">
	        </div>
        	<div class="row content">
	          <div class="col-md-6">
	            <ul>
	              <li>최신글</li>
	            </ul>
	          </div>
	          <div class="col-md-6">
	            <ul>
	              <li>실시간 인기글</li>
	            </ul>
	          </div>
	      	</div>
        </div>
    </section><!-- Section -->
    <!-- ======= Recent Campaign Section ======= -->
	<section id="campaign-recent-photos" class="recent-photos">
	<div class="container">
		<div class="section-title">
			<h2>최신 캠페인 목록</h2>
		</div>
		<div class="recent-photos-slider swiper">
			<div class="swiper-wrapper align-items-center">
	            <div class="swiper-slide"><a href="#" class="glightbox"><img src="assets/img/recent-photos/recent-photos-1.jpg" class="img-fluid" alt=""></a></div>
	            <div class="swiper-slide"><a href="#" class="glightbox"><img src="assets/img/recent-photos/recent-photos-2.jpg" class="img-fluid" alt=""></a></div>
	            <div class="swiper-slide"><a href="#" class="glightbox"><img src="assets/img/recent-photos/recent-photos-3.jpg" class="img-fluid" alt=""></a></div>
	            <div class="swiper-slide"><a href="#" class="glightbox"><img src="assets/img/recent-photos/recent-photos-4.jpg" class="img-fluid" alt=""></a></div>
         	</div>
        	<div class="swiper-pagination"></div>
		</div>
	</div>
    </section><!-- End Campaign Section -->
    <!-- ======= Recent Sports Section ======= -->
    <section id="sports-recent-photos" class="recent-photos">
      <div class="container">

        <div class="section-title">
          <h2>종목소개</h2>
          <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
        </div>

        <div class="recent-photos-slider swiper">
          <div class="swiper-wrapper align-items-center">
            <div class="swiper-slide"><a href="#" class="glightbox"><img src="#" class="img-fluid" alt=""></a></div>
            <div class="swiper-slide"><a href="#" class="glightbox"><img src="#" class="img-fluid" alt=""></a></div>
            <div class="swiper-slide"><a href="#" class="glightbox"><img src="#" class="img-fluid" alt=""></a></div>
            <div class="swiper-slide"><a href="#" class="glightbox"><img src="#" class="img-fluid" alt=""></a></div>
            <div class="swiper-slide"><a href="#" class="glightbox"><img src="#" class="img-fluid" alt=""></a></div>
            <div class="swiper-slide"><a href="#" class="glightbox"><img src="#" class="img-fluid" alt=""></a></div>
          </div>
          <div class="swiper-pagination"></div>
        </div>
      </div>
    </section><!-- End Sports Section -->
  </main>
  <!-- End #main -->

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

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  
  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
  <script src = "assets/js/jquery-1.12.3.min.js"></script>
  <script src = "assets/js/jquery.counterup.min.js"></script>
  <script src = "assets/js/waypoints.min.js"></script>
</body>

</html>