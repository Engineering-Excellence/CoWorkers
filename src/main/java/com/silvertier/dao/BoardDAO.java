package com.silvertier.dao;

import com.silvertier.dto.BoardCommentDTO;
import com.silvertier.dto.BoardDTO;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.HashMap;

// Kyle
public class BoardDAO {

    private static final BoardDAO instance = new BoardDAO();

    public static BoardDAO getInstance() {
        return instance;
    }

    // 전체 글의 개수를 얻어오는 명령을 실행하는 메서드
    public int boardSelectCount(SqlSession mapper) {
        System.out.println("BoardDAO 클래스의 selectCount() 메서드 실행");
        return (int) mapper.selectOne("boardSelectCount");
    }

    // 페이징을 위한 시작, 끝 인덱스가 저장된 HashMap 객체를 넘겨받고 1 페이지 분량의 글 목록을 얻어오는 명령을 실행하는 메서드
    public ArrayList<BoardDTO> boardSelectList(SqlSession mapper, HashMap<String, Integer> hashMap) {
        System.out.println("BoardDAO 클래스의 selectList() 메서드 실행");
        return (ArrayList<BoardDTO>) mapper.selectList("boardSelectList", hashMap);
    }

    // 게시판에 새 글을 저장하는 INSERT SQL 명령을 실행하는 메서드
    public void boardInsert(SqlSession mapper, BoardDTO boardDTO) {
        System.out.println("BoardDAO 클래스의 insert() 메서드 실행");
        mapper.insert("boardInsert", boardDTO);
    }

    // 모든 공지글을 얻어오는 명령을 실행하는 메서드
    public ArrayList<BoardDTO> boardSelectNotice(SqlSession mapper) {
        System.out.println("BoardDAO 클래스의 selectNotice() 메서드 실행");
        return (ArrayList<BoardDTO>) mapper.selectList("boardSelectNotice");
    }

    // 조회수를 증가시키는 UPDATE SQL 명령을 실행하는 메서드
    public void boardHit(SqlSession mapper, int postID) {
        System.out.println("BoardDAO 클래스의 hit() 메서드 실행");
        mapper.update("boardHit", postID);
    }


    // 글 1건을 선택하는 SELECT SQL 명령을 실행하는 메서드
    public BoardDTO boardSelectByPostID(SqlSession mapper, int postID) {
        System.out.println("BoardDAO 클래스의 selectByPostID() 메서드 실행");
        return (BoardDTO) mapper.selectOne("boardSelectByPostID", postID);
    }

    // 글 1건을 삭제(블라인드 처리)하는 UPDATE SQL 명령을 실행하는 메서드
    public void boardDelete(SqlSession mapper, int postID) {
        System.out.println("BoardDAO 클래스의 delete() 메서드 실행");
        mapper.update("boardDelete", postID);
    }

    // 글 1건을 수정하는 UPDATE SQL 명령을 실행하는 메서드
    public void boardUpdate(SqlSession mapper, BoardDTO boardDTO) {
        System.out.println("BoardDAO 클래스의 update() 메서드 실행");
        mapper.update("boardUpdate", boardDTO);
    }

    // 댓글 목록을 얻어오는 SELECT SQL 명령을 실행하는 메서드
    public ArrayList<BoardCommentDTO> boardSelectCommentList(SqlSession mapper, int postID) {
        System.out.println("BoardDAO 클래스의 selectCommentList() 메서드 실행");
        return (ArrayList<BoardCommentDTO>) mapper.selectList("boardSelectCommentList", postID);
    }

    // 새 덧글을 저장하는 INSERT SQL 명령을 실행하는 메서드
    public void boardCommentInsert(SqlSession mapper, BoardCommentDTO commentDTO) {
        System.out.println("BoardDAO 클래스의 commentInsert() 메서드 실행");
        mapper.insert("boardCommentInsert", commentDTO);
    }

    // 덧글을 삭제(블라인드 처리)하는 UPDATE SQL 명령을 실행하는 메서드
    public void boardCommentDelete(SqlSession mapper, int commentID) {
        System.out.println("BoardDAO 클래스의 commentDelete() 메서드 실행");
        mapper.update("boardCommentDelete", commentID);
    }

    // 덧글을 수정하는 UPDATE SQL 명령을 실행하는 메서드
    public void boardCommentUpdate(SqlSession mapper, BoardCommentDTO commentDTO) {
        System.out.println("BoardDAO 클래스의 commentUpdate() 메서드 실행");
        mapper.update("boardCommentUpdate", commentDTO);
    }

    // 댓글 수를 얻어오는 SQL 명령을 실행하는 메서드
    public int boardCommentCount(SqlSession mapper, int postID) {
        System.out.println("BoardDAO 클래스의 commentCount() 메서드 실행");
        return (int) mapper.selectOne("boardCommentCount", postID);
    }
}
