// replyService 객체?
var replyService = (function() {
	
	function add(reply, callback, error) {
		$.ajax({
			type: 'post',
			url: '/replies/regi',
			data: JSON.stringify(reply),
			contentType: 'application/json;charset=utf-8',
			success: function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error: function(err, xhr, status) {
				if (error) {
					error(err);
				}
			}
		});
		
	}
	
	function getList(param, callback, error) {
		
		var num = param.num;
		var page = param.page || 1;
		
		$.getJSON("/replies/" + num + "/" + page
				, function (data) {
					if (callback) {
						callback(data.replyCnt, data.list);
					}
				}).fail(function(err, xhr, status) {
					if (error) {
						error();
					}
				});
	}
	
	function getReply(re_num, callback, error) {
		$.get("/replies/" + re_num, function(result) {
			if (callback) {
				callback(result);
			}
		}).fail(function(err, xhr, status) {
			if (error) {
				error();
			}
		});
	}
	
	function update(reply, callback, error) {
		$.ajax({
			type: 'put',
			url: '/replies/' + reply.re_num,
			data: JSON.stringify(reply),
			contentType: 'application/json;charset=utf-8',
			success: function (result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error: function(err, status, xhr) {
				if (error) {
					error(err);
				}
			}
			
		});
	}
	
	function remove (re_num, callback, error) {
		$.ajax({
			type: 'delete',
			url: '/replies/' + re_num,
			//data: JSON.stringify(reply),
			contentType: 'application/json;charset=utf-8',
			success: function (result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error: function(err, status, xhr) {
				if (error) {
					error(err);
				}
			}
			
		});
	}
	
	function countReply (dis_num, callback, error) {
		$.get("/replies/count/" + dis_num, function(result) {
			if (callback) {
				callback(result);
			}
		}).fail(function(err, xhr, status) {
			if (error) {
				error();
			}
		});
		
	}
		
	return {
		add : add,
		getList : getList,
		getReply : getReply,
		update : update,
		remove : remove,
		countReply : countReply
	};
	
})();
