

function memoDelete(url) {
    let answer = confirm('정말로 삭제하시겠습니까?')
    if (answer === true) {
        alert('삭제 완료')
        location = url
    }
}

function memoMark(url) {
    let answer = confirm('관심 쪽지로 등록하시겠습니까?')
    if (answer === true) {
        alert('등록 완료')
        location = url
    }
}
function memoMarkGG(url) {
    let answer = confirm('관심 쪽지를 해제하시겠습니까?')
    if (answer === true) {
        alert('해제 완료')
        location = url
    }
}
function memoRestore(url) {
    let answer = confirm('복구하시겠습니까?')
    if (answer === true) {
        alert('복구 완료')
        location = url
    }
}

function memoDeleteOK(url) {
    let answer = confirm('완전히 삭제하시겠습니까?')
    if (answer === true) {
        alert('삭제 완료')
        location = url
    }
}