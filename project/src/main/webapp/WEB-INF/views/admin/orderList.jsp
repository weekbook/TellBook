<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문현황 - 관리자페이지</title>
<!-- 파비콘 -->
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/pavicon.png">
<link rel="stylesheet" href="../resources/css/admin/orderList.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<%@ include file="../includes/adminLayout.jsp"%>
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>주문 현황</span>
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
							<td class="th_column_5">취소</td>
						</tr>
					</thead>
					<c:forEach items="${list}" var="list">
						<tr>
							<td><a href="${list.orderId }" class="move"><c:out value="${list.orderId}"></c:out></a></td>
							<td><c:out value="${list.memberId}"></c:out></td>
							<td><fmt:formatDate value="${list.orderDate}"
									pattern="yyyy-MM-dd" /></td>
							<td><c:out value="${list.orderState}" /></td>
							<td> 
								<c:if test="${list.orderState =='배송준비' }">
									<button class="btn delete_btn btn-danger" data-orderid="${list.orderId}">취소</button>
								</c:if>
							</td>
						</tr>
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
			<form id="searchForm" action="/admin/orderList" method="get">
				<div class="search_input"
					style="display: flex; justify-content: center;">
					<input type="text" name="keyword" class="form-control"
						placeholder="Search..."
						style="width: 40%; display: inline-block; margin-bottom: 20px;"
						value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
					<input type="hidden" name="pageNum"
						value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
					<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
					<button class='btn search_btn btn-primary'>검 색</button>
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
				<c:forEach begin="${pageMaker.pageStart}" end="${pageMaker.pageEnd}"
					var="num">
					<li
						class='page-item pageMaker_btn ${pageMaker.cri.pageNum==num?"active":"" }'>
						<a href="${num}" class="page-link">${num}</a>
				</c:forEach>

				<!-- 다음 버튼 -->
				<c:if test="${pageMaker.next}">
					<li class="page-item pageMaker_btn next"><a class="page-link"
						href="${pageMaker.pageEnd + 1 }">다음</a></li>
				</c:if>
			</ul>
		</div>
		<form id="moveForm" action="/admin/orderList" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		</form>
		
		<form id="deleteForm" action="/admin/orderCancle" method="post">
        	<input type="hidden" name="orderId">
        	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
        	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
        	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
        	<input type="hidden" name="memberId" value="${member.memberId}">
        </form>
	</div>

	<%@ include file="../includes/footer.jsp"%>

</body>
<script>
	let searchForm = $('#searchForm');
	let moveForm = $('#moveForm');
	
	/* 작거 검색 버튼 동작 */
	$("#searchForm button").on("click", function(e){
		
		e.preventDefault();
		
		/* 검색 키워드 유효성 검사 */
		if(!searchForm.find("input[name='keyword']").val()){
			alert("키워드를 입력하십시오");
			return false;
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		
		searchForm.submit();
		
	});
	
	
	/* 페이지 이동 버튼 */
	$(".pageMaker_btn a").on("click", function(e){
		
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
	
	//  주문 상세 페이지 이동
 	$(".move").on("click", function(e){
 		e.preventDefault();
 		
 		var orderId = moveForm.find("input[name='authorId']").val();
		// 게시물 읽고 뒤로가기 버튼했을때 같은 게시물에 들어가지는 오류 해결
		if(orderId != ''){
			moveForm.find("input[name='orderId']").remove();
		}
 		
 		moveForm.append("<input type='hidden' name='orderId' value='" + $(this).attr("href") + "'>");
 		moveForm.attr("action", "/admin/orderInfo");
 		moveForm.submit();
 	});
</script>
</html>
