package com.silvertier.calendar;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.silvertier.dto.EventDTO;
import com.silvertier.service.EventService;

@WebServlet("/AjaxGetEventList")
public class AjaxGetEventList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxGetEventList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AjaxGetEventList 서블릿이 get 방식으로 요청됨");
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AjaxGetEventList 서블릿이 post 방식으로 요청됨");
		actionDo(request, response);
	}

	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AjaxGetEventList 서블릿의 processToGetEventList() 메서드 실행");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		response.getWriter().write(getJSON());
	}
	
	private String getJSON() {
		
		ArrayList<EventDTO> eList = new ArrayList<>();
		eList = EventService.getInstance().selectEList();
		
		StringBuffer result = new StringBuffer();
			/*
			 	{"result" : [
			 		[
			 		]
			 	]}
			 */
		result.append("{\"eList\":[");	//json 시작부분
//		데이터의 개수만큼 반복하며 json 형태의 문자열을 만든다.
		for(EventDTO eDTO : eList) {
			result.append("[{\"eventID\":\"" + eDTO.getEventID() + "\"}, ");
			result.append("{\"startDate\":\"" + eDTO.getStartDate() + "\"}, ");
			result.append("{\"endDate\":\"" + eDTO.getEndDate() + "\"}, ");
			result.append("{\"subject\":\"" + eDTO.getSubject() + "\"}, ");
			result.append("{\"eventColor\":\"" + eDTO.getEventColor() + "\"}, ");
			result.append("{\"deleteDate\":\"" + eDTO.getDeleteDate() + "\"}, ");
			result.append("{\"writeDate\":\"" + eDTO.getWriteDate() + "\"}], ");
		}
		result.append("]}");	//json 끝부분
		
//		StringBuffer 타입의 객체를 String 타입으로 리턴시키기 위해 
//		toString()  메서드를 실행하여 리턴시킨다.
		return result.toString();
	}
}
























