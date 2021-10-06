<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- +선수/일반 회원 들급 변경 /유저 아이디(닉네임) 검색 기능 추가 / 페이징 처리 추가--%>
    <%-- 회원삭제 버튼 클릭시 회원 정보 삭제 처리페이지로 이동(member_remove_action.jsp --%>
	<%-- css 보정 검색창 위치변경/ 검색창 바탕색변경 / 테이블 css손보기 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원 관리(전체 회원 정보 조회)</title>
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
  		/*제목*/
	h1{
	    vertical-align:middle;
	    line-height:30px;
   		color: rgb(140, 158, 91);
   		font-weight: bold;
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
		height: 35px;
		line-height: 35px;
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
		height: 40px;
		line-height:40px;
		float:left;
		font-size:10pt;
		border-bottom:1px solid #ededed;
		vertical-align:baseline;
	}
	.ulTable > li > ul > li:first-child                {width:10%;} /*체크박스 열 크기*/
	.ulTable > li > ul > li:first-child +li            {width:10%;} /*No 열 크기*/
	.ulTable > li > ul > li:first-child +li+li         {width:20%;} /*아이디 열 크기*/
	.ulTable > li > ul > li:first-child +li+li+li      {width:20%;} /*닉네임 열 크기*/
	.ulTable > li > ul > li:first-child +li+li+li+li   {width:20%;} /*가입일 열 크기*/
	
	
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
	#liSearchOption {clear:both;}
	#liSearchOption > div {
	    margin:0 auto; 
	    margin-top: 30px; 
	    width:auto; 
	    height:100px;
	
	}
	/* #search-field{
		margin-left: 3px;
		margin-right: 3px;
		margin:0 auto;
		text-align:center;
		align-items: center;
	} */
	#selSearchOption{
		height: 38px;
		width: 120px;
	}
	#txtKeyWord {
		width: 180px;
		height: 38px;
		margin-top: 2px;
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
	#removeBtn {
		position: relative;
		left: 300px;
	}
	 #search{
       margin-left: 30px;
    }
</style>
</head>
<body>
		 <header id="header" class="fixed-top">
	    <div class="container d-flex align-items-center justify-content-between">
         <!-- 여기에 로고 사진 추가 -->
         <h1 class="logo">
            <a href="../index.jsp"> Sportogether </a>
         </h1>
         <nav id="navbar" class="navbar">
            <ul>
               <li><a class="active" href="../Sports/sportsList.jsp">종목</a></li>
               <li><a href="/board/list">자유게시판</a></li>
               <li><a href="/support/list">후원</a></li>
               <li><input type="search" placeholder="검색" size="10"
                  id="search"></li>
               <li><a href="../login_registration/login.jsp">Login</a></li>
               <li class="dropdown"><a href="#"><span>SIDE MENU</span> <i
                     class="bi bi-chevron-down"></i></a>
                  <ul>
                     <li><a href="/notice/list">공지사항</a></li>
                     <li><a href="/mypage/main">마이페이지</a></li>
                     <li><a href="/qna/list">1:1문의</a></li>
                  </ul></li>
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
         </nav><!-- .navbar -->
    </div>
  </header><!-- End Header -->
  <br><br>
  <main id="main">
		<section id="membermanage">
<!-- 모든 값을 출력해준다 memberDTO list로 불러와서 selectAllMember() -->
			<div class="container">
				<h1>전체 회원 관리</h1><br><br>
				<ul class="ulTable">
					<li>
						<ul>
<!-- 							<li><input type="checkbox" name="" value="all" id="chk_all"></li> -->
							<li>아이디</li>
							<li>닉네임</li>
							<li>가입일</li>
						</ul>
					</li>
					<c:forEach items="${requestScope.mList}" var="member" varStatus="index">
					<li>
						<ul>
<!-- 						<li><input type="checkbox" name="" value="vallyball" class="one-chk"></li> -->
							<li><a href="/mypage/modify?useId=${member.userId}">${member.userId}</a></li>
							<li>${member.userNickName}</li>
							<li>${member.userEnrollDate}</li>
						</ul>
					</li>
					</c:forEach>
					<li>
						<div id="divPaging">
							<div>◀</div>
							<div><b>1</b></div>
							<div>2</div>
							<div>3</div>
							<div>4</div>
							<div>5</div>
							<div>▶</div>
						</div>
					</li>
					<li>
							<button id="removeBtn" class="Btn" onclick="onRemoveClick()">회원탈퇴</button>
					</li><br><br><br>
					<li id='liSearchOption'>
	                    <div>
	                        <select id='selSearchOption' >
	                            <option value='nick'>닉네임</option>
	                            <option value='id'>아이디</option>
	                        </select>
	                        <input id='txtKeyWord' />
	                        <input class="Btn" type='button' value='검색'/>
	                    </div>
		            </li>
				</ul>
			</div><br><br>
		</section>
	</main>
	<br><br><br>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script>
		function onRemoveClick(){
			var removecheck = window.confirm("회원을 탈퇴시키겠습니까?");
			if(removecheck) {
				console.log("네");
			}else {
				console.log("아니오");
			}
		}
		$(document).on('click','#chk_all',function(){
			if($('#chk_all').is(':checked')){
				$('.one-chk').prop('checked',true);
			}else{
				$('.one-chk').prop('checked',false);
			}
		});
		$(document).on('click','one-chk',function(){
			if($('input[class=one-chk]:checked').length==$('one-chk').legth){
				$('#chk_all').prop('checked',true);
			}else{
				$('#chk_all').prop('checked',false);
			}
		});
	</script>
</body>
</html>