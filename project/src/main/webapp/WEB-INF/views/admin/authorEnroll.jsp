<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작가등록 - 관리자페이지</title>
<!-- 파비콘 -->
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/pavicon.png">
<link rel="stylesheet" href="../resources/css/admin/authorEnroll.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
</head>
<body>
	<%@ include file="../includes/adminLayout.jsp"%>
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>작가 등록</span>
		</div>
		<div class="admin_content_main">
			<form action="/admin/authorEnroll.do" method="post" id="enrollForm">
				<div class="form_section">
					<div class="form_section_title">
						<label>작가 이름</label>
					</div>
					<div class="form_section_content">
						<input name="authorName" class="form-control"> <span
							id="warn_authorName">작가 이름을 입력 해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>소속 국가</label>
					</div>
					<div class="form_section_content">
						<select class="form-select" name="nationId">
							<option value="none" selected>=== 선택 ===</option>
							<option value="01">국내</option>
							<option value="02">국외</option>
						</select> <span id="warn_nationId">소속 국가를 선택해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>작가소개</label>
					</div>
					<div class="form_section_content">
						<input name="authorIntro" type="text" class="form-control">
						<span id="warn_authorIntro">작가 소개를 입력 해주세요.</span>
					</div>
				</div>
			</form>
			<div class="btn_section">
				<button id="cancelBtn" class="btn btn-warning">취 소</button>
				<button id="enrollBtn" class="btn btn-primary enroll_btn">등록</button>
			</div>
		</div>
	</div>
	<%@ include file="../includes/footer.jsp"%>


	<script>
 	// 등록 버튼
 	$("#enrollBtn").click(function(){
 		// 검사 통과 유무 변수
 		let nameCheck = false;
 		let nationCheck = false;
 		let introCheck = false;
 		
 		// 입력값 변수
 		let authorName = $('input[name=authorName]').val();
 		let nationId = $('select[name=nationId]').val();
 		let authorIntro = $('input[name=authorIntro]').val();
 		
 		// 공란 경고 span태그
 		let wAuthorName = $('#warn_authorName');
 		let wnationId = $('#warn_nationId');
 		let wauthorIntro = $('#warn_authorIntro')	;
 		
 		// 작가 이름 공란 체크
 		if(authorName === ''){
 			wAuthorName.css('display','block');
 			nameCheck = false;
 		} else{
 			wAuthorName.css('display', 'none');
 			nameCheck = true;
 		}
 		
 		// 소속 국가 공란 체크
 		if(nationId === 'none'){
 			wnationId.css('display','block');
 			nationCheck = false;
 		} else{
 			wnationId.css('display', 'none');
 			nationCheck = true;
 		}
 	
 		// 작가 소개 공란 체크
 		if(authorIntro === ''){
 			wauthorIntro.css('display','block');
 			introCheck = false;
 		} else{
 			wauthorIntro.css('display', 'none');
 			introCheck = true;
 		}
 		/* 최종 검사 */
 	    if(nameCheck && nationCheck && introCheck){
 	        $("#enrollForm").submit(); 
 	    } else{
 	        return;
 	    }
 		
 	});
 	// 취소 버튼
 	$("#cancelBtn").click(function(){
 		location.href="/admin/authorManage";
 	});
 </script>
</body>
</html>