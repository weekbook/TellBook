<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ | 고객센터-TellBook</title>
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
					<li><a href="supportLi6" style="text-decoration: none; color: inherit;">1:1상담접수/내역확인 </a></li>
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
					<a href="#" class="list-group-item list-group-item-action active"
						aria-current="true"> 주문·배송 </a> <a href="#"
						class="list-group-item list-group-item-action">도서·상품</a> <a
						href="#" class="list-group-item list-group-item-action">회원정보</a>
				</div>


				<div id="servicelistView">
					<ul class="text_list">
						<li id="viewList1"><a id="openAnchor31"
							href="javascript:searchForView(31,'')"> 국내에 보유하고 있지 않는 서양서/일서
								[해외주문도서]는 얼마만에 받아 볼 수 있나요? </a></li>
						<li id="viewList2"><a id="openAnchor32"
							href="javascript:searchForView(32,'')"> 주문한 상품 중 일부가 오지
								않았습니다. </a></li>
						<li id="viewList3"><a id="openAnchor33"
							href="javascript:searchForView(33,'')"> 해외배송을 하려 하는데 배송지를 어떻게
								작성해야 하나요? </a></li>
						<li id="viewList4"><a id="openAnchor35"
							href="javascript:searchForView(35,'')"> 예약상품 배송에 대하여 설명드립니다.
						</a></li>
						<li id="viewList5"><a id="openAnchor36"
							href="javascript:searchForView(36,'')"> 회사로 배송신청을 하면 퇴근 전에
								바로배송이 가능한가요? </a></li>
						<li id="viewList6"><a id="openAnchor37"
							href="javascript:searchForView(37,'')"> 인터넷 안전결제(ISP, 안심결제)
								안내 </a></li>
						<li id="viewList7"><a id="openAnchor38"
							href="javascript:searchForView(38,'')"> 해외카드 결제시 3D 인증방식이
								무엇인가요? </a></li>
					</ul>
				</div>
			</div>

		</div>
	</div>


	<%@ include file="../includes/footer.jsp"%>
</body>
<script>
</script>
</html>