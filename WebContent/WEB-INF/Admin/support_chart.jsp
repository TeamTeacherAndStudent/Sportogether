<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자용 후원 차트</title>
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
  	<!--Load the AJAX API-->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
	<style>
		#search{
		   margin-left: 30px;
		}
		/*제목*/
		h1{
		    vertical-align:middle;
		    line-height:30px;
	   		color: rgb(140, 158, 91);
		    text-align: center;
		}	
		/*section 1, 2*/
		.section1, .section2{
			text-align : center;
		}
		select{
			margin-right: 10px;
		}
		.counter{
			text-align: right;
		}
		.link {
		text-align: center;
		}
	</style>

</head>
<body>
<script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['Mushrooms', 3],
          ['Onions', 1],
          ['Olives', 1],
          ['Zucchini', 1],
          ['Pepperoni', 2]
        ]);

        // Set chart options
        var options = {'title':'내가 한 후원 종목 비율 확인',
                       'width':700,
                       'height':500};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center justify-content-between">
      <h1 class="logo"><a href="/"> Sportogether </a></h1>
      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="active" href="/sports/list">종목</a></li>
          <li><a href="/board/list">자유게시판</a></li>
          <li><a href="/support/list">후원</a></li>
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
		<section id="supportChart">
			<div class="container">
				<h1>종목별 후원 비율</h1>
				<div class="counter">
				 	일일 방문자 수 : <br>
				 	총 방문자 수 :
				</div>
				<div class="row">
					<div class="col-md-5">
						<div class="section1">
							<h4>월별 차트</h4>
							 <select name="selectmonth">
							 	<option value="1월">1월</option>
							 	<option value="2월">2월</option>
							 	<option value="3월">3월</option>
							 	<option value="4월">4월</option>
							 	<option value="5월">5월</option>
							 	<option value="6월">6월</option>
							 	<option value="7월">7월</option>
							 	<option value="8월">8월</option>
							 	<option value="9월">9월</option>
							 	<option value="10월">10월</option>
							 	<option value="11월">11월</option>
							 	<option value="12월">12월</option>
							 </select>
							총 후원자 수 : <br>
							<!-- 월별 방문자수  차트 -->
					<section>
					<div id="main-content">
						<!--Div that will hold the pie chart-->
						<div id="chart_div"></div>
						<div id="count">
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
						</div>
					</div>
					</section>
					</div>
					<div class="col-md-6">
						<div class="section2">
							<h4>년도별 차트</h4>
							<select name="selectyear">
								<option value="2021" selected>2021</option>
							</select>
							년
							 <!-- 년도별 방문자수
							 -->
						</div>
					</div>
				</div>
			</div>
			<br><br>
			<div class="link">
				<a href="/support/manage">후원 결제 관리 보기</a><br>
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
	<script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>