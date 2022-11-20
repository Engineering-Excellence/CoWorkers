package com.silvertier.dto;

import java.sql.Date;

//캘린더에 표시하는 일정 DTO
public class EventDTO {

	private int eventID; //PK, 일정 번호
	private String subject;	// 일정 제목
	private String userName;
	private String content;	// 일정 내용
	private String eventColor;	//	일정(스케줄) 별 색(16진수rbc값)
	private String allDay = "false"; // all day 일정 이벤트 여부 => 값 : y/n
	private Date startDate;	// 일정 시작하는 날짜
	private Date endDate;	// 일정 끝나는 날짜
	private Date writeDate;	//작성일
	private Date updateDate;	//수정일
    private Date deleteDate;	//삭제일
	private int hit = 0;	//	일정(스케줄) 내용 조회수
	private String ip;	//작성자 ip
	private int userID; //FK, 사번(작성자)
	
	public EventDTO() {	}
	
	public int getEventID() {
		return eventID;
	}
	public void setEventID(int eventID) {
		this.eventID = eventID;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
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
	public String getEventColor() {
		return eventColor;
	}
	public void setEventColor(String eventColor) {
		this.eventColor = eventColor;
	}
	public String getAllDay() {
		return allDay;
	}
	public void setAllDay(String allDay) {
		this.allDay = allDay;
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	
	@Override
	public String toString() {
		return "EventDTO [eventID=" + eventID + ", subject=" + subject + ", userName=" + userName + ", content="
				+ content + ", eventColor=" + eventColor + ", allDay=" + allDay + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", writeDate=" + writeDate + ", updateDate=" + updateDate + ", deleteDate="
				+ deleteDate + ", hit=" + hit + ", ip=" + ip + ", userID=" + userID + "]";
	}

}
