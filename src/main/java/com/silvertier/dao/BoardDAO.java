package com.silvertier.dao;

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
    public int selectCount(SqlSession mapper) {
        System.out.println("BoardDAO 클래스의 selectCount() 메서드 실행");
        return (int) mapper.selectOne("selectCount");
    }

    // 페이징을 위한 시작, 끝 인덱스가 저장된 HashMap 객체를 넘겨받고 1 페이지 분량의 글 목록을 얻어오는 명령을 실행하는 메서드
    public ArrayList<BoardDTO> selectList(SqlSession mapper, HashMap<String, Integer> hashMap) {
        System.out.println("BoardDAO 클래스의 selectList() 메서드 실행");
        return (ArrayList<BoardDTO>) mapper.selectList("selectList", hashMap);
    }

    // 게시판에 새 글을 저장하는 INSERT SQL 명령을 실행하는 메서드
    public void insert(SqlSession mapper, BoardDTO dto) {
        System.out.println("BoardDAO 클래스의 insert() 메서드 실행");
        mapper.insert("insert", dto);
    }

    // 모든 공지글을 얻어오는 명령을 실행하는 메서드
    public ArrayList<BoardDTO> selectNotice(SqlSession mapper) {
        System.out.println("BoardDAO 클래스의 selectNotice() 메서드 실행");
        return (ArrayList<BoardDTO>) mapper.selectList("selectNotice");
    }

    // 조회수를 증가시키는 UPDATE SQL 명령을 실행하는 메서드
    public void hit(SqlSession mapper, int postID) {
        System.out.println("BoardDAO 클래스의 hit() 메서드 실행");
        mapper.update("hit", postID);
    }


    // 글 1건을 선택하는 SELECT SQL 명령을 실행하는 메서드
    public BoardDTO selectByPostID(SqlSession mapper, int postID) {
        System.out.println("BoardDAO 클래스의 selectByPostID() 메서드 실행");
        return (BoardDTO) mapper.selectOne("selectByPostID", postID);
    }

    // 글 1건을 삭제(블라인드 처리)하는 UPDATE SQL 명령을 실행하는 메서드
    public void delete(SqlSession mapper, int postID) {
        System.out.println("BoardDAO 클래스의 delete() 메서드 실행");
        mapper.update("delete", postID);
    }
}
