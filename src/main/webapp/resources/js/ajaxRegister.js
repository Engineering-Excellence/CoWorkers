// onload 이벤트

window.onload = () => {
	document.getElementById('accountID').focus();
}

function joinCheck(obj) {
	
	// 아이디 폼 체크	
	if (!obj.accountID.value || obj.accountID.value.trim().length == 0) {
		window.alert('아이디가 입력되지 않았습니다.')
		obj.accountID.focus();
		return false;
	} else if (document.getElementById('idChkResult').value = false) {
		window.alert('중복체크가 완료되지 않았습니다.')
		obj.accountID.focus();
		return false;
	}
	
	// 패스워드 폼 체크
	if (!obj.accountPassword.value || obj.accountPassword.value.trim().length == 0) {
		window.alert('패스워드가 입력되지 않았습니다.')
		obj.accountPassword.focus();
		return false;
	}
	
	//	이름 폼 체크
	if (!obj.userName.value || obj.userName.value.trim().length == 0) {
		window.alert('이름이 입력되지 않았습니다.')
		obj.userName.focus();
		return false;
	}
	
	// 주민등록번호 폼 체크
	if (!obj.registerNumber.value || obj.registerNumber.value.trim().length == 0) {
		window.alert('주민등록번호가 입력되지 않았습니다.')
		obj.registerNumber.focus();
		return false;
	} else if (document.getElementById('regChkResult').value = false) {
		window.alert('주민등록번호 유효검사를 완료해주세요.');
		obj.registerNumber.focus();
		return false;
	}
	
	// 전화번호 폼 체크
	if (!obj.mobileNumber.value || obj.mobileNumber.value.trim().length == 0) {
		window.alert('전화번호가 입력되지 않았습니다.')
		obj.mobileNumber.focus();
		return false;
	} else if (obj.mobileNumber.value.substring(0, 3) != '010') {
		window.alert('전화번호는 010으로 시작해야 합니다.')
		obj.mobileNumber.focus();
		return false;
	}
	
	// 이메일 폼 체크
	if (!obj.email.value || obj.email.value.trim().length == 0) {
		window.alert('이메일이 입력되지 않았습니다.')
		obj.email.focus();
		return false;
	} else if (!obj.email.value.includes('@')) {
		window.alert('이메일은 반드시 "@" 을 사용해야 합니다.')
		obj.email.focus();
		return false;
	} else if (!(obj.email.value.includes('.com') || obj.email.value.includes('.net') || obj.email.value.includes('.co.kr') || obj.email.value.includes('.ac.kr'))) {
		window.alert('이메일 형식이 올바르지 않습니다.')
		obj.email.focus();
		return false;
	}

window.alert('회원가입이 완료되었습니다.');
return true;

}

