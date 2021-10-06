<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="../assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="../assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="../assets/css/style.css" rel="stylesheet">
  <style>
		 #main-contents{
		    width: 100%;
		}
		 #search{
		   margin-left: 30px;
		}
    /*제목*/
		h1{
		    vertical-align:middle;
		    line-height:30px;
	   		color: rgb(140, 158, 91);
		    text-align: center;
		}	
		
    .card {
    	height: 400px;
		width: 350px;
		border-radius: 15px;
		display: inline-block;
		margin-top: 30px;
		margin-left: 30px;
		margin-bottom: 30px;
		position: relative;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
		overflow: hidden;
    }
    #reportedcard{
    	background-color: #3be8b0;
    }
    #approvalcard{
    	background-color: #007fdb;
    }
    #campaigncard{
    	background-color: #6a67ce;
    }
    #membercard{
    	background-color: #ffb900;
    }
    #paycard{
    	background-color: #fc636b;
    }
    #sportscard{
    	background-color: #832561;
    }
    .card-header {
		-webkit-transition: 0.5s; /*사파리 & 크롬*/
	    -moz-transition: 0.5s;  /*파이어폭스*/
	    -ms-transition: 0.5s;	/*인터넷 익스플로러*/
	    -o-transition: 0.5s;  /*오페라*/
	    transition: 0.5s;
		width: 100%;
		height: 1500px;
		border-radius: 15px 15px 0 0;
		text-align : center;
		color: white;
		position: absolute;
		top: 50%;
	}
	.card:hover .card-header  {
		opacity: 0.8;
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
<script>
	window.onload = function() {
		
	}
</script>
  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center justify-content-between">
      <h1 class="logo"><a href="/"> Sportogether </a></h1>
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
       	 	<c:if test = "${sessionScope.userId ne null }">
       	 		<a href="/member/logout">Logout</a>
       	 	</c:if>
       	  </li>
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
      </nav><!-- .navbar -->
		</div>
	</header>
	<!-- End Header -->
  <br><br><br>
  <section id="main-contents">
  	<h1>관리자 전용 메인</h1><br><br>
  	<div class="container">
	 	<div class="row">
	 		<div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
				<a href="/admin/reportedList/board">
					<div id="reportedcard" class="card">
						<div class="card-header">
							<h3>신고글 목록</h3>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
				<a href="/support/appList">
					<div id="approvalcard" class="card">
						<div class="card-header">
							<h3>승인 대기 캠페인 목록</h3>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
				<a href="campaign_delete.jsp">
					<div id="campaigncard" class="card">
						<div class="card-header">
							<h3>캠페인 관리</h3>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
				<a href="/admin/memberlist">
					<div id="membercard" class="card">
						<div class="card-header">
							<h3>회원 관리</h3>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
				<a href="support_manage.jsp">
					<div id="paycard" class="card">
						<div class="card-header">
							<h3>후원 결제 관리</h3>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
				<a href="sports_manage.jsp">
					<div  id="sportscard"  class="card">
						<div class="card-header">
							<h3>종목 관리</h3>
						</div>
					</div>
				</a>
			</div>
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