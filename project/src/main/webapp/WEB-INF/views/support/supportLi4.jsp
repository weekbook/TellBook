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
			<p class="path" style="margin-left: 10px;">홈 > 고객센터 > 도서/상품정보/교과서 </p>
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
				<h3 class="content_h3">도서 / 상품정보 / 교과서</h3>
				<hr style="">
				
				<div class="accordion" id="accordionExample">
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingOne">
				      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				        &nbsp [정보/검색/알림기능] 검색을 쉽게 하는 방법은 없나요?
				      </button>
				    </h2>
				    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				      	<p>많은 고객님들께서 책을 검색하는 데에 어려움을 갖고 계십니다.</p>

						도대체 왜 도서검색이 어려운 것일까요?<br>
						무엇보다도 도서명의 특수성 때문입니다.<br>
						냉장고나 세탁기, 디지털카메라 같은 품목은 단일 검색어를 갖고 찾을 수 있으며 여기에 여러 종류의 품목이 있습니다.<br>
						따라서 검색어에 대한 결과를 보고 상품을 비교해가면서 구입하시면 됩니다.<br>
						그러나 도서의 경우에는 검색어에 해당되는 도서 자체를 찾기가 어려워집니다.<br><br>
						
						어떻게 해야 책 검색을 쉽게 할 수 있을까요?<br>
						몇가지 TIP을 알려드립니다<br><br>
						
						1. 여러 단어가 연결되어 있는 도서명은 확실한 두 단어를 띄어쓰기 해서 검색해주세요<br>
						
						"그 많던 싱아는 누가 다 먹었을까?" 라던가 "수줍음도 지나치면 병", "모리와 함께 한 화요일" 같은 제목의 책들은 -<br>
						조사를 틀리게 기억할 수도 있고, 순서를 다르게 기억할 수도 있습니다.<br>
						
						예컨데 "누가 그 많던 싱아를 다 먹었는가?"라던가 "지나친 수줍음은 병", "화요일은 모리와 함께" -<br>
						이런 식으로 검색을 하면 도저히 검색을 할 수가 없습니다.<br>
						
						그러므로 다음과 같이 검색을 해보세요.<br>
						
						(예) 그 많던 싱아는 누가 다 먹었을까? -> 싱아 누가<br>
						      수줍음도 지나치면 병 -> 수줍음 병<br>
						      모리와 함께 한 화요일 -> 모리 화요일

				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingTwo">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
				        &nbsp [일본잡지정기구독] 일본잡지 정기주문은 주문취소/반품/교환이 가능한가요?
				      </button>
				    </h2>
				    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				      	<strong>주문하신 도서는 대금결재가 완료된 후 24시간 이내 자동발주 처리되기 때문에 주문 후에는 주문취소가 불가합니다.</strong><br><br>

						또한 일잡지 정기구독 상품은<br>
						고객님 개인의 요청에 의해서 수입된 도서로 해외반품이 불가하므로 반품이나 교환도 불가합니다.
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingThree">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
				        &nbsp [정보/검색/알림기능] 검색이 되지 않거나 품절/절판인 도서는 구입할 수 없나요?
				      </button>
				    </h2>
				    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				      	검색이 되지 않는 도서는 품절/절판일 경우가 대부분이므로<br>
						<strong>검색 옵션 중 [품절/절판상품 포함] 란에 체크하신 후 한번 더 검색해보시기 바랍니다.</strong><br><br>
						
						품절이나 절판으로 표시된 도서는 출판사에서도 더 이상 발행되지 않고 재고가 없는 경우가 대부분이라,<br>
						구하기 어려운 도서입니다. 이 경우 회원님께서 요청하셔도 구입시기를 확실하게 약속드릴 수 없습니다.<br>
						이러한 도서의 구입가능 여부를 확인하시려면 고객센터의 Q&A <도서/상품정보> 상담을 이용하여 주십시오.<br>
						최대한 확인하여 답변드리겠습니다.
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingThree">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
				        &nbsp [정보/검색/알림기능] 관심있는 분야의 도서를 추천받고 싶습니다.
				      </button>
				    </h2>
				    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				      	<p style="font-weight: bold;">고객님께서 특정 분야의 도서나 도서목록을 원하실 경우,<br>
						고객센터의 Q&A <도서/상품정보> 상담으로 문의하여 주십시오.</p>
						
						도서담당자가 추천도서 및 목록을 제공하여 드립니다.
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingFive">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
				       &nbsp [일본도서] 일본원서 표지에 붙어있는 <19세미만 구독불가> 스티커가 떼어지지 않는데, 스티커가 없는 도서로 교환이 되나요?
				      </button>
				    </h2>
				    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				      	일본도서 중 19세미만 구독불가 상품의 경우,<br>
						청소년 보호법 14조 및 유해표시방법에 따라 <19세미만 구독불가> 스티커가 부착됩니다.<br>
						스티커가 부착되지 않은 경우 국내 유통이 불가하여, 부착되지 않은 상품으로의 교환은 불가합니다.
				      </div>
				    </div>
				  </div>
				  
				</div>
			</div>
		</div>
		

	<%@ include file="../includes/footer.jsp"%>
</body>
</html>