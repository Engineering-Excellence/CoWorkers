package com.crunch.service;

import com.crunch.domain.UserInfoDTO;

import java.util.List;

public interface UserInfoService {

	void insert(UserInfoDTO userInfoDTO); // 회원가입 정보 입력

    String compareID(String accountID); // 로그인시 ID 비교

    String comparePW(String accountPassword); // 로그인시 PW 비교

    List<UserInfoDTO> select(String accountID); // 유저 1인 정보 select

    int selectUserID(String accountID); // 쪽지 보낸이 ID를 가져오기 위한 메서드
    
    int accountIDCount(String accountID); // ID 중복체크

	int registerNumberCount(String registerNumber); // 주민등록번호 중복체크

	List<UserInfoDTO> getUserInfoList(); // 사원목록 List

	String findIdByName(String userName); // ID찾기 이름 비교

	String findIdByMail(String email); // ID찾기 이메일 비교

	String findPwById(String accountID); // PW찾기 아이디 비교

	String findPwByName(String userName); // PW찾기 이름 비교

	String findPwByMail(String email); // PW찾기 메일 비교
}
