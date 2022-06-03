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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
						<li>
							<a href="/cart/${member.memberId}">장바구니</a>
						</li>
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
								</select> <input type="text" name="keyword" class="form-control">
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
			<div class="navi_bar_area">
				<div class="dropdown">
				    <button class="dropbtn">국내 
				      <i class="fa fa-caret-down"></i>
				    </button>
				    <div class="dropdown-content">
				    	<c:forEach items="${cate1}" var="cate"> 
				    		<a href="search?type=C&cateCode=${cate.cateCode}">${cate.cateName}</a>
				    	</c:forEach> 
				    </div>			
				</div>
				<div class="dropdown">
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
				<h1>content area</h1>
			</div>
		</div>
		<%-- <%@ include file="includes/footer.jsp"%> --%>
	</div>

	<script>
	// gnb영역 로그아웃 버튼 작동
	$("#gnb_logout_button").click(function(){
		// alert("버튼 작동");
		$.ajax({
			type : "post",
			url : "/member/logout.do",
			success : function(data){
				// alert("로그아웃 완료");
				document.location.reload();
			}
		});
	});
</script>
</body>
</html>
