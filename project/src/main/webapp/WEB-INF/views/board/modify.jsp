<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">글 수정</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<form role="form" id="modifyForm" action="/board/modify" method="post">
				
				<input type="hidden" name="bno" value="${board.bno }"/>
				<input type="hidden" name="pageNum" value="${cri.pageNum }"/>
				<input type="hidden" name="amount" value="${cri.amount }"/>
				<input type="hidden" name="keyword" value="${cri.keyword }"/>
				<input type="hidden" name="type" value="${cri.type }"/>
					<div class="form-group">
						<label>제목</label> <input class="form-control" name="title"
							value='<c:out value="${board.title }"/>'>
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea rows="3" class="form-control" name="content"><c:out value="${board.content }" /></textarea>
					</div>
					<div class="form-group">
						<label>작성자</label> <input class="form-control" name="writer"
							value='<c:out value="${board.writer }"/>' readonly="readonly">
					</div>
					
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-body">
									<div class="form-group uploadDiv">
										파일 첨부 : <input type="file" name="uploadFile" multiple>
									</div>
									<div class="uploadResult">
										<ul></ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					
							<button type="submit" data-oper='modify' class="btn btn-success">수정</button>
							<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
					
					
					<button type="submit" data-oper='list' class="btn btn-info" id="list_btn">목록</button>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		var formObj = $("form");
		$('button').on("click", function(e){
			e.preventDefault();
			var operation = $(this).data("oper");
			console.log(operation);
			if(operation === 'remove'){
				formObj.attr("action", "/board/remove");
			} else if(operation === 'list'){
				
				var PageNumTag = $("input[name='pageNum']");
				var amountTag = $("input[name='amount']");
				var keyword = $("input[name='keyword']");
				var typeTag = $("input[name='type']");
				
				formObj.attr("action", "/board/list").attr("method","get");
				formObj.empty();
				
				formObj.append(PageNumTag);
				formObj.append(amountTag);
				formObj.append(keyword);
				formObj.append(typeTag);
			}
			
			else if (operation === "modify") {
				var str = "";
				$(".uploadResult ul li").each(function(i,obj){
					var jobj=$(obj);
					console.log(jobj.data("filename"));
					str+="<input type='hidden' name='attachList[";
					str+=i+"].fileName' value='"+jobj.data("filename");
					str+="'>";
					
					str+="<input type='hidden' name='attachList[";
					str+=i+"].uuid' value='"+jobj.data("uuid");
					str+="'>";
					
					str+="<input type='hidden' name='attachList[";
					str+=i+"].uploadPath' value='"+jobj.data("path");
					str+="'>";
					
					str+="<input type='hidden' name='attachList[";
					str+=i+"].fileType' value='"+jobj.data("type");
					str+="'>";
				});
				formObj.append(str);
			}
			formObj.submit();
		});
		
		(function() {
			var bno = '<c:out value="${board.bno}"/>';
			
			$.getJSON("/board/getAttachList"
					,{bno:bno}, function(arr) {
						console.log(arr);
						
						var str="";
		                $(arr).each(function(i,attach){
		                	 var fileCallPath
		                	 = encodeURIComponent(attach.uploadPath
		                			 +"/"+attach.uuid+"_"+attach.fileName);
		                     str+="<li data-path='";
		                     str+=attach.uploadPath+"' data-uuid='";
		                     str+=attach.uuid+"' data-filename='";
		                     str+=attach.fileName+"' data-type='";
		                     str+=attach.fileType+"'><div>";
		                     str+="<img src='/resources/img/dan.jpg' width='20' height='20'>";
		                     str+="<span>"+attach.fileName+"</span>&nbsp;&nbsp;";
		                     str+="<b data-file='"+fileCallPath;
		                     str+="' data-type='file'>[x]</b>";
		                     str+="</div></li>";
		                  });
		                  $(".uploadResult ul").html(str);
					});
		})();
		
		
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		$(".uploadResult").on("click","b",function(e){
			console.log("delete file");
			var delConfirm
			= confirm('선택한 파일을 삭제하시겠습니까? \n 확인을 선택하면 복구 불가')
			if (delConfirm) {
				var targetFile=$(this).data("file");
				var type=$(this).data("type");
				var targetLi=$(this).closest("li");
				$.ajax({
					url : '/deleteFile',
					data : {
						fileName : targetFile,
						type : type
					},
					beforeSend : function(xhr) {
						xhr.setRequestHeader(
								csrfHeaderName,
								csrfTokenValue);
					},
					dataType : 'text',
					type : 'POST',
					success : function(result){
						alert(result);
						targetLi.remove();
					}
				});
			}else {
				return;
			}
		});
		
		
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880;
		
		function checkExtension(fileName, fileSize) {
	           if (fileSize >= maxSize) {
	              alert("파일 크기 초과");
	              return false;
	           }

	           if (regex.test(fileName)) {
	              alert("해당 종류의 파일은 업로드 불가.");
	              return false;
	           }
	           return true;
	       }

		$("input[type='file']").change(function(e) {
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			for (var i = 0; i < files.length; i++) {
				if (!checkExtension(files[i].name, files[i].size)) {
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
			$.ajax({
				url: '/uploadAjaxAction',
				processData: false,
				contentType: false,
				data: formData,
				beforeSend : function(xhr) {
					xhr.setRequestHeader(
							csrfHeaderName,
							csrfTokenValue);
				},
				type: 'POST',
				dataType: 'json',
				success: function(result) {
					console.log(result);
					showUploadResult(result);
				}
			});
		});
		
		function showUploadResult(uploadResultArr) {
			if (!uploadResultArr || uploadResultArr.length == 0) {
				return;
			}
			var uploadUL = $(".uploadResult ul");
			var str ="";
			
			
			$(uploadResultArr).each(function(i, obj) {
				var fileCallPath = encodeURIComponent(obj.uploadPath
						+ "/" + obj.uuid + "_" + obj.fileName);
				
				var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
				
				str += "<li data-path='";
                str += obj.uploadPath+"' data-uuid='";
                str += obj.uuid+"' data-filename='";
                str += obj.fileName+"' data-type='";
                str += obj.image+"'><div>";
                str += "<img src='/resources/img/dan.jpg' width='20' height='20'>";
                str += "<span>" + obj.fileName + "</span> ";
                str += "<b data-file='"+fileCallPath;
                str += "' data-type='file'>[x]</b>";
                str += "</div></li>";
			});
			uploadUL.append(str);
		}
		
	});
</script>

<%@ include file="../includes/footer.jsp"%>

