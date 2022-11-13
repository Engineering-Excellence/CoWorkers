package com.silvertier.dto;

import java.util.Date;

public class UserInfoDTO {

	// 김태형(terry) 로그인 및 계정 관련 DTO
	
	private int userID; // PK, 사원번호 - 퇴사 및 탈퇴처리 시 활용
	private String accountID; // UK, 로그인용 ID -- User간 ID 중복 불가
	private String accountPassword; // 로그인용 Password -- 개인정보 수정 + 탈퇴 시 활용 목적
	private String userName; // 사원명
	private String registerNumber; // UK, 주민등록번호 -- 회원가입 시 주민등록번호 유효성 검사 + 탈퇴 시 이용
	private String mobileNumber; // UK, 휴대폰 번호 -- 회원가입 시 인증 및 ID/PW 찾기 용도
	private String gender; // 사원 성별
	private String email; // 사원 메일 -- 임시비밀번호 설정 메일 송부에 사용
	private Date joinDate; // 계정 입사일자
	private Date retireDate; // 계정 탈퇴일자 -- 개인정보 보존 용도(결제 관련 5년, 일반 정보는 보존기간 3년)
	private int positionCode; // FK, 직급코드
	
	public UserInfoDTO() { }
	
	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getAccountID() {
		return accountID;
	}

	public void setAccountID(String accountID) {
		this.accountID = accountID;
	}

	public String getAccountPassword() {
		return accountPassword;
	}

	public void setAccountPassword(String accountPassword) {
		this.accountPassword = accountPassword;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getRegisterNumber() {
		return registerNumber;
	}

	public void setRegisterNumber(String registerNumber) {
		this.registerNumber = registerNumber;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public Date getRetireDate() {
		return retireDate;
	}

	public void setRetireDate(Date retireDate) {
		this.retireDate = retireDate;
	}

	public int getPositionCode() {
		return positionCode;
	}

	public void setPositionCode(int positionCode) {
		this.positionCode = positionCode;
	}

	@Override
	public String toString() {
		return "UserInfoDTO [userID=" + userID + ", accountID=" + accountID + ", accountPassword=" + accountPassword
				+ ", userName=" + userName + ", registerNumber=" + registerNumber + ", mobileNumber=" + mobileNumber
				+ ", gender=" + gender + ", email=" + email + ", joinDate=" + joinDate + ", retireDate=" + retireDate
				+ ", positionCode=" + positionCode + "]";
	}

}
