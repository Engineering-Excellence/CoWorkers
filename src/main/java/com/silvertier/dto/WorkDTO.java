package com.silvertier.dto;

import java.sql.Date;

//조우철

public class WorkDTO {
    private int workID; // 글번호 // pk // not null
    private String subject; // 제목 // not null
    private String userName; // 작성자(담당자) // not null
    private String content; // 내용 // not null
    private int priority; // 우선순위 1(긴급), 2(높음), 3(보통), 4(낮음)
    private int currentProgress; // 업무 상태 1(요청), 2(진행), 3(완료)
    private int workProgress; // 업무 진척도 ((0~10)*10)%
    private Date writeDate; // 작성일
    private Date updateDate; // 수정일
    private Date deleteDate; // 삭제일
    private Date startDate; // 시작일 // not null
    private Date deadline; // 마감일 // not null
    private String ip; // ip
    private String admin; // 관리자
    private int userID; // 작성자(담당자) // fk // not null

    public int getWorkID() {
        return workID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public void setWorkID(int workID) {
        this.workID = workID;
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

    public int getPriority() {
        return priority;
    }

    public void setPriority(int priority) {
        this.priority = priority;
    }

    public int getCurrentProgress() {
        return currentProgress;
    }

    public void setCurrentProgress(int currentProgress) {
        this.currentProgress = currentProgress;
    }

    public int getWorkProgress() {
        return workProgress;
    }

    public void setWorkProgress(int workProgress) {
        this.workProgress = workProgress;
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

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }
}
