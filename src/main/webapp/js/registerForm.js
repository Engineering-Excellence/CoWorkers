function idCheck() {
	
	var accountID = $("#accountID").val();
	var duplicateID = $("#btnId").val();
	
	
}
 
function pwCheck() {
	
	var accountPassword = $("#accountPassword").val();
	var accountPassword2 = $("#accountPassword2").val();
	
	if (accountPassword.length < 6 || accountPassword.length > 20) {
		window.alert('비밀번호는 6글자 이상, 20글자 이하만 이용 가능합니다.')
		accountPassword = accountPassword2 = "";
	}
	
	if (accountPassword != "" && accountPassword2 != "") {
		if (accountPassword == accountPassword2) {
			$("#accountPassword").html('일치')
			$("#accountPassword").attr('color', 'green')
		} else {
			$("#accountPassword2").html('불일치')
			$("#accountPassword2").attr('color', 'red')
		}
	}
	
}
 