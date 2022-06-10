<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="../resources/css/admin/authorManage.css?ver2">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<%@ include file="../includes/adminLayout.jsp"%>
	<div class="admin_content_wrap">
		<div class="admin_content_subject"><span>작가 관리</span></div>
		<div class="author_table_wrap">
			<!-- 게시물 O -->
			<c:if test="${listCheck != 'empty' }">
				<table class="author_table table">
					<thead class="table-dark">
						<tr>
							<td class="th_column_1">작가 번호</td>
							<td class="th_column_2">작가 이름</td>
							<td class="th_column_3">작가 국가</td>
							<td class="th_column_4">등록 날짜</td>
							<td class="th_column_5">수정 날짜</td>
						</tr>
					</thead>
					<c:forEach items="${list}" var="list">
						<tr>
							<td><c:out value="${list.authorId}"></c:out></td>
							<td>
								<a class="move" href='<c:out value="${list.authorId}"/>'>
									<c:out value="${list.authorName}"></c:out>
								</a>
							</td>
							<td><c:out value="${list.nationName}"></c:out></td>
							<td><fmt:formatDate value="${list.regDate}"
									pattern="yyyy-MM-dd" /></td>
							<td><fmt:formatDate value="${list.updateDate}"
									pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			
			<!-- 게시물 o -->
			<c:if test="${listCheck == 'empty' }">
				<div class="table_empty">
					등록된 작가가 없습니다.
				</div>
			</c:if>
		</div>
		<!-- 검색 영역 -->
		<div class="search_wrap">
			<form id="searchForm" action="/admin/authorManage" method="get">
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
		<form id="moveForm" action="/admin/authorManage" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		</form>
	</div>

	<%@ include file="../includes/footer.jsp"%>


	<script>
	let moveForm = $('#moveForm');
	let searchForm = $("#searchForm");
	

 	$(document).ready(function(){
 		let result = '<c:out value="${enroll_result}"/>';
 		let mresult = '<c:out value="${modify_result}"/>';
 		
 		checkResult(result);
 		checkmResult(mresult);
 		
 		// 작가 등록 결과
 		function checkResult(result){
 			if(result === ''){
 				return;
 			}
 			
 			alert("작가'${enroll_result}' 을 등록하였습니다.");
 		}
 		
 		// 작가 수정 결과
 		function checkmResult(mresult){
 			if(mresult === '1'){
 				alert("작가 정부 수정을 완료하였습니다.");
 			} else if(mresult === '0'){
 				alert("작가 정부 수정을 하지 못하였습니다.")
 			}
 		}
 		
 		/* 삭제 결과 경고창 */
 		let delete_result = '${delete_result}';
 		
 		if(delete_result == 1){
 			alert("삭제 완료");
 		} else if(delete_result == 2){
 			alert("해당 작가 데이터를 사용하고 있는 데이터가 있어서 삭제 할 수 없습니다.")
 		}	
 		
 	});
 	
 	// 페이지 이동 버튼
	 $(".pageMaker_btn a").on("click", function (e) {
		e.preventDefault();
			
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.attr("action", "/admin/authorManage");
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
 	
 	//  작가 상세 페이지 이동
 	$(".move").on("click", function(e){
 		e.preventDefault();
 		
 		var authorId = moveForm.find("input[name='authorId']").val();
		// 게시물 읽고 뒤로가기 버튼했을때 같은 게시물에 들어가지는 오류 해결
		if(authorId != ''){
			moveForm.find("input[name='authorId']").remove();
		}
 		
 		moveForm.append("<input type='hidden' name='authorId' value='" + $(this).attr("href") + "'>");
 		moveForm.attr("action", "/admin/authorDetail");
 		moveForm.submit();
 	});
</script>
</body>
</html>
