function memoCheck(obj) {

    accountList = Array.from(document.getElementsByName('accountList'))[0].value.replace('[','').replace(']','').replace(/,/g, '').split(' ');

    // for (let i = 0; i < accountList.length; i++) {
    //     console.log(accountList[i]);
    // }

    if (!obj.subject.value || obj.subject.value.trim().length === 0) {
        window.alert('제목이 입력되지 않았습니다.')
        obj.subject.focus();
        return false;
    }
    if (!obj.accountID.value || obj.accountID.value.trim().length === 0) {
        window.alert('받는이가 입력되지 않았습니다.')
        obj.accountID.focus();
        return false;
    }

    if (!obj.content.value || obj.content.value.trim().length === 0) {
        window.alert('내용이 입력되지 않았습니다.')
        obj.content.focus();
        return false;
    }

    // if (accountList.indexOf(obj.accountID.value) === -1) {
    if (!accountList.includes(obj.accountID.value)) {
        window.alert('받는이가 존재하지 않습니다.')
        obj.accountID.focus();
        return false;
    }

}

function boardCheck(obj) {
    if (!obj.subject.value || obj.subject.value.trim().length === 0) {
        window.alert('제목이 입력되지 않았습니다.')
        obj.subject.focus();
        return false;
    }
    if (!obj.content.value || obj.content.value.trim().length === 0) {
        window.alert('내용이 입력되지 않았습니다.')
        obj.content.focus();
        return false;
    }
}