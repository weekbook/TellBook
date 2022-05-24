console.log("Reply module.....");


var replyService = (function(){
	function add(reply, callback, error){
		console.log("add reply.....");
		
		$.ajax({
			type: 'post',
			url: '/replies/new',
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success: function(result){
				if(callback){
					callback(result);
				}
			},
			error: function(er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function getList(param, callback, error) {
             console.log("getlist....");
             var bno = param.bno;
             var page = param.page || 1;
             $.getJSON("/replies/pages/" + bno + "/" + page,
                 function(data) {
                     if(callback) {
                          callback(data.replyTotalCnt, data.list);
                     }
                 }).fail(function(xhr, status, err){
                     if(error) {
                         error(er);
                     }
                 })
        }
	
	function displayTime(timeValue){
		var today = new Date();
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);
		var str = "";
		
		if(gap<(1000*60*60*24)){
			var hr = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var sc = dateObj.getSeconds();
			
			return [ (hr>9?'':'0')+hr, ':',(mi>9?'':'0')+mi,':'
			,(sc>9?'':'0')+sc].join('');
		}else{
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth()+1;
			var dd = dateObj.getDate();
			
			return [yy, '/', (mm>9?'':'0')+mm, '/',
                    (dd>9?'':'0')+dd].join('');
		}
	}
	
	function get(rno, callback, error){
		$.get("/replies/" + rno, function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, er){
			if(error){
				error(er);
			}
		});
	}
	
	function update(reply, callback, error){
		console.log("rno: " + reply.rno);
		$.ajax({
			type : 'put',
			url : '/replies/' + reply.rno,
			data : JSON.stringify(reply),
			contentType : "application/json;charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			}
		});
	}
	
	function remove(rno, replyer, callback, error){
		$.ajax({
			type : 'delete',
			url : '/replies/' + rno,
			
			data:JSON.stringify({rno:rno,replyer:replyer}),
				contentType : "application/json; charset=utf-8",
			
			success : function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	
	
	
	
	
	
	return{
		add: add,
		getList: getList,
		displayTime: displayTime,
		get: get,
		update: update,
		remove: remove
	};
})();