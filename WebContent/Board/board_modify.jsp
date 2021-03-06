<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

    <!-- Vendor JS Files -->
  <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="../assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="../assets/vendor/php-email-form/validate.js"></script>
  <script src="../assets/vendor/swiper/swiper-bundle.min.js"></script>
  
  <!-- Template Main JS File -->
  <script src="../assets/js/main.js"></script>
  <script src = "../assets/js/waypoints.min.js"></script>
  <!-- CKEditor5-->
  <script src="https://cdn.ckeditor.com/ckeditor5/29.2.0/classic/ckeditor.js"></script>
	<!-- 추가 -->
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>자유게시판 수정</title>
  
  <style>
     .ck.ck-editor{
     	max-width: 100%;
     	text-align: center;
     }
     .ck.ck-editor-editable{
     }
	  #main{
	    width: 100%;
	  }
	  #mainform{
	    border: 1px solid black;
	  }
	  #maindiv{
	    width: 70%;
	    height: 70%;
	  }
	   #search{
		   margin-left: 30px;
		}
	  .text{
		text-align:center;
		}
		select {
			text-align:center;
			width:150px;
			height:30px;
			margin-right: 10px;
		}
	  #form{
	    width: 100%;
	  	display: inline-block;
        text-align: center;
    	border: 1px solid #f5f5f5;
    	padding : 30px;
	  }
	  .box{
	    color: rgb(140, 158, 91);
	    text-align:center;
	  }
	  .file-upload{
	  	text-align:center;
	  }
	    /*파일 업로드 버튼 css*/
	  	.input-file-button{
		    font-family: "Raleway", sans-serif;
		    font-weight: 600;
		    font-size: 14px;
		    border-style : none;
		    margin-top: 6px;
		    margin-left : 10px;
	  		padding: 12px 32px;
		    border-radius: 5px;
		    border: 2px solid #1d284b;
		    transition: 0.3s;
		    line-height: 1;
	  		background-color: #1d284b;
	  		color : white;
	  		cursor: pointer;
	  		width: 150px;
		    letter-spacing: 1px;
	  	}
	  	#input-file{
	  		display: none;
	  	}
	  input.upload-name {
	    display: inline-block;
	    padding: 12px 32px;  /* label의 패딩값과 일치 */
	    font-size: inherit;
	    font-family: inherit;
	    line-height: normal;
	    vertical-align: middle;
	    background-color: #f5f5f5;
	    border: 1px solid #ebebeb;
	   	width : 500px;
	   	height: 38px;
	  }
	  .Btn{
	    position:relative;
	    left: 800px;
  		font-family: "Raleway", sans-serif;
	    font-weight: 600;
	    font-size: 14px;
	    border-style : none;
	    margin-top: 6px;
	    margin-left : 10px;
  		padding: 12px 32px;
	    border-radius: 5px;
	    border: 2px solid #1d284b;
	    transition: 0.3s;
	    line-height: 1;
  		background-color: #1d284b;
  		cursor: pointer;
  		width: 150px;
	    letter-spacing: 1px;
  		color : white;
  	  }
  	  
  </style>

</head>

<body>
	
	 <header id="header" class="fixed-top">
	    <div class="container d-flex align-items-center justify-content-between">
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
  </header><!-- End Header -->

<br><br><br><br><br><br><br>

    <main id="main">
        <div class="container">
		  <h2 class="box">게시글 수정</h2>
		  <div id="form">
			<!-- <form action ="" method="post" name="sportUpdate">
				 <select name="sportsName">
      					<option value="">종목선택</option>
      					<option value="">배구</option>
      					<option value="">축구</option>
      					<option value="">탁구</option>
      					<option value="">승마</option>
      					<option value="">농구</option>
      					<option value="">사이클</option>
      					<option value="">기타</option>
			      </select> -->
			     <form action = "/board/modify" method="post">
			     <input type="hidden" name="boardNo" value="${board.boardNo}">
			    	<input type="text" id="title" name="title" value = "${board.boardtitle }" maxlength="50" pattern=".{4,50}" placeholder="제목을 입력해주세요." size="70" required><br><br>
			    	<textarea rows="30" cols="100" id="editor" name="content" value="${board.boardConents }" placeholder="내용을 작성해주세요."></textarea>
					<div id="image_container"></div><br>
					<!-- 파일 수정 불가 
					<div class="file-upload">
						<input type="text" class="upload-name" readonly>
						<label class="input-file-button" for="input-file">파일 업로드</label>
						<input type="file" id="input-file" name="file" multiple="multiple">
					</div>
					-->
					<br><br>
			    	<button id="previewBtn" class="Btn">미리보기</button>
			   		<input type="submit" value="수정" class="Btn" onClick="onEnrollClick();">
			    	<input type="reset" value="취소" class="Btn">
				</form>
		</div>
   </main><br><br><br>
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
<script>
		ClassicEditor
		.create( document.querySelector( '#editor' ) )
		.catch( error => {
		    console.error( error );
		});
		
//등록 클릭이벤트
	function onEnrollClick() {
		var enrollResult = window.confirm("글이 수정되었습니다.");
		if(enrollResult) {
			console.log("Modify Y");
		}else{
			console.log("N");
		}
	}
	/* //파일 경로 무조건 C:\fakepath\
		$(function(){
			$('.upload-name').val('파일선택');
			$('#input-file').change(function(){
				var filename = $(this).val();
				$('.upload-name').val(filename);
			});
		}); */
</script>
</body>
</html>