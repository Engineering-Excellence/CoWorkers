package com.silvertier.service;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.ibatis.session.SqlSession;
import com.silvertier.dao.EventDAO;
import com.silvertier.dto.EventDTO;
import com.silvertier.dto.EventList;
import com.silvertier.mybatis.MySession;

public class EventService {
	
	private static EventService instance = new EventService();
	private EventService() { }
	public static EventService getInstance() {
		return instance;
	}
	
	//자주 호출하는 클래스 객체 미리 선언.
	private EventDAO eDAO = EventDAO.getInstance();
	private EventDTO eDTO = new EventDTO();
	
	public void eventInsert(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("eventInsert() Method of EventService Class");
		SqlSession mapper = MySession.getSession();
		
//		event.jsp에서 입력한 request 객체에 저장되어 넘어오는 데이터를 받아서 EventDTO 클래스 객체에 저장한다.
		eDTO.setSubject(request.getParameter("subject"));
		eDTO.setEventColor (request.getParameter("eventColor"));
		eDTO.setContent(request.getParameter("content"));
		eDTO.setIp(request.getParameter("ip"));
		//isAllDay의 값이 "yes"일 경우에만 값을 받아와서 EventDTO 클래스 객체에 저장한다. 
		if(request.getParameter("allDay").equals("yes")) {
			eDTO.setAllDay(request.getParameter("allDay"));
		}
		//날짜 데이터 (string) => java.sql.Date 타입으로 변환 작업
		Date tempDate = Date.valueOf(request.getParameter("startDate"));
		eDTO.setStartDate(tempDate);
		tempDate = Date.valueOf(request.getParameter("endDate"));
		eDTO.setEndDate(tempDate);
		System.out.println(eDTO);
		eDAO.eventInsert(mapper, eDTO);
		mapper.commit();
		mapper.close();
	}

	public void eventSelectList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("eventSelectList() Method of EventService Class");
		SqlSession mapper = MySession.getSession();
		

		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch (NumberFormatException e) { }
		
//		1 페이지에 표시할 글의 개수를 정함.
		int pageSize = 100;
//		테이블에 젖아된 전체 글의 개수를 얻어온다.
		int totalCount = eDAO.eventSelectCount(mapper);
		System.out.println(totalCount);
		
		EventList eList = new EventList(pageSize, totalCount, currentPage);
		
		HashMap<String, Integer> hmap = new HashMap<>();
		hmap.put("startNo", eList.getStartNo());
		hmap.put("endNo", eList.getEndNo());
		
		eList.setList(eDAO.eventSelectList(mapper, hmap));
		System.out.println("eList: " + eList.getList());
		
		request.setAttribute("eList", eList);
		mapper.close();
	}
	
	
	public void eventSelectArrayList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("eventSelectArrayList() Method of EventService Class");
		SqlSession mapper = MySession.getSession();
		ArrayList<EventDTO> eList = new ArrayList<>();
		
		eList = eDAO.eventSelectArrayList(mapper);
		System.out.println("eList: " + eList);
		
		request.setAttribute("eList", eList);
		mapper.close();
	}
	
	public void workSelectArrayList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("workSelectArrayList() Method of EventService Class");
		SqlSession mapper = MySession.getSession();
		ArrayList<EventDTO> wList = new ArrayList<>();
		
		wList = eDAO.workSelectArrayList(mapper);
//		System.out.println("wList: " + wList); // 확인. // workDTO에 toString override가 없음.
		
		request.setAttribute("wList", wList);
		mapper.close();
	}

	
}
