<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/goodsManage.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
</head>
<body>
	<%@ include file="../includes/header.jsp"%>
	
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>상품 관리</span>
		</div>
	</div>

	<%@ include file="../includes/footer.jsp"%>
	
<script>
	let eResult = '<c:out value="${enroll_result}"/>';
	checkResult(eResult);
	
	function checkResult(result){
		if(result === ''){
			return;
		}
		
		alert("상품'" + eResult + "'을 등록하였습니다.'")

		
		
		
		
		
		
		
		
		
		
		
	
	}
</script>
</body>
</html>
