let recordLink, listBtn, modBtn, removeBtn, operForm;

recordLink = document.querySelectorAll(".get");
listBtn = document.querySelector("#listBtn");
modBtn = document.querySelector("#modifyBtn");
removeBtn = document.querySelector("#removeBtn");
operForm = document.querySelector("#operForm");

// board.jsp에서 get.jsp로 링크 
if (recordLink) {
	recordLink.forEach((link) => {
		link.addEventListener("click", (e) => {
			e.preventDefault();
			
			let pageTag = document.querySelector("#page").cloneNode();
			
			while (operForm.hasChildNodes()) {
				operForm.removeChild(
					operForm.firstChild
				);
			}
			
			let rec_num = document.createElement("input");
			rec_num.name = "num";
			rec_num.value = link.getAttribute("href");
			operForm.append(rec_num);
			operForm.append(pageTag);
			operForm.action = "get";
			operForm.submit();
		});
	});
	
	let pageTag = document.querySelector("#page");
	let endPageTag = document.querySelector("#endPage");

	let movePageBtn = document.querySelectorAll(".record-paging > button");
	movePageBtn.forEach((btn) => {
		btn.addEventListener("click", (e) => movePage(e.currentTarget));
	})
	
	
	function movePage(arg) {

		
		if (arg.dataset.oper == "prev") {
			
			if (pageTag.value == 1) {
				pageTag.remove();
			} else {
				pageTag.value = Number(pageTag.value) - 1;
				endPageTag.remove();
			}
			
		} else if (arg.dataset.oper == "next") {
			
			if (pageTag.value == endPageTag.value) {
				pageTag.value = 1;
			} else {
				pageTag.value = Number(pageTag.value) + 1;
			}
			
			endPageTag.remove();
			
		}
		
		operForm.action = "board";
		operForm.submit();
		
	}
	
	
}

// list로 귀환하는 버튼 
if (listBtn) {
	listBtn.addEventListener("click", () => {
	    operForm.action = "/record/board";
	    operForm.method = "get";
	    
	    let pageTag = document.querySelector("#page").cloneNode();
	    
	    while(operForm.hasChildNodes()) {
		 	operForm.removeChild(operForm.firstChild);
		}
	    
	    operForm.append(pageTag);
	    operForm.submit();
	});
} 

// 수정버튼 클릭시
if (modBtn) {
	modBtn.addEventListener("click" , () => {
	    operForm.submit();
	});
}

// 삭제버튼 클릭시
if (removeBtn) {
	removeBtn.addEventListener("click", () => {
		operForm.action = "remove";	
		operForm.submit();
	});
}








