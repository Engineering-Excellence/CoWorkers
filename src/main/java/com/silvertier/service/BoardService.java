package com.silvertier.service;

import com.silvertier.dao.BoardDAO;
import com.silvertier.dto.BoardDTO;
import com.silvertier.dto.BoardList;
import com.silvertier.mybatis.MySession;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;

// Kyle
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
//        System.out.println(boardList);

        request.setAttribute("boardList", boardList);

        mapper.close();
    }

    // 게시판에 새 글을 저장하는 메서드를 호출하는 메서드
    public void insert(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("BoardService 클래스의 insert() 메서드 실행");
        SqlSession mapper = MySession.getSession();

        BoardDTO dto = new BoardDTO();
        dto.setSubject(request.getParameter("subject"));
        dto.setUserName(request.getParameter("userName"));
        dto.setContent(request.getParameter("content"));
        dto.setIp(request.getParameter("ip"));
        if (request.getParameter("notice") != null) {
            dto.setNotice(request.getParameter("notice"));
        }
        dao.insert(mapper, dto);

        mapper.commit();
        mapper.close();
    }

    // 모든 공지글을 얻어오는 SELECT SQL 명령을 실행하는 메서드를 호출하는 메서드
    public void selectNotice(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("BoardService 클래스의 selectNotice() 메서드 실행");
        SqlSession mapper = MySession.getSession();

        ArrayList<BoardDTO> notice = dao.selectNotice(mapper);
//        System.out.println("notice: " + notice);
        request.setAttribute("notice", notice);

        mapper.close();
    }

    // 조회수를 증가시키는 UPDATE SQL 명령을 실행하는 메서드를 호출하는 메서드
    public void hit(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("BoardService 클래스의 hit() 메서드 실행");
        SqlSession mapper = MySession.getSession();

        int postID = Integer.parseInt(request.getParameter("postID"));
        dao.hit(mapper, postID);

        mapper.commit();
        mapper.close();
    }

    // 조회수를 증가시킨 글 1건을 SELECT 하는 SQL 명령을 실행하고  request 영역에 저장하는 메서드
    public BoardDTO selectByPostID(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("BoardService 클래스의 selectByPostID() 메서드 실행");
        SqlSession mapper = MySession.getSession();

        int postID = Integer.parseInt(request.getParameter("postID"));
        int currentPage = Integer.parseInt(request.getParameter("currentPage"));
//        System.out.println(postID + "&" +  currentPage);

        BoardDTO dto = dao.selectByPostID(mapper, postID);
        System.out.println(dto);

        request.setAttribute("boardDTO", dto);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("enter", "\r\n");

        mapper.close();
        return dto;
    }
}