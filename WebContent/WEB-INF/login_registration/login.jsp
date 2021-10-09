<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>


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
  <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
  <script src="https://kit.fontawesome.com/a9dc1781b1.js" crossorigin="anonymous"></script>
  
  
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

  <style>
  	#formtest{
  		margin-top:5%;
  		margin-bottom: 120px;
  	}
  	.login-main{
  		margin-top : 100px;
  		text-align: center;
  	}
  	.login-input{
		margin : 8px; 	
		
		
  	}
   </style>
</head>
<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center justify-content-between">
      <h1 class="logo"><a href="/index.jsp"> Sportogether </a></h1>
      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="active" href="/sports/list">종목</a></li>
          <li><a href="/board/list">자유게시판</a></li>
          <li><a href="/support/list">후원</a></li>
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
  </header><!-- End Header -->
  
<!-- 로그인 -->
<div class="login-main">
	<section class="container">
		<div>
			<div id = "formtest">
			<span style="font-size : 6em;"><i class="far fa-user"></span></i><br>
				<form action = "/member/login" method="post">
						<input class = "login-input" id = "floatingInput" autocomplete="off" type="text" name = "user-id" placeholder ="ID"><br>
						<input class = "login-input" id = "floatingPassword" autocomplete="off" type="password" name = "user-pw" placeholder ="PASSWORD"><br>
					<a href="/member/findid" style="font-size:12px;" class="link-secondary">ID 찾기</a>
					<a href="/member/findpw" style="font-size:12px;" class="link-secondary">PW 찾기</a><br>
					<a href="/member/enroll" style="font-size:18px;" id = "registration" class="link-secondary">회원가입</a><br><br>
					<input class = "btn btn-info" type="submit" value= "    LOG-IN !    ">
					<hr>
				</form>
				
					
					<div>
					<a id="kakao-login-btn"></a>
  					
					
					<div id="result"></div>
					<a href="javascript:void(0)" onclick="kakaoOut()"> 카카오 로그아웃</a>
					</div>
					<a href="javascript:void(0)" style= "{text-decoration:none;,color: black;}" onclick="unlinkApp()">카카오 연동 해제</a>
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
    <script>
 	 Kakao.init('731fd7d33749e9a6bb2bf8fb2a1d7327');
  	Kakao.isInitialized();
 </script>
 
 <script type="text/javascript">
  function unlinkApp() {
    Kakao.API.request({
      url: '/v1/user/unlink',
      success: function(res) {
        alert('success: ' + JSON.stringify(res))
      },
      fail: function(err) {
        alert('fail: ' + JSON.stringify(err))
      },
    })
  }
</script>
<script>
	function kakaoOut(){
		if (!Kakao.Auth.getAccessToken()) {
			  console.log('Not logged in.');
			  return;
			}
			Kakao.Auth.logout(function() {
			  console.log(Kakao.Auth.getAccessToken());
			});
	}
</script>
  <script type="text/javascript">
  Kakao.Auth.createLoginButton({
	    container: '#kakao-login-btn',
	    success: function(authObj) {
	      Kakao.API.request({
	        url: '/v2/user/me',
	        success: function(result) {
	        	
	          $('#result').append(result);
	          id = result.id
	          connected_at = result.connected_at
	          kakao_account = result.kakao_account
	          $('#result').append(kakao_account);
	          resultdiv="<h2>로그인 성공 !!"
	          resultdiv += '<h4>id: '+id+'<h4>'
	          resultdiv += '<h4>connected_at: '+connected_at+'<h4>'
	          email ="";
	          gender = "";
	          if(typeof kakao_account != 'undefined'){
	        	  email = kakao_account.email;
	        	  gender = kakao_account.gender;
	          }
	          resultdiv += '<h4>email: '+email+'<h4>'
	          resultdiv += '<h4>gender: '+gender+'<h4>'
	          $('#result').append(resultdiv);
	          location.href="/index.jsp";
	        },
	        fail: function(error) {
	          alert(
	            'login success, but failed to request user information: ' +
	              JSON.stringify(error)
	          )
	        },
	      })
	    },
	    fail: function(err) {
	      alert('failed to login: ' + JSON.stringify(err))
	    },
	  })
</script>

</body>
</html>