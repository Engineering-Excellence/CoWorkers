package com.silvertier.dto;

// 곽규창(Kyle) - 파일 DTO
public class BoardFileDTO {

    private int fileID; // PK, 파일번호
    private String fileName;    // 파일명
    private String fileRealName;    // 실제 파일명
    private int downloadCount;  // 다운로드 횟수
    private int postID; // FK, 메인글의 글번호

    public int getFileID() {
        return fileID;
    }

    public void setFileID(int fileID) {
        this.fileID = fileID;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileRealName() {
        return fileRealName;
    }

    public void setFileRealName(String fileRealName) {
        this.fileRealName = fileRealName;
    }

    public int getDownloadCount() {
        return downloadCount;
    }

    public void setDownloadCount(int downloadCount) {
        this.downloadCount = downloadCount;
    }

    public int getPostID() {
        return postID;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }
}
