// 김태형 (Terry) - registerForm 기능용 js 파일

onload = function () {
	$('#accountID').focus();
}

function idCheck() {
	
	let ID = $('#accountID').val().trim();
	
	if (ID.length == 0 || ID.length > 20) {
		alert('아이디는 6자 이상 20자 이내로 작성해야 합니다.')
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
 
function pwCheck() {
	
	let Password = $('#accountPassword').val().trim();
	let Password2 = $('#accountPassword2').val().trim();
	
	if (Password != "" && Password2 != "") {
		if (Password == Password2) {
			$('#pwCheckMsg').html('비밀번호가 일치합니다.')
			$('#pwCheckMsg').css('color', 'green')
		} else if (Password.length < 6 || Password.length > 18) {
			window.alert('비밀번호는 6자 이상, 18자 이하만 이용 가능합니다.');
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
	
function nameCheck() {
	
	let userName = $('#userName').val();
	
	if (userName.length > 6) {
		window.alert('성함은 한글 6자 이내로 작성 해야합니다.');
		document.getElementById('userName').value = "";
	}
}

function mobileCheck() {
	
	let mobileNumber = $('#mobileNumber').val();
	
	if (mobileNumber.length > 10) {
		window.alert('휴대전화번호는 11자리 입니다.')
		document.getElementById('mobileNumber').value = "";
	}
}
	
function emailCheck() {
	
}

	
