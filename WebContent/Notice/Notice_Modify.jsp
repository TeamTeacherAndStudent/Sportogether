<%@page import="notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Notice notice = (Notice)request.getAttribute("notice");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<title>공지사항 수정</title>

<style>
#search{
   margin-left: 30px;
}
    
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
	/* display: flex; */
	justify-content: center;
	vertical-align: middle;
}

#maindiv {
	width: 70%;
	height: 70%;
}

#but {
	float: left;
}

#back-btn {
	margin-left: 5%;
	margin-right: 1%;
	text-align: right;
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
	border: 2px solid #1d284b;
}

button:hover {
	background: #006fbe;
	color: #fff;
	text-decoration: none;
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
</style>

</head>
<body>
<header id="header" class="fixed-top">
		<div
			class="container d-flex align-items-center justify-content-between">
			<!-- 여기에 로고 사진 추가 -->
			<h1 class="logo"><a href="../index.html"> Sportogether </a></h1>
       <nav id="navbar" class="navbar">
        <ul>
          <li><a class="active" href="../Sports/sportsList.jsp">종목</a></li>
          <li><a href="../Board/board_main.jsp">자유게시판</a></li>
          <li><a href="../Support/support_main.jsp">후원</a></li>
          <li><input type="search" placeholder="검색" size="10" id="search"></li>
            <li><a href="../login_registration/login.jsp">Login</a></li>
          <li class="dropdown"><a href="#"><span>SIDE MENU</span> <i class="bi bi-chevron-down"></i></a>
          <ul>
             <li><a href="../Notice/notice_main.jsp">공지사항</a></li>     
             <li><a href="../MyPage/Mypage_Main.html">마이페이지</a></li>
             <li><a href="../QnA/Qna_UserMain.html">1:1문의</a></li>
          </ul>
          </li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

		</div>
	</header>
	<!-- End Header -->



	<main id="main">
		<section>
			<div id="main-title">
				<h1>공지사항 수정</h1>
			</div>
		</section>


		<div id="main-content">
			<form action="/notice/modify" method="post" id="notice">
				<div class="form-group">

					<br> <label for="title">제목</label>
					<!-- placeholder 속성 입력한 데이터가 없는 경우 배경으로 나타난다.실제적으로 입력을 100자까지로 지정 -->
					<!-- required 속성을 설정하면 필수입력 사항이된다. -->
					<!-- pattern 속성을 이용한 정규표현식으로 데이터의 유효성 검사를 할 수 있다. -->
					<input type="text" class="form-control" id="title"
						placeholder="제목 입력(4-100)" name="notice-title" value="<%=notice.getNoticeTitle()%>" maxlength="100"
						required="required" pattern=".{4,100}">
				</div>
				<div class="form-group">
					<label for="content">내용</label>
					<!--  여러줄의 데이터를 입력하고 하고자 할때 textarea 태그를 사용한다. -->
					<!--  textarea 안에 있는 모든 글자는 그대로 나타난다. 공백문자, tag, enter -->
					<textarea class="form-control" rows="20" id="content" name="notice-content" placeholder="내용 작성">
						<%=notice.getNoticeContents()%>
					</textarea>
				</div>
			<section>
				<input type="hidden" name="noticeNo" value="<%=notice.getNoticeNo()%>">
				<div id="back-btn">
					<button type="submit">수정완료</button>
					<!-- <a href="#layer" class="check-btn"><button>삭제</button></a> --> 
					<a href="#"><button type="reset">취소</button></a>
				</div>
			</section>
			</form>


<!-- 			<div id="layer" class="pop-layer">
				<div class="pop-container">
					<div class="pop-conts">
						내용
						<p class="ctxt mb20">정말로 삭제하시겠습니까?</p>
						<div class="btn-r">
							<a href="#" class="btn-layerClose"><button>삭제</button></a> <a
								href="#" class="btn-layerClose"><button>취소</button></a>
						</div>
						 // 내용 끝
					</div>
				</div>
			</div> -->
			
		</div>
	</main>
	<!-- footer 옆으로 넘어감 방지 -->
	<div style="clear: both;"></div>
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
			</select> <br> <br>
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