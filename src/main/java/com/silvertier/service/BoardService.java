package com.silvertier.service;

import com.silvertier.dao.BoardDAO;
import com.silvertier.dto.BoardCommentDTO;
import com.silvertier.dto.BoardCommentList;
import com.silvertier.dto.BoardDTO;
import com.silvertier.dto.BoardList;
import com.silvertier.mybatis.MySession;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
    public void boardSelectList(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("BoardService 클래스의 selectList() 메서드 실행");
        SqlSession mapper = MySession.getSession();

        int currentPage = 1;
        try {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        } catch (NumberFormatException e) {
        }

        int pageSize = 10;
        int totalCount = dao.boardSelectCount(mapper);

        ArrayList<BoardDTO> notice = dao.boardSelectNotice(mapper);
        BoardList boardList = new BoardList(pageSize, totalCount, currentPage);

        HashMap<String, Integer> hashMap = new HashMap<>();
        hashMap.put("startNo", boardList.getStartNo());
        hashMap.put("endNo", boardList.getEndNo());
        boardList.setList(dao.boardSelectList(mapper, hashMap));

        for (BoardDTO boardDTO : notice) {
            boardDTO.setCommentCount(BoardService.getInstance().boardCommentCount(boardDTO.getPostID()));
        }
        for (BoardDTO boardDTO : boardList.getList()) {
            boardDTO.setCommentCount(BoardService.getInstance().boardCommentCount(boardDTO.getPostID()));
        }

        request.setAttribute("notice", notice);
        request.setAttribute("boardList", boardList);

        mapper.close();
    }

    private int boardCommentCount(int postID) {
        System.out.println("BoardService 클래스의 commentCount() 메서드 실행");
        SqlSession mapper = MySession.getSession();

        int commentCount = BoardDAO.getInstance().boardCommentCount(mapper, postID);

        mapper.close();
        return commentCount;
    }

    // 게시판에 새 글을 저장하는 메서드를 호출하는 메서드
    public void boardInsert(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("BoardService 클래스의 insert() 메서드 실행");
        SqlSession mapper = MySession.getSession();

        BoardDTO boardDTO = new BoardDTO();
        boardDTO.setSubject(request.getParameter("subject"));
        boardDTO.setUserName(request.getParameter("userName"));
        boardDTO.setContent(request.getParameter("content"));
        boardDTO.setIp(request.getParameter("ip"));
        boardDTO.setUserID(Integer.parseInt(request.getParameter("userID")));
        if (request.getParameter("notice") != null) {
            boardDTO.setNotice(request.getParameter("notice"));
        }
        dao.boardInsert(mapper, boardDTO);

        mapper.commit();
        mapper.close();
    }

    // 조회수를 증가시키는 UPDATE SQL 명령을 실행하는 메서드를 호출하는 메서드
    public void boardHit(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("BoardService 클래스의 hit() 메서드 실행");
        SqlSession mapper = MySession.getSession();

        int postID = Integer.parseInt(request.getParameter("postID"));
        dao.boardHit(mapper, postID);

        mapper.commit();
        mapper.close();
    }

    // 조회수를 증가시킨 글 1건을 선택하는 SELECT SQL 명령을 실행하고  request 영역에 저장하는 메서드
    public void boardSelectByPostID(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("BoardService 클래스의 selectByPostID() 메서드 실행");
        SqlSession mapper = MySession.getSession();

        int postID = Integer.parseInt(request.getParameter("postID"));
        int currentPage = Integer.parseInt(request.getParameter("currentPage"));

        BoardDTO boardDTO = dao.boardSelectByPostID(mapper, postID);
        BoardCommentList boardCommentList = new BoardCommentList();
        boardCommentList.setList(BoardDAO.getInstance().boardSelectCommentList(mapper, postID));

        request.setAttribute("boardDTO", boardDTO);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("enter", "\r\n");
        request.setAttribute("boardCommentList", boardCommentList);
        boardDTO.setCommentCount(BoardService.getInstance().boardCommentCount(boardDTO.getPostID()));


        mapper.close();
    }

    // 게시글을 삭제(블라인드 처리)하는 UPDATE SQL 명령을 실행하는 메서드를 호출하는 메서드
    public void boardDelete(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("BoardService 클래스의 delete() 메서드 실행");
        SqlSession mapper = MySession.getSession();

        int postID = Integer.parseInt(request.getParameter("postID"));

        dao.boardDelete(mapper, postID);

        mapper.commit();
        mapper.close();
    }

    // 게시글을 수정하는 UPDATE SQL 명령을 실행하는 메서드를 호출하는 메서드
    public void boardUpdate(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("BoardService 클래스의 update() 메서드 실행");
        SqlSession mapper = MySession.getSession();

        int currentPage = Integer.parseInt(request.getParameter("currentPage"));
        BoardDTO boardDTO = new BoardDTO();
        boardDTO.setPostID(Integer.parseInt(request.getParameter("postID")));
        boardDTO.setSubject(request.getParameter("subject"));
//        boardDTO.setUserName(request.getParameter("userName"));
        boardDTO.setContent(request.getParameter("content"));
        boardDTO.setIp(request.getParameter("ip"));
        if (request.getParameter("notice") != null) {
            boardDTO.setNotice(request.getParameter("notice"));
        }
        dao.boardUpdate(mapper, boardDTO);

        mapper.commit();
        mapper.close();
    }

    // 새 덧글을 저장하는 INSERT SQL 명령을 실행하는 메서들르 호출하는 메서드
    public void boardCommentInsert(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("BoardService 클래스의 commentInsert() 메서드 실행");
        SqlSession mapper = MySession.getSession();

        BoardCommentDTO commentDTO = new BoardCommentDTO();
        commentDTO.setPostID(Integer.parseInt(request.getParameter("postID")));
        commentDTO.setUserName(request.getParameter("userName"));
        commentDTO.setContent(request.getParameter("content"));
        commentDTO.setIp(request.getParameter("ip"));
        commentDTO.setUserID(Integer.parseInt(request.getParameter("userID")));

        dao.boardCommentInsert(mapper, commentDTO);

        mapper.commit();
        mapper.close();
    }

    // 덧글을 삭제(블라인드 처리)하는 UPDATE SQL 명령을 실행하는 메서드를 호출하는 메서드
    public void boardCommentDelete(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("BoardService 클래스의 commentDelete() 메서드 실행");
        SqlSession mapper = MySession.getSession();

        int commentID = Integer.parseInt(request.getParameter("commentID"));
        int postID = Integer.parseInt(request.getParameter("postID"));
        int currentPage = Integer.parseInt(request.getParameter("currentPage"));

        dao.boardCommentDelete(mapper, commentID);

        mapper.commit();
        mapper.close();
    }

    // 덧글을 수정하는 UPDATE SQL 명령을 실행하는 메서드를 호출하는 메서드
    public void boardCommentUpdate(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("BoardService 클래스의 commentUpdate() 메서드 실행");
        SqlSession mapper = MySession.getSession();

        int currentPage = Integer.parseInt(request.getParameter("currentPage"));

        BoardCommentDTO commentDTO = new BoardCommentDTO();
        commentDTO.setCommentID(Integer.parseInt(request.getParameter("commentID")));
//        commentDTO.setUserName(request.getParameter("userName"));
        commentDTO.setContent(request.getParameter("content"));
        commentDTO.setIp(request.getParameter("ip"));
        commentDTO.setPostID(Integer.parseInt(request.getParameter("postID")));

        dao.boardCommentUpdate(mapper, commentDTO);

        mapper.commit();
        mapper.close();
    }

}