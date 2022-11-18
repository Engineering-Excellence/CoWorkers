package com.silvertier.service;


import java.util.ArrayList;

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
		userInfoDTO.setAccountPassword(request.getParameter("accountPassword"));
		System.out.println("userInfoCompareID: " + userInfoDTO);
		String originID = userInfoDAO.userInfoCompareID(mapper, userInfoDTO);
		mapper.close();
		return originID;
//		return compareID(request, response); // 에러: 무한재귀
	}
	
	// 로그인 시 패스워드 비교
	public String userInfoComparePW(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("UserInfoService -> userInfoComparePW()");
		SqlSession mapper = MySession.getSession();
		
		UserInfoDTO userInfoDTO = new UserInfoDTO();
		userInfoDTO.setAccountID(request.getParameter("accountID"));
		userInfoDTO.setAccountPassword(request.getParameter("accountPassword"));
		System.out.println("userInfoComparePW: " + userInfoDTO);
		String originPW = userInfoDAO.userInfoComparePW(mapper, userInfoDTO);
		mapper.close();
		return originPW;
//		return comparePW(request, response); // 에러: 무한재귀
	}
	
	// 유저 리스트 뽑아오기
	public void userInfoSelectList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("UserInfoService -> userInfoSelectList()");
		SqlSession mapper = MySession.getSession();
		
		ArrayList<UserInfoDTO> userList = new ArrayList<>();
		userList = userInfoDAO.userInfoSelectList(mapper);
		System.out.println(userList);
		
		request.setAttribute("userList", userList);
		mapper.close();
	}
	
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
