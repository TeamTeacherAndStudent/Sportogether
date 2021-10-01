<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
</head>
<body>
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
		
	  .Btn{
	  		font-family: "Raleway", sans-serif;
		    font-weight: 600;
		    font-size: 14px;
		    border-style : none;
		    margin-left : 5px;
	  		padding: 12px 10px;
		    border-radius: 5px;
		    border: 1px solid;
		    transition: 0.3s;
		    line-height: 1;
	  		background-color: #1d284b;
	  		cursor: pointer;
	  		width: 100px;
		    letter-spacing: 1px;
	  		color : white;
	  	}
		input {
		 width : 100%;
		 text-align: center;
		 line-height: 33px;
		}
		.searchbox{
	    	width : 100%;
			height: 800px;
			margin-top : 15px;
			text-align: center;
		  	display: flex;
			justify-content: center;
		}
		#boardlist-search {
			height: 400px;
			background-color: red;
			display: inline-block;
		}
		#supportlist-search{
			height: 400px;
			display: inline-block;
			background-color: blue;
		}		
  </style>
</head>
<body>
	<!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center justify-content-between">
      <h1 class="logo"><a href="index.html"> Sportogether </a></h1>
      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="active" href="Sports/sportsList.jsp">종목</a></li>
          <li><a href="Board/board_main.jsp">자유게시판</a></li>
          <li><a href="Support/support_main.jsp">후원</a></li>
          <li><input type="search" placeholder="검색" size="10" id="search"></li>
       	  <li><a href="login_registration/login.jsp">Login</a></li>
          <li class="dropdown"><a href="#"><span>SIDE MENU</span> <i class="bi bi-chevron-down"></i></a>
          <ul>
             <li><a href="Notice/notice_main.jsp">공지사항</a></li>     
             <li><a href="MyPage/Mypage_Main.html">마이페이지</a></li>
             <li><a href="QnA/Qna_UserMain.html">1:1문의</a></li>
          </ul>
          </li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

  <br><br><br>
  <section id="main-contents">
  	<h1>검색</h1><br><br>
	<form action="" method="post">
	  	<div class="container">
		 	<div class="row">
				<div class="col-md-10">
					<input type="text" class="input-field" placeholder="Search" name="searchWord" />
				</div>
				<div class="col-md-2">
					<input type="submit" class="Btn" value="검색">
					<span class="board-search">
				</span>
				</div>
		 	</div>
		</div>
	</form>
 	<div class="searchbox">
 		<div id="boardlist-search">
 			<div class="board-url">
 			</div>
 			<div class="search-contents">
 			</div>
 		</div>
 	</div>
 	<div class="searchbox">
 		<div id="supportlist-search">
 			<div class="support-url">
 			</div>
 			<div class="search-contents">
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