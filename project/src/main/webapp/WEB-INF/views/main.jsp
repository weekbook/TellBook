<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TellBook</title>
<link rel="shortcut icon" type="image/x-icon" href="resources/img/pavicon.png">
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

</head>
<body>
	<%@include file="includes/header.jsp"%>
	<div class="navi_bar_area">
		<div class="dropdowns">
			<button class="dropbtn">
				국내 <i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-content">
				<c:forEach items="${cate1}" var="cate">
					<a href="search?type=C&cateCode=${cate.cateCode}">${cate.cateName}</a>
				</c:forEach>
			</div>
		</div>
		<div class="dropdowns">
			<button class="dropbtn">
				국외 <i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-content">
				<c:forEach items="${cate2}" var="cate">
					<a href="search?type=C&cateCode=${cate.cateCode}">${cate.cateName}</a>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="content_area">
		<div class="slide_div_wrap" style="width: auto;">
			<div class="slide_div">
				<div>
					<a> <img src="../resources/img/220518_ebs_layer.jpg">
					</a>
				</div>
				<div>
					<a> <img src="../resources/img/220601_picnic_layer.jpg">
					</a>
				</div>
				<div>
					<a> <img src="../resources/img/220602_comic_layer.jpg">
					</a>
				</div>
			</div>
		</div>
		
		<div class="ls_wrap border-bottom pb-3 mb-3">
			<div class="ls_div_subject">베스트셀러</div>
			<div class="ls_div">
				<c:forEach items="${bs}" var="bs" varStatus="status">
					<a href="/goodsDetail/${bs.bookId}" style="text-decoration: none;">
						<div class="ls_div_content_wrap">
							<div class="ls_div_content">
								<c:choose>
									<c:when test="${status.index == 0 }">
										<strong class="ranking" style="color: red;"><c:out value="${status.index + 1 }" /></strong>
									</c:when>
									<c:when test="${status.index == 1 }">
										<strong class="ranking" style="color: blue;"><c:out value="${status.index + 1 }" /></strong>
									</c:when>
									<c:otherwise>
										<strong class="ranking"><c:out value="${status.index + 1 }" /></strong>
									</c:otherwise>
								</c:choose>
								
								<div class="image_wrap" data-bookid="${bs.imageList[0].bookId}"
									data-path="${bs.imageList[0].uploadPath}"
									data-uuid="${bs.imageList[0].uuid}"
									data-filename="${bs.imageList[0].fileName}">
									<img>
								</div>
								<div class="ls_category">${bs.cateName}</div>
								<div class="ls_rating best">셀러포인트 : ${bs.ratingAvg * bs.purchaseCount }</div>
								<div class="ls_bookName">${bs.bookName}</div>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
		</div>
		
		<div class="ls_wrap border-bottom pb-3 mb-3">
			<div class="ls_div_subject">신간도서</div>
			<div class="ls_div">
				<c:forEach items="${ds}" var="ds">
					<a href="/goodsDetail/${ds.bookId}" style="text-decoration: none;">
						<div class="ls_div_content_wrap">
							<div class="ls_div_content">
								<div class="image_wrap" data-bookid="${ds.imageList[0].bookId}"
									data-path="${ds.imageList[0].uploadPath}"
									data-uuid="${ds.imageList[0].uuid}"
									data-filename="${ds.imageList[0].fileName}">
									<img>
								</div>
								<div class="ls_category">${ds.cateName}</div>
								<div class="ls_rating"><fmt:formatDate pattern="yyyy-MM-dd" value="${ds.regDate}"/></div>
								<div class="ls_bookName">${ds.bookName}</div>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
		</div>
		
		<div class="ls_wrap border-bottom pb-3 mb-3">
			<div class="ls_div_subject">평점TOP</div>
			<div class="ls_div">
				<c:forEach items="${ls}" var="ls">
					<a href="/goodsDetail/${ls.bookId}" style="text-decoration: none;">
						<div class="ls_div_content_wrap">
							<div class="ls_div_content">
								<div class="image_wrap" data-bookid="${ls.imageList[0].bookId}"
									data-path="${ls.imageList[0].uploadPath}"
									data-uuid="${ls.imageList[0].uuid}"
									data-filename="${ls.imageList[0].fileName}">
									<img>
								</div>
								<div class="ls_category">${ls.cateName}</div>
								<div class="ls_rating">${ls.ratingAvg}</div>
								<div class="ls_bookName">${ls.bookName}</div>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
		</div>
		
	</div>

	<%@ include file="includes/footer.jsp"%>

</body>
<script>
	let deleteResult = '${memberDeleteResult}';

	$(document)
			.ready(
					function() {

						$(".slide_div").slick({
							dots : true,
							autoplay : true,
							autoplaySpeed : 3000,
							arrows : false
						});

						$(".ls_div").slick({
							slidesToShow : 4,
							slidesToScroll : 4,
							/* prevArrow : "<button type='button' class='ls_div_content_prev'>이전</button>",		// 이전 화살표 모양 설정
							nextArrow : "<button type='button' class='ls_div_content_next'>다음</button>", */
							autoplay : true,
							autoplaySpeed : 3000,
							arrows : false
						});
						
						/* 이미지 삽입 */
						$(".image_wrap")
								.each(
										function(i, obj) {

											const bobj = $(obj);

											if (bobj.data("bookid")) {
												const uploadPath = bobj
														.data("path");
												const uuid = bobj.data("uuid");
												const fileName = bobj
														.data("filename");

												const fileCallPath = encodeURIComponent(uploadPath
														+ "/s_"
														+ uuid
														+ "_"
														+ fileName);

												$(this).find("img").attr(
														'src',
														'/display?fileName='
																+ fileCallPath);
											} else {
												$(this)
														.find("img")
														.attr('src',
																'/resources/img/goodsNoImage.png');
											}

										});

						if (deleteResult === '1') {
							alert("회원탈퇴가 완료되었습니다.");
						}
						
					});
</script>
</html>
