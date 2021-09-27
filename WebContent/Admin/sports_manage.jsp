<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>종목 관리</title>
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
  /*파일 첨부 버튼 css*/
  	.input-file-button{
  		padding : 6px 10px;
  		background-color: #1d284b;
  		border-radius : 4px;
  		color : white;
  		cursor: pointer;
  		width: 150px;
  	}
  	#input-file{
  		visibility : hidden;
  	}
  	/* 파일명 upload */
	.file-upload.upload-name {
	    display: inline-block;
	    padding: 6px 10px;  /* label의 패딩값과 일치 */
	    font-size: inherit;
	    font-family: inherit;
	    line-height: normal;
	    vertical-align: middle;
	    background-color: #f5f5f5;
	    border: 1px solid #ebebeb;
	   	width : 300px;
	   	height: 30px;
	}
  	.Btn{
  		padding : 6px 10px;
  		background-color: #1d284b;
  		border-radius : 4px;
  		color : white;
  	}
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
	<section id="sportsManage">
			<div class="container">
				<div class="section-title">
					<h2>종목 관리 </h2>
					<div class="">
						<form action ="" method="post">
							<h4>종목 등록 및 수정</h4><br>
							<select name="sports">
								<option value="">종목소분류</option>
								<!-- 종목 소분류 긁어오기 optgroup label-->
								<option value="">구기종목</option>
							</select>
							<!-- 이름값도 넘겨주기 -->
							<input type="text" placeholder="종목 이름 입력" size="30"><br><br>
							<textarea id="sports_enroll" name="sport_enroll" cols="100" rows="20" placeholder=" 내용을 입력하세요."></textarea><br>
							<div class="file-upload">
								<input type="text" class="upload-name" value="파일선택" readonly="readonly">
								<label class="input-file-button" for="input-file">파일 업로드</label>
								<input type="file" id="input-file"><hr><br><br><!-- 파일버튼 숨김 -->
							</div>
							<button class="Btn">미리보기</button> <input type="submit" value="등록하기" class="Btn"> <input type="reset" value="취소" onclick="location.href='Admin_Main.jsp'" class="Btn">
						</form>
					</div>
				</div>
			</div>
	</section>  
  </main>
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
	<script src="../assets/vendor/bootstrap/js/bootstr-ap.bundle.min.js"></script>
	<script>
		$(function(){
			$('.upload-name').val('파일선택');
			$('.input-file').change(function(){
				var filename = $(this).val();
				$('.upload-name').val();
			});
		});
			/* 	var fileTarget = $('.file-upload#input-file');
				fileTarget.on('change', function(){
					if(window.FileReader){ //modern browser
						var filename = $(this)[0].files[0].name;
					}else { //old IE
						var filename = $(this).val().split('/').pop().split('\\').pop(); //파일명 추출
					}
					// 추출한 파일명 삽입
			          $(this).siblings('.upload-name').val(filename);
			     })
			 })    
			     */
		
		
	</script>
</body>
</html>