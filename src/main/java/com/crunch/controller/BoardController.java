package com.crunch.controller;

import com.crunch.domain.*;
import com.crunch.service.BoardCommentService;
import com.crunch.service.BoardService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Controller
@AllArgsConstructor
@Slf4j
public class BoardController {

    private BoardService service;
    private BoardCommentService commentService;
    private BoardList boardList;
    private BoardCommentList boardCommentList;

    // 게시글 목록 불러오기
    @GetMapping(value = "/board")
    public String board(Model model,
                        @RequestParam(value = "/currentPage", required = false, defaultValue = "1") int currentPage) {

        log.info("board() 실행");

        // 페이지 당 표시할 글 개수, 전체 글 개수 저장
        int pageSize = 10;
        int totalCount = service.selectCount();

        // 한 페이지 분량의 글과 페이징 작업에 사용할 변수 초기화
        List<BoardDTO> notice = service.selectNotice();
        boardList.initBoardList(pageSize, totalCount, currentPage);

        // 한 페이지 분량의 글 목록을 얻어온다.
        HashMap<String, Integer> hashMap = new HashMap<>();
        hashMap.put("startNo", boardList.getStartNo());
        hashMap.put("endNo", boardList.getEndNo());
        boardList.setList(service.selectList(hashMap));

        for (BoardDTO boardDTO : notice) {
            boardDTO.setCommentCount(commentService.commentCount(boardDTO.getPostID()));
        }
        for (BoardDTO boardDTO : boardList.getList()) {
            boardDTO.setCommentCount(commentService.commentCount(boardDTO.getPostID()));
        }

        model.addAttribute("notice", notice);
        model.addAttribute("boardList", boardList);

        return "board/board";
    }

    // 게시글 조회 수 증가
    @GetMapping(value = "/boardHit")
    public String boardHit(Model model,
                           @RequestParam("postID") int postID,
                           @RequestParam("currentPage") int currentPage) {

        log.info("boardHit() 실행");

        service.hit(postID);

        model.addAttribute("postID", postID);
        model.addAttribute("currentPage", currentPage);

        return "redirect:boardView";
    }

    // 게시글 조회
    @GetMapping(value = "/boardView")
    public String boardView(Model model,
                            @RequestParam("postID") int postID,
                            @RequestParam("currentPage") int currenPage) {

        log.info("boardView() 실행");

        BoardDTO boardDTO = service.selectByPostID(postID);
        boardDTO.setCommentCount(commentService.commentCount(postID));
        boardCommentList.setList(commentService.selectCommentList(postID));

        model.addAttribute("boardDTO", boardDTO);
        model.addAttribute("currentPage", currenPage);
        model.addAttribute("enter", "\r\n");
        model.addAttribute("boardCommentList", boardCommentList);

        return "board/boardView";
    }

    // 게시글 쓰기 페이지 진입
    @GetMapping(value = "/boardInsert")
    public String boardInsert() {

        log.info("boardInsert() 실행");

        return "board/boardInsert";
    }

    // 신규 게시글 작성
    @PostMapping(value = "/boardInsertOK")
    public String boardInsertOK(BoardDTO boardDTO, RedirectAttributes rttr) {

        log.info("boardInsertOK() 실행 → boardDTO: {}", boardDTO);

        if (boardDTO.getAttachList() != null) {
            boardDTO.getAttachList().forEach(attachDTO -> log.info("{}", attachDTO));
        }

        log.info("===================================================================================================");

        service.insert(boardDTO);
        rttr.addFlashAttribute("result", boardDTO.getPostID());

        return "redirect:board";
    }

