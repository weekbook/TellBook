<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문상세 - 관리자페이지</title>
<!-- 파비콘 -->
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/pavicon.png">
<link rel="stylesheet" href="../resources/css/admin/orderList.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<%@ include file="../includes/adminLayout.jsp"%>
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>주문상세</span>
		</div>
		${orderInfo }

		<form id="moveForm" action="/admin/orderList" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		</form>
		
		<form id="deleteForm" action="/admin/orderCancle" method="post">
        	<input type="hidden" name="orderId">
        	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
        	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
        	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
        	<input type="hidden" name="memberId" value="${member.memberId}">
        </form>
	</div>

	<%@ include file="../includes/footer.jsp"%>

</body>
<script>

</script>
</html>
