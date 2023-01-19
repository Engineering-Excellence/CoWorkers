'use strict'

function deleteCheck(url) {

    let answer = confirm('정말로 삭제하시겠습니까?')

    if (answer === true) {
        alert('삭제 완료')
        location = url
    }
}

// 댓글 작성/수정 선택
function setting(commentID, mode, title, name, content) {

    let frm = document.commentForm;

    frm.commentID.value = commentID
    frm.mode.value = mode
    frm.commentBtn.value = title
    frm.userName.value = name

    while (content.indexOf('<br/>') != -1) {
        content = content.replace('<br/>', '\r\n')
    }
    frm.content.value = content
}

// 댓글 작성/수정 선택(REST Ajax)
function action() {

    let frm = document.commentForm
    let mode = frm.mode.value
    let commentID = frm.commentID.value
    console.log(mode)
    console.log(commentID)

    switch (mode) {

        case 'insert':
            location = 'replies/new'
            break
        case 'update':
            location = 'replies/' + commentID
            break
        default:
            location = '#'
            break
    }
}