package com.silvertier.dto;

import java.util.ArrayList;

// 곽규창(Kyle)
public class BoardCommentList {

    private ArrayList<BoardCommentDTO> list = new ArrayList<>();

    public ArrayList<BoardCommentDTO> getList() {
        return list;
    }

    public void setList(ArrayList<BoardCommentDTO> list) {
        this.list = list;
    }
}
