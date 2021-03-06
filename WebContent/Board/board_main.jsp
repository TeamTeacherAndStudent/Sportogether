<%@page import="board.model.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
        List<Board> bList = (List<Board>)request.getAttribute("bList");
		String pageNavi = (String)request.getAttribute("pageNavi");
		 
%>
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
	
	
	#ulTable > li:first-child > ul > li {
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
	
	#ulTable > li > ul > li:first-child               	   {width:10%;} /*No ??? ??????*/
	#ulTable > li > ul > li:first-child +li                {width:10%;} /*?????? ??? ??????*/
	#ulTable > li > ul > li:first-child +li+li             {width:30%;} /*?????? ??? ??????*/
	#ulTable > li > ul > li:first-child +li+li+li          {width:15%;} /*????????? ??? ??????*/
	#ulTable > li > ul > li:first-child +li+li+li+li       {width:15%;} /*????????? ??? ??????*/
	#ulTable > li > ul > li:first-child +li+li+li+li+li    {width:10%;} /*????????? ??? ??????*/
	#ulTable > li > ul > li:first-child +li+li+li+li+li+li {width:10%;} /*????????? ??? ??????*/
	
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
	#selSearchOption{
		height: 40px;
		width:120px;
	}
	#txtKeyWord{
		height:38px;
		width: 300px;
	}
	
  </style>
<title>??????????????? </title>
</head>

<body>
 <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center justify-content-between">
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

<br><br><br><br>
    <main id="main">
        <div id="mainWrapper">
            <ul>
                <li>
                    <h1 class="page">???????????????</h1>
                    <select id="selectSports" name="sportsZip">
      					<option value="">????????????</option>
      					<option value="">??????</option>
      					<option value="">??????</option>
      					<option value="">??????</option>
      					<option value="">??????</option>
      					<option value="">??????</option>
      					<option value="">?????????</option>
      					<option value="">??????</option>
     				</select>
           			<br>
                    <ul id ="ulTable">
                        <li>
                        	<ul>
                                <li>No</li>
                                <li>??????</li>
                                <li>??????</li>
                                <li>?????????</li>
                                <li>?????????</li>
                                <li>?????????</li>
                                <li>?????????</li>
                            </ul>
                            <% for(Board bOne : bList) { %>
                            <ul>
                            	 <li><%=bOne.getBoardNo() %></li>
                            	 <li><%=bOne.getSportsName() %></li>
								 <li><a href="/board/detail?boardNo=<%=bOne.getBoardNo() %>"><%=bOne.getBoardTitle() %></a></li>
								 <li><%=bOne.getBoardEnrollDate() %></li>
								 <li><%=bOne.getUserId() %></li>
								 <li><%=bOne.getBoardCount() %></li>
								 <li><%=bOne.getBoardLike() %></li>					
                            </ul>
							<% } %>  
                        </li>
                    </ul>
                </li>
                <li>
                    <div id="divPaging">
                    </div>
                </li>
                <form action ="board/write">
                	<input id="writeBtn" class="Btn" type="submit" value="?????????">
                </form>
                <li id='liSearchOption'>
                    <div>
                  	<form action="/board/search" method="get">
                        <select id='selSearchOption' >
                            <option value='A'>??????+??????</option>
                            <option value='T'>??????</option>
                            <option value='C'>??????</option>
                        </select>
                        <input id='txtKeyWord' />
                        <input type='submit' value='??????' class="Btn"/>
                    </div>
                    </li>
                 </form>
            </ul>
        </div>
    </main>

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