// DB내 ID가 존재하는지 중복체크 (Ajax)
function idDupCheck() {
	
	var ID = $('#accountID').val().trim();
	const regexID = /[a-zA-z]+\w{5,19}/g;
	
	$.ajax({
		url: 'idCheck',
		type: 'post',
		async: true,
		data: $('#accountID').val(),
		dataType: 'JSON',
		contentType: 'application/json; charset=utf-8',
		success: function(idResult) {
			//	console.log($('#accountID').val());
			//	console.log(idResult);
			console.log(ID.search(regexID));
			// DB 내 ID 유무 확인 및 정규식 검사
			if (idResult != 0) { 
				window.alert('사용할 수 없는 아이디입니다.');
				$('#idCheckMsg').html('사용할 수 없는 아이디입니다.');
				$('#idCheckMsg').css('color', 'red');
				document.getElementById('idChkResult').value = false;
				return false;
			} else if (ID.search(regexID) != 0) {
				window.alert('아이디는 영문 또는 영문 + 숫자 조합 6 ~ 20자로 작성해야 합니다.')
				$('#idCheckMsg').html('아이디는 영문 또는 영문 + 숫자 조합 6 ~ 20자로 작성해야 합니다.')
				$('#idCheckMsg').css('color', 'red')
				setTimeout(function() {
					document.getElementById('accountID').focus();
				}, 10);
				return false;
			} else if (ID.length >=1 && ID.length < 6) {
				window.alert('아이디는 6자 이하로 작성할 수 없습니다.')
				setTimeout(function() {
					document.getElementById('accountID').focus();
				}, 10);
				return false;
			} else if (ID.length > 20) {
				window.alert('아이디는 20자를 초과할 수 없습니다.')
				$('#idCheckMsg').html('아이디는 20자를 초과할 수 없습니다.')
				$('#idCheckMsg').css('color', 'red')
				setTimeout(function() {
					document.getElementById('accountID').focus();
				}, 10);
				return false;
			} else if ($('#accountID').val().trim() != null && idResult == 0) {
				window.alert('사용 가능한 아이디입니다.');
				$('#idCheckMsg').html('사용 가능한 아이디입니다.');
				$('#idCheckMsg').css('color', 'green');
				document.getElementById('idChkResult').value = true;
				return true;
			}
		},
		error: function(e) {
			console.log(e);
			window.alert('아이디를 다시 확인해주세요.');
			$('#idCheckMsg').html('아이디를 다시 확인해주세요.');
			$('#idCheckMsg').css('color', 'red');
			document.getElementById('idChkResult').value = false;
			return false;
		}
	});
};

// 비밀번호 정규식 검사
function pwCheck() {

	var Password = $('#accountPassword').val().trim();
	var Password2 = $('#accountPassword2').val().trim();
	const regexPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,20}$/g;
	
//	console.log(Password.search(regexPw));
	
	if (Password != "" && Password2 != "") {
		if (Password == Password2) {
			if (Password.search(regexPw) == 0) {
				$('#pwCheckMsg').html('비밀번호가 일치합니다.')
				$('#pwCheckMsg').css('color', 'green')
			} else {
				$('#pwCheckMsg').html('비밀번호는 영문, 숫자, 특수문자를 포함하여 6 ~ 20자로 작성해야 합니다.')	
				$('#pwCheckMsg').css('color', 'red')
			}
		} else if (Password.length < 6) {
			window.alert('비밀번호는 6 ~ 20자 이내로 입력해야합니다.');
			document.getElementById('accountPassword2').value = '';
			setTimeout(function() {
				document.getElementById('accountPassword').focus();
			}, 10);
		} else if (Password.length > 20) {
			window.alert('비밀번호는 6 ~ 20자 이내로 입력해야합니다.');
			document.getElementById('accountPassword2').value = '';
			setTimeout(function() {
				document.getElementById('accountPassword').focus();
			}, 10);
		} 
	}
	
	if (Password == "" && Password2 == "") {
		$('#pwCheckMsg').html('')
	}
	
}

// 성함 정규식 검사
function nameCheck() {
	
	let userName = $('#userName').val();
	const regexName = /[^ㅏ-ㅣㄱ-ㅎa-zA-z]{3}/g;
	
	console.log(userName.search(regexName));
	
	if (userName.search(regexName) != 0) {
		window.alert('성함은 한글 6자 이내로 작성 해야합니다.')
		setTimeout(function() {
			document.getElementById('userName').focus();
		}, 10);
	} else if (userName.length > 6) {
		window.alert('성함은 한글 6자 이내로 작성 해야합니다.');
		setTimeout(function() {
			document.getElementById('userName').focus();
		}, 10);
	} else if (userName.length == 1) {
		window.alert('성함은 한글 2자 이상 6자 이하로 작성해주세요.')
		setTimeout(function() {
			document.getElementById('userName').focus();
		}, 10);
	}
}

