<%@page import="qna.model.vo.QnA"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	List<QnA> qList = (List<QnA>)request.getAttribute("qList");
	String pageNavi = (String)request.getAttribute("pageNavi");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 포맷태그 식별 태그라이브러리  -->
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 목록</title>
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

h2 {
	padding: 5px 10px;
	border-bottom: 1px solid #848484;
	border-left: 8px solid #848484;
}
h4{
	text-align : center;
}

ul, li {
	list-style: none;
	text-align: center;
	padding: 0;
	margin: 0;
}

#mainWrapper {
	width: 950px;
	margin: auto;
	justify-content: center;
	vertical-align: middle;
	align-items: center;
}

#mainWrapper>ul>li:first-child {
	text-align: center;
	font-size: 14pt;
	height: 40px;
	vertical-align: middle;
	line-height: 30px;
}

#ulTable {
	margin-top: 10px;
}

#ulTable>li:first-child>ul>li {
	background: #165992;
	color: #fff;
	font-weight: bold;
	text-align: center;
}

#ulTable>li>ul {
	clear: both;
	padding: 0px auto;
	position: relative;
	min-width: 50px;
}

#ulTable>li>ul>li {
	float: left;
	font-size: 10pt;
	border-bottom: 1px solid silver;
	vertical-align: baseline;
}

#ulTable>li>ul>li:first-child {
	width: 10%;
} /*No 열 크기*/
#ulTable>li>ul>li:first-child+li {
	width: 45%;
} /*제목 열 크기*/
#ulTable>li>ul>li:first-child+li+li {
	width: 15%;
} /*작성일 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li {
	width: 15%;
} /*작성자 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li+li {
	width: 15%;
} /*추천수 열 크기*/
#divPaging {
	clear: both;
	margin: 0 auto;
	padding: 20px;
	width: 250px;
	height: 50px;
}

#divPaging>div {
	float: left;
	width: 30px;
	margin: 0 auto;
	text-align: center;
}

#back-btn {
	margin-left: 25%;
	margin-right: 25%;
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

#search {
	margin-left: 30px;
}
</style>
</head>
<body>
<!-- ======= Header ======= -->
	<header id="header" class="fixed-top">
		<div
			class="container d-flex align-items-center justify-content-between">
		<!-- 여기에 로고 사진 추가 -->
     	<h1 class="logo"><a href="/index.jsp"> Sportogether </a></h1>
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
			<c:if test="${sessionScope.userId ne null }">
				<a href="/member/logout">Logout</a>
			</c:if></li>
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
			</nav>
			<!-- .navbar -->

		</div>
	</header>
	<!-- End Header -->

	<!-- === Main ===  -->
	<main id="main">
		<section>
			<div id="main-title">
				<h1>1:1 문의 내역</h1>
				<c:if test="${sessionScope.userCode eq null}">
					<br><br></b><h4>--- 로그인을 하고 이용해주세요 ---</h4><br><br>
				</c:if>
			</div>
		</section>
					

	<c:if test="${sessionScope.userCode eq 'G'}">
		<div id="mainWrapper">

			<ul>
				<li>
					<ul id="ulTable">
						<li>
							<ul>
								<li>No</li>
								<li>제목</li>
								<li>작성일</li>
								<li>작성자</li>
								<li>답변대기</li>
							</ul>
						</li>
						
						
						<c:forEach items="${requestScope.qList}" var="qna">
						<li>
							<ul>
								<li>${qna.qnaNo}</li>
								<li class="left"><a href="/qna/detail?qnaNo=${qna.qnaNo}">${qna.qnaTitle}</a></li>
								<li><fmt:formatDate value="${qna.qnaDate}" pattern = "yyyy-MM-dd HH:mm" /></li>
								<li>${qna.userId}</li>
								<li>${qna.qnaAns}</li>
							</ul>
						</li>
						</c:forEach>
					</ul>
				</li>

				<li>
					<div id="divPaging">
					<%= pageNavi %>
					</div>
				</li>
	
			</ul>
		</div>
	</c:if>
	
	<c:if test="${sessionScope.userCode eq 'A'}">
		<div id="mainWrapper">
			<ul>
				<li>
					<ul id="ulTable">
						<li>
							<ul>
								<li>No</li>
								<li>제목</li>
								<li>작성일</li>
								<li>작성자</li>
								<li>답변대기</li>
							</ul>
						</li>
						
						
						<c:forEach items="${requestScope.qList}" var="qna">
						<c:if test="${sessionScope.userId eq qna.userId}">
						<li>
							<ul>
								<li>${qna.qnaNo}</li>
								<li class="left"><a href="/qna/detail?qnaNo=${qna.qnaNo}">${qna.qnaTitle}</a></li>
								<li><fmt:formatDate value="${qna.qnaDate}" pattern = "yyyy-MM-dd HH:mm" /></li>
								<li>${qna.userId}</li>
								<li>${qna.qnaAns}</li>
							</ul>
						</li>
						</c:if>
						</c:forEach>
					</ul>
				</li>

				<li>
					<div id="divPaging">
					<%= pageNavi %>
					</div>
				</li>

			</ul>
		</div>
	</c:if>	
	

	
	<c:if test="${sessionScope.userCode ne null}">
		<section>
			<div id="back-btn">
				<a href="/qna/write"><button>글쓰기</button></a>
			</div>
		
		</section>
	</c:if>	
		<!-- (관리자만)검색 ///우선 여기에 해서 테스트.. -->
		<c:if test="${sessionScope.userCode eq 'G'}">
		<section>
		<form action="/qna/search" method="get">
			<ul>
				<li id='liSearchOption'>
					<div>
<!-- 						<select id='selSearchOption' name="select">
							<option value='A'>제목+내용</option>
							<option value='T'>제목</option>
							<option value='C'>내용</option>
						</select>  -->
						<input type="text" id='txtKeyWord' name="searchKeyword" /> <input type="submit" id="search-btn" value='검색' />
					</div>
				</li>
			</ul>
		</form>
		</section>
		</c:if>

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
</body>
</html>