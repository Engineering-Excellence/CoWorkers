// input date 기본값을 오늘 날짜로 설정
var today = new Date();   
let tyear = today.getFullYear(); // 년도
let tmonth = today.getMonth() + 1;  // 월
let tdate = today.getDate();  // 날짜
let tday = today.getDay();  // 요일
let now = tyear + "-" + (tmonth<10?"0"+tmonth:tmonth) + "-" + (tdate<10?"0"+tdate:tdate);
$('#startDate').val(now);
$('#endDate').val(now);

// 입력/수정/삭제 후 돌아갈 뷰 처리를 위한 변수 생성
var urlParam = new URL(location.href).searchParams;
var viewParam = urlParam.get('view')
if(viewParam == null){
	viewParam = 'dayGridMonth';
}

// DOMContentLoaded Event DOM Tree가 모두 로딩된 이후에 발생하는 이벤트
$( function() {
	
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
//		customButtons:{
//		},
		initialView: viewParam,
		nowIndicator: true,
		headerToolbar: {
			left: 'prev, next, today',
			center: 'title',
			right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
		},
		views:{
			dayGridMonth: {
				titleFormat: {year: 'numeric', month: '2-digit'},
//				fixedWeekCount: false
			},
			dayGridWeek:{
				titleFormat: {month: '2-digit', day: '2-digit'}
			},
			timeGridDay: {
				titleFormat: {year: 'numeric', month: '2-digit', day: '2-digit'},
				slotEventOverlap: false
			},
			listMonth: {
				titleFormat: {year: 'numeric', month: '2-digit'},
				listDayFormat: {year: 'numeric', month: '2-digit', day: '2-digit',weekday: 'short'},
				listDaySideFormat: false
			}
		},
		locale: 'ko',
		navLinks: true, // can click day/week names to navigate views
		editable: false,
		selectable: true,
		selectMirror: true,
		select: (arg) => {	// 선택한 범위에 이벤트를 추가하는 함수
			var sDateStr = dateFormat(arg.start).substr(0, 10);
			var eDateStr = dateFormat(arg.end).substr(0, 10);
			var sTimeStr = dateFormat(arg.start).substr(11, 16);
			var eTimeStr = dateFormat(arg.end).substr(11, 16);
			// 모달 팝업 띄우기
			$('#insert').trigger('click');
			$('#view').val(arg.view.type);
			// dayGridMonth view에서 기간을 지정한 경우의 필요한 처리
			if (arg.view.type == 'dayGridMonth'){
				//선택한 기간 입력을 위한 처리 => fullcalendar 의 dayGridMonth 페이지에서 select하는 경우 endDate가 1일 빠르다.
				endStr = dateFormat(new Date(arg.end - 1000*60*60*24)); //string
				startStr = dateFormat(arg.start);
				// 선택한 기간 입력 모달창에 자동 입력
				$('#allDay').val('true');
				$('#startDate').val(startStr.substr(0, 10));
				$('#endDate').val(endStr.substr(0, 10));
				$('#startTime').val('12:00');
				$('#endTime').val('13:00');
				// 필요 처리_allDay => dayGridMonth view에서 insert창을 연 경우 all day 처리를 하기 위함. 
				$('#allDay').prop( "checked", true);
				$('#startTime').val('');
				$('#endTime').val('');
				$('#startTime').attr("disabled", true);
				$('#endTime').attr("disabled", true);
			} else{
				// 선택한 기간 입력해놓기
				$('#allDay').val('false');
				$('#startDate').val(sDateStr);
				$('#endDate').val(eDateStr);
				$('#startTime').val(sTimeStr);
				$('#endTime').val(eTimeStr);
				// 필요 처리_allDay
				$('#allDay').prop("checked", false);
				$('#startTime').attr("disabled", false);
				$('#endTime').attr("disabled", false);
			}
		},
		eventClick: (arg) => { // 클릭한 이벤트의 페이지로 이동하는 함수
			location.href = "eventView?eventID=" + arg.event._def.publicId + "&view=" + arg.view.type;
		},
		dayMaxEvents: true, // allow "more" link when too many events
//		events: getAllEvents()
		eventSources: {	
			// event 목록을 얻어오는 소스
			url: "./event/calendar.json",
			method: "get",
			contentData: "application/json; charset=utf-8",
			dataType: "json",
			error: e => {
				console.log("(Request failed) " + e.status + ': ' + e.statusText);
				alert('페이지를 불러올 수 없습니다.');
			}
		}
	});
	calendar.render();
	calendar.setOption('height', 'auto');
});

