<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠페인 상세</title>

 <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!-- jquery ui -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <!-- font Awesome -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
 <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  
  <!-- count up -->
     <script src = "../assets/js/jquery.counterup.min.js"></script>
  <script src = "../assets/js/waypoints.min.js"></script>
   

 
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
  	.spt-img{
  		margin : 10px;
  	}
  	.logos{
  		padding-top : 20px;
  		display:inline-block;
  	}
  	.logo{
  		float : left;
  		padding : 8px;
  	}
  	.logo img{
  		
  		height : 38px;
  		width : 38px;
  	}
  	#share-btn {
  		align : center;
  		height : 35px;
  	}
  	<!-- 관리자 삭제 버튼 -->
  	#spt-delete{
 		 	display: none;
  	}
  	.replysubmit{
  		float: right;
  	}
  	#search{
    	margin-left: 30px;
    }
    .modbtn {
    }
    #modbtn{
    	background-color : #1d284b;
  		border-style: none;
  		border-color: #1d284b;
    }
    .lg{
  		background-color: #1d284b;
  		border-color: #1d284b;
  	}
  </style>
   <!-- 카카오 공유하기 사용을 위한 -->
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
   <!--  jQuery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>

 <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center justify-content-between">
      <h1 class="logo"><a href="/index.jsp"> Sportogether </a></h1>
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
  </header><!-- End Header --><br><br><br>

<div>
	<section class="container">
			<div>
				<h2>후원하기</h2><br><br>
			</div>
		<div  class="row">
			<div class="col-md-1 visible">
			</div>
			<div class="col-md-7">
				<!-- 후원 제목 -->
				<h3>${requestScope.supportOne.supportTitle }</h3>
				
				<!-- 선수 이름 -->
				
				&nbsp;<h5>${member.userName }</h5><br>
				
				
				<h5>소개</h5>
				
				<p>${supportOne.supportIntro }</p>
				<br>
				
				<h5>목적</h5>
				
				<!-- 목적 -->
				<p>${supportOne.supportPurpose }</p>
				
				<!-- 본문 이미지 -->
				<div class="row">
					<img class="spt-img"  src="/upload/${supportOne.supportFileName }" alt = "...">
				</div>
				<br><br>
				
				<!-- 본문 -->
				<p>${supportOne.supportContents }
				</p>
			</div>
			<div class="col-md-1 visible">
			</div>
			<div class="col-md-3">
				<div class="text-center" >
					<img src="data:image/png;base64,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">
					
					<!-- 목표 금액 -->
					<h5 > 
					목표 금액
						
						<fmt:formatNumber type="currency"> ${supportOne.supportGoal } </fmt:formatNumber>
						
					</h5> 
					<br><br>
					
					<!-- 현재 모금액 -->
					<h4 class= "money">모금액   <fmt:formatNumber type="currency"> ${supportOne.supportAchived }</fmt:formatNumber>  </h4> <br><br>
					<div class="progress">
					<div class="progress-bar bg-warning" role="progressbar" background-color ="yellow" style="width: ${(supportOne.supportAchived / supportOne.supportGoal)*100 }%"></div>
				</div>
					
					<!-- 달성률 % -->
					<h6><fmt:formatNumber pattern = ".0">${(supportOne.supportAchived/ supportOne.supportGoal)*100 }</fmt:formatNumber>%</h6><br>
					<c:if test="${sessionScope.userId eq null }">
       	 				 <a href="/member/login"  id="modbtn" class="btn btn-primary" >로그인하고 후원에 참여해보세요 ! CLICK!</a> 
       	 			</c:if>
       	 			<c:if test = "${sessionScope.userId ne null }">
						<form action = "/support/paytest" method = "post">
							<div  class="container px-5 my-5">
							
								<!-- 후원자 정보-->
									<input type = "hidden" id = "supportNo" name ="supportNo" value = "${supportOne.supportNo }">
									<input type = "hidden" id = "donator-id" name = "donator-id" value ="${sessionScope.userId }">
									<input type = "hidden" id = "donator-email" name= "donator-email" value="${donator.userEmail}">
									<input type = "hidden" id = "donator-phone" name = "donator-phone" value = "${donator.userPhone }">
									<input type = "text" id = "amount" name = "amount" placeholder = "금액을 입력해주세요!" class = form-control required pattern="^[0-9]+$"> 
							
							</div>
							
							<!-- 후원 버튼  -->
							<div class="d-grid gap-2" >
