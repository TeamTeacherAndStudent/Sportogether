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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
  
  <!-- 추가 counter js, jquery-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <style>
  	.reg-main{
		margin-top : 5%;  
  	}
  	.btn-lg{
  		background-color: #1d284b;
  		border-color: #1d284b;
  	}
  	.center-block{
  		align-content: center;
  	}
  </style>
<body>
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
             <li><a href="/mypage/main">마이페이지</a></li>
             <li><a href="/qna/list">1:1문의</a></li>
             <c:if test="${sessionScope.userCode eq 'G'}"><li><a href="/admin/main">관리자 페이지</a></li></c:if>
          </ul>
          </li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><br><br><br><!-- .navbar -->

    </div>
  </header>
  <!-- End Header -->
  <div class="reg-main">
  	<section class="container">
  		<div><h2>비밀번호 찾기</h2></div>
		<div class = "row">
			<div class="col-md-3 visible"></div>
			<div class= " col-md-6">
				<div class="container px-5 my-5 center">
				    <form  class="was-validated" action="/member/findpw" method="post">
				      	 <div class="mb-3">
				            <label class="form-label" for="user-id">아이디</label>
				            <input  class="form-control" id="user-id" name="user-id" type="text" placeholder="아이디"  autocomplete = "off" required minLength="5" maxLength="14" pattern="^[0-9a-zA-Z]+$"/>
				            <div class="invalid-feedback" > 본인의 아이디를 입력해주세요. </div>
				        </div>
				        <div class= "text-center">
				        	<p>회원가입시 등록한 이메일로 임시 비밀번호가 발송됩니다.</p>
				        	<input type="submit" id = "enrollbtn" class= "btn btn-primary btn-lg" value ="비밀번호 찾기">
				        </div>
				        <div>
				        	
				        </div>
				    </form>
				</div>
			</div>
		</div>
		<hr>
  	</section>
  	
  </div>
  
  <!-- footer -->
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
  
  <script>
//   function findPw(){
// 		var removeReplyChk = window.confirm("해당 댓글을 삭제하시겠습니까?");
// 		var supportNo = $("#supportNo").val();
// 		var replyNo = $("#replyNo").val();
// 		if(removeReplyChk) {
// 			location.href = "/supportReply/Remove?replyNo=" + replyNo + "&supportNo=" + supportNo;;
					
// 		}else{
// 			window.alert("취소하였습니다.");
// 		}
	
  
  </script>
</body>
</html>