    // 파일 업로드 AJAX
    @PostMapping(value = "//uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {

        log.info("uploadAjaxPost() 실행 → uploadFile: {}", (Object[]) uploadFile);

        List<AttachFileDTO> attachList = new ArrayList<>();
        String uploadPath = "C:\\Users\\tjoeun-jr-906-11\\Downloads";

        log.info("upload path: {}", uploadPath);

        for (MultipartFile multipartFile : uploadFile) {

            log.info("-----------------------------------------------------------------------------------------------");
            log.info("Upload File Name: {}", multipartFile.getOriginalFilename());
            log.info("Upload File Size: {}", multipartFile.getSize());

            AttachFileDTO attachDTO = new AttachFileDTO();

            String uploadFileName = multipartFile.getOriginalFilename();

            // IE has file path
            uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("/") + 1);
            log.info("only file name: {}", uploadFileName);

            UUID uuid = UUID.randomUUID();

            uploadFileName = uuid + "_" + uploadFileName;

            try {
                File saveFile = new File(uploadPath, uploadFileName);
                multipartFile.transferTo(saveFile);

                attachDTO.setFileName(multipartFile.getOriginalFilename());
                attachDTO.setUuid(uuid.toString());
                attachDTO.setUploadPath(uploadPath);

                // 파일 이미지 타입 체크
                if (checkImageType(saveFile)) {

                    attachDTO.setImage(true);

                    FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
                    Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);

                    thumbnail.close();
                }

                // 리스트에 추가
                attachList.add(attachDTO);

            } catch (Exception e) {
                log.error(e.getMessage());
            }
        }   // end for

        return new ResponseEntity<>(attachList, HttpStatus.OK);
    }

    // 이미지 여부 확인
    private boolean checkImageType(File file) {

        log.info("checkImageType() 실행 → file: {}", file);

        try {
            String contentType = Files.probeContentType(file.toPath());

            return contentType.startsWith("image");

        } catch (IOException e) {
            e.printStackTrace();
        }

        return false;
    }

    // 섬네일 전송
    @GetMapping(value = "/display")
    @ResponseBody
    public ResponseEntity<byte[]> getFile(String fileName) {

        log.info("getFile() 실행 → fileName: {}", fileName);

        File file = new File(fileName);
        log.info("file: {}", file);

        ResponseEntity<byte[]> result = null;

        try {
            HttpHeaders header = new HttpHeaders();

            header.add("Content-Type", Files.probeContentType(file.toPath()));
            result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    // 업로드 파일 삭제
    @PostMapping(value = "/deleteFile")
    @ResponseBody
    public ResponseEntity<String> deleteFile(String fileName, String type) {

        log.info("deleteFile() 실행 → fileName:{}, type: {}", fileName, type);

        File file;

//        try {
            file = new File(URLDecoder.decode(fileName, StandardCharsets.UTF_8));

            file.delete();
            log.info("업로드 파일 삭제");

            if (type.equals("image")) {
                String largeFileName = file.getAbsolutePath().replace("s_", "");
                log.info("largeFileName: {}", largeFileName);
                file = new File(largeFileName);

                file.delete();
                log.info("업로드 이미지 원본 삭제");
            }
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
//        }

        return new ResponseEntity<>("deleted", HttpStatus.OK);
    }

    // 첨부파일 다운로드
    @GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
    @ResponseBody
    public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName) {

        log.info("downloadFile() 실행 → fileName: {}", fileName);

        FileSystemResource resource = new FileSystemResource(fileName);
        log.info("resource: {}", resource);
        if (!resource.exists()) {
            log.error("{} 파일이 존재하지 않습니다.", resource);
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        String resourceName = resource.getFilename();
        // UUID 제거
        String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);

        HttpHeaders headers = new HttpHeaders();
        String downloadName = null;

        if (userAgent.contains("Trident")) {
            log.info("IE browser");
            downloadName = URLEncoder.encode(resourceOriginalName, StandardCharsets.UTF_8).replaceAll("/+", " ");
        } else if (userAgent.contains("Edge")) {
            log.info("Edge Browser");
            downloadName = URLEncoder.encode(resourceOriginalName, StandardCharsets.UTF_8);
        } else {
            log.info("Chrome browser");
            downloadName = new String(resourceOriginalName.getBytes(StandardCharsets.UTF_8), StandardCharsets.ISO_8859_1);
        }
        log.info("downloadName: {}", downloadName);
        headers.add("Content-Disposition", "attachment; filename=" + downloadName);
        return new ResponseEntity<>(resource, headers, HttpStatus.OK);
    }

    // 게시글 수정 페이지 호출
    @GetMapping(value = "/boardUpdate")
    public String boardUpdate(Model model,
                              @RequestParam("postID") int postID,
                              @RequestParam("currentPage") int currentPage) {

        log.info("boardUpdate() 실행");

        BoardDTO boardDTO = service.selectByPostID(postID);

        model.addAttribute("boardDTO", boardDTO);
        model.addAttribute("currentPage", currentPage);

        return "board/boardUpdate";
    }

    // 게시글 수정
    @PostMapping(value = "/boardUpdateOK")
    public String boardUpdateOK(Model model, BoardDTO boardDTO,
                                @RequestParam("currentPage") int currentPage) {

        log.info("boardUpdateOK() 실행");

        service.update(boardDTO);

        model.addAttribute("postID", boardDTO.getPostID());
        model.addAttribute("currentPage", currentPage);

        return "redirect:boardView";
    }

    // 게시글 삭제
    @GetMapping(value = "/boardDelete")
    public String boardDelete(Model model,
                              @RequestParam("postID") int postID,
                              @RequestParam("currentPage") int currentPage) {

        log.info("boardDelete() 실행");

        service.delete(postID);

        model.addAttribute("currentPage", currentPage);

        return "redirect:board";
    }

    // 신규 덧글 작성 및 수정
    @RequestMapping(value = "/boardCommentOK")
    public String boardCommentOK(Model model,
                                 BoardCommentDTO boardCommentDTO,
                                 @RequestParam("mode") String mode,
                                 @RequestParam("currentPage") int currentPage) {

        log.info("boardCommentOK() 실행");

        switch (mode) {
            case "insert":
                commentService.commentInsert(boardCommentDTO);
                break;
            case "update":
                commentService.commentUpdate(boardCommentDTO);
                break;
            default:
                break;
        }

        model.addAttribute("postID", boardCommentDTO.getPostID());
        model.addAttribute("currentPage", currentPage);

        return "redirect:boardView";
    }

    // 댓글 삭제
    @GetMapping(value = "/boardCommentDelete")
    public String boardCommentDelete(Model model,
                                     @RequestParam("commentID") int commentID,
                                     @RequestParam("postID") int postID,
                                     @RequestParam("currentPage") int currentPage) {

        log.info("boardCommentDelete() 실행");

        commentService.commentDelete(commentID);

        model.addAttribute("postID", postID);
        model.addAttribute("currentPage", currentPage);

        return "redirect:boardView";
    }

}
