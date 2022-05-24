<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">글 읽기</h1>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"></div>
			<div class="panel-body">
				<div class="form-group">
					게시물 번호<input class="form-control" name="bno"
						value='<c:out value="${board.bno }"/>' readonly="readonly">
				</div>
				<div class="form-group">
					제목<input class="form-control" name="title"
						value='<c:out value="${board.title }"/>' readonly="readonly">
				</div>
				<div class="form-group">
					내용
					<textarea rows="3" class="form-control" name="content"
						readonly="readonly"><c:out value="${board.content }" /></textarea>
				</div>
				<div class="form-group">
					작성자<input class="form-control" name="writer"
						value='<c:out value="${board.writer }"/>' readonly="readonly">
				</div>
				
				<button data-oper="modify" class="btn btn-warning" id="modify_btn">수정</button>
				<button data-oper="list" id="boardList_Btn" class="btn btn-info"> 목록</button>
				
				<form id="infoForm" action="/board/modify" method="get">
					<input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno }"/>'>
					<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
					<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'>
					<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>
					<input type="hidden" name="type" value='<c:out value="${cri.type }"/>'>
				</form>
			</div>
		</div>
	</div>
</div>

<br/>
<div class="row">
   <div class="col-lg-12">
      <div class="panel panel-default">
         <div class="panel-heading">첨부파일</div>
         <div class="panel-body">
            <div class="uploadResult">
               <ul></ul>
            </div>
         </div>
      </div>
   </div>
</div>


<br>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i>덧글
				<sec:authorize access="isAuthenticated()">
					<button id="addReplyBtn" class="btn btn-primary btn-xs float-right">새 덧글</button> 
				</sec:authorize>
			</div>
			<br>
			<div class="panel-body">
				<ul class="chat">
					<li>good</li>
				</ul>
			</div>
			<div class="panel-footer"></div>
		</div>
	</div>
</div>

<br />
		<div>
			<div>
				<div style="border-bottom: 1px solid #E6E6E6; padding: 20px 10px">
					<img src="../resources/img/comments.png" width="20px"
					 style="height: 20px; vertical-align: middle">&nbsp;<b>댓글</b>
					 <sec:authorize access="isAnonymous()">
					 	<div style="text-align: center;">댓글 작성은 로그인 후 가능합니다.</div>
					</sec:authorize>
					 <sec:authorize access="isAuthenticated()">
						 <button id="reWrite" class="reForm-btn" style="float: right">작성</button>
					 </sec:authorize>
				</div>
				<div style="border-bottom: 1px solid #E6E6E6;">
					<form id="replyForm" class="re-form">
						<div>
							 <sec:authorize access="isAuthenticated()">
								작성자: <input class="re-input" type="text" name="replyer"
									value="<c:out value="${pinfo.username}"/>" readonly="readonly">
								<button type="submit" class="reForm-btn" id="reSubBtn"
									style="float: right;">등록</button>
								<button type="reset" class="reForm-btn" id="reFormClose"
									style="float: right;">취소</button>
							</sec:authorize>
						</div>
						<br />
						<div>
							<textarea id="reply" class="re-text" name="reply"
								style="resize: none;" placeholder="내용을 입력해 주세요."></textarea>
							<div id="reply_cnt" align="right">[0 / 500]</div>
						</div>
					</form>
				</div>
				<div>
					<ul id="chat" class="reply-ul">
						<li></li>
					</ul>
				</div>
				<div id="reply-footer" align="center"></div>
			</div>
		</div>
		<!-- 댓글 목록 끝 -->

