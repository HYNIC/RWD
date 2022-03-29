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


// 댓글 작성폼
let replyBtn = document.querySelector("#replyBtn");
if (replyBtn) {
	replyBtn.addEventListener("click", (e) => {
		e.preventDefault();
		
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange() = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let result = xhr.responseText;
				
				if (result == 1) {
					// 댓글 목록 보여주기
				} 
			}
		}
		xhr.open("post", "replies/new");
		xhr.send();
	})
}
