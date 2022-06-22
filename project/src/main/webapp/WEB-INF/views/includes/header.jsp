<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/resources/css/header.css">

<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<div class="wrapper">
	<div class="wrap">
		<div class="top_gnb_area">
			<ul class="list">
				<c:if test="${member == null }">
					<li><a href="/member/login">로그인</a></li>
					<li><a href="/member/join">회원가입</a></li>
				</c:if>
				<c:if test="${member != null }">
					<c:if test="${member.adminCk == 1 }">
						<li><a href="/admin/main">관리자 페이지</a></li>
					</c:if>
					<li><a id="gnb_logout_button">로그아웃</a></li>
					<li><a href="/mypage/myPage">마이페이지</a></li>
					<li><a href="/cart/${member.memberId }">장바구니</a></li>
				</c:if>
				<li><a href="/support">고객센터</a></li>
			</ul>
		</div>

		<div class="top_area">
			<div class="logo_area">
				<a href="/main"><img src="/resources/img/mLogo.png"></a>
			</div>
			<div class="search_area">
				<div class="search_wrap">
					<form id="searchForm" action="/search" method="get">
						<div class="search_input">
							<select class="form-select" name="type">
								<option value="T">책 제목</option>
								<option value="A">작가</option>
							</select> <input type="text" name="keyword" class="form-control"
								value='<c:out value="${pageMaker.cri.keyword }"/>'>
							<button class='btn search_btn btn-success'>검 색</button>
						</div>
					</form>
				</div>
			</div>
			
			<div class="login_area">
			
				 <!-- 로그인 하지 않은 상태 -->
				<c:if test="${member == null }">
					<div class="login_button">
						<a href="/member/login">로그인</a>
					</div>
					<span><a href="/member/join">회원가입</a></span>
				</c:if>

				<!-- 로그인한 상태 -->
				<c:if test="${member != null }">
					<div class="login_success_area">
						<span>안녕하세요. TellBook 입니다.</span>
						<span>회원ID : ${member.memberId}</span> <%-- <span>충전금액 : <fmt:formatNumber
								value="${member.money}" pattern="\#,###.##" /></span> <span>포인트
							: <fmt:formatNumber value="${member.point}" pattern="#,###" />
						</span>  --%><!-- <a href="/member/logout.do">로그아웃</a> -->
					</div>
				</c:if>
			</div>
			
			<div class="clearfix"></div>
		</div>

		<script>
//gnb영역 로그아웃 버튼 작동
$("#gnb_logout_button").click(function(){
	// alert("버튼 작동");
	$.ajax({
		type : "post",
		url : "/member/logout.do",
		success : function(data){
			alert("로그아웃 완료");
			document.location.reload();
		}
	});
});
</script>