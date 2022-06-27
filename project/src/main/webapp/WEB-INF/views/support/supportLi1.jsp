<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<p class="path" style="margin-left: 10px;">홈 > 고객센터 </p>
			<div class="support_snb">
				<h2 class="cscenter_h2"><a href="support">고객센터</a></h2>
					<div style="background: #e9e9e9;">
						<ul class="support_li" style="margin-top: 15px;">
							<li><a href="supportLi1" style="text-decoration: none; color: inherit;">반품/교환/환불</a></li>
							<li>주문/결제</li>
							<li>회원</li>
							<li>도서/상품정보/교과서</li>
							<li>배송/수령일안내</li>
							<li>서비스/기타</li>
						</ul>
					</div>
			</div>
			<div class="content_area">
				반품/교환/환불
		
			</div>
		</div>
		

	<%@ include file="../includes/footer.jsp"%>
</body>
</html>