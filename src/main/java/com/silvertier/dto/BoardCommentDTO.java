package com.silvertier.dto;

import java.sql.Date;

// 곽규창(Kyle) - 덧글 DTO
public class BoardCommentDTO {

    private int commentID;    // PK, 댓글번호
    private String userName;    // 성명
    private String content;  // 덧글 내용
    private Date writeDate; // 입력일
    private Date updateDate;    // 수정일
    private Date deleteDate;    // 삭제일
    private String ip;      // IP 주소
    private int postID;    // FK, 메인글의 글번호
    private int userID;    // FK, 아이디

    public int getCommentID() {
        return commentID;
    }

    public void setCommentID(int commentID) {
        this.commentID = commentID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getWriteDate() {
        return writeDate;
    }

    public void setWriteDate(Date writeDate) {
        this.writeDate = writeDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public Date getDeleteDate() {
        return deleteDate;
    }

    public void setDeleteDate(Date deleteDate) {
        this.deleteDate = deleteDate;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public int getPostID() {
        return postID;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }
}
