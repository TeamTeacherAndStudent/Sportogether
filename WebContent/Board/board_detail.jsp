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
  	/*?????????, ????????? ????????? ?????????*/
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
<title>???????????????</title>
</head>

<body>

 <header id="header" class="fixed-top">
     <div class="container d-flex align-items-center justify-content-between">
		<!-- ????????? ?????? ?????? ?????? -->
     	<h1 class="logo"><a href="../index.html"> Sportogether </a></h1>
       <nav id="navbar" class="navbar">
        <ul>
          <li><a class="active" href="../Sports/sportsList.jsp">??????</a></li>
          <li><a href="../Board/board_main.jsp">???????????????</a></li>
          <li><a href="../Support/support_main.jsp">??????</a></li>
          <li><input type="search" placeholder="??????" size="10" id="search"></li>
            <li><a href="../login_registration/login.jsp">Login</a></li>
          <li class="dropdown"><a href="#"><span>SIDE MENU</span> <i class="bi bi-chevron-down"></i></a>
          <ul>
             <li><a href="../Notice/notice_main.jsp">????????????</a></li>     
             <li><a href="../MyPage/Mypage_Main.html">???????????????</a></li>
             <li><a href="../QnA/Qna_UserMain.html">1:1??????</a></li>
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
  			<h1 class="">???????????????</h1><br><br>
  			<fieldset>
	  			<div id="form">
					<div class="text">
							<div id="category"class="input-field">${requestScope.boardOne.sportsName }</div>
							<div id="title" class="input-field">${requestScope.boardOne.boardTitle }</div>
							<div id="writeInf" class="input-field">
								????????? : ${requestScope.boardOne.userId }<br>
								??????  : ${requestScope.boardOne.boardEnrollDate }<br>
								????????? : ${requestScope.boardOne.boardCount } <br>
								????????? : ${requestScope.boardOne.boardLike }
							</div><br>
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
    					<button type="submit" id="likeBtn" class="Btn" onclick="onLikeChange()">?????????</button>
                        <button type="submit"id="scrapBtn" class="Btn" onclick="onScrapChange();">?????????</button>
                        <button id="repostedBtn" class="Btn" onclick="onReportedBoardClick();">???????????????</button>
					</div><br><br>
	                <div id="BtnZip">
	                 	 <button type="submit" id="modifyBtn" class="Btn" onclick="onModifyClick();">??????</button>
	                 	 <button type="submit" id="reportedBtn" class="Btn" onclick="onRemoveClick();">??????</button>
	                 	 <button id="listBtn" class="Btn" onclick="location.href='/board/list'">??????</button>
					</div>
				<br><br>
				<div class="reply">
					<div class="row">
					<!-- ?????? ??????(????????? ??????????????????/ ????????? ?????? ???????????? ?????? -->
	                   <h3 class="subtitle">??????<h3></h3><hr><br>
						<form action="/boardReply/write" method="post">
		                        <div class="replyEnroll">
		                           	<input type="text" name="replyContents" id="comment" placeholder="????????? ??????????????????." maxlength="500" size="100">
									<input type="hidden" name="boardNo" value="${boardOne.boardNo}">
									<input type="submit" value="??????" class="Btn">
		                        </div>
						</form><br><br>
						<!-- ?????? -->
					<c:forEach items="${boardOne.replies }" var ="reply"> <!-- ????????? -->
					<div class="col-md-1">
                    	<div class="replyContents">
                    		?????????  ${requestScope.boardReply.boardReplyUserId }
                    	</div>
                    </div>
    				<div class="col-md-11">            
                  	  <div class="replyDate">
                   		${requestScope.boardReply.boardReplyDate }
                      </div>
                    </div>
                   	<div class="col-md-10">
	                    <div class="replyContent">
	                    	<p>${requestScope.boardReplyContents }</p>
	                    </div>
                    </div>
                    <div class="col-md-2">
                    	<a href="/boardReply/reported?boardNo=${BoardReply.boardNo }&boardReplyNo=${BoardReply.boardReplyNo }" id="repostedReply" onclick="onReportedReplyClick();">??????</a>
                    </div>
					</c:forEach>
				</div>
			</div>
		</div>
    </main><br><br><br><br>
    <!-- footer ????????? ????????? ?????? -->
	<div style="clear: both;"></div>
   <footer id="footer">
    <div class="container">
      <h3>SPORTOGETHER</h3>
      <!-- ?????? ??? ?????? -->
      <p>?????? ?????? ????????? ?????? ?????? ?????? ????????????.</p>
      <select name="sitezip" onchange="if(this.value) window.open(this.value);">
      	<option value="">?????? ????????? ????????????</option>
      	<option value="https://www.sports.or.kr/index.do">???????????????</option>
      	<option value="https://www.kspo.or.kr/kspo/main/main.do">????????????????????????</option>
      	<option value="https://www.koreanpc.kr/index.do">????????????????????????</option>
      	<option value="https://www.gb.go.kr/2021sports/sports.html">??????????????????</option>
      	<option value="http://k-scf.co.kr/">???????????????????????????</option>
      	<option value="http://www.kahperd.or.kr/">??????????????????</option>
      	<option value="https://www.sports.re.kr/front/main/main.do?menu_seq=0">?????????????????????</option>
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
 		if($(this).attr('class') == 'like'){
			location.href ="/like/update?boardNo=${requestScope.boardOne.boardNo }";
		}else{ 
			location.href="/like/delete?boardNo=${requestScope.boardOne.boardNo }";
		}
	}
	
	function onScrapChange(){
		$("#scrapBtn").toggleClass('scrap');
		if($(this).attr('class') == 'scrap'){
	//      ??????????????? ???????????? ???????????? ???????????????????????? ???????????? ??????
			location.href ="/scrap/update?boardNo=${requestScope.boardOne.boardNo }";
//			${sessionScope.Mypage.myScarap}
		}else{ 
			location.href="/scrap/delete?boardNo=${requestScope.boardOne.boardNo }";
		}
	}
	function onReportedBoardClick(){
		var reportedChk = window.confirm("?????? ???????????? ??????????????????????");
		var reportedBoard = document.getElementById("reportedBtn");  
		if(reportedChk) {
			window.alert("???????????? ?????????????????????");
			//????????? ??????????????? insert?????? ???
			reportedBoard.action = "/board/reported";
		}else{
			window.location.reload();//????????????
		}
	}
	function onReportedReplyClick(){
		var reportedChk = window.confirm("?????? ????????? ??????????????????????");
		if(reportedChk) {
			window.alert("????????? ?????????????????????");
		}else{
			window.location.reload();//????????????
		}
	}
	function onModifyClick(){
		location.href="/board/modify?boardNo='${requestScope.boardOne.boardNo }'"
	}
	function onRemoveClick(){
		var removeChk = window.confirm("?????? ?????? ?????????????????????????");
		if(removeChk) {
			location.href="/board/remove?boardNo='${requestScope.boardOne.boardNo }'";
			window.alert("?????? ?????????????????????");
		}else{
			window.location.reload();//????????????
		}
	}
</script>
</body>
</html>