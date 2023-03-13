$(function() {
    let priorityRows = $('.bg-danger');
    let lastPriorityList = priorityRows.last();
    priorityRows.not(lastPriorityList).addClass('hidden');
    lastPriorityList.removeClass('hidden');
    // 펼치기 클릭시
    let showAll = $('#showAll');
    showAll.on('click', function() {
        let hiddenPriorityRows = $('.bg-danger.hidden');
        hiddenPriorityRows.removeClass('hidden');
        showAll.addClass('hidden');
        $('#showOne').removeClass('hidden');
    });
    // 접기 클릭시
    let showOne = $('#showOne');
    showOne.on('click', function() {
        priorityRows.addClass('hidden');
        lastPriorityList.removeClass('hidden');
        showOne.addClass('hidden');
        showAll.removeClass('hidden');
    });
});