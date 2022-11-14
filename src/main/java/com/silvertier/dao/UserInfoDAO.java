package com.silvertier.dao;

import org.apache.ibatis.session.SqlSession;

import com.silvertier.dto.UserInfoDTO;

public class UserInfoDAO {

	private static UserInfoDAO instance = new UserInfoDAO();
	private UserInfoDAO() { }
	public static UserInfoDAO getInstance() {
		return instance;
	}
	
	// 회원가입 데이터 입력
	public void insert(SqlSession mapper, UserInfoDTO userInfoDTO) {
		System.out.println("UserInfoDAO -> insert()");
		mapper.insert("insert", userInfoDTO);
	}
	
	// 로그인시 아이디 비교
	public void compareID(SqlSession mapper, UserInfoDTO userInfoDTO) {
		System.out.println("UserInfoDAO -> compareID()");
		mapper.selectOne("compareID", userInfoDTO);
	}
	
	// 로그인시 패스워드 비교
	public void comparePW(SqlSession mapper, UserInfoDTO userInfoDTO) {
		System.out.println("UserInfoDAO -> comparePW()");
		mapper.selectOne("comparePW", userInfoDTO);	
	}
	
	
}
