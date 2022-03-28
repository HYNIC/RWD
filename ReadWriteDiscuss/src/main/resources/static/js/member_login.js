document.querySelector("button").addEventListener("click", checkInput);


function checkInput(event) {
	event.preventDefault();
	let email = document.querySelector("input[name='email']");
	let pw = document.querySelector("input[name='user_pw']");
	let msg = document.querySelectorAll(".errMsg");
	
	msg.forEach((m) => {
		m.style.display="none";
	});
	
	if (email.value.length == 0) {
		email.style.border = "2px solid tomato";
		msg[0].innerText = "아이디를 입력해주세요";
		msg[0].style.display="block";
		return false;
	}
	
	if (pw.value.length == 0) {
		pw.style.border = "2px solid tomato";
		msg[1].innerText = "비밀번호를 입력해주세요";
		msg[1].style.display = "inline";
		return false;
	}
	
	
	document.querySelector("#loginForm").submit();
	
}