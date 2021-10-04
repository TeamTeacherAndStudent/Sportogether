<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		border: 1px solid silver;
		width: 100%;
		float: left;
	}
	#category{
		display: inline-block;
	/*	float: left; */
		margin-right: 10px;
		width: 80%;
		border: 1px solid red;
		float: left;
	}
	#writeInf{
		margin-left: 10px;
		width: 100%;
		float: left;
		margin-bottom : 30px;
	
	}
  	.input-field{
  		display: inline-block;
  		float: left;
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
  	 #search{
		   margin-left: 30px;
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
<br><br><br><br><br>
    <main id="main">
  		<div class="container">
  			<h1 class="">자유게시판</h1><br><br>
  			<fieldset>
	  			<div id="form" class="row">
					<div class="text">
						<input type="hidden" value="${requestScope.boardOne.boardNo }">
						<div class = "col-lg-2">
							<div id="category"class="input-field">${requestScope.boardOne.sportsName }</div>
						</div>
						<div class="col-lg-7">	
							<div id="title" class="input-field">${requestScope.boardOne.boardTitle }</div>
						</div>
						<div class="col-lg-3">	
							<div id="writeInf" class="input-field">
								작성자 : ${requestScope.boardOne.userId }<br>
								날짜  : ${requestScope.boardOne.boardEnrollDate }<br>
								조회수 : ${requestScope.boardOne.boardCount } <br>
								추천수 : ${requestScope.boardOne.boardLike }<br>
							</div>
						</div><br><br>
							<div id="content">
								${requestScope.boardOne.boardContents }
							</div><br>
							<hr>
							<div class="file-download">
								${requestScope.boardOne.files }
							</div><br><hr>
					</div>
				</div>
			</fieldset>
					<div id="center-btn">
    					<button type="submit" id="likeBtn" class="Btn" onclick="onLikeChange()">좋아요</button>
                        <button type="submit"id="scrapBtn" class="Btn" onclick="onScrapChange();">스크랩</button>
                        <button id="reportBtn" class="Btn" onclick="onReportedBoardClick();">게시글신고</button>
					</div><br><br>
	                <div id="BtnZip">
	                	<c:if test="${sessionScope.userId eq boardOne.userId }">
	                 	 <button type="submit" id="modifyBtn" class="Btn" onclick="onModifyClick();">수정</button>
	                 	 <button type="submit" id="removeBtn" class="Btn" onclick="onRemoveClick();">삭제</button>
						</c:if>
	                 	 <button id="listBtn" class="Btn" onclick="location.href='/board/list'">목록</button>
					</div>
				<br><br>
				<div class="reply">
					<div class="row">
					<!-- 버튼 숨김(등록시 수정안보이게/ 수정시 등록 안보이게 정렬 -->
	                   <h3 class="subtitle">댓글<h3></h3><hr><br>
						<form action="/boardReply/write" method="post">
		                        <div class="replyEnroll">
		                           	<input type="text" name="replyContents" id="comment" placeholder="댓글을 입력해주세요." maxlength="500" size="100">
									<input type="hidden" name="boardNo" value="${boardOne.boardNo}">
									<input type="submit" value="등록" class="Btn">
		                        </div>
						</form><br><br>
						<!-- 출력 -->
					<c:forEach items="${boardOne.replies }" var ="reply"> <!-- 반복문 -->
						<div class="col-md-1">
	                    	<div class="replyContents">
	                    		작성자  ${reply.boardReplyUserId }
	                    	</div>
	                    </div>
	    				<div class="col-md-11">            
	                  	  <div class="replyDate">
	                   		${reply.boardReplyDate }
	                      </div>
	                    </div>
	                   	<div class="col-md-9">
		                    <div class="replyContent">
		                    	${reply.boardReplyContents }
		                    </div>
	                    </div>
	                    <div class="col-md-1">
	                    	<a href="/boardReply/delete?boardNo=${reply.boardNo }&boardReplyNo=${reply.boardReplyNo }" id="removeReply" onclick="onRemoveReplyClick();">삭제</a>
	                    </div>
	                    <div class="col-md-2">
	                    	<a href="/boardReply/reported?boardNo=${reply.boardNo }&boardReplyNo=${reply.boardReplyNo }" id="repostedReply" onclick="onReportedReplyClick();">신고</a>
	                    </div><hr>
					</c:forEach>
				</div>
			</div>
		</div>
    </main><br><br><br><br>
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
		$("#likeBtn").toggleClass('like');
		var boardNo = "${requestScope.boardOne.boardNo }";
 		if($(this).attr('class') == 'like'){
			location.href ="/like/update?boardNo="+boardNo;
		}else{ 
			location.href="/like/delete?boardNo="+boardNo;
		}
	}
	
	function onScrapChange(){
		$("#scrapBtn").toggleClass('scrap');
		var boardNo = "${requestScope.boardOne.boardNo }";
		if($(this).attr('class') == 'scrap'){
	//      마이페이지 세션으로 넘어가서 마이스크랩목록에 보여지게 하기
			location.href = "/scrap/update?boardNo="+boardNo;
		}else{ 
			location.href ="/scrap/delete?boardNo="+boardNo;
		}
	}
	function onReportedBoardClick(){
		var reportedChk = window.confirm("해당 게시물을 신고하겠습니까?");
		var boardNo = "${requestScope.boardOne.boardNo}"
		if(reportedChk) {
			<c:if test="${sessionScope.userId eq null }">
				location.href = "/board/reported"+boardNo; //관리자 신고리스트servlet들어가기
				window.alert("게시물이 신고되었습니다");
			</c:if> 
			<c:if test="${sessionScope.userId ne null }">
				window.alert("로그인 후 이용할 수 있습니다.");
			</c:if>
		}else{
			return
		}
	}
	function onReportedReplyClick(){
		var reportedChk = window.confirm("해당 댓글을 신고하겠습니까?"); 
		var boardNo = "${requestScope.boardOne.boardNo}";
		if(reportedChk) {
			<c:if test="${sessionScope.userId eq null }">
			 	location.href="#"; //신고리스트servlet에 들어가기
				window.alert("댓글이 신고되었습니다");
			</c:if>
			<c:if test="${sessionScope.userId ne null }">
				window.alert("로그인 후 이용할 수 있습니다.");
			</c:if>
		}else{
			return
		}
	}
	
	function onModifyClick(){
		var boardNo = '${requestScope.boardOne.boardNo }';
		location.href="/board/modify?boardNo="+boardNo;
	}
	
	function onRemoveClick(){
		var removeChk = window.confirm("해당 글을 삭제하시겠습니까?");
		var remove = document.getElementById("removeBtn");
		var boardNo = '${requestScope.boardOne.boardNo }';
		if(removeChk) {
			location.href ="/board/remove?boardNo="+boardNo;
			window.alert("글이 삭제되었습니다");
		}else{
			window.alert("로그인 후 이용해주세요.");
		}
	}
</script>
</body>
</html>