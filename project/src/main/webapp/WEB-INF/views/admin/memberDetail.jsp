<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/memberDetail.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
		<form id="moveForm" method="get">
			<input type="hidden" name="authorId" value='<c:out value="${memberInfo.memberId }"/>'> 
			<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
			<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'> 
			<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>
		</form>
	</div>

	
	<%@include file="../includes/footer.jsp"%>

<script>
	let moveForm = $("#moveForm");
	
	/* 회원 관리 페이지 이동 버튼 */
	$("#cancelBtn").on("click", function(e){
		
		e.preventDefault();
		
		$("input[name=authorId]").remove();
		moveForm.attr("action", "/admin/memberManage")
		moveForm.submit();
		
	});
	
	/* 회원 수정 페이지 이동 버튼 */
	$("#modifyBtn").on("click", function(e){
		
		e.preventDefault();
		
		moveForm.attr("action", "/admin/memberModify");
		moveForm.submit();
		
	});
</script>
</body>
</html>