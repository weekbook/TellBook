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
			<p class="path" style="margin-left: 10px;">홈 > 고객센터 > 주문 / 결제 </p>
			<div class="support_snb">
				<h2 class="cscenter_h2"><a href="support">고객센터</a></h2>
					<div style="background: #e9e9e9;">
						<ul class="support_li" style="margin-top: 15px;">
							<li><a href="supportLi1" style="text-decoration: none; color: inherit;">반품/교환/환불</a></li>
							<li><a href="supportLi2" style="text-decoration: none; color: inherit;">주문/결제</a></li>
							<li><a href="supportLi3" style="text-decoration: none; color: inherit;">회원</a></li>
							<li><a href="supportLi4" style="text-decoration: none; color: inherit;">도서/상품정보/교과서</a></li>
							<li><a href="supportLi5" style="text-decoration: none; color: inherit;">배송/수령일안내</a></li>
							<li><a href="inquirie" style="text-decoration: none; color: inherit;">1:1상담접수/내역확인</a></li>
						</ul>
					</div>
			</div>
			<div class="content_area">
				<h3 class="content_h3">주문 / 결제</h3>
				<hr style="">
				
				<div class="accordion" id="accordionExample">
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingOne">
				      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				        &nbsp [주문] 비회원도 주문할 수 있나요?
				      </button>
				    </h2>
				    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				      	<p>TellBook은 비회원으로 주문하실 수 없습니다.</p>
				      	주문을 하기 위해서는 로그인을 완료한 회원상태에서 주문이 가능합니다.<br>
				      	번거로울수 있으시지만, 회원상태에서 주문을 진행해주시길 바랍니다.
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingTwo">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
				        &nbsp [결제] 결제방법을 변경할 수 있나요?
				      </button>
				    </h2>
				    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				      	주문/결제하신 후에는 인터넷 상에서 결제방법을 변경하실 수 없습니다.<br>
						주문을 취소한 후 재주문 해 주시기 바랍니다.<br><br>
						
						단, 신용카드 결제 후 카드 변경이 필요하거나 온라인입금 선택 후 입금 전 상태에서 신용카드 결제로 변경은<br>
						고객센터 1:1상담의 <주문/결제> 또는 전화(국번없이)1544-1900으로 문의 주신 후<br>
						주문번호와 변경사항 등을 알려주시면 확인 후 변경 가능합니다.
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingThree">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
				        &nbsp [결제] 온라인 송금으로 주문/결제했을 때 며칠 이내에 송금해야 하나요?
				      </button>
				    </h2>
				    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				      	<온라인 송금>으로 주문/결제하신 상품의 경우, 주문완료일로부터 10일 이내에 상품금액을 송금해주셔야 결제가 완료됩니다.<br>
						10일 이내에 송금이 완료되지 않은 주문은 자동으로 주문 취소됩니다.
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingThree">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
				        &nbsp [주문] 외국서적을 해외에서 직접 주문할 때는?
				      </button>
				    </h2>
				    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				      	먼저 '외국도서' 코너에서 국내에 수입 되었는지 여부를 검색하시고, 국내에 수입되지 않았거나, 국내 재고가 없는 도서에 대해서는 해외로 직접 주문하실 수 있습니다.<br>

						- 인터넷교보문고에서는 미국 내 최대 도서 도매상인 Baker & Taylor 사와 제휴하여 국내에 수입되지 않은 해외도서를 최대 10%까지 할인된 가격으로 국내 독자님들에게 보다 신속하게 제공해 드립니다.<br>
						
						- 서양 도서에서 검색이 되지 않을 경우에는 도서명, 출판사, 저자, ISBN 등을 고객센터의 Q&A <서양 도서 검색/주문> 상담으로 알려주시면 해외 주문 가능 여부를 확인하여 드립니다.<br>
						
						- 일본 도서의 경우에는 고객센터의 Q&A <일본 도서 검색/주문> 상담을 이용하여 주십시오.
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingFive">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
				       &nbsp [주문] 주문을 수정(취소/변경)할 수 있나요?
				      </button>
				    </h2>
				    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				      	주문수정(취소/변경)는 주문/배송조회에서 회원 로그인 후 하실 수 있습니다.<br><br>
				      	
				      	주문을 접수하여 대금 결제를 진행하는 단계로 주문취소가 가능합니다.<br>
						온라인 입금이 완료된 건은 고객님의 환불계좌를 확인하기까지 일시적으로 취소하신 금액을 예치금으로 전환해 드립니다.<br>
						[반송 주소]<br>
						(우편번호:10881) 경기도 파주시 문발로 249, 교보문고 A동 2층 인터넷반품담당자 앞
				      </div>
				    </div>
				  </div>
				  
				</div>
			</div>
		</div>
		

	<%@ include file="../includes/footer.jsp"%>
</body>
</html>