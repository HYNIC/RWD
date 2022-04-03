let discussLink, replyCnt, pageBtns, listBtn, modBtn, removeBtn, operForm, searchBtn, searchForm;

discussLink = document.querySelectorAll(".get");
replyCnt = document.querySelectorAll(".replyCnt");
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
if (discussLink) { // discussLink가 있는건 board.jsp >> board.jsp가 열리면 실행
	discussLink.forEach((discuss) => {
		discuss.addEventListener("click", (e) => {
			e.preventDefault();
			
			let dis_num = document.createElement("input");
			dis_num.type = "hidden";
			dis_num.name = "num";
			dis_num.value = discuss.getAttribute("href");
			
			//console.log(dis_num);
			operForm.append(dis_num);
			operForm.method = "get";
			operForm.action ="get";
			operForm.submit();
			
		});
	
	});
	
	// 댓글 수 표시
	replyCnt.forEach((td) => {
		let dis_num = td.dataset.dnum;
		
		replyService.countReply(dis_num, function(cnt) {
			td.innerText = cnt;
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


let replyUL = document.querySelector("#reply");
let replyPageDiv = document.querySelector("#reply-page");


if (replyUL) { // replyUL 이 있는건 get.jsp >> get.jsp가 열리면 실행하는 거
	let replyBtn = document.querySelector("#replyBtn");
	let replyInput = document.querySelector("input[name='reply']");

	let replyer = document.querySelector("#replyer"); // 로그인한 이용자
	let dis_num = document.querySelector("#num"); 
	
	let replyModBtns, reply_li,doModBtn, replyDelBtn, quitModifyBtn, re_num;
	
	
	// 댓글 불러오기
	showReplies(1);	
	
	if (replyBtn) {
		// 댓글 등록
		replyBtn.addEventListener("click", () => {
			var reply = {
				dis_num: Number(dis_num.value),
				reply: replyInput.value,
				}
			
			replyService.add(reply);		
			replyInput.value = "";
			
			alert("댓글 등록 완료");
			showReplies(-1);
		});	
	}
			
	
	// 댓글목록불러오는 메서드
	function showReplies(page) {
		replyService.getList(
			{num: Number(dis_num.value), page:page||1}, function(replyCnt, list) {
				if(page == -1) {
					pageNum = Math.ceil(replyCnt/7.0);
					showReplies(pageNum);
					return;
				}
				
				if (list == null || list.length == 0) {
					replyUL.innerHTML = "";
					
					return;
				} 
				
				var str = "";
				for (var i = 0, len = list.length || 0; i < len; i++) {
					//console.log(list[i]);
					str +="<li class='reply-li' data-rnum='"+ list[i].re_num + "'>";
					str +="<div><div><strong>" + list[i].username + "</strong>";
					str += "<small>" + list[i].replyDate + "</small></div>";
					str += "<div><p>" + list[i].reply + "</p>";
					if (list[i].replyer == replyer.value) {
						str += "<small><a class='replyMod' data-rnum='"+ list[i].re_num + "'>수정</a></small>";	
					}
					str += "</div></li>";
				}
				
				replyUL.innerHTML = str;
					
				showReplyPage(replyCnt);
				
				replyModBtns = document.querySelectorAll(".replyMod");
				reply_li = document.querySelectorAll(".reply-li");
				
				goUpdate();

		}); // replyService.getList callback 끝
	
	} // showReplies() 끝
	
	let pageNum = 1;

	// 댓글 페이지 표시
	function showReplyPage(replyCnt) {
		
		let endNum = Math.ceil(pageNum / 5.0) * 5; // 페이지번호 5개씩 보여줌
		let startNum = endNum - 4;
		
		// prev, next는 boolean형
		let prev = startNum != 1;
		let next = false;
		
		if (endNum * 7 >= replyCnt) { // 7은 한페이지에 나타낼 댓글 개수
			endNum = Math.ceil(replyCnt/7.0);
		}
		
		if (endNum * 7 < replyCnt) {
			next = true;
		}
		
		let str = "<ul class='reply-paging'>";
		
		if (prev) {
			str += "<li><a class='reply-paginate' href='" + (startNum - 1) + "'><</a></li>";
		}
		
		for (let i = startNum; i <= endNum; i++) {
			let active = pageNum == i ? 'page-active' : '';
			str += "<li class='" + active + "'><a class='reply-paginate' href='" + i + "'>" + i + "</a></li>";
		}
		
		if (next) {
			str += "<li><a class='reply-paginate' href='" + (endNum + 1) + "'>></a></div>";
		}
		
		str += "</ul>";
		
		replyPageDiv.innerHTML = str;
		
		var replyPages = document.querySelectorAll(".reply-paginate");
		
		// 댓글 페이지 전환
		//console.log(replyPages);
		replyPages.forEach((btn) => {
			btn.addEventListener("click", (e) => {
				e.preventDefault();
				
				let targetPageNum = e.currentTarget.getAttribute("href");
				
				pageNum = targetPageNum;
				
				showReplies(pageNum);
			});
		});
		
	}
	
	// 댓글 수정창 열기
	function goUpdate() {
		// '수정하기' 버튼클릭 >> 수정칸으로 바뀜.	
		replyModBtns.forEach((btn) => {
			btn.addEventListener("click", () => {
				re_num = Number(btn.dataset.rnum); // 선택한 버튼의 data-rnum값
				
				reply_li.forEach((li) => {
					if (li.dataset.rnum == re_num) { // 선택한 수정버튼의 data-rnum값과 같은 data-rnum값을 가진 li태그
						// 그 태그의 값 가져오고, 수정input할 수 있는 창으로 바꾸기.
						replyService.getReply(re_num, function(comment) {
							
							if (!document.querySelector("#re-mod-input")) {
								str = "<div><div><strong>" + comment.username + "</strong></div>";
								str += "<div><input type='text' id='re-mod-input' value='"+ comment.reply + "'>";
								str += "<div><button id='doReplyMod' data-rnum='" + re_num + "'>수정</button>";
								str += "<button id='replyDel' data-rnum='" + re_num + "'>삭제</button>";
								str += "<button id='quitModify'>취소</button></div></div>";
								li.innerHTML = str;
							} 
							
							// 수정창진입 후 찐 수정위한 버튼
							doModBtn = document.querySelector("#doReplyMod");
							replyDelBtn = document.querySelector("#replyDel");
							quitModifyBtn = document.querySelector("#quitModify");
							
							doUpdate();
							
						}); // getReply callback 끝

					}
				});					
			});
		});// 댓글 수정 버튼 선택 이벤트(수정창진입) 끝
	} // goUpdate() 끝
	
	function doUpdate() {
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
			replyService.remove(re_num, () => {
				location.href=window.location.href;
			});
		});
		
		// 수정취소
		quitModifyBtn.addEventListener("click", () => {
			location.href=window.location.href; // ㅜㅜ 원래 있는데다가 포커스 주고 싶은데.. 좀 더 고민해보기
		});
	}// doUpdate()끝	

	
	
} // if(replyUL)끝



