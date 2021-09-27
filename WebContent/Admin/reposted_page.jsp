<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--수정사항유 ) 
    1) current가 계속 보여진다
    2)  css가 마음에 들지 않는다
	3) 페이징 처리를 해줘야한다
    
      --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 관리</title>
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
	#main {
		 width:100%;
		 height : 800px;
	}
	/*제목*/
	h1{
	    vertical-align:middle;
	    line-height:30px;
   		color: rgb(140, 158, 91);
	    text-align: center;
	}
	/*탭 메뉴 글씨 디자인*/
	.subtitle{
		text-align: center;
		vertical-align:middle;
	    line-height:30px;
	    font-size:14pt;
   		color: rgb(140, 158, 91);
	}
/*탭관련 css*/
	.container{
				margin: 0 auto;
	}
	ul, li{
		list-style: none;
		text-align: center;
		padding : 0px;
		margin : 0px;
	}
	ul.tabs{
	  margin: 0px;
	  padding: 0px;
	  text-align: center;
	  list-style: none;
	}
	ul.tabs li{
	  background: none;
	  color: #222;
	  display: inline-block;
	  padding: 10px 15px;
	  cursor: pointer;
	}
	
	ul.tabs li.current{
	  background-color: #ededed;
	  color: #222;
	}
	
	.tab-content{
	  display: none;
	  background-color: #ededed;
	  padding: 15px;
	}
	
	.tab-content.current{
	  display: inherit;
	}
	
/* 테이블(게시판 형태) CSS*/
	.ulTable {
		margin-top:10px;
		text-align: center;
	}
	
	.ulTable > li:first-child > ul > li {
		background-color:#c9c9c9;
		font-weight:bold;
		text-align:center;
	}
	
	.ulTable > li > ul {
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
	.ulTable > li > ul > li:first-child +li            {width:35%;} /*제목 열 크기*/
	.ulTable > li > ul > li:first-child +li+li         {width:20%;} /*작성일 열 크기*/
	.ulTable > li > ul > li:first-child +li+li+li      {width:15%;} /*작성자 열 크기*/
	.ulTable > li > ul > li:first-child +li+li+li+li   {width:10%;} /*추천수 열 크기*/
	.ulTable > li > ul > li:first-child +li+li+li+li+li{width:10%;} /*조회수 열 크기*/
	
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
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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
  <br><br>
  <!-- ======== 본문 ============= -->
  <main id="main">
  		<section id="reposted">
      		<div class="container">
	      		<h1>신고글 관리</h1><br><br>
	      		<ul class="tabs">
		      		<li class="tab-link current" data-tab="tab-1">신고 게시물</li>
		      		<li class="tab-link" data-tab="tab-2">신고 댓글 </li>
		      		<li class="tab-link" data-tab="tab-3">신고 응원글</li>
	   			</ul>
  					<!-- 페이징 처리 -->
  					<!-- 회원 클릭시 회원 detail페이지/게시물 제목 클릭시 게시물 상세 조회 -->
  					<div id="tab-1" class="tab-content">
	        		<ul class ="ulTable">
	   					<li>
	   						<h3 class="subtitle">신고 게시물</h3>
	   						<ul>
	   							<li>No</li>
	   							<li>제목</li>
	   							<li>작성자</li>
	   							<li>날짜</li>
	   							<li>신고수</li>
	   						</ul>
	   					</li>
	   					<li>
	   						<ul>
	   							<li>1</li>
	   							<li>불법주정차</li>
	   							<li>car</li>
	   							<li>2021-09-27</li>
	   							<li>5</li>
	   						</ul>
	   					</li>
	   				</ul>
        		</div>
        		<div id="tab-2" class="tab-content">
	        		<ul class ="ulTable">
	   					<li>
	   						<h3 class="subtitle">신고 댓글</h3>
	   						<ul>
	   							<li>No</li>
	   							<li>댓글내용</li>
	   							<li>작성자</li>
	   							<li>날짜</li>
	   							<li>신고수</li>
	   						</ul>
	   					</li>
	   					<li>
	   						<ul>
	   							<li>1</li>
	   							<li>2</li>
	   							<li>3</li>
	   							<li>4</li>
	   							<li>5</li>
	   						</ul>
	   					</li>
	   				</ul>
        		</div>
        		<div id="tab-3" class="tab-content">
	        		<ul class ="ulTable">
	   					<li>
		   					<h3 class="subtitle">신고 응원글</h3>
		   					<ul>
	   							<li>No</li>
	   							<li>응원글 내용</li>
	   							<li>작성자</li>
	   							<li>날짜</li>
	   							<li>신고수</li>
		   					</ul>
		   				</li>
		   			</ul>
   				</div>
	   				<div id="divPaging">
						<div>◀</div>
						<div><b>1</b></div>
						<div>2</div>
						<div>3</div>
						<div>4</div>
						<div>5</div>
						<div>▶</div>
					</div>
   				</div>
        </section>
  </main>
  <br><br>
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
	
	<script>
		$(function(){
			$('ul.tabs li').click(function(){
		    	var tab_id = $(this).attr('data-tab');
			    $('ul.tabs li').removeClass('current');
		   		$('.tab-content').removeClass('current');
		    	$(this).addClass('current');
		 		$("#"+tab_id).addClass('current');
		  	})
		});
	</script>
</body>
</html>