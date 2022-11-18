// 김태형 (Terry) - registerForm 기능용 js 파일

onload = function () {
	$('#accountID').focus();
}

// 폼 중 값이 하나라도 입력이 안되면 false 리턴	
function joinCheck(obj) {
	
	if (!obj.accountID.value || obj.accountID.value.trim().length == 0) {
		window.alert('아이디가 입력되지 않았습니다.')
		obj.accountID.focus();
		return false;
	}
	
	if (!obj.accountPassword.value || obj.accountPassword.value.trim().length == 0) {
		window.alert('패스워드가 입력되지 않았습니다.')
		obj.accountPassword.focus();
		return false;
	}
	
	if (!obj.userName.value || obj.userName.value.trim().length == 0) {
		window.alert('이름이 입력되지 않았습니다.')
		obj.userName.focus();
		return false;
	}
	
	if (!obj.registerNumber.value || obj.registerNumber.value.trim().length == 0) {
		window.alert('주민등록번호가 입력되지 않았습니다.')
		obj.registerNumber.focus();
		return false;
	}
	
	if (!obj.mobileNumber.value || obj.mobileNumber.value.trim().length == 0) {
		window.alert('전화번호가 입력되지 않았습니다.')
		obj.mobileNumber.focus();
		return false;
	}
	
	if (!obj.email.value || obj.email.value.trim().length == 0) {
		window.alert('이메일이 입력되지 않았습니다.')
		obj.email.focus();
		return false;
	}

return true;
}

// id 중복 검사
function idDuplicateCheck(obj) {
	let ID = obj.accountID.value;
	let userList = new userInfoSelectList();
	console.log('userList' + userList);
	
	if (userList.accountID.value == ID) {
		window.alert('중복된 아이디 입니다.')
		document.getElementById('accountID').value = '';
		$('#accountID').focus();
		return false;
	} else if (ID.length == 0 || ID.length > 20) {
		window.alert('아이디는 6자 이상 20자 이내로 작성해야 합니다.')
		document.getElementById('accountID').value = '';
		$('#idCheckMsg').html('아이디는 영문자, 숫자 포함 20자 이내로 작성하여야 합니다.')
		$('#idCheckMsg').css('color', 'red')
		return false;
	} else if(ID.length >=1 && ID.length < 6) {	
		alert('아이디는 6자 이상 20자 이내로 작성해야 합니다.')
		document.getElementById('accountID').value = '';
		return false;
	} else {
		window.alert('사용가능한 아이디 입니다.')
	}
return true;
}	

// id 길이 검사
function idCheck() {
	
	let ID = $('#accountID').val().trim();

	if (ID.length == 0 || ID.length > 20) {
		window.alert('아이디는 6자 이상 20자 이내로 작성해야 합니다.')
		document.getElementById('accountID').value = '';
		$('#idCheckMsg').html('아이디는 영문자, 숫자 포함 20자 이내로 작성하여야 합니다.')
		$('#idCheckMsg').css('color', 'red')
	} else if(ID.length >=1 && ID.length < 6) {
		alert('아이디는 6자 이상 20자 이내로 작성해야 합니다.')
		document.getElementById('accountID').value = '';
	} else {
		$('#idCheckMsg').html('사용 가능한 아이디 입니다.')
		$('#idCheckMsg').css('color', 'green')
	}
}
 
// PW 길이 검사 
function pwCheck() {
	
	let Password = $('#accountPassword').val().trim();
	let Password2 = $('#accountPassword2').val().trim();
	
	if (Password != "" && Password2 != "") {
		if (Password == Password2) {
			$('#pwCheckMsg').html('비밀번호가 일치합니다.')
			$('#pwCheckMsg').css('color', 'green')
		} else if (Password.length < 6) {
			window.alert('비밀번호는 6자 이상 입력해야합니다.');
			document.getElementById('accountPassword').value = '';
			document.getElementById('accountPassword2').value = '';
			$('#accountPassword').focus();
		} else if (Password.length > 20) {
			window.alert('비밀번호는 20자 이하로 입력해야합니다.');
			document.getElementById('accountPassword').value = '';
			document.getElementById('accountPassword2').value = '';
			$('#accountPassword').focus();
		} else {
			$('#pwCheckMsg').html('비밀번호가 일치하지 않습니다.')	
			$('#pwCheckMsg').css('color', 'red')
		}
	}
	if (Password == "" && Password2 == "") {
		$('#pwCheckMsg').html('')
	}
}

// 주민등록번호 유효성 검사
function regCheck() {
	
	let registerNumber = document.getElementById('registerNumber').value
	let check = '234567892345';
	
	let sum = 0;
	for (let i = 0; i < 12; i++) {
		sum += registerNumber.charAt(i) * check.charAt(i)
	}
	
	let form = (11 - (sum % 11)) % 10;
	if (form == registerNumber.substring(12)) {
		window.alert('유효한 주민등록번호 입니다.')
	} else {
		window.alert('유효하지않은 주민등록번호 입니다.')
	}
}	

// 이름 길이 검사	
function nameCheck() {
	
	let userName = $('#userName').val();
	
	if (userName.length > 6) {
		window.alert('성함은 한글 6자 이내로 작성 해야합니다.');
		document.getElementById('userName').value = "";
	}
}

// 휴대폰번호 길이 검사
function mobileCheck() {
	
	let mobileNumber = $('#mobileNumber').val();
	
	if (mobileNumber.length > 11) {
		window.alert('휴대전화번호는 11자리 입니다.')
		document.getElementById('mobileNumber').value = "";
	}
}	
	

	
