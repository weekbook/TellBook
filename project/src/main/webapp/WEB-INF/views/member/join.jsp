<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 - TellBook</title>
<!-- 파비콘 -->
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/pavicon.png">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="/resources/css/member/join.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<Style>
.correct{
	color: green;
}
.incorrect{
    color : red;
}
input{
	height: 20px;
}
</Style>
</head>
<body>

<div class="wrapper">
	<form id="join_form" method="post">
	<div class="wrap">
		<div style="width:100%; text-align: center;">
			<img class="mb-4" src="/resources/img/mLogo.png" alt="" width="200" height="210" style="margin: auto; display: block;">
			<span class="mb-3 fw-normal" style="font-weight: 800 !important; font-size: 34px;">회 원 가 입</span>
		</div>
		
			<div class="id_wrap">
				<div class="id_name form-group">아이디</div>
					<input class="id_input form-control" name="memberId">
				<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
				<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
				<span class="final_id_ck">아이디를 입력해주세요.</span>
			</div>
			<div class="pw_wrap">
				<div class="pw_name">비밀번호</div>
					<p>비밀번호는
						영문, 숫자, 특수문자를 최소 한가지씩 조합하여<br>
						8자 이상, 20자 이하로 설정하십시오.<br></p>
					<input type="password" class="pw_input form-control" name="memberPw">
				<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
				<span class="valiation_pw" style="display: none; color: red">비밀번호 형식에 어긋납니다.</span>
			</div>
			<div class="pwck_wrap">
				<div class="pwck_name">비밀번호 확인</div>
					<input type="password" class="pwck_input form-control">
				<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
				<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
                <span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
			</div>
			<div class="user_wrap">
				<div class="user_name">이름</div>
					<input class="user_input form-control" name="memberName">
				<span class="final_name_ck">이름을 입력해주세요.</span>
			</div>
			<div class="mail_wrap">
				<div class="mail_name">이메일</div> 
				<div id="mail_input_box" style="width: 65%; display: inline-block;" >
					<input class="mail_input form-control" name="memberMail">
					<span class="final_mail_ck">이메일을 입력해주세요.</span>
					<span class="mail_input_box_warn"></span>
					<p class="mail_overlab_pTag" style="display: none; color: red;"><strong>이메일 중복검사를 실행해주세요.</strong></p>
				</div>
				<div class="mail_overlabCk_button mail_overlab_btn btn btn-success">
						<span style="font-weight: 900">이메일 중복 검사</span>
				</div>
				<div class="mail_check_wrap">
					<div id="mail_check_input_box_false" style="width: 65%; display: inline-block;" >
						<input class="mail_check_input form-control" disabled="disabled" style="width: 100%">
					</div>
					<div class="mail_check_button btn btn-success">
						<span style="font-weight: 900">인증번호 전송</span>
					</div>
					<div class="clearfix"></div>
					<span id="mail_check_input_box_warn"></span>
				</div>
				
			</div>
			
			<div class="address_wrap">
				<div class="address_name">주소</div>
				<div class="address_input_1_wrap">
						<input class="address_input_1 form-control" name="memberAddr1" readonly="readonly" style="width:65%; display: inline-block;">
					<div class="address_button btn btn-success" onclick="execution_daum_address()">
						<span style="font-weight: 900">주소 찾기</span>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class ="address_input_2_wrap">
						<input class="address_input_2 form-control" name="memberAddr2" readonly="readonly">
				</div>
				<div class ="address_input_3_wrap">
						<input class="address_input_3 form-control" name="memberAddr3" readonly="readonly">
				</div>
				<span class="final_addr_ck">주소를 입력해주세요.</span>
			</div>
			<div class="join_button_wrap">
				<input type="button" class="join_button btn btn-primary" value="가입하기" style="font-size: 40px; font-weight: 900;">
			</div>
		</div>
	</form>
	
</div>

<!-- 다음 주소록 API 스크립트 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
let code = ""; // 이메일전송 인증번호 저장을 위한 변수

/* 유효성 검사 통과유무 변수 */
let idCheck = false;            // 아이디
let idckCheck = false;            // 아이디 중복 검사
let pwCheck = false;            // 비번
let pwckCheck = false;            // 비번 확인
let pwckcorCheck = false;        // 비번 확인 일치 확인
let vali_pwCk = false;
let nameCheck = false;            // 이름
let mailCheck = false;            // 이메일
let mailnumCheck = false;        // 이메일 인증번호 확인

let mailOverlap = false; 		// 이메일 DB 중복 검사

let addressCheck = false         // 주소

