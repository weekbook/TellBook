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
<link rel="stylesheet"
	href="/resources/css/mypage/ordersHistoryList.css">
</head>
<body>
	<div class="wrapper">
		<div class="wrap">
			<!-- gnv_area -->
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
			<!-- contents-area -->
			<div class="admin_wrap">
				<!-- 네비영역 -->
				<div class="admin_navi_wrap">
					<ul>
						<li><a class="admin_list_01" href="/mypage/ordersHistoryList">주문조회/취소</a></li>
						<li><a class="admin_list_02" href="/mypage/memberDetail">개인정보
								수정</a></li>
					</ul>
				</div>
				<div class="admin_content_wrap">
					<div class="admin_content_subject">
						<span>주문조회 및 취소</span>
					</div>
					<div class="order_table_wrap ">
						<!-- 게시물 O -->
						<c:if test="${listCheck != 'empty' }">
							<table class="order_table table">
								<colgroup>
									<col width="21%">
									<col width="20%">
									<col width="20%">
									<col width="20%">
									<col width="19%%">
								</colgroup>
								<thead class="table-dark">
									<tr>
										<td class="th_column_1">주문 번호</td>
										<td class="th_column_2">주문 아이디</td>
										<td class="th_column_3">주문 날짜</td>
										<td class="th_column_4">주문 상태</td>
										<td class="th_column_5">상품 이름</td>
										<td class="th_column_6">취소</td>
									</tr>
								</thead>
								<c:forEach items="${list}" var="list">
									<c:if test="${member.memberId == list.memberId}">
										<tr>
											<td><c:out value="${list.orderId}"></c:out></td>
											<td><c:out value="${list.memberId}"></c:out></td>
											<td><fmt:formatDate value="${list.orderDate}"
													pattern="yyyy-MM-dd" /></td>
											<td><c:out value="${list.orderState}" /></td>
											<td><c:out value="${list.bookName }"></c:out></td>
											<td><c:if test="${list.orderState =='배송준비' }">
													<button class="btn delete_btn btn-danger"
														data-orderid="${list.orderId}">취소</button>
												</c:if></td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</c:if>

						<!-- 게시물 o -->
						<c:if test="${listCheck == 'empty' }">
							<div class="table_empty">등록된 주문이 없습니다.</div>
						</c:if>
					</div>
					<!-- 검색 영역 -->
					<div class="search_wrap">
						<form id="searchForm2" action="/mypage/OrdersHistoryList"
							method="get" style="display: flex; justify-content: center;">
							<div class="search_input"
								style="display: flex; justify-content: center;">
								<input type="text" name="keyword" class="form-control"
									placeholder="Search..."
									style="width: 40%; display: inline-block; margin-bottom: 20px;"
									value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
								<input type="hidden" name="pageNum"
									value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
								<input type="hidden" name="amount"
									value='${pageMaker.cri.amount}'>
								<button class='btn search_btn2 btn-primary'>검 색</button>
							</div>
						</form>
					</div>

					<!-- 페이지 이동 인터페이스 영역 -->
					<div class="pageMaker_wrap">
						<ul class="pageMaker pagination">

							<!-- 이전 버튼 -->
							<c:if test="${pageMaker.prev}">
								<li class="pageMaker_btn prev page-item"><a
									href="${pageMaker.pageStart - 1}" class="page-link">이전</a></li>
							</c:if>

							<!-- 페이지 번호 -->
							<c:forEach begin="${pageMaker.pageStart}"
								end="${pageMaker.pageEnd}" var="num">
								<li
									class='page-item pageMaker_btn ${pageMaker.cri.pageNum==num?"active":"" }'>
									<a href="${num}" class="page-link">${num}</a>
							</c:forEach>

							<!-- 다음 버튼 -->
							<c:if test="${pageMaker.next}">
								<li class="page-item pageMaker_btn next"><a
									class="page-link" href="${pageMaker.pageEnd + 1 }">다음</a></li>
							</c:if>
						</ul>
					</div>
					<form id="moveForm" action="/mypage/OrdersHistoryList" method="get">
						<input type="hidden" name="pageNum"
							value="${pageMaker.cri.pageNum}"> <input type="hidden"
							name="amount" value="${pageMaker.cri.amount}"> <input
							type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
					</form>

					<form id="deleteForm" action="/mypage/orderCancle" method="post">
						<input type="hidden" name="orderId"> <input type="hidden"
							name="pageNum" value="${pageMaker.cri.pageNum}"> <input
							type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<input type="hidden" name="keyword"
							value="${pageMaker.cri.keyword}"> <input type="hidden"
							name="memberId" value="${member.memberId}">
					</form>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../includes/footer.jsp"%>
</body>
<script>
	let searchForm2 = $('#searchForm2');
	let moveForm = $('#moveForm');

	$("#searchForm2 button").on("click", function(e) {

		e.preventDefault();
		
		/* 검색 키워드 유효성 검사 */
		if (!searchForm2.find("input[name='keyword']").val()) {
			alert("키워드를 입력하십시오");
			return false;
		}

		searchForm2.find("input[name='pageNum']").val("1");

		searchForm2.submit();

	});

	/* 페이지 이동 버튼 */
	$(".pageMaker_btn a").on("click", function(e) {

		e.preventDefault();

		console.log($(this).attr("href"));

		moveForm.find("input[name='pageNum']").val($(this).attr("href"));

		moveForm.submit();

	});
	
	$(".delete_btn").on("click", function(e){
		e.preventDefault();
		
		let id = $(this).data("orderid");
		
		$("#deleteForm").find("input[name='orderId']").val(id);
		$("#deleteForm").submit();
	});
</script>
</html>