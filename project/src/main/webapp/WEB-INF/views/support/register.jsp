<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1QnA | 고객센터 - TellBook</title>
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/img/pavicon.png">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="/resources/css/support.css">

<style>
.select_area {
	margin: 10px 7px 0 10px;
	padding: 6px 19px;
	background: #f6f6f6;
	border: 1px solid #e9e9e9;
	line-height: 24px;
	color: #555;
	font-size: 17px;
}

.radio {
	vertical-align: -2px;
}

label {
	vertical-align: middle;
	display: inline !important;
}

.select_area ul {
	float: left;
	width: 170px;
	padding: inherit;
	margin-left: 35px;
}

.select_area ul li {
	margin-top: 10px;
}

#personal_area {
	width: 900px;
	margin: auto;
}

.tg {
	border-collapse: collapse;
	border-spacing: 0;
	width: -webkit-fill-available;
}

.tg td {
	border-color: #ccc;
	border-style: solid;
	border-width: 0px;
	color: #333;
	font-family: Arial, sans-serif;
	overflow: hidden;
	padding: 12px 11px;
	word-break: normal;
}

.tg th {
	border-color: #ccc;
	border-style: solid;
	border-width: 0px;
	color: #333;
	font-family: Arial, sans-serif;
	font-weight: normal;
	overflow: hidden;
	padding: 12px 11px;
	word-break: normal;
}

.tg .tg-0lax {
	text-align: left;
	vertical-align: top
}

.tg .tg-0pky {
	border-color: inherit;
	text-align: left;
	vertical-align: top
}

