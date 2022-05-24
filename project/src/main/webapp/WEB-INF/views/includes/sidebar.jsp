<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.bd-sidebar {
  position: sticky;
  top: 4rem;
  z-index: 1000;
  height: calc(100vh - 4rem);
  border-right: 1px solid rgba(0,0,0,.1);
  max-width: 220px;
  display: flex;
  padding: 0;
  overflow-y: hidden;
  flex-direction: column;
}
.bd-sidebar-body {
  height: 100%;
  overflow-y: auto;
  display: block;
}
.bd-sidebar-body .nav {
  display: block;
}
.bd-sidebar-body .nav>li>a {
  display: block;
  padding: .25rem 1.5rem;
  font-size: 90%;
}
</style>
</head>
<body>
	<!-- Page Content -->
	<br>
	<div class="p-2 bg-white">
	    <a href="/" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
	      <span class="fs-5 fw-semibold">Collapsible</span>
	    </a>
	    <ul class="list-unstyled ps-0 ">
	      <li class="mb-1">
	        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="false">
	          상의
	        </button>
	        <div class="collapse" id="home-collapse" style="">
	          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	            <li><a href="#" class="link-dark rounded">반팔티</a></li>
	            <li><a href="#" class="link-dark rounded">셔츠/남방</a></li>
	            <li><a href="#" class="link-dark rounded">긴팔티</a></li>
	            <li><a href="#" class="link-dark rounded">맨투맨</a></li>
	            <li><a href="#" class="link-dark rounded">후드티/아노락</a></li>
	            <li><a href="#" class="link-dark rounded">후드집업</a></li>
	            <li><a href="#" class="link-dark rounded">니트/스웨터</a></li>
	            <li><a href="#" class="link-dark rounded">민소매/나시</a></li>
	            <li><a href="#" class="link-dark rounded">트레이닝상의</a></li>
	          </ul>
	        </div>
	      </li>
	      <li class="mb-1">
	        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
	          아우터
	        </button>
	        <div class="collapse" id="dashboard-collapse">
	          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	            <li><a href="#" class="link-dark rounded">코트</a></li>
	            <li><a href="#" class="link-dark rounded">점퍼</a></li>
	            <li><a href="#" class="link-dark rounded">자켓</a></li>
	            <li><a href="#" class="link-dark rounded">무스탕</a></li>
	            <li><a href="#" class="link-dark rounded">가디건</a></li>
	            <li><a href="#" class="link-dark rounded">항공점퍼/블루종</a></li>
	            <li><a href="#" class="link-dark rounded">패딩/다운</a></li>
	            <li><a href="#" class="link-dark rounded">수트</a></li>
	          </ul>
	        </div>
	      </li>
	      <li class="border-top my-2"></li>
	      
	      <li class="mb-1">
	        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
	          하의
	        </button>
	        <div class="collapse" id="orders-collapse">
	          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	            <li><a href="#" class="link-dark rounded">청바지</a></li>
	            <li><a href="#" class="link-dark rounded">슬랙스</a></li>
	            <li><a href="#" class="link-dark rounded">면바지</a></li>
	            <li><a href="#" class="link-dark rounded">트레이닝하의</a></li>
	            <li><a href="#" class="link-dark rounded">반바지</a></li>
	            <li><a href="#" class="link-dark rounded">조거팬츠</a></li>
	          </ul>
	        </div>
	      </li>
	      <li class="mb-1">
	        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
	          신발
	        </button>
	        <div class="collapse" id="account-collapse">
	          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	            <li><a href="#" class="link-dark rounded">슬립온</a></li>
	            <li><a href="#" class="link-dark rounded">스니커즈</a></li>
	            <li><a href="#" class="link-dark rounded">운동화</a></li>
	            <li><a href="#" class="link-dark rounded">워커</a></li>
	            <li><a href="#" class="link-dark rounded">부츠</a></li>
	            <li><a href="#" class="link-dark rounded">로퍼</a></li>
	            <li><a href="#" class="link-dark rounded">보트화</a></li>
	            <li><a href="#" class="link-dark rounded">구두</a></li>
	            <li><a href="#" class="link-dark rounded">슬리퍼</a></li>
	            <li><a href="#" class="link-dark rounded">샌들</a></li>
	          </ul>
	        </div>
	      </li>
	    </ul>
  </div>
</body>
</html>