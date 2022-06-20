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
<link rel="stylesheet" href="/resources/css/mypage/memberDelete.css">
</head>
<body>
	<!-- gnv_area -->
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


	<!-- contents-area -->
	<div class="admin_wrap">
		<!-- 네비영역 -->
		<div class="admin_navi_wrap">
			<ul>
				<li><a class="admin_list_01" href="/mypage/ordersHistoryList">주문조회/취소</a></li>
				<li><a class="admin_list_02 move"
					href='<c:out value="${member.memberId }"/>'> 개인정보 수정</a></li>
				<li><a class="admin_list_03" href="/mypage/memberDelete">회원탈퇴</a></li>
			</ul>
		</div>

		<div class="admin_content_wrap">
			<div class="admin_content_subject">
				<span>회원탈퇴</span>
			</div>
			<div class="account_info01 hidden" style="margin-top: 10px;">
				<ul class="giftCard_ul01">
					<li>- 회원 탈퇴시 충전금액, 포인트, 회원정보가 자동삭제 됩니다.<br> </li>
					<li style="color: red;">- 출고 이전 주문이 있을 경우 상품 배송처리 문제로 탈퇴 불가합니다.(주문 취소 혹은 출고 이후 탈퇴 가능) <br> 
					</li>
				</ul>
			</div>
			<hr><br>
			<section class="check_section">
		        <h5>TellBook에게 바라는 점을 남겨주세요. 소중하게 반영하겠습니다</h5>
		        <div>
		        	<textarea name="" id="" class="secede_textarea" rows="5" cols="41" style="width: 90%; height: 128px;"></textarea>
		        </div>
		        <br>
		    </section>
		    <hr>
		    
		    <div class="password_check mt30">
				<p>본인 확인을 위해 비밀번호를 입력한 후, "탈퇴확인" 버튼을 눌러주세요.<br>(회원 탈퇴시 나의계정과 나의서재의 <strong style="color:#df307f;">모든 정보와 DB가 삭제되며,<br>
		            1년 내 재가입/회원구매에 제약이 있으니</strong> 신중하게 탈퇴신청을 해주세요.)<br>
				</p>
				<form id="delete_form" method="post">
					<div class="secede_password_btn mt30">	
						<label for="secedePass"><strong>비밀번호 :</strong> </label>
			            <input style="display:none" aria-hidden="true">
						<input style="padding:7px 5px; outline:0;" id="memberPw" type="password" maxlength="20" name="memberPw" onkeypress="" autocomplete="off">
						<div class="secedeBtn01 ml5 mb_m10">
							<div class="leave_btn">
								<a class="aWhite" href="#" onclick="Submit_Delete();">회원 탈퇴</a>
							</div>
							<input type="hidden" name="memberId" value="${member.memberId}">
						</div>
					</div>
				</form>
		    </div>
			
			<form id="moveForm" action="/mypage/memberDetail" method="get">
				<input type="hidden" name="memberId" value="${member.memberId}">
			</form>
		</div>
	</div>
	<%@include file="../includes/footer.jsp"%>
</body>

<script>
	let moveForm = $('#moveForm');
	let deleteForm = $('#delete_form');
	let deleteResult = '${memberDeleteResult}';
	
	$(document).ready(function(){
		if(deleteResult === '0'){
			alert("회원탈퇴에 실패하였습니다. 비밀번호를 다시 확인해주세요.")
		}
		
	});
	
	$(".move").on("click", function(e){
		
		e.preventDefault();
		
		var memberId = moveForm.find("input[name='memberId']").val();
		// 게시물 읽고 뒤로가기 버튼했을때 같은 게시물에 들어가지는 오류 해결
		if(memberId != ''){
			moveForm.find("input[name='memberId']").remove();
		}
		
		moveForm.append("<input type='hidden' name='memberId' value='"+$(this).attr("href") + "'>");
		moveForm.attr("action", "/mypage/memberDetail");
		moveForm.submit();
		
		
	});
	
	function Submit_Delete() {
		$("#delete_form").attr("action", "/mypage/memberDelete");
		$("#delete_form").submit();
	}
</script>
</html>