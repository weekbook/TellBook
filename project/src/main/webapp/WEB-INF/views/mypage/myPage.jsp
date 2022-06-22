<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome BookMall</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="/resources/css/mypage/myPage.css">
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
		<!-- top_subject_area -->
		<div class="admin_top_wrap">
			<span>마이페이지</span>
		</div>
		<!-- contents-area -->
		<div class="admin_wrap">
			<!-- 네비영역 -->
			<div class="admin_navi_wrap">
				<ul>
					<li><a class="admin_list_01" href="/mypage/ordersHistoryList">주문조회/취소</a></li>
					<li><a class="admin_list_02 move" href='<c:out value="${member.memberId }"/>'>
									개인정보 수정
								</a></li>
					<li><a class="admin_list_03" href="/mypage/memberDelete">회원탈퇴</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="content_area">
		<div class="card border-secondary mb-3" style="max-width: 55rem; margin-top: 40px;">
		  <div class="card-header">${member.memberName}님의 마이페이지</div>
		  <div class="card-body">
		    <h4 class="card-title">충전금액 / 포인트</h4>
		    <p class="card-text">회원님의 현재 충전금액 : ${member.money } </p>
		    <p class="card-text">회원님의 현재 포인트 : ${member.point} </p>
		  </div>
		</div>	
	
	
		<form id="moveForm" action="/mypage/memberDetail" method="get">
			<input type="hidden" name="memberId" value="${member.memberId}">
		</form>
	</div>

	<%@ include file="../includes/footer.jsp"%>
</body>
<script>

let moveForm = $('#moveForm');
/* 상품 조회 페이지 */
$(".move").on("click", function(e){
	
	e.preventDefault();
	
	var memberId = moveForm.find("input[name='memberId']").val();
	// 게시물 읽고 뒤로가기 버튼했을때 같은 게시물에 들어가지는 오류 해결
	if(memberId != ''){
		moveForm.find("input[name='memberId']").remove();
	}
	
	moveForm.append("<input type='hidden' name='memberId' value='"+$(this).attr("href") + "'>");
	moveForm.attr("action", "/mypage/memberDetail");
	moveForm.submit();
	
	
});
</script>
</html>