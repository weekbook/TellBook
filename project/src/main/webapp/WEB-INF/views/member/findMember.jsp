<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입 화면 샘플 - Bootstrap</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>

  <style>
    body {
      min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
    }

    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
  </style>
</head>

<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">아이디 및 비밀번호 찾기</h4>
          <div class="accordion" id="accordionExample">
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingOne">
		      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		       회원 정보에 등록된 이름과 이메일로 ID 찾기
		      </button>
		    </h2>
		    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		      		<div class="mb-3">
					  <label for="exampleFormControlInput1" class="form-label">이름</label>
					  <input type="text" class="i_name form-control" name="memberName" placeholder="이름">
					  <p class="name_check" style="display: none; color: red"><strong>이름을 입력해주세요.</strong></p>
					</div>
					<div class="mb-3">
					  <label for="exampleFormControlInput1" class="form-label">이메일</label>
					  <input type="email" class="i_email form-control" name="memberMail" placeholder="이메일(name@example.com)">
					  <p class="email_check" style="display: none; color: red"><strong>알맞은 이메일 형식을 입력해주세요.</strong></p>
					</div>
					<div class="d-grid gap-2 col-6 mx-auto">
						<button class="btn btn-success" style="margin-top: 10px;" onclick="find_ID();">찾기</button>
					</div>
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingTwo">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
		        아이디와 이메일을 입력하고 비밀번호 재설정
		      </button>
		    </h2>
		    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		      		<div class="mb-3">
					  <label for="exampleFormControlInput1" class="form-label">아이디</label>
					  <input type="text" class="i_id form-control" name="memberId" placeholder="아이디">
					  <p class="id_check" style="display: none; color: red"><strong>아이디를 입력해주세요.</strong></p>
					</div>
					<div class="mb-3">
					  <label for="exampleFormControlInput1" class="form-label">이메일</label>
					  <input type="email" class="i_email2 form-control" name="memberMail" placeholder="이메일(name@example.com)">
					  <p class="email_check2" style="display: none; color: red"><strong>알맞은 이메일 형식을 입력해주세요.</strong></p>
					  <p class="check_success" style="display: none; color: green;"><strong>회원님의 계정을 확인했습니다.</strong></p>
					</div>
					<div class="d-grid gap-2 col-6 mx-auto">
						<button class="btn btn-success join_check" style="margin-top: 10px;" onclick="find_Pw();">가입여부 확인</button>
						<button class="btn btn-success send_number" style="margin-top: 10px; display: none;" onclick="send_Mail();">이메일 인증</button>
					</div>
					<div class="mb-3 iden_div" style="display: none">
					  <label for="exampleFormControlInput1" class="form-label">입력한 이메일로 인증번호를 전송했습니다. 입력칸에 입력해주세요.</label>
					  <input type="text" class="iden_number form-control" name="iden_number" placeholder="인증번호">
					  <p class="iden_checkFail" style="display: none; color: red;"><strong>인증번호가 일치하지 않습니다.</strong></p>
					</div>
					<div class="d-grid gap-2 col-6 mx-auto iden_btndiv">
						<button class="btn btn-success iden-btn" style="margin-top: 10px; display: none;" onclick="iden_Check();">확인</button>
					</div>
		      </div>
		    </div>
		  </div>
		  
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel"></h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <p id="modal_Ptag"></p>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary modal_btn" data-bs-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-secondary replace_btn" style="display: none;">Close</button>
			      </div>
			      
			    </div>
			  </div>
			</div>
			
			<!-- 비밀번호 재설정 모달 -->
			<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
			  <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalToggleLabel2">비밀번호 재설정</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			      	<div class="mb-3">
					  <label for="exampleFormControlInput1" class="form-label">새 비밀번호</label>
					  <input type="password" class="i_password form-control" name="memberPw" placeholder="새 비밀번호">
					  <p class="final_pw_ck" style="display: none; color: red;"><strong>비밀번호를 입력해주세요.</strong></p>
					  <p class="valiation_pw" style="display: none; color: red"><strong>비밀번호 형식에 어긋납니다.</strong>	</p>
					  <label for="exampleFormControlInput1" class="form-label">비밀번호 확인</label>
					  <input type="password" class="i_passwordCk form-control" name="memberPwCk" placeholder="비밀번호 확인">
					  <p class="final_pwck_ck" style="display: none; color: red;"><strong>비밀번호를 입력해주세요.</strong></p>
					  <p class="pwck_input_re_1" style="display: none; color: green;"><strong>비밀번호가 일치합니다.</strong></p>
					  <p class="pwck_input_re_2" style="display: none; color: red;"><strong>비밀번호가 일치하지않습니다.</strong></p>
					</div>
			      </div>
			      <div class="modal-footer">
			        <button class="btn btn-success pw_btn" onclick="change_Pw();">확인</button>
			      </div>
			    </div>
			  </div>
			</div>
			
		</div>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; 2022 TELLBOOK</p>
    </footer>
  </div>
  