// yyyy-MM-ddThh:mm:ss
function dateFormat(date) {
    let month = date.getMonth() + 1;
    let day = date.getDate();
    let hour = date.getHours();
    let minute = date.getMinutes();
    let second = date.getSeconds();

    month = month >= 10 ? month : '0' + month;
    day = day >= 10 ? day : '0' + day;
    hour = hour >= 10 ? hour : '0' + hour;
    minute = minute >= 10 ? minute : '0' + minute;
    second = second >= 10 ? second : '0' + second;

    return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
}

// 일정추가 버튼을 누르는 경우
$('#insert').on("click", function(){
	if($(this).prop("checked", false)){
		$('#allDay').val() =='false';
		$('#startTime').val('12:00');
		$('#endTime').val('13:00');
	} else {
		$('#allDay').val() =='true';
		$('#startTime').val('00:00');
		$('#endTime').val('00:00');
	}
})

//모달을 통한 일정 등록
function insertWithModalEvent(){
	
//	time 처리
	var sdate ;
	var edate ;
	
//	console.log($('#allDay').val())
//	console.log($('#startTime').val())
//	console.log($('#endTime').val())
//	console.log($('#startDate').val())
//	console.log($('#endDate').val())
	
	if($('#allDay').val() == 'true'){
		sdate = $('#startDate').val();
		edate = $('#endDate').val();
	} else{
		sdate = $('#startDate').val() + "T" + $('#startTime').val();
		edate = $('#endDate').val() + "T" + $('#endTime').val();
	}
	
	// post 방식으로 넘길 데이터 만들기
	let data = {
		userName : $('#userName').val(),
		userID : $('#userID').val(),
		subject : $('#subject').val(),
		content : $('#content').val(),
		eventColor : $('#eventColor option:selected').val(),
		startDate : sdate,
		endDate : edate,
		allDay : $('#allDay').val(),
		ip : $('#ip').val(),
		view : $('#view').val()
	};
//	console.log(data);
	
	$.ajax({
		url: './event/insertEvent',
		type: 'post',
		data: JSON.stringify(data),
		contentType: 'application/json; charset=utf-8',
		success : data => {
			console.log('success');
			window.top.location.reload(true);
		},
		error: e => {
			console.log("(Request failed) " + e.status + ': ' + e.statusText);
		}
	})
}


//eventColor의 selectBox에서 선택된 option의 value값 가져오기
function selectBoxChgColor(){
	//alert('selectBoxChgColor() 실행 확인')
	$('#eventColor').val();
	$('select[name=eventColor] option:selected').val();	//string 타입
//	console.log($('select[name=projectColor] option:selected').val());
}

// 종일 checkbox 클릭 시, startTime, endTime disabled 처리
$("#allDay").on("change", function(){
	if($(this).is(":checked")){
		$(this).prop("checked", true);
//		console.log($(this).is(":checked"));
		$('#startTime').attr("disabled", true);
		$('#endTime').attr("disabled", true);
		$('#startTime').val('');
		$('#endTime').val('');
		$('#allDay').val('true');
	}else{
		$(this).prop("checked", false);
		$('#startTime').attr("disabled", false);
		$('#endTime').attr("disabled", false);
		$('#startTime').val('12:00:00');
		$('#endTime').val('13:00:00');
		$('#allDay').val('false');
	}
});

//eventColor의 selectBox에서 선택된 option의 value값 가져오기
function selectBoxChgColor(){
	//alert('selectBoxChgColor() 실행 확인')
	$('#eventColor').val();
	$('select[name=eventColor] option:selected').val();	//string 타입
//	console.log($('select[name=projectColor] option:selected').val());
}

// 종일 checkbox 클릭 시, startTime, endTime disabled 처리
$("#allDay").on("change", function(){
	if($(this).is(":checked")){
		$(this).prop("checked", true);
//		console.log($(this).is(":checked"));
		$('#startTime').attr("disabled", true);
		$('#endTime').attr("disabled", true);
		$('#startTime').val('');
		$('#endTime').val('');
		$('#allDay').val('true');
	}else{
		$(this).prop("checked", false);
		$('#startTime').attr("disabled", false);
		$('#endTime').attr("disabled", false);
		$('#startTime').val('12:00:00');
		$('#endTime').val('13:00:00');
		$('#allDay').val('false');
	}
});


	