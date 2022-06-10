<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/memberManage.css?ver1">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
</head>
<body>
	<%@ include file="../includes/adminLayout.jsp"%>

	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>회원 관리</span>
		</div>

		<div class="member_table_wrap">
			<!-- 회원 리스트 O -->
			<c:if test="${listcheck != 'empty'}">
				<table class="members_table table">
					<thead class="table-dark">
						<tr>
							<td class="th_column_1">회원 ID</td>
							<td class="th_column_2">회원 이름</td>
							<td class="th_column_3">회원 이메일</td>
							<td class="th_column_4">생성일</td>
						</tr>
					</thead>
					<c:forEach items="${list}" var="list">
						<tr>
							<td><c:out value="${list.memberId}"></c:out></td>
							<td>
								<a class="move" href='<c:out value="${list.memberId }"/>'>
									<c:out value="${list.memberName}"></c:out>
								</a>
							</td>
							<td><c:out value="${list.memberMail}"></c:out></td>
							<td><fmt:formatDate value="${list.regDate}"
									pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<!-- 상품 리스트 X -->
			<c:if test="${listCheck == 'empty'}">
				<div class="table_empty">등록된 회원이 없습니다.</div>
			</c:if>
		</div>

		<!-- 검색 영역 -->
		<div class="search_wrap">
			<form id="searchForm" action="/admin/memberManage" method="get">
				<div class="search_input" style="display: flex; justify-content: center;">
					<input type="text" name="keyword" class="form-control" placeholder="Search..."
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
					<li class='page-item pageMaker_btn ${pageMaker.cri.pageNum==num?"active":"" }'>
					<a href="${num}" class="page-link">${num}</a>
				</c:forEach>

				<!-- 다음 버튼 -->
				<c:if test="${pageMaker.next}">
					<li class="page-item pageMaker_btn next"><a class="page-link"
						href="${pageMaker.pageEnd + 1 }">다음</a></li>
				</c:if>
			</ul>
		</div>

		<form id="moveForm" action="/admin/memberManage" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
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
		
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.attr("action", "/admin/memberManage");
		moveForm.submit();
		
	});

	/* 상품 조회 페이지 */
	$(".move").on("click", function(e){
		
		e.preventDefault();
		
		var memberId = moveForm.find("input[name='memberId']").val();
		// 게시물 읽고 뒤로가기 버튼했을때 같은 게시물에 들어가지는 오류 해결
		if(memberId != ''){
			moveForm.find("input[name='memberId']").remove();
		}
		
		moveForm.append("<input type='hidden' name='memberId' value='"+$(this).attr("href") + "'>");
		moveForm.attr("action", "/admin/memberDetail");
		moveForm.submit();
		
		
	});
</script>
</html>