</body>
<script>
	let mailCheck = false;
	let nameCheck = false;
	
	let pwCheck = false;            // 비번
	let pwckCheck = false;            // 비번 확인
	let pwckcorCheck = false;        // 비번 확인 일치 확인
	let vali_pwCk = false; 			// 8자~20자 문자,숫자,특수문자 1개씩
	
	let code = ""; // 이메일전송 인증번호 저장을 위한 변수

	function find_ID() {
		// 입력값 변수
		const mail = $('.i_email').val(); // 이메일 입력란
		const name = $('.i_name').val(); // 이름 입력란
	
		if (name == '') {
			nameCheck = false;
			$('.name_check').css('display','block');
		}else{
			nameCheck = true;
			$('.name_check').css('display','none');
		}
	
		/* 이메일 유효성 검사 */
		if (mailFormCheck(mail) && mail != "") {
			mailCheck = true;
			$('.email_check').css('display','none');
		} else {
			mailCheck = false;
			$('.email_check').css('display','block');
			
		}
	
		const data = {
				memberName : name,
				memberMail : mail
		}
		
		if (mailCheck == true && nameCheck == true) {
			$.ajax({
				data : data,
				url : "/member/findMemberID",
				type : "POST",
				success : function(result) {
					if(result == 0){
						$('.modal-title').text("아이디 찾기");
						$('#modal_Ptag').text("일치하는 회원정보가 없습니다.");
						
						$('#exampleModal').modal('show'); 
					} else {
						$('.modal-title').text("아이디 찾기");
						$('#modal_Ptag').text("찾은 아이디는 " + result + " 입니다.");
						
						$('#exampleModal').modal('show'); 
					}
				}

			});
		}
	
	}
	
	let IdCheck = false;
	
	function find_Pw() {
		// 입력값 변수
		const mail = $('.i_email2').val(); // 이메일 입력란
		const memId = $('.i_id').val(); // 아이디 입력란
	
		if (memId == '') {
			IdCheck = false;
			$('.id_check').css('display','block');
		}else{
			IdCheck = true;
			$('.id_check').css('display','none');
		}
	
		/* 이메일 유효성 검사 */
		if (mailFormCheck(mail) && mail != "") {
			mailCheck = true;
			$('.email_check2').css('display','none');
		} else {
			mailCheck = false;
			$('.email_check2').css('display','block');
			
		}
	
		const data = {
				memberId : memId,
				memberMail : mail
		}
		
		if (mailCheck == true && IdCheck == true) {
			$.ajax({
				data : data,
				url : "/member/findMemberPw",
				type : "POST",
				success : function(result) {
					if(result == 0){
						$('.check_success').css('display','none');
						
						$('.modal-title').text("회원계정 확인");
						$('#modal_Ptag').text("일치하는 회원정보가 없습니다.");
						
						$('#exampleModal').modal('show'); 
						
					} else {
						$('.check_success').css('display','block');
						$('.join_check').css('display','none');
						$('.send_number').css('display','block');
						
						$('.i_id').prop('readonly', true);
						$('.i_email2').prop('readonly', true);
					}
				}

			});
		}
	
	}
	
	function send_Mail() {
		$('.send_number').css('display','none');
		$('.iden_div').css('display','block');
		$('.iden-btn').css('display','block');
		
		// 회원가입때 사용했던거 재사용
		const email = $('.i_email2').val(); // 이메일 입력란
		
		$.ajax({
	        type:"get",
	        url:"mailCheck?email=" + email,
	        success : function(data){
	        	// console.log("data : " + data);
	        	code = data;
	        }
	    });
	}
	
	function iden_Check() {
		// if추가해서 code 일치하면 비번 재설정 팝업창 띄우기 
		// 아니라면 인증번호 틀렷다고 인증번호 입력창 밑에 p태그 추가하기
		let idenNumber =  $('.iden_number').val();
		
		if (idenNumber === code) {
			$('.iden_checkFail').css('display','none');
			$('#exampleModalToggle2').modal('show'); 
		}else{
			$('.iden_checkFail').css('display','block');
		}
	}
	
	
	function change_Pw() {
		let newPw = $('.i_password').val();
		let newPwCk = $('.i_passwordCk').val();
		let memId = $('.i_id').val(); // 아이디 입력란
		
		const data = {
				memberId : memId,
				memberPw : newPw
		}
		
		/* 비밀번호 유효성 검사 */
        if(newPw == ""){
            $('.final_pw_ck').css('display','block');
            pwCheck = false;
        }else{
            $('.final_pw_ck').css('display', 'none');
            pwCheck = true;
        }
        
        /* 비밀번호 확인 유효성 검사 */
        if(newPwCk == ""){
            $('.final_pwck_ck').css('display','block');
            pwckCheck = false;
        }else{
            $('.final_pwck_ck').css('display', 'none');
            pwckCheck = true;
        }
    	
    	if (pwCheck && pwckCheck && pwckcorCheck && pwckcorCheck && vali_pwCk) {
    		
    		$.ajax({
				data : data,
				url : "/member/resetPassword",
				type : "POST",
				success : function(result) {
					if(result == 0){
						alert("오류가 발생했습니다. 새로고침 후 다시 시도해 주세요.")
					} else{
						$('.modal_btn').css('display','none');
						$('.replace_btn').css('display','block');
						
						$('.modal-title').text("비밀번호 재설정");
						$('#modal_Ptag').text("비밀번호를 변경하였습니다.");
						
						
						$('#exampleModalToggle2').modal('hide');
						$('#exampleModal').modal('show');
					}
				}
			});
		}
	}
	
	$('.replace_btn').click(function() {
		window.location.href = "/main";
	});
	
	// 비밀번호 확인 일치 유효성 검사
	$('.i_passwordCk').on("propertychange change keyup paste input", function(){
		
		var pw = $('.i_password').val();
		var pwck = $('.i_passwordCk').val();
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
	$('.i_password').on("propertychange change keyup paste input", function(){
		var pw = $('.i_password').val();
		
	    if(passwordCheck(pw)){
			vali_pwCk = true;
			$('.valiation_pw').css('display','none');
		}else{
			vali_pwCk = false;
			$('.valiation_pw').css('display','block');
		}
	});
	
	$('btn-close').click(function() {
		$('.modal-title').empty();
		$('#modal_Ptag').empty();
	});
	
	function mailFormCheck(email) {
		var form = new RegExp(
				/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
		return form.test(email);
	}
	
	function passwordCheck(password){
		var regExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,20}$/;
		return regExp.test(password);
	}

 </script>
</html>
