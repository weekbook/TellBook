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
<link rel="stylesheet" href="/resources/css/mypage/memberDetail.css">
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
			</ul>
		</div>

		<div class="admin_content_wrap">
			<div class="admin_content_subject">
				<span>개인정보 수정</span>
			</div>
			<div class="account_info01 hidden" style="margin-top: 10px;">
				<ul class="giftCard_ul01">
					<li>- 변경된 주소나 연락처, 이메일 주소를 수정해주세요.<br> - 주소 변경 전 접수하신
						주문에는 새 주소가 반영되지 않습니다. <br> - 이미 접수된 주문의 배송주소는 주문별 상세 페이지에서 각각
						변경해주세요.
					</li>
				</ul>
			</div>
			<p class="member_info_left_p">일반 개인 회원</p>

			<table class="table">
				<colgroup>
					<col width="16%">
					<col width="84%">
				</colgroup>
				<tbody>
					<tr>
						<th>
							<div><label for="memberId">아이디</label></div>
						</th>
						<td> 
							<c:out value='${memberInfo.memberId }'></c:out>
						</td>
					</tr>					
					<tr>
						<th>
							<div><label for="memberName">성명</label></div>
						</th>
						<td> 
							<c:out value='${memberInfo.memberName }'></c:out>
							<button class="btn btn-secondary">개명고객 이름 변경하기</button>
						</td>
					</tr>
					<tr>
						<th>
							<div><label for="memberMail">이메일주소</label></div>
						</th>
						<td> 
							<c:out value='${memberInfo.memberMail }'></c:out>
							<button class="btn btn-secondary">변경하기</button>
						</td>
					</tr>
					<tr>
						<th style="vertical-align: middle;">
							<div><label for="memberAddress">주소</label></div>
						</th>
						<td> 
							<c:out value='${memberInfo.memberAddr1 }'></c:out><br>
							<c:out value='${memberInfo.memberAddr2 }'></c:out><br>
							<c:out value='${memberInfo.memberAddr3 }'></c:out>
							<button class="btn btn-secondary">변경하기</button>
						</td>
					</tr>
					<tr>
						<th>
							<div><label for="passWord">비밀번호</label></div>
						</th>
						<td> 
							<button class="btn btn-secondary">비밀번호 변경하기</button>
						</td>
					</tr>
					<tr>
						<th>
							<div><label for="regDate">가입날짜</label></div>
						</th>
						<td> 
							<fmt:formatDate value="${memberInfo.regDate}" pattern="yyyy-MM-dd"/>
						</td>
					</tr>
					
				</tbody>
			</table>



			<div class="admin_content_main">
				<div class="form_section">
					<div class="form_section_title">
						<label>회원 ID</label>
					</div>
					<div class="form_section_content">
						<input class="input_block form-control" name="memberId"
							readonly="readonly"
							value="<c:out value='${memberInfo.memberId }'></c:out>">

					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>회원 이름</label>
					</div>
					<div class="form_section_content">
						<input class="input_block form-control" name="memberName"
							readonly="readonly"
							value="<c:out value='${memberInfo.memberName }'></c:out>">
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>이메일</label>
					</div>
					<div class="form_section_content">
						<input class="input_block form-control" name="memberMail"
							readonly="readonly"
							value="<c:out value='${memberInfo.memberMail }'></c:out>">
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>주소</label>
					</div>
					<div class="form_section_content address">
						<input class="input_block form-control" name="memberAddr1"
							readonly="readonly"
							value="<c:out value='${memberInfo.memberAddr1 }'></c:out>">
						<input class="input_block form-control" name="memberAddr1"
							readonly="readonly"
							value="<c:out value='${memberInfo.memberAddr2 }'></c:out>">
						<input class="input_block form-control" name="memberAddr1"
							readonly="readonly"
							value="<c:out value='${memberInfo.memberAddr3 }'></c:out>">
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>생성일</label>
					</div>
					<div class="form_section_content">
						<input class="input_block form-control" type="text"
							readonly="readonly"
							value="<fmt:formatDate value="${memberInfo.regDate}" pattern="yyyy-MM-dd"/>">
					</div>
				</div>
				<div class="btn_section">
					<button id="cancelBtn" class="btn btn-primary">회원 목록</button>
					<button id="modifyBtn" class="btn modify_btn btn-warning">수정</button>
				</div>
			</div>
		</div>
		<form id="moveForm" action="/mypage/memberDetail" method="get">
			<input type="hidden" name="memberId" value="${member.memberId}">
		</form>
	</div>
	<%@include file="../includes/footer.jsp"%>
</body>

<script>
	let moveForm = $('#moveForm');

	$(".move").on(
			"click",
			function(e) {
				e.preventDefault();

				var memberId = moveForm.find("input[name='memberId']").val();
				// 게시물 읽고 뒤로가기 버튼했을때 같은 게시물에 들어가지는 오류 해결
				if (memberId != '') {
					moveForm.find("input[name='memberId']").remove();
				}

				moveForm.append("<input type='hidden' name='memberId' value='"
						+ $(this).attr("href") + "'>");
				moveForm.attr("action", "/mypage/memberDetail");
				moveForm.submit();

			});
</script>
</html>