<!-- 						<button id="modbtn" type="submit" class="btn btn-primary" >후원하기</button> -->
<!-- 						<button id="modbtn"  class="btn btn-primary" >후원하기</button> -->
						<input  type="submit" id ="modbtn" class="btn btn-primary" value="후원하기">


<!--   						<a href="javascript:gotopay();"  id="modbtn" class="btn btn-primary" >후원하기</a> -->

					</div>
					</form>

       	 			</c:if>
					
					
					<!-- sns 로고 -->
					<div class= "logos">
						<!-- facebook에 공유하기 -->
						<div class="logo">
							<a href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Flocalhost%3A9999%2FSportogether%2FSupport%2FsupportDetail.jsp%23&quote=" title="Share on Facebook" target="_blank" onclick="window.open('https://www.facebook.com/sharer/sharer.php?u=' + encodeURIComponent(document.URL) + '&quote=' + encodeURIComponent(document.URL)); return false;">
								<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAb1BMVEU7WZj///8mS5Hf4+3w8vcqTpM2VpcnTJLS1+X09vmzvNMzVJYvUZQeR4/j5u/K0OBEYJyOnL95irSHlrt0hrGossyfq8iNm75Sa6JbcqY+XJpvgq+YpcSstc6AkLdnfKzFy91NZ6DEy9wAPIsPQY2Bl4GkAAAEZUlEQVR4nO3dW3eiMBQFYIglQiEgVK127HXm///GoRentmtVNoZDOMzeT30pJ99aBiQ3o/gzWbmYR8rsRBUd/6iayJm5xEVN9U2YrkwezSm5WaWnwtrZ0E0aPNbVn8J1Ero5IknWR2E9T2BLrN+FqQvdErG49E24ml8fPMauXoWVCd0OwZiqFTbzekx8Td60wtCNEE4cZfO9z7zGZVE5527YdsQyWsxcuKBQeyjUHwr1h0L9oVB/KNQfCvWHQv2hUH8oDB2b58VJ8jy3tt8I/XSFtkhMcrdvbg/bzf39ZrPZHurbm4f14/45yhNjTJK04m7tNIW2MMvH7dOXueovybKrRfW0OTS7TuIUhYXbbRc/2b7lunNecHJCu7TbEuRpFFqzf8F5+oStL+3l0yYsoqeePmVCd9Pbp0poi74fUGXCYvfjs28ewveFLzMWLi/pgpqEycVAJcKiuRioQ5jvLweqENr8sruoHqG76DmoSFjUPkAFQnvnBVQgNFW3QrXQPvoBpy906GiFVmH+yxM4eaHfk0KB0O58gVMXJtdzFzqf72sahNb7PjN14QAf0okLzdXMhfbZHzhtoedbxYew6CoTUJj0GOEurw+/dqvX+dJvmfT8oUGnmLLtnUuKvnO//8oE/JSCwM2y8Nl5Fk5owQGo/dKvTjhh/oABO28lHQknLLYI8NZ7d2s4IfSNpvTfdRZQiIzQPPhvjQwnXCJvvwNsHAwnNMAQTeV5H32vE0wIfO/e+t5Io6kLh9ihPG1h95ouoM6khUMcFDBt4RAnIUxbOMCNZuLCIQ4koVAuFFII16FQLBRSCNehUCwUUgjXoVAsFFII16FQLBTqFzpAOMCgvrDQngkkPHcBi83siwqTboNngNk35cJ94NUm8kKgEbqFGdB03ULk6FXdwgp4YOoWdq9M1C48AJNTuoVrYBZctxCZBdctRFquWgidRK5aCLVctfAFeX9ULbxHVjKoFtazFz7O/g34efZCaEGRZuEVtL5WszCFGq5Z+AQNp2oWbmbfD2+gFcSahdDjULUQW1+rWYhtxlAsBH/FSbEwxWamFAuRoUTdQmQoUbcQ3NemWAjMrIkLi/RcAMTZ/7/DGiE7y708k9/ALPcfc+YCYBu4FkMuFFII16FQLBRSCNehUCwUUgjXoVAsFFII16FQLBRSCNehUCwUUgjXoVAsFFII16FQLBRSCNehUCwUUgjXoVAsFFII16FQLBRSCNehUCwUUgjXoVAsFFII16FQLBRSCNehUCwUUgjXoVAsFFII16FQLBRSCNehUCwUUgjX+R+E4Ek2Q2c0YRlBJ7kOn7GELouQw+kFMpaw9Q3yy8n9M5Iwb1phFaQjjiQ0VSsc5KeT+5ceRWhX8aswDXGvGUfo0jdhXA/SpftlFGFSx+/CeD0+cQxhso6Pwrh2Y/dFeaF1dfwpjNOVGfehIS3MzerjsK3oeLmqiZwZL9hJWJfGRU11vEp0csWsXIyXrDsXX7vMTlR/AYn9VbN6VB0TAAAAAElFTkSuQmCC">
							</a>
						</div>
						<!-- twitter에 공유하기-->
						<div class="logo">
							<a href="https://twitter.com/intent/tweet?source=http%3A%2F%2Flocalhost%3A9999%2FSportogether%2FSupport%2FsupportDetail.jsp%23&text=:%20http%3A%2F%2Flocalhost%3A9999%2FSportogether%2FSupport%2FsupportDetail.jsp%23" target="_blank" title="Tweet" onclick="window.open('https://twitter.com/intent/tweet?text=' + encodeURIComponent(document.title) + ':%20'  + encodeURIComponent(document.URL)); return false;">
								<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXrSNlfucWa3SYHMOV6XtqHBgAFlM8zEgIsQ&usqp=CAU">
							</a>
						</div>

						<!-- 카카오톡에 공유하기 -->
						<div class="logo">
							<a id="kakao-link-btn" href="javascript:void(0)" onclick="sendLink()">
								<img src ="data:image/png;base64,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" ></a>
						</div>
						<!-- URL 복사 -->
						<div class="logo">
							<a href="javascript:void(0)" onclick = "copyURL()">
								<img src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDYWMFMwTbz8GDWAbGMMIE7-GrSHZVnrBZhQ&usqp=CAU">
							</a>
						</div>
					</div>
					<!-- 수정하기 버튼 = 작성자에게만 보이도록 -->
					<div class=modbtn>
						<c:if test = "${sessionScope.userId eq supportOne.supportWriter }">
							<a href="/support/modify?supportNo=${supportOne.supportNo }" id="modbtn" class = "btn btn-primary">수정하기</a>
						</c:if>
						<c:if test = "${sessionScope.userId eq supportOne.supportWriter || sessionScope.userCode eq  'G'}">
							<a href="/support/remove?supportNo=${supportOne.supportNo }" id="modbtn" class = "btn btn-primary">삭제하기</a>
						</c:if>
						
					</div>
				</div>
			</div>
		</div>

		</section>
