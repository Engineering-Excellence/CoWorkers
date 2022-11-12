package com.silvertier.dto;

import java.util.ArrayList;

// 곽규창(Kyle)
public class CommentList {

    private ArrayList<CommentDTO> list = new ArrayList<>();

    public ArrayList<CommentDTO> getList() {
        return list;
    }

    public void setList(ArrayList<CommentDTO> list) {
        this.list = list;
    }
}
