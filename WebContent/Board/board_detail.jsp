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
  <script src = "../assets/js/main.js"></script>
  <script src = "../assets/js/jquery-1.12.3.min.js"></script>
  <script src = "../assets/js/jquery.counterup.min.js"></script>
  <script src = "../assets/js/waypoints.min.js"></script>
	<!-- jQuery  CDN -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
  <style>
  	#main{
   	 width: 100%;
	}
	h1{
		color: rgb(140, 158, 91);
	    font-weight: bold;
	    text-align:center;
	}
	.subtitle{
		color: rgb(140, 158, 91);
	}
	.text{
		text-align:center;
	}
  	.Btn{
  		font-family: "Raleway", sans-serif;
	    font-weight: 600;
	    font-size: 14px;
	    border-style : none;
	    margin-top: 6px;
	    margin-left : 10px;
  		padding: 12px 10px;
	    border-radius: 5px;
	    border: 1px solid;
	    transition: 0.3s;
	    line-height: 1;
  		background-color: #1d284b;
  		cursor: pointer;
  		width: 100px;
	    letter-spacing: 1px;
  		color : white;
  	}
	#title{
		display: inline-block;
	/*	float: left; */
		margin-right: 10px;
	}
	#category{
		display: inline-block;
	/*	float: left; */
		margin-right: 10px;
	}
	
  	.input-field{
  		display: inline-block;
  		text-align: center;
  	}
  	#center-btn{
  		 display: flex;
 		 justify-content: center;
  	}
  	#BtnZip {
  		text-align : right;
  	}
  	/*스크랩, 좋아요 클릭시 색변경*/
  	.like {
  		background-color : #FF6666;
  	    border : 1px solid #1d284b;
  	}
  	.scrap{
  		color : #1d284b;
  		background-color: #FFFFCC;
  	}
  	hr{
  	
  	}
  </style>
<title>자유게시판</title>
</head>

<body>

 <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center justify-content-between">
<!-- 여기에 로고 사진 추가 -->
      <h1 class="logo"><a href="../index.html"> Sportogether </a></h1>
      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="active" href="../Sports/sportsList.jsp">종목</a></li>
          <li><a href="board_main.jsp">자유게시판</a></li>
          <li><a href="../Support/support_main.jsp">후원</a></li>
          <li><input type="search" placeholder="검색" size="5"></li>
          <li class="dropdown"><a href="#"><span>SIDE MENU</span> <i class="bi bi-chevron-down"></i></a>
          <ul>
             <li><a href="../Notice/noticelist.html">공지사항</a></li>     
             <li><a href="../MyPage/Mypage_Main">마이페이지</a></li>
             <li><a href="">1:1문의</a></li>
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
  			<h1 class="">자유게시판</h1><br><br>
  			<fieldset>
	  			<div id="form">
					<div class="text">
						<form action ="" method="post" name="sportEnroll" target="_self">
							<fieldset>
							<input type="text" id="category" class="input-field" size="10">
							<input type="text" id="title" class="input-field" size="50">
							<div id="writeInf" class="input-field">
								작성자  
								날짜 
								조회수 
								추천 	
							</div></fieldset><br>
							<textarea id="content" name="boardContent" cols="100" rows="30"></textarea><br>
							<hr>
							<div class="file-download">
							첨부파일 자리
							</div><br><hr>
						</form>
					</div>
				</div>
			</fieldset>
					<div id="center-btn">
    					<button id="likeBtn" class="Btn" onclick="onLikeChange()">좋아요</button>
                        <button id="scrapBtn" class="Btn" onclick="onScrapChange();">스크랩</button>
                        <button id="repostedBtn" class="Btn" onclick="onRepostedContentClick();">게시글신고</button>
					</div><br><br>
	                <div id="BtnZip">
	                 	 <a href=""><button type="button" id="list" class="Btn">수정</button></a>
	                 	 <button type="button" id="list" class="Btn" onclick="onRemoveClick();">삭제</button>
	                 	 <a href="board_main.jsp"><button type="button" id="list" class="Btn">목록</button></a>
					</div>
				<br><br>
				<div class="reply">
					<div class="row">
					<!-- 버튼 숨김(등록시 수정안보이게/ 수정시 등록 안보이게 정렬 -->
						<form action="" method="post">
	                      	<h3 class="subtitle">댓글<h3></h3><hr><br>
	                        <div class="replyEnroll">
	                           	<input type="text" name="replyContents" id="comment" placeholder="댓글을 입력해주세요." maxlength="500" size="100">
								<input type="submit" value="등록" class="Btn">
	                        </div>
						</form><br><br>
					<div class="col-md-1">
                    	<div class="replyContents">
                    		작성자
                    	</div>
                    </div>
    				<div class="col-md-11">            
                  	  <div class="replyDate">
                    	2021/09/30 12:00:03
                    	</div>
                    </div>
                   	<div class="col-md-10">
	                    <div class="replyContent">
	                    	<p>댓글내용</p>
	                    </div>
                    </div>
                    <div class="col-md-2">
                    	<a href="" id="repostedReply" onclick="onRepostedClick();">신고</a>
					</div><hr>
					<div class="col-md-1">
                    	<div class="replyContents">
                    		작성자
                    	</div>
                    </div>
    				<div class="col-md-11">            
                  	  <div class="replyDate">
                    	2021/09/30 12:00:03
                    	</div>
                    </div>
                   	<div class="col-md-10">
	                    <div class="replyContent">
	                    	<p>댓글내용</p>
	                    </div>
                    </div>
                    <div class="col-md-2">
                    	<a href="" id="repostedReply" onclick="onRepostedClick();">신고</a>
					</div><hr>
				</div>
			</div>
		</div>
    </main>
    <!-- footer 옆으로 넘어감 방지 -->
	<div style="clear: both;"></div>
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

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<script>
	function onLikeChange(){
		$('#likeBtn').addClass('like');
		if($(this).attr("checked", true)){
				$(this).removeClass('like');
		}else if($(this).attr("checked", false)){
				$(this).addClass('like');
		}
		
		/* var likeClick = document.getElementById("likeBtn")
		if(likeClick) {
			likeClick.style.backgroundColor = "#FF6666";
			likeClick.style.border = "1px solid #1d284b";
		}else{
			
		} */
	}
	function onScrapChange(){
		var scrapClick = document.getElementById("scrapBtn");
		scrapClick.style.backgroundColor="#FFFF66";
		scrapClick.style.color = "#1d284b";
	}
	function onRepostedContentClick(){
		var repostedChk = window.confirm("해당 게시물을 신고하겠습니까?");
		if(repostedChk) {
			console.log("Y");
		}else{
			console.log("N");
		}
	}
	function onRepostedClick(){
		var repostedChk = window.confirm("해당 댓글을 신고하겠습니까?");
		if(repostedChk) {
			console.log("Y");
		}else{
			console.log("N");
		}
	}
	function onRemoveClick(){
		var removeChk = window.confirm("해당 글을 삭제하시겠습니까?");
		if(removeChk) {
			console.log("Y");
		}else{
			console.log("N");
		}
	}
</script>
</body>
</html>