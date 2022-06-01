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
<link rel="stylesheet" href="resources/css/search.css">
</head>
<body>
	<div class="wrapper">
		<div class="wrap">
			<div class="top_gnb_area">
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
						<li>마이룸</li>
						<li>장바구니</li>
					</c:if>
					<li>고객센터</li>
				</ul>
			</div>
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
								</select> 
								<input type="text" name="keyword" class="form-control" value='<c:out value="${pageMaker.cri.keyword }"/>'>
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
							<span>회원 : ${member.memberName}</span> <span>충전금액 : <fmt:formatNumber
									value="${member.money}" pattern="\#,###.##" /></span> <span>포인트
								: <fmt:formatNumber value="${member.point}" pattern="#,###" />
							</span> <a href="/member/logout.do">로그아웃</a>
						</div>
					</c:if>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="content_area">
				<!-- 게시물 o -->
				<c:if test="${listcheck != 'empty'}">
					<div class="list_search_result">
						<table class="type_list">
							<colgroup>
								<col width="110">
								<col width="*">
								<col width="120">
								<col width="120">
								<col width="120">
							</colgroup>
							<tbody id="searchList>">
								<c:forEach items="${list}" var="list">
									<tr>
										<td class="image">
											<div class="image_wrap" data-bookid="${list.imageList[0].bookId}" data-path="${list.imageList[0].uploadPath}" data-uuid="${list.imageList[0].uuid}" data-fileName="${list.imageList[0].fileName}">
												<img>
											</div>
										</td>
										<td class="detail">
											<div class="category">[${list.cateName}]</div>
											<div class="title">${list.bookName}</div>
											<div class="author">
												<fmt:parseDate var="publeYear" value="${list.publeYear}" pattern="yyyy-MM-dd" />
											${list.authorName}지음| ${list.publisher} | <fmt:formatDate value="${publeYear}" pattern="yyyy-MM-dd"/>
											
											</div>
										</td>
										<td class="info">
											<div class="rating">평점(추후 추가)</div>
										</td>
										<td class="price">
											<div class="org_price">
												<del> <fmt:formatNumber value="${list.bookPrice}" pattern="#,### 원" /> </del>
											</div>
											<div class="sell_price">
												<strong> 
													<fmt:formatNumber value="${list.bookPrice * (1-list.bookDiscount)}" pattern="#,### 원" />
												</strong>
											</div>
										</td>
										<td class="option"></td>
									</tr>
								</c:forEach>
							</tbody>

						</table>
					</div>

					<!-- 페이지 이동 인터페이스 -->
					<div class="pageMaker_wrap">
						<ul class="pageMaker pagination">
							<!-- 이전 버튼 -->
							<c:if test="${pageMaker.prev }">
								<li class="pageMaker_btn prev page-item"><a
									href="${pageMaker.pageStart -1}" class="page-link">이전</a></li>
							</c:if>
							<!-- 페이지 번호 -->
							<c:forEach begin="${pageMaker.pageStart }"
								end="${pageMaker.pageEnd }" var="num">
								<li
									class="page-item pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
									<a href="${num}" class="page-link">${num}</a>
								</li>
							</c:forEach>
							<!-- 다음 버튼 -->
							<c:if test="${pageMaker.next}">
								<li class="page-item pageMaker_btn next"><a
									href="${pageMaker.pageEnd + 1 }" class="page-link">다음</a></li>
							</c:if>
						</ul>
					</div>

					<form id="moveForm" action="/search" method="get">
						<input type="hidden" name="pageNum"
							value="${pageMaker.cri.pageNum}"> <input type="hidden"
							name="amount" value="${pageMaker.cri.amount}"> <input
							type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
						<input type="hidden" name="type" value="${pageMaker.cri.type}">
					</form>

				</c:if>
				<!-- 게시물 x -->
				<c:if test="${listcheck == 'empty'}">
					<div class="table_empty">검색결과가 없습니다.</div>
				</c:if>
			</div>

			<%@ include file="includes/footer.jsp"%>
		</div>
	</div>


</body>
<script>
	// gnb영역 로그아웃 버튼 작동
	$("#gnb_logout_button").click(function() {
		// alert("버튼 작동");
		$.ajax({
			type : "post",
			url : "/member/logout.do",
			success : function(data) {
				// alert("로그아웃 완료");
				document.location.reload();
			}
		});
	});
	
	/* 페이지 이동 버튼 */
    const moveForm = $('#moveForm');
    
	$(".pageMaker_btn a").on("click", function(e){
		
		e.preventDefault();
		
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		
		moveForm.submit();
		
	});
	
	$(document).ready(function(){
		// 검색 타입 selected
		const selectedType = '<c:out value="${pageMaker.cri.type}"/>';
		if(selectedType != ""){
			$("select[name='type']").val(selectedType).attr("selected", "selected");	
		}
		
		
		// 이미지 삽입
		$(".image_wrap").each(function(i,obj){
			const bobj = $(obj);
			
			if(bobj.data("bookid")){
				const uploadPath = bobj.data("path");
				const uuid = bobj.data("uuid");
				const fileName = bobj.data("fileName");
				
				alert(fileName);
				
				const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
				
				$(this).find("img").attr('src', '/display?fileName=' + fileCallPath);
			} else{
				$(this).find("img").attr('src', '/resources/img/goodsNoImage.png');
			}
			
		});
	});
</script>
</html>