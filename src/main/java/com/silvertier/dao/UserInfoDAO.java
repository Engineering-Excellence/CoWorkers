package com.silvertier.dao;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.mapper.Mapper;
import org.apache.ibatis.session.SqlSession;

import com.silvertier.dto.UserInfoDTO;

public class UserInfoDAO {

	private static UserInfoDAO instance = new UserInfoDAO();
	private UserInfoDAO() { }
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
//		System.out.println("dao ID: " + userInfoDTO);
		return (String) mapper.selectOne("userInfoCompareID", userInfoDTO);
	}
	
	// 로그인시 패스워드 비교
	public String userInfoComparePW(SqlSession mapper, UserInfoDTO userInfoDTO) {
		System.out.println("UserInfoDAO -> userInfoComparePW()");
//		System.out.println("dao PW: " + userInfoDTO);
		return (String) mapper.selectOne("userInfoComparePW", userInfoDTO);
	}
	
	// 유저 전체 리스트 뽑아오기
	public ArrayList<UserInfoDTO> userInfoSelectList(SqlSession mapper) {
		System.out.println("UserInfoDAO -> userInfoSelectList()");
		return (ArrayList<UserInfoDTO>) mapper.selectList("userInfoSelectList", mapper);
	}
	
	// 유저 정보 가져오기
	public void userInfoSelectUser(SqlSession mapper, UserInfoDTO userInfoDTO) {
		System.out.println("UserInfoDAO -> userInfoSelectUser()");
		mapper.selectOne("userInfoSelectUser", userInfoDTO);
	}

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
