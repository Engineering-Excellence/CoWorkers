package com.silvertier.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.sil")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public HomeController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HomeController -> doGet");
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HomeController -> doPost");
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HomeController -> actionDO");
		
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
			
			case "/mainView.sil":
				viewpage += "mainView";
				break;
				
			case "/registerForm.sil":
				viewpage += "registerForm";
				break;
				
			case "/idPwFind.sil":
				viewpage += "idPwFind";
				break;
				
			case "/board.sil":
				viewpage += "board";
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
