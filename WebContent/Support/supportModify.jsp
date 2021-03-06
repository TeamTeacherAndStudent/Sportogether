<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원 작성</title>
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
 

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  
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
  <br><br><br><br><br>
    <main id="main">
        <div class="container">
  <h2>후원 등록</h2>
  <form action="boardDeteil.html" method="post">
    <div class="form-group">
         
      <br>
      <label for="title">캠페인 제목</label>
<!-- placeholder 속성 입력한 데이터가 없는 경우 배경으로 나타난다.실제적으로 입력을 100자까지로 지정 -->
<!-- required 속성을 설정하면 필수입력 사항이된다. -->
<!-- pattern 속성을 이용한 정규표현식으로 데이터의 유효성 검사를 할 수 있다. -->
      <input type="text" class="form-control" id="title"
       placeholder="제목 입력(4-100)" name="title"
       maxlength="100" required="required"
       pattern=".{4,100}">
       <br>
       <label for="pupose">캠페인 목적</label><br>
        <input type="text" class="form-control" id="purpose"
       placeholder="목적 입력(4-100)" name="title"
       maxlength="100" required="required"
       pattern=".{4,200}">
       
        <label for="int">내 소개</label>
        <input type="text" class="form-control" id="int"
       placeholder="내 소개 입력(4-100)" name="title"
       maxlength="100" required="required"
       pattern=".{4,200}">
       <br>
       <label for="writer">첨부파일</label>
      <input type="text" class="form-control" id="writer"
       placeholder="첨부 이미지 파일" name="writer">
       <button type="submit" id="but1" class="btn btn-default">첨부파일</button>
    </div>
    <div class="form-group">
   <label for="content">내용</label>
<!--  여러줄의 데이터를 입력하고 하고자 할때 textarea 태그를 사용한다. -->
<!--  textarea 안에 있는 모든 글자는 그대로 나타난다. 공백문자, tag, enter -->
   <textarea class="form-control" rows="5" id="content"
    name="content" placeholder="내용 작성"></textarea>
 </div>
 <br>
    <div class="form-group">
        <select id="box1" name="sports">
      					<option value="">종목선택</option>
      					<option value="">배구</option>
      					<option value="">축구</option>
      					<option value="">탁구</option>
      					<option value="">승마</option>
      					<option value="">농구</option>
      					<option value="">사이클</option>
      					<option value="">기계체조</option>
      </select><br>
      <br>
        <label for="goal">목표 금액</label>
        <input type="text" class="form-control" id="goal"
       placeholder="후원 목표 금액 입력" name="title"
       maxlength="50" required="required"
       pattern=".{4,50}"><br>
      
      
       <select id="box2" name="year">
      					<option value="">년도</option>
      					<option value="">2021</option>
      					<option value="">2022</option>
      					<option value="">2023</option>
      					<option value="">2024</option>
      					<option value="">2025</option>
      					<option value="">2026</option>
      					<option value="">2027</option>
      </select>
      
      <select id="box3" name="month">
      					<option value="">월</option>
      					<option value="">1</option>
      					<option value="">2</option>
      					<option value="">3</option>
      					<option value="">4</option>
      					<option value="">5</option>
      					<option value="">6</option>
      					<option value="">7</option>
      					<option value="">8</option>
      					<option value="">9</option>
      					<option value="">10</option>
      					<option value="">11</option>
      					<option value="">12</option>
      </select>
      
      <select id="box4" name="day">
      					<option value="">일</option>
      					<option value="">1</option>
      					<option value="">2</option>
      					<option value="">3</option>
      					<option value="">4</option>
      					<option value="">5</option>
      					<option value="">6</option>
      					<option value="">7</option>
      					<option value="">8</option>
      					<option value="">9</option>
      					<option value="">10</option>
      					<option value="">11</option>
      					<option value="">12</option>
      					<option value="">13</option>
      					<option value="">14</option>
      					<option value="">15</option>
      					<option value="">16</option>
      					<option value="">17</option>
      					<option value="">18</option>
      					<option value="">19</option>
      					<option value="">20</option>
      					<option value="">21</option>
      					<option value="">22</option>
      					<option value="">23</option>
      					<option value="">24</option>
      					<option value="">25</option>
      					<option value="">26</option>
      					<option value="">27</option>
      					<option value="">28</option>
      					<option value="">29</option>
      					<option value="">30</option>
      					<option value="">31</option>
      </select>
    </div>
    <button type="submit" class="btn btn-default">미리보기</button>
    <a href="boardDeteil.html"><button type="submit" class="btn btn-default">등록</button></a>
    <button type="reset" class="btn btn-default">취소</button>
  </form>
</div>
    </main>
<br><br><br><br><br><br><br><br><br>
 

   

  
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