let discussLink, listBtn, modBtn, removeBtn, operForm;

discussLink = document.querySelectorAll(".get");
listBtn = document.querySelector("#listBtn");
modBtn = document.querySelector("#modBtn");
removeBtn = document.querySelector("#removeBtn");
operForm = document.querySelector("#operForm");

// discuss/board >> discuss/get?num=#으로 이동
if (discussLink) {
	discussLink.forEach((discuss) => {
		discuss.addEventListener("click", (e) => {
			e.preventDefault();
			// 나중에 페이징 처리하고 childNOdes없애주기.
			
			
			let dis_num = document.createElement("input");
			dis_num.name = "num";
			dis_num.value = discuss.getAttribute("href");
			
			console.log(dis_num);
			operForm.append(dis_num);
			operForm.action ="get";
			operForm.submit();
			
		});
	
	});
}

if (listBtn) {
	listBtn.addEventListener("click", (e) => {
		e.preventDefault();
		operForm.action = "/discuss/";
		operForm.method = "get";
		operForm.removeChild(operForm.firstChild);
		operForm.submit();
	});
}

if (modBtn) {
	modBtn.addEventListener("click", () => {
		operForm.submit();
	});
}

if (removeBtn) {
	removeBtn.addEventListener("click", (e) => {
		e.preventDefault();
		operForm.action = "remove";
		operForm.submit();
	});
}