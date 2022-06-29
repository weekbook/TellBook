<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1QnA | 고객센터 - TellBook</title>
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
		<p class="path" style="margin-left: 10px;">홈 > 고객센터 > 문의내역</p>
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
		<div class="content_area" style="border: 1px solid;">
			<h2 class="content_h2">반품 / 교환 / 환불</h2>
			<hr style="">
			<h3 class="conten_h3">1:1 문의내역</h3>
			
			<div class="goods_table_wrap">
				<!-- 상품 리스트 O -->
				<c:if test="${listcheck != 'empty'}">
					<table class="goods_table table">
						<thead class="table-primary">
							<tr>
								<td class="th_column_1">글번호</td>
								<td class="th_column_2">질문유형</td>
								<td class="th_column_3">제목</td>
								<td class="th_column_4">날짜</td>
							</tr>
						</thead>
						<c:forEach items="${list}" var="list">
							<tr>
								<td><c:out value="${list.bookId}"></c:out></td>
								<td>
									<a class="move" href='<c:out value="${list.bookId }"/>'>
										<c:out value="${list.bookName}"></c:out>
									</a>
								</td>
								<td><c:out value="${list.authorName}"></c:out></td>
								<td><fmt:formatDate value="${list.regDate}"
										pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
				<!-- 상품 리스트 X -->
				<c:if test="${listCheck == 'empty'}">
					<div class="table_empty">문의 내용이 없습니다.</div>
				</c:if>
			</div>
		</div>
	</div>


	<%@ include file="../includes/footer.jsp"%>
</body>
</html>