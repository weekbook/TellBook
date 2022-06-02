<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/goodsEnroll.css?ver2">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 위지윅스크립트 -->
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>

<!-- jquery-ui datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style>
	#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
	#result_card {
		position: relative;
	}
	.imgDeleteBtn{
	    position: absolute;
	    top: 0;
	    right: 5%;
	    background-color: #ef7d7d;
	    color: wheat;
	    font-weight: 900;
	    width: 30px;
	    height: 30px;
	    border-radius: 50%;
	    line-height: 26px;
	    text-align: center;
	    border: none;
	    display: block;
	    cursor: pointer;	
	}
</style>

</head>
<body>

	<%@ include file="../includes/header.jsp"%>
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>상품 등록</span>
		</div>
		<div class="admin_content_main">
			<form action="/admin/goodsEnroll" method="post" id="enrollForm">
				<div class="form_section">
					<div class="form_section_title">
						<label>책 제목</label>
					</div>
					<div class="form_section_content">
						<input name="bookName" class="form-control">
						<span class="ck_warn bookName_warn">책 이름을 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>작가</label>
					</div>
					<div class="form_section_content">
						<input id="authorName_input" readonly="readonly" class="form-control" style="display: inline-block;">
						<input id="authorId_input" name="authorId" type="hidden">
						<button class="authorId_btn">작가 선택</button>
						<span class="ck_warn authorId_warn">작가를 선택해주세요</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>출판일</label>
					</div>
					<div class="form_section_content">
						<input name="publeYear" class="form-control" autocomplete="off" readonly="readonly"
						style="display: inline-block;">
						<span class="ck_warn publeYear_warn">출판일을 선택해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>출판사</label>
					</div>
					<div class="form_section_content">
						<input name="publisher" class="form-control">
						<span class="ck_warn publisher_warn">출판사를 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>책 카테고리</label>
					</div>
					<div class="form_section_content">
						<div class="cate_wrap">
							<span>대분류</span>
							<select class="cate1 form-select" style="display: inline-block;">
								<option selected value="none">선택</option>
							</select>
						</div>
						<div class="cate_wrap">
							<span>중분류</span>
							<select class="cate2 form-select" style="display: inline-block;">
								<option selected value="none">선택</option>
							</select>
						</div>
						<div class="cate_wrap">
							<span>소분류</span>
							<select class="cate3 form-select" name="cateCode" style="display: inline-block;">
								<option selected value="none">선택</option>
							</select>
						</div> 
						<span class="ck_warn cateCode_warn">카테고리를 선택해주세요.</span> 
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 가격</label>
					</div>
					<div class="form_section_content">
						<input name="bookPrice" value="0" class="form-control">
						<span class="ck_warn bookPrice_warn">상품 가격을 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 재고</label>
					</div>
					<div class="form_section_content">
						<input name="bookStock" value="0" class="form-control">
						<span class="ck_warn bookStock_warn">상품 재고를 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 할인율</label>
					</div>
					<div class="form_section_content">
						<input id="discount_interface" maxlength="2" value="0" class="form-control">
						<input name="bookDiscount" type="hidden" value="0">
						<span class="step_val">할인 가격 : <span class="span_discount"></span></span>
						<span class="ck_warn bookDiscount_warn">0~99 숫자를 입력하세요</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>책 소개</label>
					</div>
					<div class="form_section_content">
						<textarea name="bookIntro" id="bookIntro_textarea"></textarea>
						<span class="ck_warn bookIntro_warn">책 소개를 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>책 목차</label>
					</div>
					<div class="form_section_content">
						<textarea name="bookContents" id="bookContents_textarea"></textarea>
						<span class="ck_warn bookContents_warn">책 목차를 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
                    <div class="form_section_title">
                    	<label>상품 이미지</label>
                    </div>
                    <div class="form_section_content">
                    	<input class="form-control" name="uploadFile" type="file" id="fileItem" multiple>
                    	<div id="uploadResult">
                    		<!-- <div id="result_card">
                    			<div class="imgDeleteBtn">x</div>
                    			<img src="/display?fileName=test.png">
                    		</div> -->
                    	</div>
                    </div>
                </div>
			</form>
			<div class="btn_section">
				<button id="cancelBtn" class="btn btn-warning">취 소</button>
				<button id="enrollBtn" class="btn enroll_btn btn-primary">등 록</button>
			</div>
		</div>
	</div>

	<%@ include file="../includes/footer.jsp"%>

