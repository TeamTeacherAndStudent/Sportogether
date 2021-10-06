<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 상세조회</title>
<!-- Google Fonts -->
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="../assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="../assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="../assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="../assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="../assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="../assets/css/style.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<style>
#main-title {
	margin-top: 2%;
	width: 100%;
	height: 100px;
	padding: 1.5%;
}

#main-title h1 {
	color: #1d284b;
	/* margin-left: 15%; */
	font-weight: bolder;
	line-height: 50px;
	text-align: center;
}

#main-content {
	/* margin-top : 5%; */
	margin-left: 15%;
	margin-right: 15%;
	margint-bottom: 15%;
	display: flex;
	justify-content: center;
	vertical-align: middle;
}

.mybox {
	width: 100%;
	height: 650px;
	border: 1px solid #165992;
	border-radius: 10px;
	background-color: white;
	letter-spacing: 1px;
	justify-content: center;
	display: flex;
}

.content {
	height: 100%;
	width: 60%;
	margin: 20px;
	letter-spacing: 1px;
	align-items: center;
	line-height: 1.5em;
	color: #165992;
	float: left;
	align: left;
}

.side {
	height: 100%;
	width: 30%;
	margin: 20px;
	float: left;
	align: right;
}

.side-top {
	height: 70%;
	width: 100%;
	/* align-items: center; */
}

#photo {
	/* margin : 1%; */
	width: inherit;
	height: 75%;
	border: 1px solid black;
}

.side-top>button {
	margin: 2%;
	float: right;
}

.button {
	height: 20%;
	margin :3%
	
	/* float: right; */
}

button {
	background-color: #1d284b;
	color: white;
	border-style: none;
	font-family: "Raleway", sans-serif;
	font-weight: 600;
	font-size: 14px;
	letter-spacing: 1px;
	display: inline-block;
	padding: 12px 32px;
	border-radius: 5px;
	transition: 0.3s;
	line-height: 1;
	-webkit-animation-delay: 0.8s;
	animation-delay: 0.8s;
	margin-top: 6px;
	margin-left: 5px;
	border: 2px solid #1d284b;
	text-aligh: right;
	float:right; 

}

/* .btn-layerClose{
	padding : 0.5%;
} */

button:hover {
	background: #006fbe;
	color: #fff;
	text-decoration: none;
}

#withdraw {
	background: #B2B2B2;
	border: 2px solid #B2B2B2;
}

#withdraw:hover {
	background: #DB4455;
}

#search {
	margin-left: 30px;
}

.pop-layer .pop-container {
	padding: 20px 25px;
}

.pop-laeyr p.ctxt {
	color: #666;
	line-height: 25px;
}

.pop-layer .btn-r {
	width: 100%;
	margin: 10px 0 20px;
	padding-top: 10px;
	border-top: 1px solid #ddd;
	text-align: right;
}

.pop-layer {
	display: none;
	position: absolute;
	top: 50%;
	left: 50%;
	width: 410px;
	height: auto;
	background-color: #fff;
	border: 5px solid #3571B5;
	z-index: 10;
}

