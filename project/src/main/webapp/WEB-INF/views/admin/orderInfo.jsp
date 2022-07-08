<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문상세 - 관리자페이지</title>
<!-- 파비콘 -->
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/img/pavicon.png">
<link rel="stylesheet" href="../resources/css/admin/orderList.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
</style>
</head>
<body>
	<%@ include file="../includes/adminLayout.jsp"%>
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>주문상세</span>
		</div>

		<h4 style="margin-top: 20px;">기본 배송정보</h4>
		<table class="table table-bordered">
			<tbody>
				<tr>
					<td style="width: 13%">주문번호</td>
					<td>${orderInfo[0].orderId }</td>
					<td>배송방법</td>
					<td>우체국택배</td>
				</tr>
				<tr>
					<td>주문접수일</td>
					<td><fmt:formatDate value="${orderInfo[0].orderDate}"
							pattern="yyyy년 MM월 dd일 HH시 mm분" /></td>
					<td>결제일</td>
					<td><fmt:formatDate value="${orderInfo[0].orderDate}"
							pattern="yyyy년 MM월 dd일 HH시 mm분" /></td>
				</tr>
				<tr>
					<td>상태</td>
					<td colspan="3">${orderInfo[0].orderState }</td>
				</tr>
			</tbody>
		</table>

		<table class="table table-bordered">
			<tbody>
				<tr>
					<td style="width: 13%">받으시는 분</td>
					<td colspan="3">${orderInfo[0].addressee }</td>
				</tr>
				<tr>
					<td>배송주소</td>
					<td colspan="3">(${orderInfo[0].memberAddr1 })
						${orderInfo[0].memberAddr2 } ${orderInfo[0].memberAddr3 }</td>
				</tr>
			</tbody>
		</table>

		<h4 style="margin-top: 20px;">주문 상품 정보</h4>
		<table class="table table-bordered" style="text-align: center">
			<thead>
				<tr>
					<th>Num</th>
					<th>상품명</th>
					<th>주문수량</th>
					<th>가격</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${orderInfo}" var="list" varStatus="status">
					<tr>
						<td>${status.index + 1 }</td>
						<td>${list.bookName }</td>
						<td>${list.bookCount }</td>
						<td style="text-align: left;">가격 : <fmt:formatNumber
								type="number" maxFractionDigits="3"
								value="${(list.bookPrice - (list.bookPrice * list.bookDiscount)) * list.bookCount }" />원<br>
							마일리지 : <fmt:formatNumber type="number" maxFractionDigits="3"
								value="${list.savePoint * list.bookCount}" />원 (5%)<br>
						</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>

		<table class="table table-bordered">
			<tbody>
				<tr>
					<c:set var="priceTotal" value="0" />
					<c:set var="pointSaveTotal" value="0" />
					<td>총 주문 금액</td>
					<c:forEach var="list" items="${orderInfo}" varStatus="status">
						<c:set var="priceTotal"
							value="${priceTotal + (list.bookPrice - (list.bookPrice * list.bookDiscount)) * list.bookCount}" />
						<c:set var="pointSaveTotal"
							value="${pointSaveTotal + list.savePoint * list.bookCount}" />
					</c:forEach>
					<td><fmt:formatNumber type="number" maxFractionDigits="3"
							value="${ priceTotal + orderInfo[0].deliveryCost}" />원 (상품가격 <fmt:formatNumber
							type="number" maxFractionDigits="3" value="${ priceTotal}" />원 +
						배송료 <fmt:formatNumber type="number" maxFractionDigits="3"
							value="${orderInfo[0].deliveryCost}" />원 )</td>
				</tr>
				<tr>
					<td>사용 / 적립 포인트</td>
					<td>사용한 포인트 : ${orderInfo[0].usePoint } | 적립한 포인트 :
						${pointSaveTotal }</td>
				</tr>
				<tr>
					<td>실 결제 금액</td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3"
							value="${priceTotal + orderInfo[0].deliveryCost - orderInfo[0].usePoint}" />원</td>
				</tr>
			</tbody>
		</table>

		<form id="moveForm" action="/admin/orderList" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		</form>

	</div>

	<%@ include file="../includes/footer.jsp"%>

</body>
<script>
</script>
</html>
