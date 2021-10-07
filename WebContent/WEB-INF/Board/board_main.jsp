<%@page import="board.model.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
        List<Board> bList = (List<Board>)request.getAttribute("bList");
		String pageNavi = (String)request.getAttribute("pageNavi");
		 
%>
<!-- 포맷태그 식별 태그라이브러리  -->
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

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
  <style>
     }
  	#main{
	    width: 100%;
	}
    #search{
    	margin-left: 30px;
    }
	.page{
	    color: rgb(140, 158, 91);
	    font-weight: bold;
	}
	h2{
	  padding: 5px 10px;
	  border-bottom:1px solid #848484;
	  border-left:8px solid #848484;
	}
	
	ul, li{ 
	    list-style:none;
	    text-align:center;
	    padding:0;
	    margin:0;
	}
	
	#mainWrapper{
	    width: 950px;
	    margin: 0 auto; 
	}
	
	#mainWrapper > ul > li:first-child {
	    text-align: center;
	    font-size:14pt;
	    height:40px;
	    vertical-align:middle;
	    line-height:30px;
	}
	
	#ulTable {margin-top:10px;}
	
	
	#ulTable > li:first-child > ul:first-child > li {
	    background-color:#c9c9c9;
	    font-weight:bold;
	    text-align:center;
	}
	
	#ulTable > li > ul {
	    clear:both;
	    padding:0px auto;
	    position:relative;
	    min-width:50px;
	}
	#ulTable > li > ul > li { 
	    float:left;
	    font-size:10pt;
	    border-bottom:1px solid silver;
	    vertical-align:baseline;
	}    
	
	#ulTable > li > ul > li:first-child               	   {width:10%;} /*No 열 크기*/
	#ulTable > li > ul > li:first-child +li                {width:10%;} /*종목 열 크기*/
	#ulTable > li > ul > li:first-child +li+li             {width:30%;} /*제목 열 크기*/
	#ulTable > li > ul > li:first-child +li+li+li          {width:20%;} /*작성일 열 크기*/
	#ulTable > li > ul > li:first-child +li+li+li+li       {width:10%;} /*작성자 열 크기*/
	#ulTable > li > ul > li:first-child +li+li+li+li+li    {width:10%;} /*추천수 열 크기*/
	#ulTable > li > ul > li:first-child +li+li+li+li+li+li {width:10%;} /*조회수 열 크기*/
	
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
	
	#writeBtn{
		position : relative;
		left: 430px;
		text-align:center;
	}
	.Btn{
	    font-family: "Raleway", sans-serif;
	    font-weight: 600;
	    font-size: 14px;
	    border-style : none;
  		padding:12px 5px;
	    border-radius: 5px;
	    border: 1px solid #1d284b;
	    transition: 0.3s;
	    line-height: 1;
  		background-color: #1d284b;
  		cursor: pointer;
  		width: 100px;
	    letter-spacing: 1px;
  		color : white;
	}
	
	#selectSports{
		margin: 0px;
		float: right;
		font-size : 15px;
	}
	#searchType{
		height: 40px;
		width:120px;
		text-align : center;
	}
	#KeyWord{
		height:38px;
		width: 300px;
	}
  </style>
<title>자유게시판 </title>
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
         <!--  <li><input type="search" placeholder="검색" size="10" id="search"></li> -->
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
<br><br><br><br>
    <main id="main">
        <div id="mainWrapper">
            <ul>
                <li>
                    <h1 class="page">자유게시판</h1>
   <!--                  <select id="selectSports" name="sportsZip">
      					<option value="">종목선택</option>
      					<option value="">배구</option>
      					<option value="">축구</option>
      					<option value="">탁구</option>
      					<option value="">승마</option>
      					<option value="">농구</option>
      					<option value="">사이클</option>
      					<option value="">기타</option>
     				</select> -->
           			<br>
                    <ul id ="ulTable">
                        <li>
                        	<ul>
                                <li>No</li>
                                <li class="sports">종목</li>
                                <li>제목</li>
                                <li>작성일</li>
                                <li>작성자</li>
                                <li>조회수</li>
                                <li>추천수</li>
                            </ul>
                            <c:forEach items="${requestScope.bList}" var="board">
                            <ul>
                            	 <li>${board.boardNo}</li>
                            	 <li class="sports">${board.sportsName}</li>
								 <li><a href="/board/detail?boardNo=${board.boardNo}">${board.boardTitle}</a></li>
								 <li><fmt:formatDate pattern = "yyyy-MM-dd HH:mm" value="${board.boardEnrollDate}"></fmt:formatDate></li>
								 <li>${board.userId}</li>
								 <li>${board.boardCount}</li>
								 <li>${board.boardLike}</li>					
                            </ul>
							</c:forEach>
                        </li>
                    </ul>
                </li>
                <li>
                    <div id="divPaging">
                    	<%= pageNavi %>
                    </div>
                </li>
                <c:if test="${sessionScope.userId ne null }">
                <li><button type="submit" id="writeBtn" class="Btn" onclick="location.href='/board/write'">글쓰기</button><li>
                </c:if>
<!--                 <form action ="/board/write" method="get"> -->
<!--                 	<input type="submit" value="글작성"  id="writeBtn" class="Btn"> -->
<!--                 </form> -->
                <li id='liSearchOption'>
                    <div>
                  	<form action="/board/search" method="get">
                        <select id="searchType" name="type">
                            <option value='A'>제목+내용</option>
                            <option value='T'>제목</option>
                            <option value='C'>내용</option>
                        </select>
                        <input type="text" id='keyWord' name="keyWord">
                        <input type='submit' value='검색' class="Btn">
                	 </form>
                     </div>
                 </li>
            </ul>
        </div>
    </main>

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
</body>
</html>