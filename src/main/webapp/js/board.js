'use strict'

function delete_check(url) {
    let answer = confirm('정말로 삭제하시겠습니까?')
    if (answer == true) {
        location = url
    }
}