<script type="text/javascript" src="/resources/js/reply.js"></script>
<script>

	$(document).ready(function() {
		var csrfHeaderName="${_csrf.headerName}";
		var csrfTokenValue="${_csrf.token}";
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		});
		
		
		var formObj = $("form");
		
		$("#boardList_Btn").on("click", function(e) {
			e.preventDefault();
			var operation = $(this).data("oper");
			console.log(operation);
			if(operation === 'list'){
				formObj.attr("action", "/board/list");
				formObj.find("#bno").remove();
			}
			formObj.submit();
		});

		$("#modify_btn").on("click", function(e) {
			e.preventDefault();
			var operation = $(this).data("oper");
			console.log(operation);
			if(operation === 'modify'){
				formObj.attr("action","/board/modify");
			}
			formObj.submit();
		});
		
		var bnoValue = '<c:out value="${board.bno}"/>';
		
		/* replyService.add({
			reply : "js test",
			replyer : "tester",
			bno : bnoValue
		}, function(result) {
			alert("결과: " + result)
		}); */
		
		var modal = $("#myModal");
		var modalInputReplydate = modal.find("input[name='replyDate']");
		var modalRegisterBtn = $("#modalRegisterBtn");
		var modalInputReply = modal.find("input[name='reply']");
		var modalInputReplyer = modal.find("input[name='replyer']");
		
		var modalModBtn=$("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		
		$("#addReplyBtn").on("click", function(e) {
			modal.find("input").val("");
			modal.find("input[name='replyer']").val(replyer);
			modal.find("input[name='replyer']").attr("readonly","readonly");
			modalInputReplydate.closest("div").hide();
			modal.find("button[id != 'modalCloseBtn']").hide();
			modalRegisterBtn.show();
			$("#myModal").modal("show");
		});
		
		$("#modalCloseBtn").on("click", function(e) {
			modal.modal("hide");
		});
		
		modalRegisterBtn.on("click", function(e) {
			var reply = {
					reply : modalInputReply.val(),
					replyer : modalInputReplyer.val(),
					bno : bnoValue
			};
			replyService.add(reply, function(result) {
				alert(result);
				modal.find("input").val("");
				modal.modal("hide");
				
				showList(-1);
			});
		});
		
		/* replyService.getList({
			bno : bnoValue,
			page : 1
		}, function(list) {
			for (var i = 0, len = list.length || 0; i < len; i++) {
				console.log(list[i]);
			}
		}); */
		
		var replyUL = $(".chat");
		
		function showList(page) {
			replyService.getList({
				bno : bnoValue,
				page : page || 1
			}, function(replyTotalCnt, list) {
					console.log("댓글갯수 : " + replyTotalCnt);
					
					if(page == -1){
						pageNum = Math.ceil(replyTotalCnt / 10.0);
						
						showList(pageNum);
						
						return;
					}
					
					var str = "";
					
					if(list ==null || list.length == 0){
						replyUL.html("");
						return;
					}
				
				for (var i = 0, len = list.length || 0; i<len; i++){
					str += "<li class='left ";
					str += "clearfix' data-rno='";
					str += list[i].rno+"'>";
					str += "<div><div class='header' ";
					str += "><strong class='";
					str += "primart-font'>";
					str += list[i].replyer+ "</strong>";
					str += "<small class='float-sm-right '>";
					str += replyService.displayTime(list[i].replyDate)
					+ "</small></div>";
					str += "<p>" + list[i].reply;
					str += "</p></div></li>";
				}
				replyUL.html(str); 
				showReplyPage(replyTotalCnt);
			});
		}
		showList(1);
		
		$(".chat").on("click", "li", function(e) {
			var rno = $(this).data("rno");
			console.log(rno);
			
			replyService.get(rno,function(reply){
				modalInputReply.val(reply.reply);
				modalInputReplyer.val(reply.replyer).attr("readonly", "readonly");
				modalInputReplydate.val(replyService.displayTime(reply.replyDate))
					.attr("readonly", "readonly");
				modal.data("rno", reply.rno);
				modal.find("button[id != 'modalCloseBtn']").hide();
				modalModBtn.show();
				modalRemoveBtn.show();
				
				$("#myModal").modal("show");
			});
		});
		
		
		modalModBtn.on("click", function(e) {
			var originalReplyer = modalInputReplyer.val();
			var reply = {
					rno : modal.data("rno"),
					reply : modalInputReply.val(),
					replyer : originalReplyer
			};
			if (!replyer) {
				alert("로그인 후 수정 가능");
				modal.modal("hide");
				return;
			}
			if (replyer != originalReplyer) {
				alert("자신이 작성한 댓글만 수정 가능");
				modal.modal("hide");
				return;
			}
			replyService.update(reply, function(result) {
				alert(result);
				modal.modal("hide");
				showList(-1);
			});
		});
		
		modalRemoveBtn.on("click", function(e) {
			var rno = modal.data("rno");
			var originalReplyer = modalInputReplyer.val();
			if (!replyer) {
				alert("로그인 후 삭제 가능");
				modal.modal("hide");
				return;
			}
			if (replyer != originalReplyer) {
				alert("자신이 작성한 댓글만 삭제 가능");
				modal.modal("hide");
				return;
			}
			replyService.remove(rno, originalReplyer, function(result) {
				alert(result);
				modal.modal("hide");
				showList(pageNum);
			});
		});
		
		var pageNum = 1;
        var replyPageFooter = $(".panel-footer");// 덧글 목록의 footer

        function showReplyPage(replyCnt) {
           var endNum = Math.ceil(pageNum / 10.0) * 10;
           // pageNum : 1 이라고 가정하면,
           // Math.ceil(1/10.0) 처리하고 *10, 즉 endNum : 10
           var startNum = endNum - 9;// - 나올지도..
           var prev = startNum != 1;// false = (1 !=1)
           var next = false;
           // replyCnt : 384, endNum : 39
           if (endNum * 10 >= replyCnt) {// 100 >= 384
              endNum = Math.ceil(replyCnt / 10.0);
           }
           if (endNum * 10 < replyCnt) {
              next = true;
           }
           var str = "<ul class='pagination";
           str+=" justify-content-center'>";
           if (prev) {
              str += "<li class='page-item'><a ";
              str += "class='page-link' href='";
              str += (startNum - 1);
              str += "'>이전</a></li>";
           }
           for (var i = startNum; i <= endNum; i++) {
              var active = pageNum == i ? "active" : "";
              str += "<li class='page-item "+ active
              +"'><a class='page-link' ";
              str+="href='"+i+"'>"
              + i + "</a></li>";
           }
           if (next) {
              str += "<li class='page-item'>";
              str += "<a class='page-link' href='";
              str += (endNum + 1) + "'>다음</a></li>";
           }
           str += "</ul>";
           console.log(str);
           replyPageFooter.html(str);
        }
		
		replyPageFooter.on("click", "li a", function(e) {
			e.preventDefault();
			var targetPageNum = $(this).attr("href");
			pageNum = targetPageNum;
			showList(pageNum);
		});
		
		
		(function(){
	         var bno='<c:out value="${board.bno}"/>';
	         $.getJSON("/board/getAttachList"
	               ,{bno:bno}, function(arr){
	                  console.log(arr);
	                  
	                  var str="";
	                  $(arr).each(function(i,attach){
	                     str+="<li data-path='";
	                     str+=attach.uploadPath+"' data-uuid='";
	                     str+=attach.uuid+"' data-filename='";
	                     str+=attach.fileName+"' data-type='";
	                     str+=attach.fileType+"'><div>";
	                     str+="<img src='/resources/img/dan.jpg' width='20' height='20'> ";
	                     str+="<span>"+attach.fileName+"</span><br/> ";
	                     
	                     str+="</div></li>";
	                  });
	                  $(".uploadResult ul").html(str);
	               });
	      })();
		
		
		$(".uploadResult").on("click", "li", function(e) {
			console.log("download file");
			var liObj = $(this);
			var path = encodeURIComponent(liObj.data("path")
					+"/"+liObj.data("uuid")+"_"
					+liObj.data("filename"));
			self.location="/download?fileName="+path;
		});
		
		
		
		
		
	});
	
</script>
<%@ include file="../includes/footer.jsp"%>