// 주민등록번호 검사 (Ajax + js)
function regCheck() {
	
	// 유효성 검사
	var registerNumber = $('#registerNumber').val().trim();
	var check = '234567892345';
	const regexRegister = /^\d{2}[0-1]\d{1}[0-3]\d{1}[1-4]\d{6}$/g;
	
	// console.log(registerNumber.search(regexRegister));
	
	let sum = 0;
	for (let i = 0; i < 13; i++) {
		sum += registerNumber.charAt(i) * check.charAt(i)
	}
	var form = (11 - (sum % 11)) % 10;
	
	//	console.log(registerNumber.substring(0, 2));
	
	var yearDate = parseInt(registerNumber.substring(0, 2));
	var monthDate = parseInt(registerNumber.substring(2, 4));
	var dayDate = parseInt(registerNumber.substring(4, 6));
	var year = yearDate >= 0 && yearDate <= 23 ? year = yearDate + 2000 : year = yearDate + 1900 
	// console.log(year);
	var isLeapYear = ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0); // 윤년 평년 판별식
	// console.log(isLeapYear);
	
	// 윤년평년
	// 유효한 주민등록번호여도 월, 일 안맞으면 false
	
	// 중복체크 검사
	$.ajax({
		url: "regCheck",
		type: "POST",
		data: $('#registerNumber').val().trim(),
		dataType: "json",
		contentType: "application/json; charset=utf-8",
		success: function(regResult) {
			
			if (registerNumber.search(regexRegister) != 0) {
				window.alert('올바르지 않은 주민등록번호입니다.')
				setTimeout(function() {
					document.getElementById('registerNumber').focus();
				}, 10);
				return false;
			} else if (isLeapYear && monthDate == 2) {
				if (dayDate >= 30) {
					window.alert('윤년의 경우 날은 30일을 넘어갈 수 없습니다.');
					setTimeout(function() {
						document.getElementById('registerNumber').focus();
					}, 10);
					return false;
				}
			} else if (monthDate > 12) {
				window.alert('주민등록번호상 월은 12월을 넘어갈 수 없습니다.')
				setTimeout(function() {
					document.getElementById('registerNumber').focus();
				}, 10);
				return false;
			} else if (dayDate > 31) {
				window.alert('주민등록번호상 일은 31일을 넘어갈 수 없습니다.')
				setTimeout(function() {
					document.getElementById('registerNumber').focus();
				}, 10);
				return false;
			} else if (registerNumber.substring(6) >= 5000000) {
				window.alert('해당 주민번호는 아직 사용 불가합니다.')
				setTimeout(function() {
					document.getElementById('registerNumber').focus();
				}, 10);
				return false;
			} else if (form != registerNumber.substring(12, 13)) {
				window.alert('유효하지않은 주민등록번호 입니다.')
				setTimeout(function() {
					document.getElementById('registerNumber').focus();
				}, 10);
				return false;
			} else if ($('#registerNumber').val().trim() != null && regResult == 0) { 
				window.alert('사용가능한 주민등록번호입니다.');
				document.getElementById('regChkResult').value = true;
			} else {
				window.alert('이미 등록된 주민등록번호입니다.');
				document.getElementById('regChkResult').value = false;
				return false;
			}
		},
		error: function() {
			window.alert('주민등록번호를 다시 확인해주세요.');
			document.getElementById('regChkResult').value = false;
			return false;
		}
	});
}

// 휴대전화 번호 정규식 검사
function mobileCheck() {
	
	let mobileNumber = $('#mobileNumber').val();
	const regexMobile = /010[0-9]{3,4}[0-9]{4}/g;
	
	console.log(mobileNumber.search(regexMobile));
	
	if (mobileNumber.search(regexMobile) != 0) {
		window.alert('올바르지 않은 휴대전화번호 형식입니다.')
		setTimeout(function() {
			document.getElementById('mobileNumber').focus();
		}, 10);
	} else if (mobileNumber.length > 11) {
		window.alert('휴대전화번호는 11자리 입니다.')
		setTimeout(function() {
			document.getElementById('mobileNumber').focus();
		}, 10);
	} 
}	
