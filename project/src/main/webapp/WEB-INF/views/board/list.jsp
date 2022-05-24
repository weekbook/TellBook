<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.table {
	text-align: center;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">

		<div class="card shadow mb-4">
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="50%"
						cellspacing="0">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="board" items="${list }">
								<tr>
									<td><c:out value="${board.bno }"></c:out></td>
									<td><a href="${board.bno }" class="move"> <c:out
												value="${board.title }"></c:out> <c:if
												test="${board.replyCnt ne 0 }">
												<span style="color: red;">[<c:out
														value="${board.replyCnt }" />]
												</span>
											</c:if>
									</a></td>
									<td><c:out value="${board.writer }"></c:out></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${board.regdate }" /></td>
									<td><c:out value="${board.views }"></c:out></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<div class="search_wrap">
						<div class="search_area">
							<select name="type">
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목
									+ 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목
									+ 작성자</option>
								<option value="TCW"
									<c:out value="${pageMaker.cri.type eq 'TCW'?'selected':'' }"/>>제목
									+ 내용 + 작성자</option>
							</select> <input type="text" name="keyword"
								value="${pageMaker.cri.keyword }">
							<button class="btn btn-warning">Search</button>
						</div>
					</div>
					<div align="right">
                    		<button id="regBtn" class="btn btn-warning">글쓰기</button>
                    </div>
					<br>
					<div>
						<ul class="pagination justify-content-center">
							<c:if test="${pageMaker.prev }">
								<li class="page-item previous"><a
									href="${pageMaker.startPage-1 }" class="page-link">Prev</a></li>
							</c:if>
							<c:forEach var="num" begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }">
								<li class='page-item ${pageMaker.cri.pageNum==num?"active":"" }'>
									<a href="${num}" class="page-link">${num }</a>
							</c:forEach>
							<c:if test="${pageMaker.next }">
								<li class="page-item next"><a
									href="${pageMaker.endPage+1 }" class="page-link">Next</a></li>
							</c:if>
						</ul>
						<form id="actionForm" action="/board/list" method="get">
							<input type="hidden" name="pageNum"
								value="${pageMaker.cri.pageNum }"> <input type="hidden"
								name="amount" value="${pageMaker.cri.amount }"> <input
								type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
							<input type="hidden" name="type" value="${pageMaker.cri.type }">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header"></div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>	
</div>
<script>
	$(document).ready(function() {
		$("#regBtn").on("click", function() {
			self.location = "/board/register";
		});
		
		var result = '<c:out value="${result}"/>';
		checkModal(result);
		
		function checkModal(result) {
			if (result === '') {
				return;
			}
			
			if($.isNumeric(result)){
				if(parseInt(result)>0){
					$(".modal-body").html("게시글 " + parseInt(result)+"번이 등록");
				}
			} else{
				$(".modal-body").html(result);
			}
			
			
			$("#myModal").modal("show");
		}
		
		var actionForm = $("#actionForm");
		
		$(".page-item a").on("click", function(e) {
			e.preventDefault();
			
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			
			actionForm.attr("action", "/board/list");
			actionForm.submit();
		});
		
		$(".move").on("click", function(e) {
			e.preventDefault();
			
			var bno = actionForm.find("input[name='bno']").val();
			if(bno != ''){
				actionForm.find("input[name='bno']").remove();
			}
			
			actionForm.append("<input type='hidden' name='bno' "
					+"value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","/board/get");
			actionForm.submit();
		});
		
		$(".search_area button").on("click", function(e) {
			var type = $(".search_area select").val();
			var keyword = $(".search_area input[name='keyword']").val();
			var sKey = '<c:out value="${pageMaker.cri.keyword}"/>';
			
			console.log("이전 검색어 : " + sKey);
			console.log("현재 검색어 : " + keyword);
			
			if(!type){
				alert("타입을 선택하세요");
				return false;
			}
			
			if(!keyword){
				alert("키워드를 입력하세요");
				return false;
			}
			
			if(sKey != keyword){
				actionForm.find("input[name='pageNum']").val(1);
			}
			
			actionForm.find("input[name='type']").val(type);
			actionForm.find("input[name='keyword']").val(keyword);
			actionForm.submit();
			
		});
		
		
		
		
		
	});
</script>
<%@ include file="../includes/footer.jsp"%>