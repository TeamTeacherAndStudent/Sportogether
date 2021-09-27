<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- +선수/일반 회원 들급 변경 /유저 아이디(닉네임) 검색 기능 추가 / 페이징 처리 추가--%>
    <%-- 회원삭제 버튼 클릭시 회원 정보 삭제 처리페이지로 이동(member_remove_action.jsp --%>
	<%-- css 보정 검색창 위치변경/ 검색창 바탕색변경 / 테이블 css손보기 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버 관리</title>
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
  <br><br>
  <main id="main">
		<section id="membermanage">
<!-- 모든 값을 출력해준다 memberDTO list로 불러와서 selectAllMember() -->
		<div class="container">
			<div class="section-title">
			<h2> 회원 목록 </h2><br>
					<table id="table"  width="90%">
						<tr>
							<th>회원번호</th>
							<th>아이디</th>
							<th>닉네임</th>
							<th>가입일</th>
						</tr>
						<!-- 아이디 클릭시 회원 정보 상세조회*user_detail.jsp -->
						<%-- 링크연결 user_detail.jsp --%>
						<%-- 검색값을 출력하기 위해 일괄처리를 사용한다. --%>
						<tr>
							<td>1</td>
							<td>admin</td>
							<td>관리자</td>
							<td>2021.10.09</td>
						</tr>
						<tr>
							<td>1</td>
							<td>admin</td>
							<td>관리자</td>
							<td>2021.10.09</td>
						</tr>
					</table>
				<br>
				<input type="text" class="search" placeholder="ID,닉네임 검색" name="usersearch">
			</div>
		</div>
		</section>
	</main>
	<br><br><br><br>
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