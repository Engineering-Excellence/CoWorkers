package com.silvertier.service;
import java.sql.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.ibatis.session.SqlSession;
import com.silvertier.dao.EventDAO;
import com.silvertier.dto.EventDTO;
import com.silvertier.mybatis.MySession;

public class EventService {
	
	private static EventService instance = new EventService();
	private EventService() { }
	public static EventService getInstance() {
		return instance;
	}
	
	//자주 호출하는 클래스 객체 미리 선언.
	private EventDAO dao = EventDAO.getInstance();
	private EventDTO eDTO = new EventDTO();
	
	public void eventInsert(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("insert() Method of EventService Class");
		SqlSession mapper = MySession.getSession();
		
//		event.jsp에서 입력한 request 객체에 저장되어 넘어오는 데이터를 받아서 EventDTO 클래스 객체에 저장한다.
		eDTO.setSubject(request.getParameter("subject"));
		eDTO.setProjectColor(request.getParameter("projectColor"));
		eDTO.setContent(request.getParameter("content"));
		eDTO.setIp(request.getParameter("ip"));
		//isAllDay의 값이 "yes"일 경우에만 값을 받아와서 EventDTO 클래스 객체에 저장한다. 
		if(request.getParameter("isAllDay").equals("yes")) {
			eDTO.setIsAllDay(request.getParameter("isAllDay"));
		}
		//날짜 데이터 (string) => java.sql.Date 타입으로 변환 작업
		Date tempDate = Date.valueOf(request.getParameter("startDate"));
		eDTO.setStartDate(tempDate);
		tempDate = Date.valueOf(request.getParameter("endDate"));
		eDTO.setEndDate(tempDate);
		System.out.println(eDTO);
		dao.eventInsert(mapper, eDTO);
		mapper.commit();
		mapper.close();
	}

	
}