</div>
<hr>
	
    <section class="container">
    
		<!-- 댓글 탭  -->
		<div class="row">
			<div class = "col-md-2 visible">
			</div>
			<div class = "col-md-8">
				<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
  				  <li class="nav-item" role="presentation">
<!-- 				    <button class="nav-link active btn secondary-btn" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">응원댓글</button> -->
				  </li>
				  <li class="nav-item" role="presentation">
<!-- 				    <button class="nav-link btn secondary-btn" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">문의댓글</button> -->
				  </li>
				</ul>
				
				<div class="tab-content" id="pills-tabContent">
					<!--  응원댓글 -->
				  <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
				  	<div>
				  		<form action = "/supportReply/write" method = "post">
				  			<div>
								<div class="input-group mb-3">
								<!-- 게시물 번호 -->
						  			<input id="supportNo" type = "hidden" name = "supportNo" value = "${supportOne.supportNo }">
								  <input type="text" class="form-control" name = "reply-contents" placeholder="응원 댓글을 작성해보세요!" aria-label="Recipient's username" aria-describedby="button-addon2">
								  <button class="btn btn-outline-secondary" type="submit" id="button-addon2">등록</button>
								</div>
				  			</div>
				  		</form>
				  	</div>
				  	<table class="table table-hover">
 						<tr>
 							<th>작성자</th>
 							<th>내용</th>
 							<th>작성일</th>
 							<th>
 								
 							</th>
 							
 						</tr>
 						<!--   댓글 소환 -->
 						<c:forEach items = "${requestScope.supportOne.rList }" var = "supportReply">
 						<tr>
 							<td>${supportReply.supportReplyWriter}</td>
 							<td>${supportReply.supportReplyContents }</td>
 							<td>${supportReply.supportReplyRegDate }</td>
 							<td>
 								<!-- 댓글 번호 저장해두기 -->
 								<input type="hidden" value="${supportReply.supportReplyNo }">
 								<!-- 댓글 작성자와 세션 아이디가 같으면 삭제 버튼 활성화 -->
 								<c:if test="${sessionScope.userId eq supportReply.supportReplyWriter }">
 									<a href = "javascript:void(0)" onclick="removeReply(this);">삭제</a>
 								</c:if>
 							</td>
 							<td>
 								<!-- confirm창으로 확인 후 신고하기 -->
 								<a href="javascript:void(0)" onclick="reportReply(this);" >신고</a>
 							</td>
 						</tr>
 						</c:forEach>
 						
 						<tr>
 							<td colspan="4" align="center"> 
 						<!-- pa -->
 						
 							</td>
 							
 						</tr>
					</table>
				  </div>
				  <!-- 문의댓글 -->
