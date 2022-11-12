package com.silvertier.service;

import com.silvertier.dao.BoardDAO;
import com.silvertier.dto.BoardList;
import com.silvertier.mybatis.MySession;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;

// 곽규창(Kyle)
public class BoardService {

    private static final BoardService instance = new BoardService();

    public static BoardService getInstance() {
        return instance;
    }

    private final BoardDAO dao = BoardDAO.getInstance();

    // 페이징을 위한 클래스 객체를 생성하여 request 영역에 저장하는 메서드를 호출하는 메서드
    public void selectList(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("BoardService 클래스의 selectList() 메서드 실행");
        SqlSession mapper = MySession.getSession();

        int currentPage = 1;
        try {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        } catch (NumberFormatException e) {
//            throw new RuntimeException(e);
        }

        int pageSize = 10;
        int totalCount = dao.selectCount(mapper);
//        System.out.println(totalCount);

        BoardList boardList = new BoardList(pageSize, totalCount, currentPage);

        HashMap<String, Integer> hashMap = new HashMap<>();
        hashMap.put("startNo", boardList.getStartNo());
        hashMap.put("endNo", boardList.getEndNo());

        boardList.setList(dao.selectList(mapper, hashMap));
        System.out.println(boardList);

        request.setAttribute("boardList", boardList);

        mapper.close();
    }
}