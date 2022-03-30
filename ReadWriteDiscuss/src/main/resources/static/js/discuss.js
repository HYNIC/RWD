let discussLink, pageBtns, listBtn, modBtn, removeBtn, operForm, searchBtn, searchForm;

discussLink = document.querySelectorAll(".get");
pageBtns = document.querySelectorAll(".paginate-button a");
listBtn = document.querySelector("#listBtn");
modBtn = document.querySelector("#modBtn");
removeBtn = document.querySelector("#removeBtn");
operForm = document.querySelector("#operForm");
searchBtn = document.querySelector("#searchBtn");
searchForm = document.querySelector("#searchForm");

let pageTag = document.querySelector("#page");
let typeTag = document.querySelector("#type");
let keywordTag = document.querySelector("input[name='keyword']");

// discuss/board >> discuss/get?num=#으로 이동
if (discussLink) {
	discussLink.forEach((discuss) => {
		discuss.addEventListener("click", (e) => {
			e.preventDefault();
			
			let dis_num = document.createElement("input");
			dis_num.name = "num";
			dis_num.value = discuss.getAttribute("href");
			
			console.log(dis_num);
			operForm.append(dis_num);
			operForm.method = "get";
			operForm.action ="get";
			operForm.submit();
			
		});
	
	});
}


// 페이지 이동할 때
if (pageBtns) {
	pageBtns.forEach((btn) => {
		btn.addEventListener("click", (e) => {
			e.preventDefault();
			
			pageTag.value = Number(btn.getAttribute("href"));
			operForm.method = "get";
			operForm.action = "board";
			operForm.submit();
			
		})
	})
}

// 목록버튼 누를때
if (listBtn) {
	listBtn.addEventListener("click", (e) => {
		e.preventDefault();
		operForm.action = "/discuss/board";
		operForm.method = "get";
		operForm.firstElementChild.remove();
		operForm.submit();
	});
}

// 수정버튼 누를때
if (modBtn) {
	modBtn.addEventListener("click", () => {
		
		var cloneNum = document.querySelector("input[name='num']").cloneNode();
		var clonePage = pageTag.cloneNode();
		var cloneType = typeTag.cloneNode();
		var cloneKeyword = keywordTag.cloneNode();
		
		while (operForm.hasChildNodes()) {
			operForm.removeChild(operForm.firstChild);
		}
		
		operForm.append(cloneNum);
		operForm.append(clonePage);
		operForm.append(cloneType);
		operForm.append(cloneKeyword);
		operForm.submit();
	});
}

// 삭제버튼 누를때
if (removeBtn) {
	removeBtn.addEventListener("click", (e) => {
		e.preventDefault();
		operForm.action = "remove";
		operForm.submit();
	});
}

// 검색버튼 누를때
if (searchBtn) {
	searchBtn.addEventListener("click", (e) => {


		if (!typeTag.options[typeTag.selectedIndex].value) {
			alert("검색분류를 선택하세요");
			return false;
		}
		
		if (!keywordTag.value) {
			alert("키워드를 입력하세요");
			return false;
		}
		
		searchForm.querySelector("input[name='page']").value = 1;
		e.preventDefault();
		
		searchForm.submit();
	});
}

let replyBtn = document.querySelector("#replyBtn");
let replyInput = document.querySelector("input[name='reply']");
let replyModBtns;

let dis_num = document.querySelector("#num"); 
let replyUL = document.querySelector("#reply");

window.onload = function () {
	if (replyUL) {
		showReplies(1);
	}
}

if (replyBtn) {
	replyBtn.addEventListener("click", () => {
		var reply = {
			reply: replyInput.value,
			dis_num: Number(dis_num.value)
			}
		
		replyService.add(reply);		
		replyInput.value = "";
		
		alert("댓글 등록 완료");
		showReplies(1);
	});
}


function showReplies(page) {
	replyService.getList(
		{num: Number(dis_num.value), page:page||1}, function(list) {
			var str = "";
			
			if (list == null || list.length == 0) {
				replyUL.innerHTML = "";
				
				return;
			} 
			
			var str = "";
			for (var i = 0, len = list.length || 0; i < len; i++) {
				str +="<li class='reply-li' data-rnum='"+ list[i].re_num + "'>";
				str +="<div><div><strong>" + list[i].replyer + "</strong>";
				str += "<small>" + list[i].replyDate + "</small></div>";
				str += "<div><p>" + list[i].reply + "</p>";
				str += "<small><a class='replyMod' data-rnum='"+ list[i].re_num + "'>수정</a></small></div></li>";
			}
			
			replyUL.innerHTML = str;		
			goUpdate();	
				
		}); // replyService.getList callback 끝
		
	
}

function goUpdate() {
	// '수정하기' 버튼클릭 >> 수정칸으로 바뀜.
	replyModBtns = document.querySelectorAll(".replyMod");
	let reply_li = document.querySelectorAll(".reply-li");
	
	replyModBtns.forEach((btn) => {
		btn.addEventListener("click", () => {
			let re_num = Number(btn.dataset.rnum); // 선택한 버튼의 data-rnum값
			
			reply_li.forEach((li) => {
				if (li.dataset.rnum == re_num) { // 선택한 수정버튼의 data-rnum값과 같은 data-rnum값을 가진 li태그
					// 그 태그의 값 가져오고, 수정input할 수 있는 창으로 바꾸기.
					replyService.getReply(re_num, function(comment) {
						
						if (!document.querySelector("#re-mod-input")) {
							str = "<div><div><strong>" + comment.replyer + "</strong></div>";
							str += "<div><input type='text' id='re-mod-input' value='"+ comment.reply + "'>";
							str += "<div><button id='doReplyMod' data-rnum='" + re_num + "'>수정</button>";
							str += "<button id='replyDel' data-rnum='" + re_num + "'>삭제</button>";
							str += "<button id='quitModify'>취소</button></div></div>";
							li.innerHTML = str;
						} 
						
						// 수정창진입 후 찐 수정위한 버튼
						let doModBtn = document.querySelector("#doReplyMod");
						let replyDelBtn = document.querySelector("#replyDel");
						let quitModifyBtn = document.querySelector("#quitModify");
						
						// 수정기능
						doModBtn.addEventListener("click", ()=>{
							let reply_mod_value = document.querySelector("#re-mod-input").value;
							
							let reply = {re_num:re_num, reply: reply_mod_value};
							replyService.update(reply, () => {
								location.href=window.location.href;
							});
							
						});
						
						// 삭제기능
						replyDelBtn.addEventListener("click", () => {
							//let reply = {re_num:re_num};
							replyService.remove(re_num, () => {
								location.href=window.location.href;
							});
						});
						
						// 수정취소
						quitModifyBtn.addEventListener("click", () => {
							location.href=window.location.href; // ㅜㅜ 원래 있는데다가 포커스 주고 싶은데.. 좀 더 고민해보기
						});
						
					}); // getReply callback 끝
				}
			});					
		});
	});// 댓글 수정 버튼 선택 이벤트(수정창진입) 끝
}



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
						callback(data);
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
		
	return {
		add : add,
		getList : getList,
		getReply : getReply,
		update : update,
		remove : remove
	};
	
})();

