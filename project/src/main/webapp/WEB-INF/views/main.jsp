<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome BookMall</title>
<link rel="stylesheet" href="resources/css/main.css?ver2">
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

</head>
<body>
		<%@include file="includes/header.jsp"%>
			<div class="navi_bar_area">
				<div class="dropdowns">
				    <button class="dropbtn">국내 
				      <i class="fa fa-caret-down"></i>
				    </button>
				    <div class="dropdown-content">
				    	<c:forEach items="${cate1}" var="cate"> 
				    		<a href="search?type=C&cateCode=${cate.cateCode}">${cate.cateName}</a>
				    	</c:forEach> 
				    </div>			
				</div>
				<div class="dropdowns">
				    <button class="dropbtn">국외 
				      <i class="fa fa-caret-down"></i>
				    </button>
				    <div class="dropdown-content">
				    	<c:forEach items="${cate2}" var="cate"> 
				    		<a href="search?type=C&cateCode=${cate.cateCode}">${cate.cateName}</a>
				    	</c:forEach>      		      		      
				    </div>			
				</div>
			</div>
			<div class="content_area">
				<div class="slide_div_wrap">
					<div class="slide_div">
						<div>
							<a>
								<img src="../resources/img/220518_ebs_layer.jpg">
							</a>
						</div>
						<div>
							<a>
								<img src="../resources/img/220601_picnic_layer.jpg">
							</a>
						</div>
						<div>
							<a>
								<img src="../resources/img/220602_comic_layer.jpg">
							</a>
						</div>				
					</div>	
				</div>
				
				<div class="ls_wrap">
					<div class="ls_div_subject">
						평점순 상품
					</div>
					<div class="ls_div">
						<c:forEach items="${ls}" var="ls">
							<a href="/goodsDetail/${ls.bookId}">
								<div class="ls_div_content_wrap">
									<div class="ls_div_content">
										<div class="image_wrap" data-bookid="${ls.imageList[0].bookId}" data-path="${ls.imageList[0].uploadPath}" data-uuid="${ls.imageList[0].uuid}" data-filename="${ls.imageList[0].fileName}">
											<img>
										</div>				
										<div class="ls_category">
											${ls.cateName}
										</div>
										<div class="ls_rating">
											${ls.ratingAvg}
										</div>
										<div class="ls_bookName">
											${ls.bookName}
										</div>							
									</div>
								</div>
							</a>					
						</c:forEach>					
					</div>
				</div>
				
				
			</div>
		</div>
		<%@ include file="includes/footer.jsp"%>
	</div>

</body>
<script>
	$(document).ready(function(){
		
		$(".slide_div").slick({
			dots: true,
			autoplay : true,
			autoplaySpeed: 3000
		});
		
		$(".ls_div").slick({
			slidesToShow: 4,
			slidesToScroll: 4,
			prevArrow : "<button type='button' class='ls_div_content_prev'>이전</button>",		// 이전 화살표 모양 설정
			nextArrow : "<button type='button' class='ls_div_content_next'>다음</button>",
			autoplay : true,
			autoplaySpeed: 3000
		});
		
		/* 이미지 삽입 */
		$(".image_wrap").each(function(i, obj){
			
			const bobj = $(obj);
			
			if(bobj.data("bookid")){
				const uploadPath = bobj.data("path");
				const uuid = bobj.data("uuid");
				const fileName = bobj.data("filename");
				
				const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
				
				$(this).find("img").attr('src', '/display?fileName=' + fileCallPath);
			} else {
				$(this).find("img").attr('src', '/resources/img/goodsNoImage.png');
			}
			
		});
	});
</script>
</html>