.admin-btn{

}
</style>
</head>
<body>
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

	<!-- === Main ===  -->
	<main>
		<section>
			<div id="main-title">
				<h1>${member.userId}님의 정보</h1>
			</div>
		</section>


		
		<!-- section : 관리자확인용-->
		<section>
			<div id="main-content">
				<form action="/admin/player" method="post">
				<div class="mybox">
				
					<div class="content">
						<!-- 회원 정보 공간 -->
						아이디 : <input type="text" name="user-id" value="${requestScope.member.userId}" readonly> <br>
						<br> 닉네임 : <input type="text" size=16 name="user-nickName" value="${member.userNickName}"> <br>
						<br> 이름 : <input type="text" size=16 name="user-name" value="${member.userName}" readonly> <br>
						<br> 성별 : <input type="text" size=16 name="user-gender" value="${member.userGender}" readonly> <br>
						<br> 생년월일 : <input type="text" size=16 name="user-birthDate" value="${member.userBirthDate}" readonly> <br>
						<br> 비밀번호 : <input type="password" name="user-pw" value="${member.userPw}"> <br>
						<br> 이메일 : <input type="email" name="user-email" value="${member.userEmail}"> <br>
						<br> 전화번호 : <input type="text" name="user-phone" value="${member.userPhone}"> <br>
						<input type="hidden" name="user-player" value="${member.userPlayer}">
					</div>
					
					<div class="side">
						<div class="side-top">
							<div id="photo"></div>
							<button>변경</button>
						</div>
						<br>
					</div>
					
				</div>
				</form>	
				<div class="button">
				<a href="/admin/player"><button class="admin-btn">선수인증</button></a> <br>
				<a href="/admin/main"><button class="admin-btn">관리자페이지</button></a> <br>
					<a href="#layer" class="check-btn"><button  class="admin-btn" id="withdraw">탈퇴처리</button></a>
				</div>
			</div>	
		</section>
		<section>
				<div id="layer" class="pop-layer">
				<div class="pop-container">
					<div class="pop-conts">
						<!-- 내용 -->
						<p class="ctxt mb20">정말로 탈퇴처리하시겠습니까?</p>
						<div class="btn-r">
						
							<a href="/admin/remove"><button class="btn-layerClose" onclick="deleteNotice()">탈퇴</button><!-- </a> --> 
							<a href="#" class="btn-layerClose"><button class="btn-layerClose">취소</button></a>
						</div>
						<!--  // 내용 끝 -->
					</div>
				</div>
			</div>
		</section>

	</main>



	<!-- footer 옆으로 넘어감 방지 -->
	<div style="clear: both;"></div>

	<!-- ======= Footer ======= -->
	<footer id="footer">
		<div class="container">
			<h3>SPORTOGETHER</h3>
			<!-- 넣을 말 추가 -->
			<p>모두 모아 그리고 모두 모여 함께 즐깁시다.</p>
			<select name="sitezip"
				onchange="if(this.value) window.open(this.value);">
				<option value="">관련 사이트 바로가기</option>
				<option value="https://www.sports.or.kr/index.do">대한체육회</option>
				<option value="https://www.kspo.or.kr/kspo/main/main.do">국민체육진흥공단</option>
				<option value="https://www.koreanpc.kr/index.do">대한장애인체육회</option>
				<option value="https://www.gb.go.kr/2021sports/sports.html">전국체육대회</option>
				<option value="http://k-scf.co.kr/">한국체육지도자연맹</option>
				<option value="http://www.kahperd.or.kr/">한국체육학회</option>
				<option
					value="https://www.sports.re.kr/front/main/main.do?menu_seq=0">한국정책과학원</option>
			</select> <br>
			<br>
			<div class="copyright">
				&copy; Copyright <strong><span>SPORTOGETHER</span></strong>. All
				Rights Reserved
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

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>
	<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>
	<script src="assets/js/jquery-1.12.3.min.js"></script>
	<script src="assets/js/jquery.counterup.min.js"></script>
	<script src="assets/js/waypoints.min.js"></script>
	
	
	<!-- 삭제 경고창 -->
	<script>
	$(".check-btn").click(function(){
        var $href = $(this).attr("href");
        layer_popup($href);
    });
    function layer_popup(el){

        var $el = $(el);    //레이어의 id를 $el 변수에 저장
        var isDim = $el.prev().hasClass("dimBg"); //dimmed 레이어를 감지하기 위한 boolean 변수

        isDim ? $(".dim-layer").fadeIn() : $el.fadeIn();

        var $elWidth = ~~($el.outerWidth()),
            $elHeight = ~~($el.outerHeight()),
            docWidth = $(document).width(),
            docHeight = $(document).height();

        // 화면의 중앙에 레이어를 띄운다.
        if ($elHeight < docHeight || $elWidth < docWidth) {
            $el.css({
                marginTop: -$elHeight /2,
                marginLeft: -$elWidth/2
            })
        } else {
            $el.css({top: 0, left: 0});
        }

        $el.find("a.btn-layerClose").click(function(){
            isDim ? $(".dim-layer").fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
            return false;
        });

        $(".layer .dimBg").click(function(){
            $(".dim-layer").fadeOut();
            return false;
        });

    }
	</script>
</body>
</html>