package com.silvertier.calendar;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.silvertier.service.EventService;

@WebServlet("*.sil")
public class EventController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
//	컨트롤러에서 사용할 service 클래스 객체를 생성한다.
	private EventService service = EventService.getInstance();
	
    public EventController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet() of EventController Class");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
//		페이지 요청 받음
		String url = request.getRequestURI();
		String contextPath = request.getContextPath();
		String context = url.substring(contextPath.length());
		
		String viewPage = "/WEB-INF/";
		
		 switch (context) {
			 case "/event.sil":
				 viewPage += "event";
				 break;
			
			 case "/eventInsertOK.sil":
				 service.insert(request, response);
				 viewPage += "event";
				 break;
		 }
		 viewPage += ".jsp";
//		 요청받은 페이지로 넘김.
		 RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost() of EventController Class");
		doGet(request, response);
	}
	
}
