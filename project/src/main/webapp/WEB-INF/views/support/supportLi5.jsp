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
			<p class="path" style="margin-left: 10px;">홈 > 고객센터 > 배송/수령일안내 </p>
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
				<h3 class="content_h3">배송 / 수령일안내</h3>
				<hr style="">
				
				<div class="accordion" id="accordionExample">
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingOne">
				      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				        &nbsp [배송료] 국내 배송료는 얼마인가요?
				      </button>
				    </h2>
				    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				      	포인트 적용 제외, 구매물품이 합 30,000원 이상이라면 무료배송입니다.<br>
				      	30,000원 미만시 3,000원 배송비가 부과됩니다.
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingTwo">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
				        &nbsp [배송안내] 주문하면 얼마 만에 받아볼 수 있나요?
				      </button>
				    </h2>
				    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				      	<p>고객님께서 주문하신 상품을 실제 받으시는 날은 "예상출고일+배송일"입니다.</p>

						'예상출고일'이란 근무일 기준으로 도서가 준비되는 시간만을 안내하는 것이며,<br>
						배송시간은 예상출고일 외 택배를 통해 고객님께 실제 배달되는 기간을 말합니다.<br><br>
						
						출고예정일은 상품에 따라 준비기간이 다르며<br>
						배송 시간은 지역에 따라 약간씩 다르나 보통 1~3일정도 소요됩니다.<br>
						(도서산간지역은 최대 7일 소요)<br><br>
						
						* 예상출고일은 영업일 기준으로 산정되며, 일요일과 공휴일 및 기타 휴무일에는 배송되지 않습니다.<br>
						(우체국 배송은 토요일 휴무로 배송 불가함)<br>
						* 주문한 상품의 당사에 재고가 없을 때는 거래처로 다시 주문 요청한 후 출고되므로 3∼7일내외 정도 더 소요됩니다.<br>
						* 천재지변 등의 불가항력적 사유로 인한 배송 지연은 그 해당기간 동안의 배송소요 기간에서 제외됩니다.
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingThree">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
				        &nbsp [배송안내] 국내에 보유하고 있지 않는 서양도서/일본도서(해외주문도서)는 얼마만에 받아 볼 수 있나요?
				      </button>
				    </h2>
				    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				      	* 서양도서[해외주문도서]의 예상출고일은 10 ~ 12일 내외 소요 예정입니다.<br>
					서양도서 [해외주문도서]중 'special order'는 해외거래처에서 출판사로 주문중인 도서로서 예상출고일은 4 ~ 6주 예상됩니다.<br>
					현지 출판사 사정에 의해 구입이 어려울 경우 2 ~ 3주안에 공지해 드립니다.<br><br>
					
					* 일본도서 [해외주문도서]의 예상출고일은 3 ~ 4주 내외 소요예정입니다.<br><br>
					
					- 해외주문일본도서의 경우 현지 출판사 사정에 의해 구입이 어려울 경우 2~4주 안에 연락 드립니다.<br>
					- 해외주문도서는 고객님의 요청에 의해 수입된 도서이기 때문에 주문진행 중 취소가 불가능합니다.
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingThree">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
				        &nbsp [배송안내] 주문한 상품 중 일부가 오지 않았습니다.
				      </button>
				    </h2>
				    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				      	고객님께서 주문하신 상품이 한꺼번에 배송되지 않는 것은 고객님의 편의를 위해 준비된 것부터 보내드리기 때문입니다.<br><br>

						주문건의 도서가 예상출고일 보다 지연 된 경우에는 먼저 준비 된 도서를 배송해 드립니다.<br>
						나머지 상품은 별도로 배송 중이거나 상품을 준비하고 있는 단계이며,<br>
						거래처로 주문 된 상품은 입고되는 즉시 배송해 드립니다.<br><br>
						
						선출고 된 후 나머지 도서는 별도로 준비하여 보내드릴 예정이며<br>
						거래처에서 준비된 후 입고 되는 즉시 신속하게 배송해 드립니다<br><br>
						
						그러나 안타깝게도 거래처로 주문이 되었더라도 품절/절판이 될 수가 있으며,<br>
						이 경우에는 별도로 고객님께 메일과 SMS를 통하여 알려 드립니다.
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingFive">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
				       &nbsp [배송안내] 주문한 상품이 아직 안 왔어요.
				      </button>
				    </h2>
				    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				      	<p>주문하신 도서를 아직 못받아 보셨다면 다음 사항을 확인해 주십시오.</p>

						<strong>1. 주문·배송 확인 시 상품의 처리상태가 포장완료로 되어 있는 경우</strong><br>
						이 상품은 당사에서는 출고처리를 한 것입니다.<br>
						당사에서 출고처리가 되었으나 2~3일 이내에 받아보시지 못한 경우는 다음을 확인하시기 바랍니다.<br><br>
						
						<strong>2. 주문·배송 확인 시 상품의 처리상태가 품절/절판이라고 되어 있는 경우</strong><br>
						상품이 품절/절판인 경우에는 당사에 재고가 없으며, 거래처에서 상품을 더 이상 취급하지 않기 때문에 보내드릴 수 없습니다.<br>
						이 경우 메일로 별도 안내해 드리고 있습니다.<br>
						만약 메일을 받아 보지 못하셨다면, 네트워크의 오류나 메일주소의 오기 또는 메일주소가 없기 때문입니다.<br>
						[마이룸]의 [회원정보 수정]에서 메일주소의 등록 또는 수정을 하십시오.<br><br>
						
						<strong>3. 상품준비중 상태가 오래 지속될 경우</strong><br>
						주문/배송 조회시 주문상태가 ‘상품준비중’ 단계로 남아 있다면 상품의 출고 예정일을 확인해 주시기 바랍니다.<br><br>
						
						여러권을 함께 주문하셨을 경우, 출고 예정일이 가장 늦은 상품에 맞춰 함께 배송됩니다.<br>
						(마이룸 > 주문배송 조회 페이지에서 예약판매 도서를 함께 주문하셨는지 확인해주세요!)
				      </div>
				    </div>
				  </div>
				  
				</div>
			</div>
		</div>
		

	<%@ include file="../includes/footer.jsp"%>
</body>
</html>