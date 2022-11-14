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
	
	// 회원가입 데이터 입력
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
	
	// 로그인 시 아이디 비교
	public void compareID(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("UserInfoService -> compareID()");
		SqlSession mapper = MySession.getSession();
		
		UserInfoDTO userInfoDTO = new UserInfoDTO();
		dao.compareID(mapper, userInfoDTO);
		System.out.println("compareID" + userInfoDTO);
		mapper.close();
	}
	
	// 로그인 시 패스워드 비교
	public void comparePW(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("UserInfoService -> comparePW()");
		SqlSession mapper = MySession.getSession();
		
		UserInfoDTO userInfoDTO = new UserInfoDTO();
		dao.comparePW(mapper, userInfoDTO);
		System.out.println("comparePW" + userInfoDTO);
		mapper.close();
	}
}
