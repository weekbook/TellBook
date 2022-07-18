<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 - TellBook</title>
<!-- 파비콘 -->
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/pavicon.png">
<link rel="stylesheet" href="/resources/css/member/login.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<Style>

</Style>
</head>
<!-- <body> -->

<%-- <div class="wrapper">

		<div class="wrap">
			<form id="login_form" method="post">
				<div class="logo_wrap">
					<span>Book Mall</span>
				</div>
				<div class="login_wrap">
					<div class="id_wrap">
						<div class="id_input_box">
							<input class="id_input" name="memberId">
						</div>
					</div>
					<div class="pw_wrap">
						<div class="pw_input_box">
							<input type="password" class="pw_iput" name="memberPw">
						</div>
					</div>

					<c:if test="${result == 0 }">
						<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
					</c:if>


					<div class="login_button_wrap">
						<input type="button" class="login_button" value="로그인">
					</div>
				</div>
			</form>
		</div>

	</div>
	

</body> --%>
<body class="text-center">
	<div class="container">
    <div class="input-form-backgroud">
      <div class="input-form col-md-12 mx-auto">
	<main class="form-signin">
		<form id="login_form" method="post">
			<a href="/main"><img class="mb-4" src="/resources/img/mLogo.png"
				alt="" width="200" height="210"></a>
			<h1 class="h3 mb-3 fw-normal">회원로그인</h1>

			<div class="form-floating">
				<input type="id_input" class="form-control" name="memberId"
					placeholder="ID"> <label for="floatingInput">ID</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" name="memberPw"
					placeholder="Password"> <label for="floatingPassword">Password</label>
			</div>

			<!-- <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div> -->

			<div class="mb-3" style="font-size: 13px;">
				<button type="button" class="btn btn-outline-dark"
					onclick="location.href='/member/findMember'">아이디 찾기</button>
				&nbsp &nbsp
				<button type="button" class="btn btn-outline-dark"
					onclick="location.href='/member/findMember'">비빌번호 찾기</button>
			</div>

			<button class="w-100 btn btn-lg btn-primary login_button"
				type="submit" value="로그인">로그인</button>
			<p class="mt-5 mb-3 text-muted">&copy; TellBook 2022.05 - 07</p>
		</form>
	</main>
	</div>
	</div>
	</div>

</body>
<script>
		// 로그인 버튼 클릭 메서드
		$(".login_button").click(function() {
			// alert("로그인 버튼 작동");

			// 로그인 메서드 서버 요청
			$("#login_form").attr("action", "/member/login.do");
			$("#login_form").submit();
		});
</script>
</html>