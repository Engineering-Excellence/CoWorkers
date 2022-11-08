package com.silvertier.dto;

import java.util.Date;

// 곽규창 - (가칭) 덧글 DTO
public class CommentDTO {

    private int commentID;    // PK, 댓글번호
    private int postID;    // FK, 메인글의 글번호
    private int userID;    // (FK), 아이디
    private String commentContent;  // 덧글 내용
    private Date commentWriteDate;
    private Date commentUpdateDate;
    private Date commentDeleteDate;
    private String commentIp;

    public int getCommentID() {
        return commentID;
    }

    public void setCommentID(int commentID) {
        this.commentID = commentID;
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

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public Date getCommentWriteDate() {
        return commentWriteDate;
    }

    public void setCommentWriteDate(Date commentWriteDate) {
        this.commentWriteDate = commentWriteDate;
    }

    public Date getCommentUpdateDate() {
        return commentUpdateDate;
    }

    public void setCommentUpdateDate(Date commentUpdateDate) {
        this.commentUpdateDate = commentUpdateDate;
    }

    public Date getCommentDeleteDate() {
        return commentDeleteDate;
    }

    public void setCommentDeleteDate(Date commentDeleteDate) {
        this.commentDeleteDate = commentDeleteDate;
    }

    public String getCommentIp() {
        return commentIp;
    }

    public void setCommentIp(String commentIp) {
        this.commentIp = commentIp;
    }
}
