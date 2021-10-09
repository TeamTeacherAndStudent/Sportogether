<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    int supportNo = (int)request.getAttribute("supportNo");
    String userId = (String)request.getAttribute("userId");
    String userEmail = (String)request.getAttribute("uesrEmail");
    String userPhone = (String)request.getAttribute("userPhone");
    int amount = (int)request.getAttribute("Amount");
   
   
    

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제페이지</title>
<!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
  
 
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
	#space{
		height : 200px;
		width : 100%;
	}
</style>
</head>
<body>

 <div>
 	<section class="container">
 		<div class= "row">
 			<div class= "col-md-3 viseble"></div>
 			<div class= "col-md-6 text-center">
<%-- 	 			<h2><%=userId%>님의 결제 페이지 입니다.</h2> --%>
 				<div id = "space" class="row visible ">
 				
 				</div>
 				<div >
 						<input id="amount" name = "amount" type = "hidden" value = "${requestScope.Amount }">
 						<input id = "userId" name = "userId" type = "hidden" value = "${requestScope.userId }">
 						<input name = "userPhone" type = "hidden" value = "${requestScope.userPhone }">
 						<input  id ="supportNo" name = "supportNo" type = "hidden" value = "${requestScope.supportNo }">
 						
 						<a style="text-decoration: none" href = "/support/detail?supportNo=${requestScope.supportNo }"><h3>뒤로 돌아가기</h3> </a>
 					
 				</div>
 			</div>
 		</div>
 	</section>
 </div>
  <script>
   $(function (){
        var supportNo = $("#supportNo").val();
	    var userId = $("#userId").val();
	    var amount = $("#amount").val();
	   	
    	 // 생략가능
        var IMP = window.IMP;
        IMP.init('imp70817839'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
       
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'Sportogether 후원 결제',
            amount : <%=amount%>,
            buyer_email : '<%=userEmail%>',
            buyer_name :  '<%=userId%>',
            buyer_tel : '<%=userPhone%>',
            buyer_addr : '서울시종로구',
            buyer_postcode : '123-456',
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
            	
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/support/paytodb", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
					location.href="/support/paytodb?supportNo=<%=supportNo%>&userId=<%=userId%>&amount=<%=amount%>";
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
<%--                 location.href="<%=request.getContextPath()%>/support/detail?supportNo="+<%=supportNo%>; --%>
				location.href="/support/detail?supportNo="+<%=supportNo%>;
// 					history.back();
                alert(msg);
            }
        });
        
    });
    </script>
  
</body>
</html>