<script>
	let enrollForm = $("#enrollForm");
	
	// 취소 버튼
	$("#cancelBtn").click(function(){
		location.href="/admin/goodsManage";
	});
	
	// 상품 등록 버튼
	$("#enrollBtn").on("click", function(e){
		e.preventDefault();
		
		/* 체크 변수 */
		let bookNameCk = false;
		let authorIdCk = false;
		let publeYearCk = false;
		let publisherCk = false;
		let cateCodeCk = false;
		let priceCk = false;
		let stockCk = false;
		let discountCk = false;
		let introCk = false;
		let contentsCk = false;
		
		/* 체크 대상 변수 */
		let bookName = $("input[name='bookName']").val();
		let authorId = $("input[name='authorId']").val();
		let publeYear = $("input[name='publeYear']").val();
		let publisher = $("input[name='publisher']").val();
		let cateCode = $("select[name='cateCode']").val();
		let bookPrice = $("input[name='bookPrice']").val();
		let bookStock = $("input[name='bookStock']").val();
		let bookDiscount = $("#discount_interface").val();
		let bookIntro = $(".bit p").html();
		let bookContents = $(".bct p").html();
		
		// 공란 체크
		if(bookName){
			$(".bookName_warn").css('display','none');
			bookNameCk = true;
		} else {
			$(".bookName_warn").css('display','block');
			bookNameCk = false;
		}
		
		if(authorId){
			$(".authorId_warn").css('display','none');
			authorIdCk = true;
		} else {
			$(".authorId_warn").css('display','block');
			authorIdCk = false;
		}
		
		if(publeYear){
			$(".publeYear_warn").css('display','none');
			publeYearCk = true;
		} else {
			$(".publeYear_warn").css('display','block');
			publeYearCk = false;
		}	
		
		if(publisher){
			$(".publisher_warn").css('display','none');
			publisherCk = true;
		} else {
			$(".publisher_warn").css('display','block');
			publisherCk = false;
		}
		
		if(cateCode != 'none'){
			$(".cateCode_warn").css('display','none');
			cateCodeCk = true;
		} else {
			$(".cateCode_warn").css('display','block');
			cateCodeCk = false;
		}	
		
		if(bookPrice != 0){
			$(".bookPrice_warn").css('display','none');
			priceCk = true;
		} else {
			$(".bookPrice_warn").css('display','block');
			priceCk = false;
		}	
		
		if(bookStock != 0){
			$(".bookStock_warn").css('display','none');
			stockCk = true;
		} else {
			$(".bookStock_warn").css('display','block');
			stockCk = false;
		}		
		
		if(!isNaN(bookDiscount)){
			$(".bookDiscount_warn").css('display','none');
			discountCk = true;
		} else {
			$(".bookDiscount_warn").css('display','block');
			discountCk = false;
		}	
		
		if(bookIntro != '<br data-cke-filler="true">'){
			$(".bookIntro_warn").css('display','none');
			introCk = true;
		} else {
			$(".bookIntro_warn").css('display','block');
			introCk = false;
		}	
		
		if(bookContents != '<br data-cke-filler="true">'){
			$(".bookContents_warn").css('display','none');
			contentsCk = true;
		} else {
			$(".bookContents_warn").css('display','block');
			contentsCk = false;
		}
		
		if(bookNameCk && authorIdCk && publeYearCk && publisherCk && cateCodeCk && priceCk && stockCk && discountCk && introCk && contentsCk ){
			//alert('통과');
			enrollForm.submit();
		} else {
			return false;
		}
		
	});
	
	// 위지윅 전용
	/* 책 소개 */
	ClassicEditor
		.create(document.querySelector('#bookIntro_textarea'))
		.catch(error=>{
			console.error(error);
		});
		
	/* 책 목차 */	
	ClassicEditor
		.create(document.querySelector('#bookContents_textarea'))
		.catch(error=>{
			console.error(error);
		});
	
	/* datepicker 날짜 설정 */
	const config = {
		dateFormat: 'yy-mm-dd',
		showOn : "button",
		buttonText:"날짜 선택",
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNames: ['일','월','화','수','목','금','토'],
		dayNamesShort: ['일','월','화','수','목','금','토'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		changeMonth: true,
	    changeYear: true
	}
	
	/* 캘린더 위젯 적용 */
	$(function(){
		$("input[name='publeYear']").datepicker(config);
	});
	
	/* 작가 선택 버튼 */
	$('.authorId_btn').on("click",function(e){
		e.preventDefault();
		
		let popUrl = "/admin/authorPop";
		let popOption = "width = 650px, height=550px, top=300px, left=300px, scrollbars=yes";
		
		window.open(popUrl,"작가 찾기", popOption);
	});
	
	/* $(document).ready(function(){
		console.log('${cateList}');
	}); */
	
	// 카테고리
	// 받아온 JSON데이터를 javascript 객체로 변환
	let cateList = JSON.parse('${cateList}');
	
	
	// 현재 cateList의 상태는 대분류,중분류,소분류 모두 섞여있는 상태이기때문에 tier에 맞게 분류하여 배열에 저장
	// 각 배열의 인덱스에는 cateName, cateCode, cateParent 변수와 그값을 가지고 있는 객체가 저장됨.
	let cate1Array = new Array();
	let cate2Array = new Array();
	let cate3Array = new Array();
	let cate1Obj = new Object();
	let cate2Obj = new Object();
	let cate3Obj = new Object();
	
	let cateSelect1 = $(".cate1")
	let cateSelect2 = $(".cate2")
	let cateSelect3 = $(".cate3")
	
	// 카테고리 배열 초기화 메서드
	function makeCateArray(obj, array, cateList, tier){
		for (let i = 0; i < cateList.length; i++) {
			if(cateList[i].tier === tier){
				obj = new Object();
				
				obj.cateName = cateList[i].cateName;
				obj.cateCode = cateList[i].cateCode;
				obj.cateParent = cateList[i].cateParent;
				
				array.push(obj);
			}
		}
	}
	
	
	/* 배열 초기화 */
	makeCateArray(cate1Obj,cate1Array,cateList,1);
	makeCateArray(cate2Obj,cate2Array,cateList,2);
	makeCateArray(cate3Obj,cate3Array,cateList,3);
	
	/* $(document).ready(function(){
		console.log(cate1Array);
		console.log(cate2Array);
		console.log(cate3Array);
	}); */
	
	// 대분류 <option> 태그
	for (var i = 0; i < cate1Array.length; i++) {
		cateSelect1.append("<option value='"+cate1Array[i].cateCode+"'>" + cate1Array[i].cateName + "</option>");
	}
	
	// 중분류 <option> 태그
	$(cateSelect1).on("change", function(){
		let selectVal1 = $(this).find("option:selected").val();
		
		cateSelect2.children().remove();
		cateSelect3.children().remove();
		
		cateSelect2.append("<option value='none'>선택</option>")
		cateSelect3.append("<option value='none'>선택</option>")
		
		for (var i = 0; i < cate2Array.length; i++) {
			if(selectVal1 === cate2Array[i].cateParent){
				cateSelect2.append("<option value='"+cate2Array[i].cateCode+"'>" + cate2Array[i].cateName + "</option>");
			}
		}
	});
	
	// 소분류 <option> 태그
	$(cateSelect2).on("change", function(){
		let selectVal2 = $(this).find("option:selected").val();
		
		cateSelect3.children().remove();
		
		cateSelect3.append("<option value='none'>선택</option>")
		
		for (var i = 0; i < cate3Array.length; i++) {
			if(selectVal2 === cate3Array[i].cateParent){
				cateSelect3.append("<option value='"+cate3Array[i].cateCode+"'>" + cate3Array[i].cateName + "</option>");
			}
		}
	});
	
	// 할인률 Input 설정
	$("#discount_interface").on("propertychange change keyup paste input", function(){
		
		let userInput = $("#discount_interface");
		let discountInput = $("input[name='bookDiscount']");
		
		let discountRate = userInput.val(); // 사용자가 입력한 할인값
		let sendDiscountRate = discountRate / 100; // 서버에 전송할 할인률 계산
		let goodsPrice = $("input[name='bookPrice']").val(); // 원가
		let discountPrice = goodsPrice * (1 - sendDiscountRate); // 할인가격
		
		if(!isNaN(discountRate)){
			$(".span_discount").html(discountPrice);
			discountInput.val(sendDiscountRate);
		}
		
	});
	$("input[name='bookPrice']").on("change", function(){
		
		let userInput = $("#discount_interface");
		let discountInput = $("input[name='bookDiscount']");
		
		let discountRate = userInput.val(); // 사용자가 입력한 할인값
		let sendDiscountRate = discountRate / 100; // 서버에 전송할 할인률 계산
		let goodsPrice = $("input[name='bookPrice']").val(); // 원가
		let discountPrice = goodsPrice * (1 - sendDiscountRate); // 할인가격
		
		if(!isNaN(discountRate)){
			$(".span_discount").html(discountPrice);
		}
	});
	
	// 이미지 업로드
	$("input[type='file']").on("change", function(e){
		
		// 이미지 존재시 삭제
		/* if($(".imgDeleteBtn").length > 0){
			deleteFile();
		} */
		
		let formData = new FormData();
		let fileInput = $('input[name="uploadFile"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
		/* if (!fileCheck(fileObj.name, fileObj.size)) {
			return false;
		} */
		
		for (var i = 0; i < fileList.length; i++) {
			formData.append("uploadFile", fileObj);
		}
		
		$.ajax({
			url: '/admin/uploadAjaxAction',
			processData : false, // 서버로 전송할 데이터를 queryString 형태로 변환할지여부
			contentType : false, // 서버로 전송되는 데이터의 content-type
			data : formData, // 서버로 전송할 데이터
			type : 'POST', // 서버 요청 타입
			dataType : 'json', // 서버로부터 반환받을 데이터 타입
			success : function(result){
				console.log(result);
				showUploadImage(result);
			},
			error : function(result){
				alert("이미지 파일이 아닙니다.");
			}
		});
	});
	
	// 파일 체크
	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 2097152; // 1MB
	
	function fileCheck(fileName, fileSize) {
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		
		return true;
	}
	
	// 이미지 출력
	function showUploadImage(uploadResultArr){
		
		/* 전달받은 데이터 검증 */
		if(!uploadResultArr || uploadResultArr.length == 0){return}
		
		let uploadResult = $("#uploadResult");
		
		let obj = uploadResultArr[0];
		
		let str = "";
		
		let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
		
		str += "<div id='result_card'>";
		str += "<img src='/display?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";	
		str += "</div>";
		
		uploadResult.append(str);     
	}	
	
	// 파일 삭제 메서드
	function deleteFile(){
		let targetFile = $(".imgDeleteBtn").data("file");
		let targetDiv = $("#result_card");
		
		$.ajax({
			url: '/admin/deleteFile',
			data : {fileName : targetFile},
			dataType : 'text',
			type : 'POST',
			success : function(result){
				console.log(result);
				
				targetDiv.remove();
				$("input[type='file']").val("");
			},
			error : function(result){
				console.log(result);
				alert("파일을 삭제하지 못하였습니다.");
			}
		});
	}
	
	// 이미지 삭제 버튼 동작
	$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
		deleteFile();
	});
	
	
	
	
	
	
	
	
</script>
</body>
</html>
