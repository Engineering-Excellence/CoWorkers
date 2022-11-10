package com.silvertier.dto;

import java.util.Date;

// 허은성 - 일정에 대한 덧글 DTO
public class EventCommentDTO {

    private int eventCommentID;    // PK, 댓글번호
    private int eventID;    // FK, 일정글의 글번호
    private int userID;    // (FK), 아이디
    private String commentContent;  // 덧글 내용
    private Date commentWriteDate;
    private Date commentUpdateDate;
    private Date commentDeleteDate;
    private String commentIp;
    
    public EventCommentDTO() {}

	public int getEventCommentID() {
		return eventCommentID;
	}

	public void setEventCommentID(int eventCommentID) {
		this.eventCommentID = eventCommentID;
	}

	public int getEventID() {
		return eventID;
	}

	public void setEventID(int eventID) {
		this.eventID = eventID;
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

	@Override
	public String toString() {
		return "CommentDTO [eventCommentID=" + eventCommentID + ", eventID=" + eventID + ", userID=" + userID
				+ ", commentContent=" + commentContent + ", commentWriteDate=" + commentWriteDate
				+ ", commentUpdateDate=" + commentUpdateDate + ", commentDeleteDate=" + commentDeleteDate
				+ ", commentIp=" + commentIp + "]";
	}
    
}
