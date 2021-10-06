<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 캠페인 관리</title>
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
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<style>
	 		/*제목*/
	h1{
	    vertical-align:middle;
	    line-height:30px;
   		color: rgb(140, 158, 91);
	    text-align: center;
	}
	.ulTable {
		margin-top:10px;
		text-align: center;
		list-style: none;
	}
	
	.ulTable > li:first-child > ul > li {
		list-style: none;
		background-color:#c9c9c9;
		font-weight:bold;
		text-align:center;
		height: 30px;
		line-height: 30px;
		font-size : 15px;
	}
	
	.ulTable > li > ul {
		list-style: none;
		clear:both;
		padding:0px auto;
		position:relative;
		min-width:50px;
	}
	.ulTable > li > ul > li {
		float:left;
		font-size:10pt;
		border-bottom:1px solid #ededed;
		vertical-align:baseline;
		height: 35px;
		line-height: 35px;
	}
	.ulTable > li > ul > li:first-child                  {width:10%;} /*체크박스 열 크기*/
	.ulTable > li > ul > li:first-child +li              {width:10%;} /*캠페인 번호 열 크기*/
	.ulTable > li > ul > li:first-child +li+li           {width:30%;} /*캠페인 이름크기*/
	.ulTable > li > ul > li:first-child +li+li+li        {width:30%;} /*선수이름 열 크기*/
	.ulTable > li > ul > li:first-child +li+li+li+li     {width:20%;} /*캠페인 게시일자 열 크기*/
	
	#divPaging {
		clear:both;
		margin:0 auto;
		width:220px;
		height:50px;
	}
	
	#divPaging > div {
		float:left;
		width: 30px;
		margin:0 auto;
		text-align:center;
	}
	.Btn{
		font-family: "Raleway", sans-serif;
	    font-weight: 600;
	    font-size: 14px;
	    border-style : none;
	    margin-left : 5px;
  		padding: 11px 32px;
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
	.Btn{
		font-family: "Raleway", sans-serif;
	    font-weight: 600;
	    font-size: 14px;
	    border-style : none;
	    margin-left : 5px;
  		padding: 12px 12px;
	    border-radius: 5px;
	    border: 2px solid #1d284b;
	    transition: 0.3s;
	    line-height: 0;
  		background-color: #1d284b;
  		cursor: pointer;
  		width: 80px;
	    letter-spacing: 1px;
  		color : white;
  		position: relative;
  		float: right;
  		margin-right: 100px;
	}
	#deleteBtn{
		height:32px
	}
/* 	.deleteBtn{ */
/* 		font-family: "Raleway", sans-serif; */
/* 		    font-weight: 600; */
/* 		    font-size: 12px; */
/* 		    border-style : none; */
/* 		    margin-top: 2px; */
/* 	  		padding: 7px 7px; */
/* 		    border-radius: 5px; */
/* 		    border: 1px solid #1d284b; */
/* 		    transition: 0.3s; */
/* 	  		background-color: #1d284b; */
/* 	  		cursor: pointer; */
/* 	  		width: 50px; */
/* 		    letter-spacing: 1px; */
/* 	  		color : white; */
/* 	  		height: 25px; */
/* 	} */
	 #search{
		   margin-left: 30px;
		}
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
  <br><br>
  <!-- =======본문======== -->
	 <main id="main">
		<section id="supportDelete">
			<div class="container">
				<h1>캠페인 관리</h1><br><br>
				<ul class="ulTable">
       			<li>
					<ul>
<!-- 						<li><input type="checkbox" name="" value="all" id="chk_all"></li> -->
						<li>번호</li>
						<li>캠페인 이름</li>
						<li>작성자</li>
						<li>캠페인 게시일자</li>
						<li>삭제</li>
					</ul>
				</li>
				<c:forEach items="${requestScope.sList }" var= "support" varStatus="index">
						<li>
							<ul>
								
								<li>${support.supportNo }</li>
								<li><a style= "color: black;"   href = "/support/detail?supportNo=${support.supportNo }">${support.supportTitle }</a></li>
								<li>${support.supportWriter }</li>
								<li><fmt:formatDate value="${support.supportRegDate }" pattern="yyyy/MM/dd HH:mm"/></li>
							
								<li>
									<button class="Btn" id = "deleteBtn" onclick="onDeleteClick();" value = "${support.supportNo }">삭제</button>
								</li>
							</ul>
						</li>
					</c:forEach>	
				</ul>
			</div>
			<br>
			<div id="divPaging">
			${requestScope.pageNavi }
			</div>
<!-- 			<button id="removeBtn" class="Btn" onclick="onRemoveClick()">삭제</button> -->
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
	<script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script>
	function onDeleteClick(){
		var deleteConfirm = window.confirm("해당 캠페인을 삭제하시겠습니까?");
		var supportNo = $("#deleteBtn").val();
		if(deleteConfirm){
			location.href ="/support/remove?supportNo="+supportNo;
			window.alert("삭제되었습니다.");
		}else{
			window.alert("취소하였습니다.")
		}
	}
// 	function onRemoveClick(){
// 		var removecheck = window.confirm("캠페인을 삭제하겠습니까?");
// 		if(removecheck) {
// 			console.log("네");
// 		}else {
// 			console.log("아니오");
// 		}
// 	}
// 	$(document).on('click','#chk_all',function(){
// 		if($('#chk_all').is(':checked')){
// 			$('.one-chk').prop('checked',true);
// 		}else{
// 			$('.one-chk').prop('checked',false);
// 		}
// 	});
// 	$(document).on('click','one-chk',function(){
// 		if($('input[class=one-chk]:checked').length==$('one-chk').legth){
// 			$('#chk_all').prop('checked',true);
// 		}else{
// 			$('#chk_all').prop('checked',false);
// 		}
// 	});
	</script>
</body>
</html>