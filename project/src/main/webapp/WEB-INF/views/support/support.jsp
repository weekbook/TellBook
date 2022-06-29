<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ | 고객센터-TellBook</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/pavicon.png">
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
		<p class="path" style="margin-left: 10px;">홈 > 고객센터</p>
		<div class="support_snb">
			<h2 class="cscenter_h2">
				<a href="support">고객센터</a>
			</h2>
			<div style="background: #e9e9e9;">
				<ul class="support_li" style="margin-top: 15px;">
					<li><a href="supportLi1" style="text-decoration: none; color: inherit;">반품/교환/환불</a></li>
					<li><a href="supportLi2" style="text-decoration: none; color: inherit;">주문/결제</a></li>
					<li><a href="supportLi3" style="text-decoration: none; color: inherit;">회원</a></li>
					<li><a href="supportLi4" style="text-decoration: none; color: inherit;">도서/상품정보/교과서</a></li>
					<li><a href="supportLi5" style="text-decoration: none; color: inherit;">배송/수령일안내</a></li>
					<li><a href="inquirie" style="text-decoration: none; color: inherit;">1:1상담접수/내역확인 </a></li>
				</ul>
			</div>
		</div>
		<div class="content_area">
			<div class="cscenter_shortcut">
				<h3>주요 FAQ</h3>
				<ul>
					<li class="item_1"><a
						href="supportLi2">주문/결제</a></li>
					<li class="item_2"><a
						href="supportLi5">배송/수령일 안내</a></li>
					<li class="item_3"><a
						href="supportLi1">반품/교환/환불</a></li>
				</ul>
				<h3>퀵 마이페이지</h3>
				<ul>
					<li class="item_4"><a
						href="/mypage/ordersHistoryList">주문/배송조회</a></li>
					<li class="item_5"><a
						href="/mypage/myPage">포인트/충전금액 조회</a></li>
					<li class="item_6"><a
						href="/mypage/memberDetail?memberId=${member.memberId}">회원정보수정</a></li>
				</ul>
			</div>

			<div class="q_Questions">
				<h3>
					자주 묻는 질문 <small>고객님께서 가장 많이 궁금해하시는 내역을 빠르게 해결하실 수 있습니다.</small>
				</h3>
				<div class="list-group" style="display: inline-block;">
					<a href="#" class="list-group-item list-group-item-action active q_list1" 
						aria-current="true"> 주문·배송 </a> 
					<a href="#"
						class="list-group-item list-group-item-action q_list2">도서·상품</a> 
					<a
						href="#" class="list-group-item list-group-item-action q_list3">회원정보</a>
				</div>


				<div id="servicelistView" class="view1">
					<ul class="text_list">
						<li id="viewList1"><a href="supportLi2"> 비회원도 주문할 수 있나요? </a></li>
						<li id="viewList2"><a href="supportLi2"> 외국서적을 해외에서 직접 주문할 때는?</a></li>
						<li id="viewList3"><a href="supportLi2"> 주문을 수정(취소/변경)할 수 있나요?</a></li>
						<li id="viewList4"><a href="supportLi5"> 국내 배숑료는 얼마인가요? </a></li>
						<li id="viewList5"><a href="supportLi5"> 주문하면 얼마 만에 받아볼 수 있나요? </a></li>
						<li id="viewList6"><a href="supportLi5"> 주문한 상품 중 일부가 오지 않았습니다. </a></li>
						<li id="viewList7"><a href="supportLi5"> 주문한 상품이 아직 안왔어요.</a></li>
					</ul>
				</div>
				
				<div id="servicelistView" class="view2" style="display: none;">
					<ul class="text_list">
						<li id="viewList1"><a href="supportLi4"> 검색을 쉽게 하는 방법은 없나요? </a></li>
						<li id="viewList2"><a href="supportLi4"> 일본잡지 정기주문은 주문취소/반품/교환이 가능한가요?</a></li>
						<li id="viewList3"><a href="supportLi4"> 검색이 되지 않거나 품절/절판인 도서는 구입할 수 없나요?</a></li>
						<li id="viewList4"><a href="supportLi4"> 관심있는 분야의 도서를 추천받고 싶습니다. </a></li>
						<li id="viewList5"><a href="supportLi4"> 일본원서 표지에 붙어있는 <19세미만 구독불가> 스티커가 떼어지지 않는데,<br> 스티커가 없는 도서로 교환이 되나요? </a></li>
						<li id="viewList7"><a href="supportLi1"> 일본만화나 문고 중 띠지가 없는 도서는 반품이 되나요?</a></li>
					</ul>
				</div>
				
				<div id="servicelistView" class="view3" style="display: none;">
					<ul class="text_list">
						<li id="viewList1"><a href="supportLi3"> 회원가입/회원탈퇴는 어떻게 하나요? </a></li>
						<li id="viewList2"><a href="supportLi3"> 회원정보변경은 어떻게 하나요?</a></li>
						<li id="viewList3"><a href="supportLi3"> 회원가입을 하면 무엇이 좋은가요?</a></li>
						<li id="viewList4"><a href="supportLi3"> 국내 배숑료는 얼마인가요? </a></li>
						<li id="viewList5"><a href="supportLi3"> 아이디(ID)와 비밀번호(Password)를 잊어버렸어요. 어떻게 확인하나요? </a></li>
						<li id="viewList6"><a href="supportLi3"> 회원탈퇴가 되지 않습니다. 어떻게 해야 하나요? </a></li>
						<li id="viewList7"><a href="supportLi2"> 비회원도 주문할 수 있나요? </a></li>
					</ul>
				</div>
			</div>

		</div>
	</div>


	<%@ include file="../includes/footer.jsp"%>
</body>
<script>
	
	$('.list-group-item').click(function() {
		$('.list-group-item').removeClass("active");
		$(this).addClass("active");
	})
	
	$('.q_list1').click(function() {
		$('.view1').css('display','inline-block');
		$('.view2').css('display','none');
		$('.view3').css('display','none');
	});
	
	$('.q_list2').click(function() {
		$('.view1').css('display','none');
		$('.view2').css('display','inline-block');
		$('.view3').css('display','none');
	});
		
	$('.q_list3').click(function() {
		$('.view1').css('display','none');
		$('.view2').css('display','none');
		$('.view3').css('display','inline-block');
	});
	
</script>
</html>