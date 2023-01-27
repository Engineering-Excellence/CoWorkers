'use strict'

// 이미지 원본 보기
function showImage(fileCallPath) {
    // alert(fileCallPath)
    console.log(fileCallPath)

    $(".bigPictureWrapper").css("display", "flex").show()

    $(".bigPicture")
        .html("<img src='/display?fileName=" + encodeURI(fileCallPath) + "'>")
        .animate({width: '100%', height: '100%'}, 1000)
}

// 파일 업로드 AJAX
$(() => {

    // let formObj = $("form[role='form']")
    let formObj = $("#formObj")

    $("input[type='submit']").on('click', e => {

        // 기본 이벤트 제거
        // e.preventDefault()
        console.log('submit clicked')

        let attachList = ""

        $(".uploadResult ul li").each((i, obj) => {
            let jobj = $(obj)
            console.dir(jobj)

            attachList += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data("filename") + "'>"
            attachList += "<input type='hidden' name='attachList[" + i + "].uuid' value = '" + jobj.data("uuid") + "'>"
            attachList += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>"
            attachList += "<input type='hidden' name='attachList[" + i + "].fileType' value='" + jobj.data("type") + "'>"
        })

        console.log(attachList)
        formObj.append('attachList', attachList)
    })

    // 업로드 파일 종류 및 크기 제한
    let regex = new RegExp('(.*?)\.(exe|sh|zip|alz)$')
    let maxSize = 5242880   // 5MB

    function checkExtension(fileName, fileSize) {
        if (fileSize > maxSize) {
            alert('파일 사이즈 초과')
            return false
        }
        if (regex.test(fileName)) {
            alert('해당 종류의 파일은 업로드 할 수 없습니다.')
            return false
        }
        return true
    }

    // 업로드 파일 보기
    let uploadResult = $('.uploadResult ul')

    function showUploadedFile(uploadResultArr) {

        let str = ''

        $(uploadResultArr).each((i, obj) => {

            if (!obj.image) {

                let fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName)
                let fileLink = fileCallPath.replace(new RegExp(/\\/g), "/")
                str += "<li><div><a href='/download?fileName=" + fileLink + "'>" +
                    "<img src='/resources/images/doker.ico'>" + obj.fileName + "</a>" +
                    "<span data-file=\'" + fileCallPath + "\' data-type='file'> × </span></div></li>"
            } else {

                let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName)
                let originPath = obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName
                originPath = originPath.replace(new RegExp(/\\/g), "/")
                str += "<li><a href=\"javascript:showImage(\'" + originPath + "\')\">" +
                    "<img src='/display?fileName=" + fileCallPath + "'></a>" +
                    "<span data-file=\'" + fileCallPath + "\' data-type='image'> × </span></li>"
            }
        })

        uploadResult.append(str)
    }

    // 원본 이미지 닫기
    $(".bigPictureWrapper").on("click", () => {
        $(".bigPicture").animate({width: '0%', height: '0%'}, 1000)
        setTimeout(() => {
            $(".bigPictureWrapper").hide()
        }, 1000)
    })

    // 업로드 파일 삭제
    $(".uploadResult").on("click", "span", function () {    // 화살표 함수 내부에서 this 사용 불가 !!
        let targetFile = $(this).data("file")
        let type = $(this).data("type")
        console.log('targetFile:', targetFile)
        console.log('type:', type)

        $.ajax({
            url: '/deleteFile',
            type: 'POST',
            data: {fileName: targetFile, type: type},
            dataType: 'text',
            success: result => {
                alert(result)
            }
        })  // $.ajax
    })

    // 업로드 파일 리스트 삭제
    $(".uploadResult").on("click", "button", function () {  // 화살표 함수 내부에서 this 사용 불가 !!
        console.log('DELETE FILES')

        let targetFile = $(this).data("file")
        let type = $(this).data("type")
        let targetLi = $(this).closest("li")

        $.ajax({
            url: '/deleteFile',
            data: {fileName: targetFile, type: type},
            dataType: 'text',
            type: 'POST',
            success: result => {
                alert(result)
                targetLi.remove()
            }
        })  // $.ajax
    })

    // 파일 업로드 버튼
    $("input[type='file']").change(() => {
        let formData = new FormData()
        let inputFile = $("input[name='uploadFile']")
        let files = inputFile[0].files
        console.log(files)

        for (const element of files) {
            if (!checkExtension(element.name, element.size)) {
                return false
            }
            formData.append('uploadFile', element)
        }

        $.ajax({
            url: '/uploadAjaxAction',
            processData: false,
            contentType: false,
            data: formData,
            type: 'POST',
            dataType: 'json',
            success: result => {
                console.log(result)
                alert('업로드 완료')
                // showUploadedFile(result)    // 업로드 결과 처리 함수
                showUploadResult(result)
            }
        })  // $.ajax
    })

    // 업로드 파일 리스트 보기
    function showUploadResult(uploadResultArr) {

        if (!uploadResultArr || uploadResultArr.length === 0) {
            return;
        }

        let uploadUL = $(".uploadResult ul")
        let str = ''

        $(uploadResultArr).each((i, obj) => {

            // image type
            if (obj.image) {
                let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName)
                str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid +
                    "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'><div>" +
                    "<a href=\"javascript:showImage(\'" + encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName) + "\')\">" +
                    "<span>" + obj.fileName + "</span>" +
                    "<button type='button' data-file=\'" + fileCallPath + "\' data-type='image' " +
                    "class='btn btn-sm btn-warning btn-circle'>" +
                    "<i class='fa fa-times'>×</i></button><br/>" +
                    "<img src='/display?fileName=" + fileCallPath + "'>" +
                    "</a></div></li>"
            } else {
                let fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName)
                let fileLink = fileCallPath.replace(new RegExp(/\\/g), "/")
                str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid +
                    "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'><div>" +
                    "<span>" + obj.fileName + "</span>" +
                    "<button type='button' data-file=\'" + fileLink + "\' data-type='file' " +
                    "class='btn btn-sm btn-warning btn-circle'>" +
                    "<i class='fa fa-times'>×</i></button><br/>" +
                    "<img src='/resources/images/doker.ico'>" +
                    "</div></li>"
            }
        })
        uploadUL.append(str)
    }
})