.tg label {
	border-right: 1px;
}
</style>
</head>
<body>
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

	<div class="wrap">
		<p class="path" style="margin-left: 10px;">홈 > 고객센터 > 1:1문의 작성</p>
		<div class="support_snb">
			<h2 class="cscenter_h2">
				<a href="support">고객센터</a>
			</h2>
			<div style="background: #e9e9e9;">
				<ul class="support_li" style="margin-top: 15px;">
					<li><a href="supportLi1"
						style="text-decoration: none; color: inherit;">반품/교환/환불</a></li>
					<li><a href="supportLi2"
						style="text-decoration: none; color: inherit;">주문/결제</a></li>
					<li><a href="supportLi3"
						style="text-decoration: none; color: inherit;">회원</a></li>
					<li><a href="supportLi4"
						style="text-decoration: none; color: inherit;">도서/상품정보/교과서</a></li>
					<li><a href="supportLi5"
						style="text-decoration: none; color: inherit;">배송/수령일안내</a></li>
					<li><a href="inquirie"
						style="text-decoration: none; color: inherit;">1:1상담접수/내역확인 </a></li>
				</ul>
			</div>
		</div>
		<div class="content_area" style="border: 1px solid;">
			<hr style="">
			<h3 class="conten_h3"
				style="display: inline-block; margin-left: 36px;">1:1 문의작성</h3>

			<div class="select_area form-check form-check-inline"
				style="width: 900px;">

				<ul class="num01">
					<li><input type="radio" name="adcDvsnCodeRdo"
						class="radio form-check-input" id="radio01" value="005"
						label="회원정보.서비스"> <label for="radio01"
						class="form-check-label">회원정보.서비스</label></li>
					<li><input type="radio" name="adcDvsnCodeRdo"
						class="radio form-check-input" id="radio21" value="008"
						label="서양도서 검색.주문"> <label for="radio21">서양도서 검색.주문</label></li>
					<li><input type="radio" name="adcDvsnCodeRdo"
						class="radio form-check-input" id="radio12" value="002"
						label="검색기능 관련"> <label for="radio12">검색기능 관련</label></li>
					<li><input type="radio" name="adcDvsnCodeRdo"
						class="radio form-check-input" id="radio04" value="007"
						label="시스템불편사항"> <label for="radio04">시스템불편사항</label></li>
				</ul>
				<ul class="num02">
					<li><input type="radio" name="adcDvsnCodeRdo"
						class="radio form-check-input" id="radio06" value="004"
						label="도서.상품정보"> <label for="radio06">도서.상품정보</label></li>
					<li><input type="radio" name="adcDvsnCodeRdo"
						class="radio form-check-input" id="radio03" value="009"
						label="일본도서 검색.주문"> <label for="radio03">일본도서 검색.주문</label></li>
					<li><input type="radio" name="adcDvsnCodeRdo"
						class="radio form-check-input" id="radio08" value="006"
						label="웹사이트이용관련"> <label for="radio08">웹사이트이용관련</label></li>
					<li><input type="radio" name="adcDvsnCodeRdo"
						class="radio form-check-input" id="radio09" value="013"
						label="고객제안/친절불친절"> <label for="radio09">고객제안/친절불친절</label></li>
				</ul>
				<ul class="num03">
					<li><input type="radio" name="adcDvsnCodeRdo"
						class="radio form-check-input" id="radio11" value="001"
						label="주문.결제.기프트카드"> <label for="radio11">주문.결제</label></li>
					<li><input type="radio" name="adcDvsnCodeRdo"
						class="radio form-check-input" id="radio02" value="014"
						label="파본.상품불량신고"> <label for="radio02">파본.상품불량신고</label></li>
					<li><input type="radio" name="adcDvsnCodeRdo"
						class="radio form-check-input" id="radio13" value="944"
						label="개인정보침해신고"> <label for="radio13">개인정보침해신고</label></li>
					<li><input type="radio" name="adcDvsnCodeRdo"
						class="radio form-check-input" id="radio15" value="000"
						label="배송.수령일 안내"> <label for="radio15">배송.수령일 안내</label></li>
				</ul>
				<ul class="num04">
					<li><input type="radio" name="adcDvsnCodeRdo"
						class="radio form-check-input" id="radio18" value="shop"
						label="매장 관련"> <label for="radio18">매장관련</label></li>
					<li><input type="radio" name="adcDvsnCodeRdo"
						class="radio form-check-input" id="radio20" value="003"
						label="반품.교환.환불"> <label for="radio20">반품.교환.환불</label></li>
				</ul>
			</div>
			<form role="form" action="/support/register" method="post">
				<div id="personal_area">
					<table class="tg table">
						<thead>
							<tr>
								<th class="tg-0lax" colspan="2">
									<div class=" row">
										<label for="staticEmail" class="col-sm-2 col-form-label">상담구분</label>
										<div class="">
											<input type="text" readonly class="form-control-plaintext"
												id="board_type" name="bType" value="" placeholder="위에서 상담유형을 체크해주세요.">
										</div>
									</div>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="tg-0lax">
									<div class=" row">
										<label for="staticEmail" class="col-sm-2 col-form-label">이름</label>
										<div class="">
											<input type="text" readonly class="form-control-plaintext"
												id="bName" name="bName" value="${member.memberName }">
										</div>
									</div>
								</td>
								<td class="tg-0pky">
									<div class=" row">
										<label for="staticEmail" class="col-sm-2 col-form-label">ID</label>
										<div class="">
											<input type="text" readonly class="form-control-plaintext"
												id="memberId" name="memberId" value="${member.memberId }">
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td class="tg-0lax" colspan="2">
									<div class="row">
										<label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
										<div class="">
											<input type="text" readonly class="form-control-plaintext"
												id="memberMail" value="${member.memberMail }">
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div id="personal_area">
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel -default">
								<div class="panel-body">
									<div class="form-group">
										<label>제목</label> <input class="form-control" name='bTitle'>
									</div>
									<div class="form-group">
										<label>내용</label>
										<textarea class="form-control" rows="5" name='bContent'></textarea>
										<p>
											문의내용 답변 안내<br> - 17시 이후 문의건과 공휴일 1:1 상담문의는 다음 운영시간(평일
											09시~ 17시)에 메일 답변드리겠습니다.<br> - 정상근무일 기준이며, 통지예정일이 휴일인 경우
											다음 정상 근무 일에 진행 됩니다.<br> - 설/추석 연휴 기간 동안 고객센터 휴무로 인해 1:1
											상담 답변이 불가합니다.<br> - 설/추석 연휴 끝난 이후부터 순차적으로 답변드릴 예정이오니 양해
											부탁드립니다.<br> - 신학기(3월,9월), 코로나로 인해 문의량이 급증하여 답변 지연될 수
											있습니다.
										</p>
									</div>
									<div class="btn_area"
										style="margin-top: 10px; margin-bottom: 10px; text-align: right;">
										<button type="submit" class="btn btn-primary">문의접수</button>
										<button type="reset" class="btn btn-warning cancel_btn">취소</button>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</form>

		</div>
	</div>


	<%@ include file="../includes/footer.jsp"%>
</body>
<script>
	$(document).ready(function() {

		$(".cancel_btn").on("click", function() {
			self.location = "/support/inquirie"
		});

		$('input[name=adcDvsnCodeRdo]').click(function() {

			let answer = $(this).attr("id");
			let anText = $("label[for='" + answer + "']").text();
			$('input[id=board_type]').attr('value', anText);
			console.log(anText);
		})
		
		var formObj = $("form[role='form']");
		$("button[type='submit']").on("click", function(e) {
			e.preventDefault();
			console.log("submit clicked");
			formObj.submit();
		});
	});
</script>
</html>