package com.silvertier.dto;

public class PositionDTO {

    //	직급 관련 DTO

    private int positionCode;
    private String positionName;
    private String admin;

    public PositionDTO() {
    }

    public int getPositionCode() {
        return positionCode;
    }

    public void setPositionCode(int positionCode) {
        this.positionCode = positionCode;
    }

    public String getPositionName() {
        return positionName;
    }

    public void setPositionName(String positionName) {
        this.positionName = positionName;
    }

    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }

    @Override
    public String toString() {
        return "PositionDTO [positionCode=" + positionCode + ", positionName=" + positionName + ", admin=" + admin
                + "]";
    }

}
