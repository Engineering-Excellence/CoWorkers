package com.silvertier.service;

import com.silvertier.dao.BoardDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardService {

    private static final BoardService instance = new BoardService();

    public static BoardService getInstance() {
        return instance;
    }

    private final BoardDAO dao = BoardDAO.getInstance();

    public void selectList(HttpServletRequest request, HttpServletResponse response) {

    }
}