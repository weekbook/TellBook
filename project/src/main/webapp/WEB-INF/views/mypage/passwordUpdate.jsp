<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<title>비밀번호 변경 - TellBook</title>
<!-- 파비콘 -->
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/pavicon.png">
</head>
<body>
	<form method="post" id="modify_form">
		<input type="hidden" name="memberId" value="${memberId }">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tbody>
				<tr>
					<td background="https://image.aladin.co.kr/img/common/popup_bg.jpg"
						style="padding: 0 0 0 20px; color: #FFFFFF; font-weight: bold; font-size: 14px;">비밀번호
						변경하기</td>
				</tr>
				<tr>
					<td colspan="2" height="3"
						background="https://image.aladin.co.kr/img/common/popup_bg2.jpg"></td>
				</tr>
			</tbody>
		</table>
		<table width="100%" height="300" cellpadding="0" cellspacing="0">
			<tbody>
				<tr>
					<td align="left" valign="top"
						style="padding-top: 6px; padding-left: 15px; padding-right: 15px">
						현재 사용하고 계신 비밀번호를 먼저 입력하신 후, 아래에 변경할 새 비밀번호를 입력하세요<br> 비밀번호는
						영문, 숫자, 특수문자를 최소 한가지씩 조합하여<br>
						8자 이상, 20자 이하로 설정하십시오.<br>
					<br>

						<table width="100%" cellspacing="1" cellpadding="4" border="0">
							<tbody>
								<tr>
									<td height="1" bgcolor="d0dee8" colspan="2"></td>
								</tr>


								<tr>
									<td width="130" height="40" align="right" bgcolor="f3f7fa"
										style="padding-right: 10px">기존 비밀번호</td>
									<td style="padding-left: 10px"><input type="password"
										class="pw_input" name="memberPw"></td>
								</tr>

								<tr>
									<td width="90" height="40" align="right" bgcolor="f3f7fa"
										style="padding-right: 10px">새 비밀번호</td>
									<td style="padding-left: 10px"><input class="pw_input2"
										type="password" size="20" name="newpassword" id="newpassword"
										maxlength="20"><span class="final_pw_ck" style="display: none; color: red">비밀번호 형식에 어긋납니다.</span><br>
									</td>
								</tr>
								<tr>
									<td width="90" height="40" align="right" bgcolor="f3f7fa"
										style="padding-right: 10px">새 비밀번호 확인</td>
									<td style="padding-left: 10px"><input class="pwck_input"
										type="password" size="20" name="chknewpassword"
										id="chknewpassword" maxlength="20">
										<span class="pwck_input_re_1" style="display: none; color: green;">비밀번호가 일치합니다.</span>
						                <span class="pwck_input_re_2" style="display: none; color: red">비밀번호가 일치하지 않습니다.</span>
									</td>
								</tr>
								<tr>
									<td height="1" bgcolor="d0dee8" colspan="2"></td>
								</tr>
							</tbody>
						</table> <br>
						<div style="text-align: center">
							<button type="button" class="btn btn-success modify_btn" >비밀번호 변경하기</button>
						</div> <br> <br>
					</td>
				</tr>
				<tr>
					<td height="25" align="right" bgcolor="e6e6e6"
						style="padding-right: 10px"><a class="btn btn-warning"
						href="#" onclick="javascript:window.close();"> 창 닫기</a>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
<script>
	let pwCheck = false;
	let pwckCheck = false;            // 비번 확인
	let pwckcorCheck = false;        // 비번 확인 일치 확인
	
	$(document).ready(function(){
		
		$(".modify_btn").click(function() {
			let newPw = $(".pw_input2").val(); // 새 비밀번호
			let newPwCheck = $(".pwck_input").val(); // 새 비밀번호
			
			if(passwordCheck(newPw)){
				pwCheck = true;
				$('.final_pw_ck').css('display','none');
			}else{
				$('.final_pw_ck').css('display','inline-block');
			}
			
			if(newPwCheck == newPw){
				pwckCheck = true
				$('.pwck_input_re_1').css('display','inline-block');
				$('.pwck_input_re_2').css('display','none');
			} else{
				$('.pwck_input_re_1').css('display','none');
				$('.pwck_input_re_2').css('display','inline-block');
			}
			
			if(pwckCheck == true && pwCheck == true){
				alert("변경되었습니다.");
				$("#modify_form").attr("action", "/mypage/passwordUpdate");
				$("#modify_form").submit();
				setTimeout(function() {   
		             window.close();
		          }, 100);
			}
			return false;
		});
		
	});
	
	function passwordCheck(password){
		var regExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,20}$/;
		return regExp.test(password);
	}

	
</script>
</html>