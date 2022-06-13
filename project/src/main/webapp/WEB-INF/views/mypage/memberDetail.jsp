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
<link rel="stylesheet"
	href="/resources/css/mypage/ordersHistoryList.css">
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>회원 상세</span>
		</div>
		<div class="admin_content_main">
			<div class="form_section">
				<div class="form_section_title">
					<label>회원 ID</label>
				</div>
				<div class="form_section_content">
					<input class="input_block form-control" name="memberId" readonly="readonly"
						value="<c:out value='${memberInfo.memberId }'></c:out>">

				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>회원 이름</label>
				</div>
				<div class="form_section_content">
					<input class="input_block form-control" name="memberName" readonly="readonly"
						value="<c:out value='${memberInfo.memberName }'></c:out>">
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>이메일</label>
				</div>
				<div class="form_section_content">
					<input class="input_block form-control" name="memberMail" readonly="readonly"
						value="<c:out value='${memberInfo.memberMail }'></c:out>">
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>주소</label>
				</div>
				<div class="form_section_content address">
					<input class="input_block form-control" name="memberAddr1" readonly="readonly"
						value="<c:out value='${memberInfo.memberAddr1 }'></c:out>">
					<input class="input_block form-control" name="memberAddr1" readonly="readonly"
						value="<c:out value='${memberInfo.memberAddr2 }'></c:out>">
					<input class="input_block form-control" name="memberAddr1" readonly="readonly"
						value="<c:out value='${memberInfo.memberAddr3 }'></c:out>">
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>생성일</label>
				</div>
				<div class="form_section_content">
					<input class="input_block form-control" type="text" readonly="readonly"
						value="<fmt:formatDate value="${memberInfo.regDate}" pattern="yyyy-MM-dd"/>">
				</div>
			</div>	
			<div class="btn_section">
				<button id="cancelBtn" class="btn btn-primary">회원 목록</button>
				<button id="modifyBtn" class="btn modify_btn btn-warning">수 정</button>
			</div>
		</div>
	</div>
	<%@include file="../includes/footer.jsp"%>
</body>
<script>

</script>
</html>