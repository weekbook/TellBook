<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ | 고객센터-TellBook</title>
<!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  	
<link rel="stylesheet" href="/resources/css/support.css">
</head>
<body>
	<%@include file="../includes/header.jsp"%>
		<div class="navi_bar_area">
			<div class="dropdowns">
				<button class="dropbtn">
					국내 <i class="fa fa-caret-down"></i>
				</button>
				<div class="dropdown-content">
					<c:forEach items="${cate1}" var="cate">
						<a href="../search?type=C&cateCode=${cate.cateCode}">${cate.cateName}</a>
					</c:forEach>
				</div>
			</div>
			<div class="dropdowns">
				<button class="dropbtn">
					국외 <i class="fa fa-caret-down"></i>
				</button>
				<div class="dropdown-content">
					<c:forEach items="${cate2}" var="cate">
						<a href="../search?type=C&cateCode=${cate.cateCode}">${cate.cateName}</a>
					</c:forEach>
				</div>
			</div>
		</div>
		
		<div class="wrap">
			<p class="path" style="margin-left: 10px;">홈 > 고객센터 > 회원 </p>
			<div class="support_snb">
				<h2 class="cscenter_h2"><a href="support">고객센터</a></h2>
					<div style="background: #e9e9e9;">
						<ul class="support_li" style="margin-top: 15px;">
							<li><a href="supportLi1" style="text-decoration: none; color: inherit;">반품/교환/환불</a></li>
							<li><a href="supportLi2" style="text-decoration: none; color: inherit;">주문/결제</a></li>
							<li><a href="supportLi3" style="text-decoration: none; color: inherit;">회원</a></li>
							<li><a href="supportLi4" style="text-decoration: none; color: inherit;">도서/상품정보/교과서</a></li>
							<li><a href="supportLi5" style="text-decoration: none; color: inherit;">배송/수령일안내</a></li>
							<li><a href="supportLi6" style="text-decoration: none; color: inherit;">1:1상담접수/내역확인</a></li>
						</ul>
					</div>
			</div>
			<div class="content_area">
				<h3 class="content_h3">회원</h3>
				<hr style="">
				
				<div class="accordion" id="accordionExample">
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingOne">
				      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				        &nbsp [회원가입/탈퇴] 회원가입/회원탈퇴는 어떻게 하나요?
				      </button>
				    </h2>
				    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				      	TellBook의 회원가입 버튼을 누르신 후 아이디, 비밀번호, 이메일, 주소를 입력단계를 거쳐 개인회원가입이 가능합니다.
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingTwo">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
				        &nbsp [회원정보 확인/변경] 회원정보변경은 어떻게 하나요?
				      </button>
				    </h2>
				    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				      	1) 회원 로그인 후, TellBook의 마이페이지 > 회원정보수정에서 변경할 수 있습니다.<br><br>

						2) 직접 변경이 어려우신 경우, 고객센터 1500-3893번 전화로 문의를 주시거나 1:1상담을 통해 문의를 남겨주신 후,<br>
						[개인정보(정정 삭제)요구서 양식]을 작성하신 다음 성명, 연락처를 기재해서 FAX(0505-430-3893)로 보내주시면<br>
						요청하신 내역에 대해 확인 후 처리하고 답변 드리겠습니다.
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingThree">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
				        &nbsp [회원가입/탈퇴] 회원가입을 하면 무엇이 좋은가요?
				      </button>
				    </h2>
				    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				      	TellBook은 비회원 주문이 없기때문에, 회원가입을 하시면 서적을 주문하실 수 있습니다.<br>
				      	또한, 주문 후, 일정 비율 포인트 적립 받으실 수 있으며, 각종 이벤트 참여가 가능합니다.
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingThree">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
				        &nbsp [회원정보 확인/변경] 아이디(ID)와 비밀번호(Password)를 잊어버렸어요. 어떻게 확인하나요?
				      </button>
				    </h2>
				    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				      	아이디(ID) 찾기<br>
				      	회원 로그인 화면에서[아이디 찾기] > [이름과 이메일 정보로 찾기]를 통하여 바로 확인하실 수 있습니다.<br><br>
				      	
				      	비밀번호 찾기<br>
				      	회원 로그인 화면에서 [비밀번호 찾기] > [아이디와 이메일 정보로 찾기]를 통하여 새로운 비밀번호를 설정 할 수 있습니다.
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingFive">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
				       &nbsp [회원가입/탈퇴] 회원탈퇴가 되지 않습니다. 어떻게 해야 하나요?
				      </button>
				    </h2>
				    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				      	[주문진행중/발송완료]<br>
				      	진행 중인 거래(구매)내역이 있는 경우<br>
				      	-일반/예약주문/해외발주 진행 중<br>
				      	-발송완료 후 15일이 경과되지 않은 경우<br>
				      	탈퇴 가능 방법 : 거래 종료 후
				      </div>
				    </div>
				  </div>
				  
				</div>
			</div>
		</div>
		

	<%@ include file="../includes/footer.jsp"%>
</body>
</html>