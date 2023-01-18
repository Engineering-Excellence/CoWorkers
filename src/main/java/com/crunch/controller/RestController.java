package com.crunch.controller;

import com.crunch.domain.BoardCommentDTO;
import com.crunch.service.BoardCommentService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RequestMapping(value = "/replies/")
@org.springframework.web.bind.annotation.RestController
@AllArgsConstructor
@Slf4j
public class RestController {

    private BoardCommentService commentService;

    // consumes & produces: JSON 데이터만 처리하고 문자열 반환, @RequestBody: JSON을 DTO로 변환
    // 신규 댓글 작성
    @PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> create(@RequestBody BoardCommentDTO boardCommentDTO) {

        log.info("create() → boardCommentDTO: {}", boardCommentDTO);

        boolean insertSuccess = commentService.commentInsert(boardCommentDTO);

        log.info("Comment Insert Success: {}", insertSuccess);

        return insertSuccess ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    // 댓글 수정
    @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value = "/{commentID}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> modify(@RequestBody BoardCommentDTO boardCommentDTO,
                                         @PathVariable(value = "commentID") int commentID) {

        boardCommentDTO.setCommentID(commentID);
        log.info("commentID: {}", commentID);
        log.info("modify() → boardCommentDTO: {}", boardCommentDTO);

        return commentService.commentUpdate(boardCommentDTO)
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
