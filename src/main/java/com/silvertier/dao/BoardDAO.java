package com.silvertier.dao;

import com.silvertier.dto.BoardDTO;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.HashMap;

// 곽규창(Kyle)
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
}
