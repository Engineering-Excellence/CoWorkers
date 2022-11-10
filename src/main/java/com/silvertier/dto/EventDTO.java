package com.silvertier.dto;

import java.util.Date;

//캘린더에 표시하는 일정 DTO
public class EventDTO {

	private int eventID; //PK, 일정 번호
	private int userID; //FK, 사번(작성자)
	private Date writeDate;	//작성일
	private Date updateDate;	//수정일
    private Date deleteDate;	//삭제일
	private String subject;	// 일정 제목
	private String content;	// 일정 내용
	private Date startDate;	// 일정 시작하는 날짜
	private Date endDate;	// 일정 끝나는 날짜
	private String projectColor;	//	일정(스케줄) 별 색(16진수rbc값)
	private int hit;	//	일정(스케줄) 내용 조회수
	private int commentCount;	//댓글 개수
	private String ip;	//작성자 ip
	private String isAllDay; // all day 일정 이벤트 여부 => 값 : y/n
	
	public EventDTO() {	}

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

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getProjectColor() {
		return projectColor;
	}

	public void setProjectColor(String projectColor) {
		this.projectColor = projectColor;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getIsAllDay() {
		return isAllDay;
	}

	public void setIsAllDay(String isAllDay) {
		this.isAllDay = isAllDay;
	}

	@Override
	public String toString() {
		return "EventDTO [eventID=" + eventID + ", userID=" + userID + ", writeDate=" + writeDate + ", updateDate="
				+ updateDate + ", deleteDate=" + deleteDate + ", subject=" + subject + ", content=" + content
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", projectColor=" + projectColor + ", hit="
				+ hit + ", commentCount=" + commentCount + ", ip=" + ip + ", isAllDay=" + isAllDay + "]";
	}
	
}




