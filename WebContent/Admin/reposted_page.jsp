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
/*탭관련 css*/
	.container{
				margin: 0 auto;
	}
	ul.tabs{
	  margin: 0px;
	  padding: 0px;
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
	  background: #ededed;
	  color: #222;
	}
	
	.tab-content{
	 /* visibility : hiddin;*/
	  display: none;
	  background: #ededed;
	  padding: 15px;
	}
	
	.tab-content.current{
	  display: inherit;
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
      		<div class="row">
      			<div class="section-title">
		      		<ul class="tabs">
			      		<li class="tab-link current" data-tab="tab-1">신고 게시물</li>
			      		<li class="tab-link" data-tab="tab-2">신고 댓글 </li>
			      		<li class="tab-link" data-tab="tab-3">신고 응원글</li>
		   			</ul>
		   			<div id="tab-1" class="tab-content-current">
	   					<h2>신고 게시물</h2>
	   					<table>
	   						<tr>
	   							<th>No</th>
	   							<th>제목</th>
	   							<th>작성자</th>
	   							<th>날짜</th>
	   							<th>신고수</th>
	   						</tr>
	   						<tr>
	   							<td>1</td>
	   							<td>정말</td>
	   							<td>user</td>
	   							<td>2021/09/26</td>
	   							<td>10</td>
	   						</tr>
	   					</table>
	        		</div>
   					<!-- 페이징 처리 -->
   					<!-- 회원 클릭시 회원 detail페이지/게시물 제목 클릭시 게시물 상세 조회 -->
	        		<div id="tab-2" class="tab-content">
	   					<h2>신고 댓글</h2>
	   					<table>
	   						<tr>
	   							<th>No</th>
	   							<th>댓글내용</th>
	   							<th>작성자</th>
	   							<th>날짜</th>
	   							<th>신고수</th>
	   						</tr>
	   						<tr>
	   							<td>2</td>
	   							<td>졸리고</td>
	   							<td>user</td>
	   							<td>2021/09/26</td>
	   							<td>10</td>
	   						</tr>
	   					</table>
	        		</div>
	        		<div id="tab-3" class="tab-content">
	   					<h2>신고 응원글</h2>
	   					<table>
	   						<tr>
	   							<th>No</th>
	   							<th>응원글 내용</th>
	   							<th>작성자</th>
	   							<th>날짜</th>
	   							<th>신고수</th>
	   						</tr>
	   						<tr>
	   							<td>3</td>
	   							<td>잘래</td>
	   							<td>user</td>
	   							<td>2021/09/26</td>
	   							<td>10</td>
	   						</tr>
	   					</table>
	   				</div>
	        	</div>
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
	
	$(document).ready(function(){
		$('ul.tabs li').click(function(){
	    	var tab_id = $(this).attr('data-tab');
	
		    $('ul.tabs li').removeClass('current');
	   		$('.tab-content').removeClass('current');
	
	    	$(this).addClass('current');
	 		$("#"+tab_id).addClass('current');
	  	})
	})
	</script>
</body>
</html>