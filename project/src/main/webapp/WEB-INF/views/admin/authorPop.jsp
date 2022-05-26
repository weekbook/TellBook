<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/authorPop.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>
	<div class="subject_name_warp">
		<span>작가 선택</span>
	</div>
	<div class="content_wrap">
		<!-- 게시물 표 영역 -->
		<div class="author_table_wrap">
			<!-- 게시물 O -->
			<c:if test="${listCheck != 'empty'}">
				<div class="table_exist">
					<table class="author_table table">
						<thead class="table-dark">
							<tr>
								<td class="th_column_1">작가 번호</td>
								<td class="th_column_2">작가 이름</td>
								<td class="th_column_3">작가 국가</td>
							</tr>
						</thead>
						<c:forEach items="${list}" var="list">
							<tr>
								<td><c:out value="${list.authorId}"></c:out></td>
								<td>
									<a class="move" href='<c:out value="${list.authorId}"/>' 
									data-name='<c:out value="${list.authorName}"/>'>
									<c:out value="${list.authorName}"></c:out> 
									</a>
								</td>
								<td><c:out value="${list.nationName}"></c:out></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</c:if>
			<!-- 게시물 x -->
			<c:if test="${listCheck == 'empty'}">
				<div class="table_empty">등록된 작가가 없습니다.</div>
			</c:if>

			<!-- 검색 영역 -->
			<div class="search_wrap">
				<form id="searchForm" action="/admin/authorPop" method="get">
					<div class="search_input" style="display: flex; justify-content: center;">
						<input type="text" class="form-control" name="keyword" placeholder="Search..."
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
						<li class="pageMaker_btn prev page-item"><a class="page-link"
							href="${pageMaker.pageStart - 1}">이전</a></li>
					</c:if>

					<!-- 페이지 번호 -->
					<c:forEach begin="${pageMaker.pageStart}"
						end="${pageMaker.pageEnd}" var="num">
						<li class="page-item pageMaker_btn ${pageMaker.cri.pageNum == num ? "active":""}">
							<a class="page-link" href="${num}">${num}</a>
						</li>
					</c:forEach>

					<!-- 다음 버튼 -->
					<c:if test="${pageMaker.next}">
						<li class="pageMaker_btn next page-item"><a class="page-link"
							href="${pageMaker.pageEnd + 1 }">다음</a></li>
					</c:if>

				</ul>

			</div>

			<form id="moveForm" action="/admin/authorPop" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
			</form>


		</div>

	</div>
	
</body>
<script>
	let moveForm = $('#moveForm');
	let searchForm = $("#searchForm");
	
	// 페이지 이동 버튼
	 $(".pageMaker_btn a").on("click", function (e) {
		e.preventDefault();
			
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.attr("action", "/admin/authorPop");
		moveForm.submit();
	});
	
	
	$("#searchForm button").on("click", function(e) {
		e.preventDefault();
		
		// 검색 유효성 검사
		if(!searchForm.find("input[name='keyword']").val()){
			alert("키워드를 입력하십시오.");
			return false;
		}
		searchForm.find("input[name='pageNum']").val("1");
		
		searchForm.submit();
	});
	
	// 작가 선택 및 팝업창 닫기
	$(".move").on("click",function(e){
		e.preventDefault();
		
		let authorId = $(this).attr("href");
		let authorName = $(this).data("name");
		$(opener.document).find("#authorId_input").val(authorId);
		$(opener.document).find("#authorName_input").val(authorName);
		
		window.close();
	});
</script>
</html>