<!-- 				  <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab"> -->
<!-- 				  		<table class="table table-hover"> -->
<!--  						<tr> -->
<!--  							<th>작성자</th> -->
<!--  							<th>내용</th> -->
<!--  							<th>작성일</th> -->
<!--  							<th></th> -->
 							
<!--  						</tr> -->
<!--  						<tr> -->
<!--  							<td>인간극장</td> -->
<!--  							<td>현재 어느 구단에 소속되어계신건가요? 3년 전에 은퇴하셨다고 들었는데 언제 다시 시작하셨나요? </td> -->
<!--  							<td>2021-09-21</td> -->
<!--  							<td><a href="#">신고</a></td> -->
<!--  						</tr> -->
 					
<!--  						<tr> -->
 							
<!--  							<td>호동이</td> -->
<!--  							<td>궁금하면 500원~</td> -->
<!--  							<td>2021-09-21</td> -->
<!--  							<td><a href="#">신고</a></td> -->
<!--  						</tr> -->
 						
<!--  						<tr> -->
<!--  							<td></td> -->
<!--  							<td></td> -->
<!--  							<td></td> -->
<!--  							<td></td> -->
<!--  						</tr> -->
<!-- 					</table> -->
<!-- 				  </div> -->
				</div>
			</div>
			<div class="col-md-1">
				<!-- 관리자 캠페인 삭제 버튼 -->
<!-- 					<div id = "spt-delete"> -->
<!-- 						<button type="button" id="" class="btn btn-default"> 캠페인 삭제</button> -->
<!-- 					</div> -->
			</div>
			
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
 
	<!-- 카카오 공유하기  -->
  <script type="text/javascript">
	  Kakao.init('731fd7d33749e9a6bb2bf8fb2a1d7327');
    function sendLink() {
      Kakao.Link.sendDefault({
        objectType: 'text',
        text:
          '후원을 공유합니다.',
        link: {
          mobileWebUrl: 'https://developers.kakao.com',
          webUrl: 'https://developers.kakao.com',
        },
      })
    }
  </script>
 <!-- 카운팅 -->
 <script>
//카운팅
// 	$(".counter").counterUp({
// 			delay: 20,
// 			time : 2000
// 		});
 </script>
	<script>
	 <!-- URL 복사 -->
		
	window.copyURL = function(){
		prompt("[Ctrl + c]를 눌러 URL을 복사하세요:",window.location);
	}
	// confirm 후 댓글 신고하기
	
	function reportReply(obj){
		var replyNo2 = $(obj).parent().prev().find("input").val();
		var reportReplyChk = window.confirm("해당 댓글을 신고하시겠습니까?");
		if(reportReplyChk) {
			location.href ="/supportReply/report?replyNo=" + replyNo2;
		}else{
			window.alert("취소하였습니다.");
		}
	}			
	
	// confirm 후 댓글 삭제하기
	function removeReply(obj){
		var supportNo = $("#supportNo").val();
		var replyNo = $(obj).parent().parent().find("input").val();
		var removeReplyChk = window.confirm("해당 댓글을 삭제하시겠습니까?");
		if(removeReplyChk) {
			location.href ="/supportReply/Remove?replyNo=" + replyNo + "&supportNo=" + supportNo;
					
		}else{
			window.alert("취소하였습니다.");
		}
	}

		
	</script>
	<script type="text/javascript">
	
	</script>
  
</body>
</html>