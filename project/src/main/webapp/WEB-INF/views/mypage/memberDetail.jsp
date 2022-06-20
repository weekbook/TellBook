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
				<li><a class="admin_list_03" href="/mypage/memberDelete">회원탈퇴</a></li>
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
			<p style="font-weight: 900; font-size: 24px;">일반 개인 회원</p>

			<table class="table">
				<colgroup>
					<col width="16%">
					<col width="84%">
				</colgroup>
				<tbody>
					<tr>
						<th>
							<div>
								<label for="memberId">아이디</label>
							</div>
						</th>
						<td><span><c:out value='${memberInfo.memberId }'></c:out></span></td>
					</tr>
					<tr>
						<th>
							<div>
								<label for="memberName">성명</label>
							</div>
						</th>
						<td><c:out value='${memberInfo.memberName }'></c:out> <!-- <button class="btn btn-secondary">개명고객 이름 변경하기</button> -->
						</td>
					</tr>
					<tr>
						<th>
							<div>
								<label for="memberMail">이메일주소</label>
							</div>
						</th>
						<td><span id="text_Email"><c:out
									value='${memberInfo.memberMail }'></c:out></span> <input
							class="i_email" type="text" size="25" name="Email" id="Email"
							maxlength="50" style="display: none;">
							<button class="btn btn-secondary mail_change"
								onclick="email_show();">변경하기</button>
							<button class="btn btn-primary mail_modify"
								onclick="email_modify();" style="display: none;">수정</button>
							<button class="btn btn-secondary mail_cancle"
								onclick="email_void();" style="display: none;">취소</button></td>
					</tr>
					<tr>
						<th style="vertical-align: middle;">
							<div>
								<label for="memberAddress">주소</label>
							</div>
						</th>
						<td>
							<div class="before_change">
								<c:out value='${memberInfo.memberAddr1 }'></c:out><br>
								<c:out value='${memberInfo.memberAddr2 }'></c:out><br> 
								<c:out value='${memberInfo.memberAddr3 }'></c:out>
								<button class="btn btn-secondary"
								onclick="address_show();">변경하기</button>
							</div>
							
							<div class="after_change" style="display: none;">
								<div class="address_input_1_wrap">
									<input type="text" class="address_input_1" size="20" name="memberAddr1"
										readonly="readonly" size="15" onclick="execution_daum_address();">
									<button class="address_button btn btn-success"
										onclick="execution_daum_address()">
										<span style="font-weight: 900">주소 찾기</span>
									</button>
									<div class="clearfix"></div>
								</div>
								<div class="address_input_2_wrap">
									<input class="address_input_2" size="60" name="memberAddr2"
										readonly="readonly" onclick="execution_daum_address();">
								</div>
								<div class="address_input_3_wrap">
									<input class="address_input_3" size="60" name="memberAddr3"
										readonly="readonly">
									<button class="btn btn-primary address_modify"
										onclick="address_modify();">수정</button>
									<button class="btn btn-secondary address_cancle"
										onclick="address_void();">취소</button>
								</div>
							</div>
							
						</td>
					</tr>
					<tr>
						<th>
							<div>
								<label for="passWord">비밀번호</label>
							</div>
						</th>
						<td>
							<button class="btn btn-secondary pwd_btn" onclick="password_modify();">비밀번호 변경하기</button>
						</td>
					</tr>
					<tr>
						<th>
							<div>
								<label for="regDate">가입날짜</label>
							</div>
						</th>
						<td><fmt:formatDate value="${memberInfo.regDate}"
								pattern="yyyy-MM-dd" /></td>
					</tr>

				</tbody>
			</table>


			<%-- <div class="admin_content_main">
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
			</div> --%>
		</div>
		<form id="moveForm" action="/mypage/memberDetail" method="get">
			<input type="hidden" name="memberId" value="${member.memberId}">
		</form>
	</div>
	<%@include file="../includes/footer.jsp"%>
</body>


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	function email_show() {
		$("#text_Email").css('display', 'none');
		$(".i_email").css('display', 'inline-block');
		$(".mail_change").css('display', 'none');

		$(".mail_modify").css('display', 'inline-block');
		$(".mail_cancle").css('display', 'inline-block');
	}

	function email_void() {
		$("#text_Email").css('display', 'inline-block');
		$(".i_email").css('display', 'none');
		$(".mail_change").css('display', 'inline-block');

		$(".mail_modify").css('display', 'none');
		$(".mail_cancle").css('display', 'none');

		$(".i_email").val("");
	}

	const memberId = "<c:out value='${memberInfo.memberId }'/>";
	
	function email_modify() {
		// 입력값 변수
		const mail = $('.i_email').val(); // 이메일 입력란

		const data = {
			memberMail : mail,
			memberId : memberId,
		}

		/* 이메일 유효성 검사 */
		if (mailFormCheck(mail) && mail != "") {
			mailCheck = true;
		} else {
			mailCheck = false;
			alert("올바르지 않은 Email 형식입니다.");
		}

		if (mailCheck == true) {
			$.ajax({
				data : data,
				url : "/mypage/emailModify",
				type : "POST",
				success : function(result) {
					alert("email을 수정하였습니다.")
					location.reload();
				}

			});
		}

		return false;
	}
	function mailFormCheck(email) {
		var form = new RegExp(
				/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
		return form.test(email);
	}
	
	/* 다음 주소 연동 */
	function execution_daum_address(){
	    
		new daum.Postcode({
			oncomplete : function(data){
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드
				
				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수

	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }

	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                // 주소변수 문자열과 참고항목 문자열 합치기
	                addr += extraAddr;
	            } else {
	            	addr += ' ';
	            }

	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            $(".address_input_1").val(data.zonecode);
	            $(".address_input_2").val(addr);
	        	// 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
	        	$(".address_input_3").attr("readonly", false);
	        	$(".address_input_3").focus();
			}
		}).open();
	}
	
	
	function address_show() {
		$(".before_change").css('display','none');
		$(".after_change").css('display', 'inline-block');
	}
	function address_void() {
		$(".before_change").css('display', 'inline-block');
		$(".after_change").css('display','none');
	}
	
	var addressCheck = false 
	
	function address_modify() {
		// 입력값 변수
        var addr1 = $('.address_input_1').val();  // 주소 입력란
        var addr2 = $('.address_input_2').val();  // 주소 입력란
        var addr3 = $('.address_input_3').val();  // 주소 입력란
        
        const data = {
        		memberId : memberId,
        		memberAddr1 : addr1,
        		memberAddr2 : addr2,
        		memberAddr3 : addr3
        }
        
        /* 주소 유효성 검사 */
        if(addr1 == "" || addr2 == "" || addr3 == ""){
            addressCheck = false;
        }else{
            addressCheck = true;
        }
        
        if(addressCheck == true){
        	$.ajax({
				data : data,
				url : "/mypage/addressModify",
				type : "POST",
				success : function(result) {
					alert("주소를 수정하였습니다.")
					location.reload();
				}
        	});
        } else{
        	alert("주소를 입력해주세요")
        }
	
        return false;
	}
	function password_modify() {
		 let replyId = $(this).attr("href");
		 let popUrl = "/mypage/passwordUpdate/" + '${member.memberId}'; 
		 let popOption = "width = 600px, height=300px, top=300px, left=300px, scrollbars=yes";
		 
		 window.open(popUrl,"비밀번호 변경",popOption);
	}
</script>
</html>