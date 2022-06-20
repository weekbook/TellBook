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
		       회원 정보에 등록된 이메일로 찾기
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
		        아이디를 입력하고 비밀번호 재설정
		      </button>
		    </h2>
		    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		      		
		      </div>
		    </div>
		  </div>
			<!-- Modal -->
			<!-- <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        ...
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			      </div>
			    </div>
			  </div>
			</div> -->
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
	let idV = "";

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
						alert("일치하는 회원정보가 없습니다.")
						//$('#id_value').text("회원 정보를 확인해주세요!");	
					} else {
						//$('#id_value').text(result);
						// 아이디값 별도로 저장
						alert(result);
						idV = result;
					}
				}

			});
		}
	
	}
	
	function mailFormCheck(email) {
		var form = new RegExp(
				/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
		return form.test(email);
	}
 </script>
</html>
