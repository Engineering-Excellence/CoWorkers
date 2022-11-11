package com.silvertier.service;

import org.apache.ibatis.session.SqlSession;

import com.silvertier.dao.UserInfoDAO;
import com.silvertier.dto.UserInfoDTO;
import com.silvertier.mybatis.MySession;

public class UserInfoService {

	private static UserInfoService instance = new UserInfoService();
	private UserInfoService() { }
	public static UserInfoService getInstance() {
		return instance;
	}
	
	public void insert(UserInfoDTO userDTO) {
		System.out.println("UserInfoService -> insert()");
		SqlSession mapper = MySession.getSession();
		UserInfoDAO.getInstance().insert(mapper, userDTO);
		mapper.commit();
		mapper.close();
	}
	
}
