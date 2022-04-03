// 변수선언
let domain, email_, email, username, user_pw, phoneArr, gender, submitBtn,
err_email, err_pw, joinForm, emailTag, nameTag, pwTag, phoneTag, genderTag;

domain = document.querySelector(".join-form-domain"); // 도메인 select창
email_ = document.getElementsByName("email"); // 이메일 __ @ __ 이렇게 받아오기 위해 다 받음
username = document.querySelector("input[name='username']"); 
user_pw = document.querySelectorAll("input[name='user_pw']"); // 비밀번호, 비밀번호 확인
phoneArr = document.querySelectorAll(".phone"); // 000 - 0000 - 0000 세개 다 받아오기
submitBtn = document.querySelector("#submit-btn");
joinForm = document.querySelector(".join-form > form");

// 이벤트 리스너 모음
document.querySelector(".join-form").addEventListener("input", activateBtn);
domain.addEventListener("change", changeDomain);
email_.forEach((email) => {
	email.addEventListener("input", checkEmail);
});
user_pw[1].addEventListener("input", checkPw);
submitBtn.addEventListener("click", doJoin);


// 숫자입력체크 이벤트 리스너
phoneArr.forEach((phone) => {
    phone.addEventListener("input", (e) => checkNum(e.currentTarget));
});

// 연락처 포커스이동 이벤트리스너
for (let i = 0; i < phoneArr.length; i++) {
	if (i < phoneArr.length - 1) {
		phoneArr[i].addEventListener("keyup", (e) => moveFocus(e.currentTarget, phoneArr[i + 1]));	
	}	
}
   
// 이메일 도메인 '직접 입력'선택 시 텍스트 입력창으로 바뀜
function changeDomain() {
	if (domain.value == "direct_input") {
		domain.remove();
		email_div = document.querySelector(".div-email");
		new_domain = document.createElement("input");
		new_domain.type="text";
		new_domain.name="email";
		new_domain.placeholder="직접 입력"; 
		email_div.append(new_domain);
		domain = new_domain;
		domain.addEventListener("input", checkEmail);	
	}
	checkEmail();
}

// 연락처 포커스 이동
function moveFocus(arg, next) {
    if(arg.value.length == arg.getAttribute('maxlength')) {
        next.focus();
        return;
    }
}

// 유효성검사 (추후 중복검사 추가) >> 가입하기 버튼 누르면 실행
function checkEmail() {
	err_email = document.querySelector("#err-email");
	email_ = document.getElementsByName("email");
	
    let domain_str = domain.value.split('.');
    
    if (!domain_str[1]) {
        email_.forEach((email) => {
			email.style.border = "2px solid tomato";
		});
        err_email.style.display = "block";
        err_email.innerText = "올바른 이메일 형식이 아닙니다"
    } else {
		
		email = email_[0].value + '@' + domain.value;
		
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				let result = xhr.responseText;
		
				if (result == 1) {
					err_email.innerText = "이미 사용중인 이메일입니다.";
					err_email.style.color = "tomato";
					email_.forEach((email) => {
						email.style.border = "2px solid tomato";
					});
				} else {
					err_email.innerText = "사용가능한 이메일입니다.";
					err_email.style.color = "seagreen";
					email_.forEach((email) => {
						email.style.border = "2px solid seagreen";
					});

				}
			}
    	} 
    	xhr.open("get", "checkEmail?email=" + email, true);
		xhr.send();
	}
}
// 비밀번호 체크
function checkPw() {
	err_pw = document.querySelector("#err-pw");

    if (user_pw[0].value != user_pw[1].value) {
        user_pw.forEach((pw) => {
			pw.style.border = "2px solid tomato";
		});
        err_pw.style.display = "block";
        err_pw.innerText = "비밀번호가 일치하지 않습니다."
    } else {
		user_pw.forEach((pw) => {
			pw.style.border = "1px solid grey";
		});
        err_pw.style.display = "none";
        err_pw.innerText = "";
    }
}

//버튼 활성화
function activateBtn() {
	// input마다 gender checked된 값 확인
    gender = document.querySelector("input[name='gender']:checked");

    // 연락처 값이 완전히 입력되었는지 확인
    for (i = 0; i < phoneArr.length; i++) {
        checkPhone = phoneArr[i].value.length == phoneArr[i].getAttribute('maxlength');
        if (!checkPhone) {
            break;
        }
    }

    // 모든 값이 작성되었는지 확인
    let input_check = email && username.value && user_pw[0].value && checkPhone && gender.value;

    // 에러메시지 떠있는지 확인
    let isErr = (err_email.style.color == "tomato") || (err_pw.style.display == "block");

    // 조건에 따라 버튼 활성화
    if (!input_check) {
        submitBtn.disabled = true;
    } else if (isErr) {
        submitBtn.disabled = true;
    } else {
        submitBtn.disabled = false;
    }
} 


// '가입하기'버튼 누를때 동작
function doJoin(event) {
	event.preventDefault();

	emailTag = email_[0].cloneNode();
	emailTag.value = email;
	
	nameTag = username.cloneNode();
	
	pwTag = user_pw[0].cloneNode();
	
	genderTag = gender.cloneNode();
	
	phoneTag = document.createElement("input");
	phoneTag.name = "phone";
	phoneTag.value = phoneArr[0].value + '-' + phoneArr[1].value + '-' + phoneArr[2].value;
	
	while (joinForm.hasChildNodes()) {
		joinForm.removeChild(
			joinForm.firstChild
		);
	}
	
	joinForm.appendChild(emailTag);
	joinForm.appendChild(nameTag);
	joinForm.appendChild(pwTag);
	joinForm.appendChild(phoneTag);
	joinForm.appendChild(genderTag);
	
	joinForm.submit();
	alert(nameTag.value + "님 환영합니다.");
	
}

// 연락처 숫자만 입력가능하도록.
function checkNum(arg) {
    arg.value = arg.value.replace(/[^0-9]/g,'');
}

