'use strict'
// 'use strict'

$(() => {

    // 첨부파일 보기
    (() => {
        let postID = '<c:out value="${boardDTO.postID}"/>'

        $.getJSON("/boardSelectAttachList", {postID: postID}, arr => {

            console.log(arr)

            let str = ''

            $(arr).each((i, attach) => {

                // 이미지
                if (attach.fileType) {
                    let fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName)
                    console.log(fileCallPath)
                    str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid
                        + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "'><div>"
                        + "<span>" + attach.fileName + "</span><br/>"
                        + "<img src='/display?fileName=" + fileCallPath + "' />" + "</div></li>"
                } else {

                    str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid
                        + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "'><div>"
                        + "<span>" + attach.fileName + "</span><br/>"
                        + "<img src='images/doker.ico'>"
                        + "</div></li>"
                }
            })

            $('.uploadResult ul').html(str)
        })  // end getJSON
    })()

    // 첨부 이미지 원본 보기 & 파일 다운로드
    $('.uploadResult').on('click', 'li', function () {

        console.log('이미지 보기')

        let liObj = $(this)
        // console.log(this)

        let path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid") + "_" + liObj.data("filename"))

        if (liObj.data("type")) {
            showImage(path.replace(new RegExp(/\\/g), "/"))
        } else {
            // 다운로드
            self.location = "/download?fileName=" + path
        }
    })

    // 이미지 원본 보기
    function showImage(fileCallPath) {

        // alert(fileCallPath)

        $('.bigPictureWrapper').css('display', 'flex').show()

        $('.bigPicture')
            .html("<img src='/display?fileName=" + fileCallPath + "'>")
            .animate({width: '100%', height: '100%'}, 1000)
    }

    // 원본 이미지 닫기
    $(".bigPictureWrapper").on("click", () => {
        $(".bigPicture").animate({width: '0%', height: '0%'}, 1000)
        setTimeout(() => {
            $(".bigPictureWrapper").hide()
        }, 1000)
    })
})