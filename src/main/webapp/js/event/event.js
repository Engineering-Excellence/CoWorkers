// event.jsp 페이지에서 필요한 처리 


//selectBox의 option의 value값 가져오기
function selectBoxChgColor(){
	//alert('selectBoxChgColor() 실행 확인')
	$('#projectColor').val();
	$('select[name=projectColor] option:selected').val();	//string 타입
	console.log($('select[name=projectColor] option:selected').val());
}

//타입확인 및 데이터 넘어가는 부분 확인.
function starDateChk(){
	console.log('startDateChk() 실행 확인');
	console.log($('#startDate').val(), typeof($('#startDate').val()) + ' type');
	console.log($('#endDate').val(), typeof($('#endDate').val()) + ' type');
	console.log($('#isAllDay').val(), typeof($('#endDate').val()) + ' type');
}


