<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠페인 리스트</title>

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
  	.list{
  		
  	}
  	.card-img-top{
  		height :  200px;
  	}
  	#paging{
 	 	padding-top : 100px; 	
  	}
  	
  	td{
  		padding : 30px;
  		}
  	a{
  		text-decoration: none;
  		color:black;
  		hover : black;
  	}
  	a:hover{
		 color : black;  	
  	}
  	span {
  		font-size: 11px;
  	}
  	.camp{
  		
  	}
  	.button-wrap{
  		float:right;
  		
  	}
  	.card {
  		margin:14px;
  	}
  	#campbtn{
  		background-color : #1d284b;
  		border-style: none;
  		border-color: #1d284b;
  	}
  	#search{
    	margin-left: 30px;
    }
  </style>
</head>
<body>
 <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
   <div class="container d-flex align-items-center justify-content-between">
      <h1 class="logo"><a href="/index.jsp"> Sportogether </a></h1>
      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="active" href="/Sports/sportsList.jsp">종목</a></li>
          <li><a href="/board/list">자유게시판</a></li>
          <li><a href="/support/list">후원</a></li>
          <li><input type="search" placeholder="검색" size="10" id="search"></li>
       	  <li>
       	  	<c:if test="${sessionScope.userId eq null }">
       	 		 <a href="/login_registration/login.jsp">Login</a>
       	 	</c:if>
       	 	<c:if test = "${sessionScope.userId ne null }">
       	 		<a href="/member/logout">Logout</a>
       	 	</c:if>
       	  </li>
          <li class="dropdown"><a href="#"><span>SIDE MENU</span> <i class="bi bi-chevron-down"></i></a>
          <ul>
             <li><a href="/notice/list">공지사항</a></li>     
             <li><a href="../MyPage/MyPage_Main.jsp">마이페이지</a></li>
             <li><a href="/qna/list">1:1문의</a></li>
          </ul>
          </li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->
  <br><br><br><br>
  
  

 <section class="evnet-list">
  <div class="container list">
  <h2>후원</h2>
  <div class="row row-cols-1 row-cols-md-4 g-8">
  <c:forEach items="${requestScope.sList }" var = "support" varStatus="index" >
  <div class="col">
    
    <a href="/support/detail?supportNo=${support.supportNo }"><div class="card text-center" style="width: 18rem;">
			  <img src="/upload/${support.supportFileName }" class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title">${support.supportTitle }</h5>
			    <p class="card-text">${support.supportIntro }</p>
			   
				<p class="card-text">NOW : ${support.supportAchived } WON</p>
					<!-- 그래프 -->
				<div class="progress">
					<div class="progress-bar bg-warning" role="progressbar" background-color ="yellow" style="width: ${(support.supportAchived / support.supportGoal)*100 }%"
					 ></div>
				</div>
					<!-- 달성률 text -->	    
				<span>${(support.supportAchived / support.supportGoal)*100 } %</span><br>
			    
			    <span class= "card-text">기한 : ${support.supportEndDate }</span><br>
			    
			  </div>
			</div></a>
      
    </div>
    </c:forEach>
  </div>
  
  
</div>
</section>
<!--   <table > -->
  
<!-- 	<tr> -->
<!-- 		<td> -->
<!-- 			<a href="none"><div class="card text-center" style="width: 18rem;"> -->
<!-- 			  <img src="data:image/jpeg;base64,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" class="card-img-top" alt="..."> -->
<!-- 			  <div class="card-body"> -->
<!-- 			    <h5 class="card-title">Card title</h5> -->
<!-- 			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
			   
<!-- 				<p class="card-text">NOW : 1,000,000 WON</p> -->
<!-- 					그래프 -->
<!-- 				<div class="progress"> -->
<!-- 					<div class="progress-bar bg-warning" role="progressbar" background-color ="yellow" style="width: 95%" ></div> -->
<!-- 				</div> -->
<!-- 					달성률 text	     -->
<!-- 				<span>50%</span><br> -->
			    
<!-- 			    <span class= "card-text">기한 : 2021-10-08</span><br> -->
			    
<!-- 			  </div> -->
<!-- 			</div></a> -->
<!-- 		</td> -->
<section class="container text-center">
	<div>
		${requestScope.pageNavi }
	</div>
	<div>
  	<div class="button-wrap">
  		<c:if test="${sessionScope.userPlayer eq 'Y' }">
  		<a href="/support/write" id="campbtn" class = "btn btn-primary">후원 작성</a>
  		</c:if>
  	</div>
  	<br><br><br><br>
  </div>

</section>		

	
			

				

  




  
   
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
   <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  
  <!-- Vendor JS Files -->
  <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="../assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="../assets/vendor/php-email-form/validate.js"></script>
  <script src="../assets/vendor/swiper/swiper-bundle.min.js"></script>
  
  <!-- Template Main JS File -->
  <script src="../assets/js/main.js"></script>
  <script src = "../assets/js/jquery-1.12.3.min.js"></script>
  <script src = "../assets/js/jquery.counterup.min.js"></script>
  <script src = "../assets/js/waypoints.min.js"></script>
  
</body>
</html>