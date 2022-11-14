package com.silvertier.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.silvertier.dto.UserInfoDTO;
import com.silvertier.service.UserInfoService;

@WebServlet("*.sil")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	// 김태형 (Terry) - 로그인, 홈 화면 분기 컨트롤러
	
	UserInfoService service = UserInfoService.getInstance();
	
    public HomeController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HomeController -> doGet");
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HomeController -> doPost");
		process(request, response);
	}
	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HomeController -> process");
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String url = request.getRequestURI();
		String contextPath = request.getContextPath();
		String context = url.substring(contextPath.length());
		String viewpage = "/WEB-INF/";
		
		switch (context) {
		case "/index.sil": 
			viewpage += "index";
			break;
			
		case "/login.sil":
			viewpage += "login";
			break;
			
		case "/loginOK.sil":
			service.compareID(request, response);
			service.comparePW(request, response);
			viewpage += "loginOK";
			break;
			
		case "/mainView.sil":
			viewpage += "mainView";
			break;
			
		case "/registerForm.sil":
			viewpage += "registerForm";
			break;
			
		case "/insertOK.sil":
			service.insert(request, response);
			viewpage += "index";
			break;
			
		case "/idPwFind.sil":
			viewpage += "idPwFind";
			break;
			
		case "/board.sil":
			viewpage += "board";
			break;
			
		case "/work.sil":
			viewpage += "work";
			break;
			
		case "/file.sil":
			viewpage += "file";
			break;
			
		case "/event.sil":
			viewpage += "event";
			break;
		}	
		viewpage += ".jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewpage);
		dispatcher.forward(request, response);
	}
	
	
}
