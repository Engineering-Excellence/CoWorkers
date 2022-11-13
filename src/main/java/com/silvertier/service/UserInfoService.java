package com.silvertier.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
	private UserInfoDAO dao = UserInfoDAO.getInstance();
	
	public void insert(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("UserInfoService -> insert()");
		SqlSession mapper = MySession.getSession();
		
		UserInfoDTO userInfoDTO = new UserInfoDTO();
		userInfoDTO.setAccountID(request.getParameter("accountID"));
		userInfoDTO.setAccountPassword(request.getParameter("accountPassword"));
		userInfoDTO.setUserName(request.getParameter("userName"));
		userInfoDTO.setRegisterNumber(request.getParameter("registerNumber"));
		userInfoDTO.setMobileNumber(request.getParameter("mobileNumber"));
		userInfoDTO.setGender(request.getParameter("gender"));
		userInfoDTO.setEmail(request.getParameter("email"));
		
		dao.insert(mapper, userInfoDTO);
		mapper.commit();
		mapper.close();
	}
	
	public void selectByID(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("UserInfoService -> selectByID()");
		SqlSession mapper = MySession.getSession();
		
		int userID = Integer.parseInt(request.getParameter("userID"));
		String accountID = request.getParameter("accountID");
		String accountPassword = request.getParameter("accountPassword");
		
		UserInfoDTO userInfoDTO = dao.selectByID(mapper, userID);
		
		mapper.close();
	}
	
}
