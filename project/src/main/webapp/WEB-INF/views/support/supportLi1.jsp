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
			<p class="path" style="margin-left: 10px;">홈 > 고객센터 > 반품/교환/환불 </p>
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
				<h3 class="content_h3">반품 / 교환 / 환불</h3>
				<hr style="">
				
				<div class="accordion" id="accordionExample">
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingOne">
				      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				        &nbsp [주문취소/변경] 주문수정(취소/변경) 할 수 있나요?
				      </button>
				    </h2>
				    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				      	<p>주문하신 상품은 아래의 상태로 주문이 진행되며, 주문수정 가능 단계는 배송상품별로 다릅니다.</p>
				      		※주문취소 안내 <br>
							- 일반배송 상품(교보문고 배송 도서)은 상품준비중 단계까지 주문취소 가능합니다. <br>
							- eBook은 구매 후 다운로드를 하지 않은 경우에 한해 구매일로부터 7일 이내 주문취소 가능합니다. <br>
							- 해외주문도서의 경우는 결제완료 이후 24시간 이내 해외발주처리되므로 결제완료 상태에서 주문취소 불가 할수 있습니다. <br>
							- 주문취소할 수 없는 진행단계에 있는 상품의 경우에는 배송완료 후 반품신청을 하시기 바랍니다.
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingTwo">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
				        &nbsp [반품/교환/환불] 파본/훼손/오배송 된 상품을 교환하고 싶습니다. 어떻게 해야하나요?
				      </button>
				    </h2>
				    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				      		고객센터 1:1상담에서 <파본/ 상품불량 신고> 또는 <반품/교환/환불> 상담에 주문번호와 내용을 기재하여 주십시오.<br>
							담당자 확인 후 주문시의 주소로 상품을 다시 배송 해 드립니다.<br>
							파본도서는 배송 된 상품을 받으시면서 맞교환해주시면 됩니다.<br><br>
							
							택배직원 편에 반송을 못하셨을 경우, 고객센터의 Q&A <반품/교환/환불>로 문의 접수해주시면,<br>
							택배기사가 반품회수 재방문을 하도록 조치해드립니다.<br>
							또는 주문번호와 반송사유를 간략하게 메모하여 착불 반품을 보내주셔도 됩니다.<br><br>
							
							[반송주소]<br>
							일반 택배 반품시 :(우편번호:12345) 인천 미추홀구 매소홀로488번길 6-32 A동 2층 인터넷반품담당자 앞<br>
							위 주소는 인터넷교보문고 구매고객님께서 이용하시는 반품주소입니다.<br>
							※만약의 배송 확인을 위해, 택배 반송 시에는 반송영수증을 최소 2개월간 보관하여 주시기 바랍니다.
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingThree">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
				        &nbsp [주의사항] 반품/교환이 안되는 상품도 있나요?
				      </button>
				    </h2>
				    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				      	<p>
				      	구입일로부터 7일 이내 교환/환불 가능<br><br>

						1. 음반, 비디오, DVD, CD-ROM 및 S/W의 포장을 개봉했을 때는 반품/교환이 되지 않습니다.<br>
						   구입 전에 시스템 사양 등을 꼭 확인하시고 구입해 주십시오.<br><br>
						
						2. 기타 반품불가품목 <br>
						   잡지, 테이프, 대학입시자료, 사진집, 방통대 교재, 교과서, 만화, 미디어전품목, 악보집,
						정부간행물, 지도, 각종 수험서(해당 시험일정 D-1일까지 교환가능), 적성검사자료, 성경, 사전, 법령집, 지류, 필기구류, 시즌상품, 개봉한 상품, 외국서적 개인 주문 분, 상품의 인위적인 훼손이 있는 경우 등
				      	</p>
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingThree">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
				        &nbsp [반품/교환/환불] 일본만화나 문고 중 띠지가 없는 도서는 반품이 되나요?
				      </button>
				    </h2>
				    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				      	일본만화나 문고의 띠지가 없는 경우는 반품사유가 되지 않습니다. 띠지는 광고효과로 도서에 첨부되는 것이고, 상품이 아니기 때문에 도서가 파손된 것이 아니므로 반품이 불가합니다.
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingFive">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
				       &nbsp [반품/교환/환불] [택배파업] 택배 파업 지역 반품 및 회수시 어떻게 하나요?
				      </button>
				    </h2>
				    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				      	수령하신 도서의 반품을 원하시는 경우에는 매장에 직접 반품해주시거나<br>
						파업지역이 아닌 경우 홈페이지에서 반품신청을 해주시면 기사님께서 방문 회수하시게 됩니다.<br><br>
						
						파업지역인 경우, 다른 택배를 이용하여 아래 주소로 착불 반품 부탁드립니다.<br>
						반품처 : (우 10881) 경기 파주시 문발로 249, 교보문고 A동 2층 인터넷반품담당자 앞
				      </div>
				    </div>
				  </div>
				</div>
		
			</div>
		</div>
		

	<%@ include file="../includes/footer.jsp"%>
</body>
</html>