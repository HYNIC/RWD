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
			
			while (operForm.hasChildNodes()) {
				operForm.removeChild(
					operForm.firstChild
				);
			}
			
			let rec_num = document.createElement("input");
			rec_num.name = "num";
			rec_num.value = link.getAttribute("href");
			operForm.append(rec_num);
			operForm.action = "get";
			operForm.submit();
		});
	});
}

// list로 귀환하는 버튼 
if (listBtn) {
	listBtn.addEventListener("click", () => {
	    operForm.action = "/record/";
	    operForm.method = "get";
	    operForm.removeChild(operForm.firstChild);
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



let movePageBtn = document.querySelectorAll(".record-paging > button");
movePageBtn.forEach((btn) => {
	btn.addEventListener("click", (e) => movePage(e.currentTarget));
})


function movePage(arg) {

	let pageTag = document.querySelector("#page");
	let endPageTag = document.querySelector("#endPage");
	
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
	
/*	operForm.action = "board";
	operForm.submit();*/
/*	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200) {
			
			let list = xhr.responseText;
			
			for (let i = 0; i < list.length; i++) {
				list[i]
			}
			
		}
	}	*/
	
}

let 



