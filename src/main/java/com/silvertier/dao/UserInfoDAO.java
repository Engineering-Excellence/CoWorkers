package com.silvertier.dao;

import org.apache.ibatis.session.SqlSession;

import com.silvertier.dto.UserInfoDTO;

public class UserInfoDAO {

	private static UserInfoDAO instance = new UserInfoDAO();
	private UserInfoDAO() { }
	public static UserInfoDAO getInstance() {
		return instance;
	}
	
	public void insert(SqlSession mapper, UserInfoDTO userInfoDTO) {
		System.out.println("UserInfoDAO -> insert()");
		mapper.insert("insert", userInfoDTO);
	}
	
	public UserInfoDTO selectByID(SqlSession mapper, int userID) {
		System.out.println("UserInfoDAO -> selectByID()");
		return (UserInfoDTO) mapper.selectOne("selectByID", userID);
	}
	

	
	
}
