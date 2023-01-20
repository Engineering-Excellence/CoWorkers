package com.crunch.mapper;

import com.crunch.domain.UserInfoDTO;

import java.util.List;

public interface UserInfoMapper {

	void userInfoInsert(UserInfoDTO userInfoDTO); // 회원가입 시 DB에 정보 입력

    String userInfoCompareID(String accountID); // 로그인시 ID 비교

    String userInfoComparePW(String accountPassword); // 로그인 시 PW 비교

    List<UserInfoDTO> userInfoSelect(String accountID); // 유저 1인 정보 가져오기

    int selectUserID(String accountID); // 쪽지 보낸이 ID를 가져오기 위한 메서드
    
    int userInfoAccountIDCount(String accountID); // ID 중복체크

	int userInfoRegisterNumberCount(String registerNumber); // 주민등록번호 중복체크

	List<UserInfoDTO> getUserInfoList(); // 사원목록용 List

	String userInfoFindIdByName(String userName); // ID 찾기 이름 비교

	String userInfoFindIdByMail(String email); // ID 찾기 메일 비교

	String userInfoFindPwById(String accountID); // PW 찾기 아이디 비교

	String userInfoFindPwByName(String userName); // PW 찾기 이름 비교

	String userInfoFindPwByMail(String email); // PW 찾기 메일 비교
}
