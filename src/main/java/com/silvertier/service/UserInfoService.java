package com.silvertier.service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.silvertier.dao.UserInfoDAO;
import com.silvertier.dto.UserInfoDTO;
import com.silvertier.mybatis.MySession;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

public class UserInfoService {

	private static UserInfoService instance = new UserInfoService();
	private UserInfoService() { }
	public static UserInfoService getInstance() {
		return instance;
	}
	
	private UserInfoDAO userInfoDAO = UserInfoDAO.getInstance();
	
	// 회원가입 데이터 입력
	public void userInfoInsert(HttpServletRequest request, HttpServletResponse response) {
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
		
		userInfoDAO.userInfoInsert(mapper, userInfoDTO);
		mapper.commit();
		mapper.close();
	}
	
	// 로그인 시 아이디 비교
	public String userInfoCompareID(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("UserInfoService -> userInfoCompareID()");
		SqlSession mapper = MySession.getSession();
		
		UserInfoDTO userInfoDTO = new UserInfoDTO();
		userInfoDTO.setAccountID(request.getParameter("accountID"));
		System.out.println("UserInfoService -> userInfoCompareID() accountID "+request.getParameter("accountID"));
//		System.out.println("userInfoCompareID: " + userInfoDTO.getAccountID());
		String originID = userInfoDAO.userInfoCompareID(mapper, userInfoDTO);
		System.out.println("UserInfoService -> userInfoCompareID() originID "+originID);
		mapper.close();
		return originID;
	}
	
	// 로그인 시 패스워드 비교
	public String userInfoComparePW(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("UserInfoService -> userInfoComparePW()");
		SqlSession mapper = MySession.getSession();
		
		UserInfoDTO userInfoDTO = new UserInfoDTO();
		userInfoDTO.setAccountID(userInfoCompareID(request, response));
		userInfoDTO.setAccountPassword(request.getParameter("accountPassword"));
//		System.out.println("userInfoComparePW: " + userInfoDTO.getAccountPassword());
		System.out.println("UserInfoService -> userInfoComparePW() accountPassword "+request.getParameter("accountPassword"));
		String originPW = userInfoDAO.userInfoComparePW(mapper, userInfoDTO);
		System.out.println("UserInfoService -> userInfoComparePW() originPW "+originPW);
		mapper.close();
		return originPW;
	}
	public void userInfoSelect(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("UserInfoService -> userInfoSelect()");
		SqlSession mapper = MySession.getSession();

		System.out.println("UserInfoService -> userInfoSelect() accountID "+request.getParameter("accountID"));
		UserInfoDTO userInfoDTO = new UserInfoDTO();
		userInfoDTO.setAccountID(userInfoCompareID(request, response));

		ArrayList<UserInfoDTO> userInfo = userInfoDAO.userInfoSelect(mapper, userInfoDTO);

		System.out.println("INFO: " + userInfo);
		HttpSession session = request.getSession();
		session.setAttribute("userInfo", userInfo);
		mapper.close();
	}

/*
	 // 전체 유저 리스트 뽑아오기 
	 public ArrayList<UserInfoDTO> userInfoSelectList(HttpServletRequest request, HttpServletResponse response) { 
		System.out.println("UserInfoService -> userInfoSelectList()"); 
		SqlSession mapper = MySession.getSession();
	  
		ArrayList<UserInfoDTO> userList = new ArrayList<>(); userList =
		userInfoDAO.userInfoSelectList(mapper); mapper.close(); return userList; }
 */
	
/*	Terry, 스프링 학습 이후 ID/PW 찾기 업데이트
 
	// ID 찾기용 이름 비교
	public String userInfoCompareName(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("UserInfoService -> userInfoCompareName()");
		SqlSession mapper = MySession.getSession();
		
		UserInfoDTO userInfoDTO = new UserInfoDTO();
		userInfoDTO.setUserName(request.getParameter("userName"));
		userInfoDTO.setEmail(request.getParameter("email"));
		userInfoDTO.setMobileNumber(request.getParameter("mobileNumber"));
		System.out.println("userInfoCompareName: " + userInfoDTO);
		String originName = userInfoDAO.userInfoCompareName(mapper, userInfoDTO);
		System.out.println(originName);
		mapper.close();
		return originName;
	}
	
	// ID 찾기용 이메일 비교
	public String userInfoCompareEmail(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("UserInfoService -> userInfoCompareEmail()");
		SqlSession mapper = MySession.getSession();
		
		UserInfoDTO userInfoDTO = new UserInfoDTO();
		userInfoDTO.setUserName(request.getParameter("userName"));
		userInfoDTO.setEmail(request.getParameter("email"));
		userInfoDTO.setMobileNumber(request.getParameter("mobileNumber"));
		System.out.println("userInfoCompareName: " + userInfoDTO);
		String originEmail = userInfoDAO.userInfoCompareEmail(mapper, userInfoDTO);
		System.out.println(originEmail);
		mapper.close();
		return originEmail;
	}
	
	// ID 찾기용 유저 정보 리스트 뽑아오기
	public void userInfoSelectList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("UserInfoService -> userInfoSelectUser()");
		SqlSession mapper = MySession.getSession();
		
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		
	}
	
	// ID 찾기용 유저리스트에서 특정 유저 뽑아오기
	public void userInfoSelectUser(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("UserInfoService -> userInfoSelectUser()");
		SqlSession mapper = MySession.getSession();
		
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		UserInfoDTO userInfoDTO = userInfoDAO.userInfoSelectUser(mapper, "email"); 
		System.out.println("userInfoSelectUser: " + userInfoDTO);
		mapper.close();
	}
*/	
}