$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
	$(".join_button").click(function(){
		
		// 입력값 변수
		let id = $('.id_input').val(); // id 입력란
		let pw = $('.pw_input').val(); // 비밀번호 입력란
		let pwck = $('.pwck_input').val(); // 비밀번호 확인 입력란
		let name = $('.user_input').val(); // 이름 입력란
        let mail = $('.mail_input').val(); // 이메일 입력란
        let addr = $('.address_input_3').val();  // 주소 입력란
        
        // 아이디 유효성검사
        if(id == ""){
        	$('.final_id_ck').css('display','block');
        	idCheck = false;
        }else{
        	$('.final_id_ck').css('display', 'none');
        	idCheck = true;
        }
        
        /* 비밀번호 유효성 검사 */
        if(pw == ""){
            $('.final_pw_ck').css('display','block');
            pwCheck = false;
        }else{
            $('.final_pw_ck').css('display', 'none');
            pwCheck = true;
        }
        
        /* 비밀번호 확인 유효성 검사 */
        if(pwck == ""){
            $('.final_pwck_ck').css('display','block');
            pwckCheck = false;
        }else{
            $('.final_pwck_ck').css('display', 'none');
            pwckCheck = true;
        }
        
        /* 이름 유효성 검사 */
        if(name == ""){
            $('.final_name_ck').css('display','block');
            nameCheck = false;
        }else{
            $('.final_name_ck').css('display', 'none');
            nameCheck = true;
        }
        
        /* 이메일 유효성 검사 */
        if(mail == ""){
            $('.final_mail_ck').css('display','block');
            mailCheck = false;
        }else{
            $('.final_mail_ck').css('display', 'none');
            mailCheck = true;
        }
        
        /* 주소 유효성 검사 */
        if(addr == ""){
            $('.final_addr_ck').css('display','block');
            addressCheck = false;
        }else{
            $('.final_addr_ck').css('display', 'none');
            addressCheck = true;
        }
        
        if(mailOverlap == false){
        	$('.mail_overlab_pTag').css('display', 'block');
        }
        
        /* 최종 유효성 검사 */
        if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&mailCheck&&mailnumCheck&&addressCheck&&vali_pwCk&&mailOverlap){
        	$("#join_form").attr("action", "/member/join");
    		$("#join_form").submit();
        }
        return false;
		
	});
	
	//아이디 중복검사
	$('.id_input').on("propertychange change keyup paste input", function(){
		let memberId = $('.id_input').val();			// .id_input에 입력되는 값
		let data = {memberId : memberId}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
		
		$.ajax({
			type : "post",
			url : "/member/memberIdChk",
			data : data,
			success : function(result){
				// console.log("성공 여부 : " + result);
				if(result != 'fail'){
					$('.id_input_re_1').css("display","inline-block");
					$('.id_input_re_2').css("display", "none");		
					idckCheck = true;
				} else {
					$('.id_input_re_2').css("display","inline-block");
					$('.id_input_re_1').css("display", "none");	
					idckCheck = false;
				}
			}
		});
	});
	
	//이메일 중복검사
	$('.mail_overlabCk_button').click(function() {
		let memberMail = $('.mail_input').val();			
		let data = {memberMail : memberMail}
		
		$.ajax({
			type : "post",
			url : "/member/memberMailChk",
			data : data,
			success : function(result){
				if(result != 'fail'){
					alert("사용가능한 이메일입니다.")
					mailOverlap = true;
				} else {
					alert("중복된 이메일입니다.")
					mailOverlap = false;
				}
			}
		});
	});
		
	/* 인증번호 이메일 전송 */
	$(".mail_check_button").click(function(){
		
		let email = $(".mail_input").val(); // 입력한 이메일
		let checkBox = $(".mail_check_input"); // 인증번호 입력란
		let boxWrap = $(".mail_check_input_box"); // 인증번호 입력란 박스
		let warnMsg = $(".mail_input_box_warn"); // 이메일 입력 경고글
		
		if(mailFormCheck(email)){
			warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
			warnMsg.css("display","inline-block");
		}else{
			warnMsg.html("올바르지 못한 이메일 형식입니다.");
			warnMsg.css("display", "inline-block");
			return false;
		}
		
		$.ajax({
	        type:"get",
	        url:"mailCheck?email=" + email,
	        success : function(data){
	        	// console.log("data : " + data);
	        	checkBox.attr("disabled", false);
	        	boxWrap.attr("id", "mail_check_input_box_true");
	        	code = data;
	        }
	    });
	});
	
	// 인증번호 비교
	$(".mail_check_input").blur(function(){
		let inputCode = $(".mail_check_input").val(); // 입력코드
		let checkResult = $("#mail_check_input_box_warn"); // 비교결과
		
		if(inputCode == code){
			checkResult.html("인증번호가 일치합니다.");
			checkResult.attr("class", "correct");
			mailnumCheck = true;
		}else{
			checkResult.html("인증번호를 다시 확인해주세요.");
			checkResult.attr("class", "incorrect");
			mailnumCheck = false;
		}
	});
	
});

/* 다음 주소 연동 */
function execution_daum_address(){
    
	new daum.Postcode({
		oncomplete : function(data){
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드
			
			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            let addr = ''; // 주소 변수
            let extraAddr = ''; // 참고항목 변수

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

// 비밀번호 확인 일치 유효성 검사
$('.pwck_input').on("propertychange change keyup paste input", function(){
	
	let pw = $('.pw_input').val();
	let pwck = $('.pwck_input').val();
	$('.final_pwck_ck').css('display', 'none');
	
	if(pw == pwck){
        $('.pwck_input_re_1').css('display','block');
        $('.pwck_input_re_2').css('display','none');
        pwckcorCheck = true;
    }else{
        $('.pwck_input_re_1').css('display','none');
        $('.pwck_input_re_2').css('display','block');
        pwckcorCheck = false;
    }     
});
//8~20자 사이 문자1개, 숫자1개, 특수문자1개 유효성
$('.pw_input').on("propertychange change keyup paste input", function(){
	let pw = $('.pw_input').val();
	let pwck = $('.pwck_input').val("");
	
    if(passwordCheck(pw)){
		vali_pwCk = true;
		$('.valiation_pw').css('display','none');
	}else{
		vali_pwCk = false;
		$('.valiation_pw').css('display','block');
	}
});

// 입력 이메일 형식 유효성 검사
function mailFormCheck(email){
	let form = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	return form.test(email);
}

function passwordCheck(password){
	let regExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,20}$/;
	return regExp.test(password);
}

</script>

</body>
</html>