<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1QnA | 고객센터 - TellBook</title>
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/img/pavicon.png">
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
					<li><a href="supportLi1"
						style="text-decoration: none; color: inherit;">반품/교환/환불</a></li>
					<li><a href="supportLi2"
						style="text-decoration: none; color: inherit;">주문/결제</a></li>
					<li><a href="supportLi3"
						style="text-decoration: none; color: inherit;">회원</a></li>
					<li><a href="supportLi4"
						style="text-decoration: none; color: inherit;">도서/상품정보/교과서</a></li>
					<li><a href="supportLi5"
						style="text-decoration: none; color: inherit;">배송/수령일안내</a></li>
					<li><a href="inquirie"
						style="text-decoration: none; color: inherit;">1:1상담접수/내역확인 </a></li>
				</ul>
			</div>
		</div>
		<div class="content_area" style="border: 1px solid;">
			<hr style="">
			<h3 class="conten_h3"
				style="display: inline-block; margin-left: 36px;">1:1 문의내역</h3>
			<button id="regBtn" class="btn btn-primary"
				style="float: right; margin-right: 36px;">1:1문의 바로가기</button>

			<div class="goods_table_wrap">
				<!-- 상품 리스트 O -->
				<c:if test="${listcheck != 'empty'}">
					<table class="goods_table table">
						<thead class="table-primary">
							<tr>
								<td class="th_column_1">일자</td>
								<td class="th_column_2">종류</td>
								<td class="th_column_3">제목</td>
								<td class="th_column_4">답변</td>
								<td class="th_column_5">기능</td>
							</tr>
						</thead>
						<c:forEach items="${list }" var="list">
							<tr>
								<td><fmt:formatDate value="${list.BDate}"
										pattern="yyyy-MM-dd" /></td>
								<td><c:out value="${list.BType}"></c:out></td>
								<td><c:out value="${list.BTitle}"></c:out></td>
								<td>
									<c:if test="${list.BAnswerCk == '1'}">
										<button class="btn btn-success answer_btn"
											style="padding: 0.05rem 0.5rem;" value="${list.BId }">답변완료</button>
									</c:if>
									<c:if test="${list.BAnswerCk == '0' }">
										<button class="btn btn-secondary" disabled
											style="padding: 0.05rem 0.5rem;" value="${list.BId }">답변대기</button>
									</c:if>
								</td>
								<td><c:if test="${member.adminCk == 1}">
										<button class="btn btn-warning answer_btn"
											style="padding: 0.05rem 0.5rem;" value="${list.BId }">답변하기</button>
									</c:if></td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
				<!-- 상품 리스트 X -->
				<c:if test="${listCheck == 'empty'}">
					<div class="table_empty">문의 내용이 없습니다.</div>
				</c:if>
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
						<li class="page-item pageMaker_btn next"><a class="page-link"
							href="${pageMaker.pageEnd + 1 }">다음</a></li>
					</c:if>
				</ul>
			</div>

			<form id="moveForm" action="/support/inquirie" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
			</form>

			<form id="actionForm" action="/support/inquirie" method="get">
				<input type="hidden" name="pageNum"
					value="${pageMaker.cri.pageNum }"> 
				<input type="hidden"
					name="amount" value="${pageMaker.cri.amount }">
			</form>
		</div>
	</div>


	<%@ include file="../includes/footer.jsp"%>
</body>
<script>
	$(document).ready(function() {
		$("#regBtn").on("click", function() {
			self.location = "/support/register";
		});

		let moveForm = $('#moveForm');
		/* 페이지 이동 버튼 */
		$(".pageMaker_btn a").on("click", function(e) {

			e.preventDefault();

			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/support/inquirie");
			moveForm.submit();

		});
		
		var actionForm = $("#actionForm");
		
		$(".answer_btn").on("click", function(e) {
			e.preventDefault();
			
			var bId = actionForm.find("input[name='bId']").val();
			if(bId != ''){
				actionForm.find("input[name='bId']").remove();
			}
			
			actionForm.append("<input type='hidden' name='bId' "
					+"value='"+$(this).attr("value")+"'>");
			actionForm.attr("action","/support/inquirieDetail");
			actionForm.submit();
		});

	});
</script>
</html>