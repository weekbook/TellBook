<%@page import="java.util.ArrayList"%>
<%@page import="com.myport.domain.SelectDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/resources/css/header.css">

<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">


<!-- 템플릿 -->
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>


<div class="wrapper">
	<div class="wrap">
		<!-- Navigation-->
		<nav class="navbar navbar-expand-lg navbar-dark fixed-top"
			id="mainNav"
			style="padding-top: 0.5rem; padding-bottom: 0.5rem; background-color: #5e6b9e">
			<div class="container">
				<a class="navbar-brand" href="#page-top" style="display: none;"><img
					src="/resources/template/assets/img/navbar-logo.svg" alt="..." /></a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
					aria-controls="navbarResponsive" aria-expanded="false"
					aria-label="Toggle navigation">
					Menu <i class="fas fa-bars ms-1"></i>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
						<c:if test="${member == null }">
							<li class="nav-item"><a class="nav-link"
								href="/member/login" style="color: white">로그인</a></li>
							<li class="nav-item"><a class="nav-link" href="/member/join"
								style="color: white">회원가입</a></li>
						</c:if>
						<c:if test="${member != null }">
							<c:if test="${member.adminCk == 1 }">
								<li class="nav-item"><a class="nav-link" href="/admin/main"
									style="color: white">관리자 페이지</a></li>
							</c:if>
							<li class="nav-item"><a class="nav-link"
								id="gnb_logout_button" style="color: white">로그아웃</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/mypage/myPage" style="color: white">마이페이지</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/cart/${member.memberId }" style="color: white">장바구니</a></li>
						</c:if>
						<li class="nav-item"><a class="nav-link"
							href="/support/support" style="color: white">고객센터</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<%-- <div class="top_gnb_area">
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
				<li><a href="/support/support">고객센터</a></li>
			</ul>
		</div> --%>

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
						<span>안녕하세요. TellBook 입니다.</span> <span>회원ID :
							${member.memberId}</span>
						<%-- <span>충전금액 : <fmt:formatNumber
								value="${member.money}" pattern="\#,###.##" /></span> <span>포인트
							: <fmt:formatNumber value="${member.point}" pattern="#,###" />
						</span>  --%>
						<!-- <a href="/member/logout.do">로그아웃</a> -->
					</div>
				</c:if>
			</div>

			<div class="clearfix"></div>
		</div>

		<div id="sidebox">
			<!-- <ul class="quick_banner" id="quick_banner"
				data-ga-category="교보문고_공통_PC" data-ga-action="퀵배너">
				<li><a data-ga-label="우측 확장형 배너 2"
					href="http://www.kyobobook.co.kr/member/kyobobenefit.jsp?orderClick=dot"
					target="_blank"><img
						src="https://simage.kyobobook.co.kr/ink/images/welcome/sample/sample_banner_15.jpg"
						alt="우측 확장형 배너 2"></a></li>
				<li><a data-ga-label="원데이_모나미"
					href="http://gift.kyobobook.co.kr/ht/hot/eventDetail?eventId=80248&amp;orderClick=do7"><img
						src="https://simage.kyobobook.co.kr/newimages/giftshop_new/work/1326/1656913328995_61_114_Wing-Banner.jpg"
						alt="우측 확장형 배너 2"></a></li>
			</ul> -->
			<div style="margin-bottom: 20px; text-align: center;">
				<p class="side_p">추천도서</p>
				<c:forEach items="${rl}" var="rl" varStatus="loop">
					<c:if test="${loop.index < 3}">
						<a href="/goodsDetail/${rl.bookId}" style="text-decoration: none;">
							<div class="content_wrap">
								<div>
									<div class="image_wrap2" data-bookid="${rl.imageList[0].bookId}"
									data-path="${rl.imageList[0].uploadPath}"
									data-uuid="${rl.imageList[0].uuid}"
									data-filename="${rl.imageList[0].fileName}">
									<img style="width: -webkit-fill-available;">
								</div>
									<div class="ls_bookName">${rl.bookName}</div>
								</div>
							</div>
						</a>
					</c:if>
				</c:forEach>
			</div>
			<div class="btn_quick_top">
				<a data-ga-label="최상단" href="#Top">TOP</a>
			</div>
			<div class="btn_quick_down">
				<a data-ga-label="최하단" href="#footer_area">DOWN</a>
			</div>
		</div>

		<script>
			$(document).ready(function() {
				var currentPosition = parseInt($("#sidebox").css("top"));
				$(window).scroll(function() {
					var position = $(window).scrollTop();
					$("#sidebox").stop().animate({
						"top" : position + currentPosition + "px"
					}, 1000);
				});
				
				/* 이미지 삽입 */
				$(".image_wrap2")
						.each(
								function(i, obj) {

									const bobj = $(obj);

									if (bobj.data("bookid")) {
										const uploadPath = bobj
												.data("path");
										const uuid = bobj.data("uuid");
										const fileName = bobj
												.data("filename");

										const fileCallPath = encodeURIComponent(uploadPath
												+ "/s_"
												+ uuid
												+ "_"
												+ fileName);

										$(this).find("img").attr(
												'src',
												'/display?fileName='
														+ fileCallPath);
									} else {
										$(this)
												.find("img")
												.attr('src',
														'/resources/img/goodsNoImage.png');
									}

								});
			});

			//gnb영역 로그아웃 버튼 작동
			$("#gnb_logout_button").click(function() {
				// alert("버튼 작동");
				$.ajax({
					type : "post",
					url : "/member/logout.do",
					success : function(data) {
						alert("로그아웃 완료");
						document.location.reload();
					}
				});
			});
		</script>