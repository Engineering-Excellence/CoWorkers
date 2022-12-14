package com.silvertier.dao;

import org.apache.ibatis.session.SqlSession;
import com.silvertier.dto.UserInfoDTO;

import java.util.ArrayList;

public class UserInfoDAO {

    private static UserInfoDAO instance = new UserInfoDAO();

    private UserInfoDAO() {
    }

    public static UserInfoDAO getInstance() {
        return instance;
    }

    // 회원가입 데이터 입력
    public void userInfoInsert(SqlSession mapper, UserInfoDTO userInfoDTO) {
        System.out.println("UserInfoDAO -> userInfoInsert()");
        mapper.insert("userInfoInsert", userInfoDTO);
    }

    // 로그인시 아이디 비교
    public String userInfoCompareID(SqlSession mapper, UserInfoDTO userInfoDTO) {
        System.out.println("UserInfoDAO -> userInfoCompareID()");
        return (String) mapper.selectOne("userInfoCompareID", userInfoDTO);
    }

    // 로그인시 패스워드 비교
    public String userInfoComparePW(SqlSession mapper, UserInfoDTO userInfoDTO) {
        System.out.println("UserInfoDAO -> userInfoComparePW()");
        return (String) mapper.selectOne("userInfoComparePW", userInfoDTO);
    }

    public ArrayList<UserInfoDTO> userInfoSelect(SqlSession mapper, UserInfoDTO userInfoDTO) {
        System.out.println("UserInfoDAO -> userInfoSelect()");
        return (ArrayList<UserInfoDTO>) mapper.selectList("userInfoSelect", userInfoDTO);
    }
	
/*
	 // 유저 전체 리스트 뽑아오기 
	 public ArrayList<UserInfoDTO> userInfoSelectList(SqlSession mapper) { 
	   	System.out.println("UserInfoDAO -> userInfoSelectList()"); 
	   	return (ArrayList<UserInfoDTO>) mapper.selectList("userInfoSelectList", mapper); }
*/
	
/*	Terry -- 스프링 학습 이후 ID/PW 찾기 업데이트
	
	// ID 찾기용 이름 비교
	public String userInfoCompareName(SqlSession mapper, UserInfoDTO userInfoDTO) {
		System.out.println("UserInfoDAO -> userInfoCompareName()");
		return (String) mapper.selectOne("userInfoCompareName", userInfoDTO);
	}
	
	// ID 찾기용 이메일 비교
	public String userInfoCompareEmail(SqlSession mapper, UserInfoDTO userInfoDTO) {
		System.out.println("UserInfoDAO -> userInfoCompareEmail()");
		return (String) mapper.selectOne("userInfoCompareEmail", userInfoDTO);
	}
	
	// ID/PW 찾기용 유저정보 가져오기
	
	// ID 찾기용 ID 가져오기
	public UserInfoDTO userInfoSelectUser(SqlSession mapper, String string) {
		System.out.println("UserInfoDAO -> userInfoSelectUser()");
		return (UserInfoDTO) mapper.selectOne("userInfoSelectUser", string);
	}
*/

}
