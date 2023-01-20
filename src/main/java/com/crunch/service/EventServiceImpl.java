package com.crunch.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

import com.crunch.domain.EventDTO;
import com.crunch.mapper.EventMapper;


@Service
@Slf4j
public class EventServiceImpl implements EventService {
	
	@Autowired
	@Setter
	private EventMapper mapper;


	@Override
	public void insert(EventDTO eDTO) {
		log.info("EventServiceImpl의 insert() 실행");
//		log.info("insert : {}", eDTO);
		// 확인
		log.info(eDTO.getStartDate() + "");
		log.info(eDTO.getEndDate() + "");
		log.info(eDTO.getSubject());
		log.info(eDTO.getContent());
		log.info(eDTO.getEventColor());
		log.info(eDTO.getStartDate() + "");
		log.info(eDTO.getEndDate() + "");
		log.info(eDTO.isAllDay() + "");
		// time 처리 -9시간
		//처리
		long longTypeTime = eDTO.getStartDate().getTime() - 1000*60*60*9;
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Timestamp startDate = new Timestamp(longTypeTime);
//		log.info(startDate+"");
		eDTO.setStartDate(startDate);
		log.info(eDTO.getStartDate() + "");
		
		longTypeTime = 0;
		longTypeTime = eDTO.getEndDate().getTime() - 1000*60*60*9;
		Timestamp endDate = new Timestamp(longTypeTime);
//		log.info(endDate + "");
		eDTO.setEndDate(endDate);
		log.info(eDTO.getEndDate() + "");
		
		eDTO.setBorderColor(eDTO.getEventColor());
		
		log.info("insert : {}", eDTO);
//		log.info(eDTO.getStartDate().getClass()+"");
//		log.info(eDTO.getEndDate().getClass()+"");

		//time 처리
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		String test = sdf.format(eDTO.getStartDate());
//		log.info(test);
//		eDTO.setStartDate(Timestamp.valueOf(test));
//		log.info(eDTO.getStartDate() + "");
		
		mapper.insert(eDTO);
	}

	@Override
	public List<EventDTO> selectEList() {
		log.info("EventServiceImpl의 selectEList() 실행");
		List<EventDTO> eList = mapper.selectEList();
//		log.info("eList: " + eList);
		return eList;
	}

	@Override
	public EventDTO selectByEventID(int eventID) {
		log.info("EventServiceImpl의 selectByEventID() 실행");
//		log.info("eventID: " + eventID);
		return mapper.selectByEventID(eventID);
	}

	@Override
	public void delete(int eventID) {
		log.info("EventServiceImpl의 delete() 실행");
//		log.info("eventID: " + eventID);
		mapper.delete(eventID);
	}

	@Override
	public void update(HttpServletRequest request, EventDTO eDTO) {
		log.info("EventServiceImpl의 update() 실행");
    	//time처리
		String sDateTimeStr = "";
		String eDateTimeStr = "";
		String eDTOStartTime = eDTO.getStartDate().toString().substring(11, 16);
		String eDTOEndTime = eDTO.getEndDate().toString().substring(11, 16);
		String reqStartTime = request.getParameter("startTime").substring(0, 5);
		String reqEndTime = request.getParameter("endTime").substring(0, 5);
		
		if (!reqStartTime.equals(eDTOStartTime) && !reqEndTime.equals(eDTOEndTime)) {
			// request의 start 타임과 edot의 startTime이 다르고 request의 endTime과 edot의 endTime이 다를 때 (startTiem, endTime 변동)
			sDateTimeStr = request.getParameter("startDate") + " " + request.getParameter("startTime") + ":00.0" ;
			eDateTimeStr = request.getParameter("endDate") + " " + request.getParameter("endTime") + ":00.0" ;
		} else if (reqStartTime.equals(eDTOStartTime) && !reqEndTime.equals(eDTOEndTime) ) { 
			//request의 start 타임과 edot의 startTime이 같고 request의 endTime과 edot의 endTime이 다를 때 (endTime만 변동)
			sDateTimeStr = request.getParameter("startDate") + " " + request.getParameter("startTime") + ".0" ;
			eDateTimeStr = request.getParameter("endDate") + " " + request.getParameter("endTime") + ":00.0" ;
		} else if (!reqStartTime.equals(eDTOStartTime) && reqEndTime.equals(eDTOEndTime) ) {
			//request의 start 타임과 edot의 startTime이 다르고 request의 endTime과 edot의 endTime이 같을 때 (startTiem만 변동) 
			sDateTimeStr = request.getParameter("startDate") + " " + request.getParameter("startTime") + ":00.0"  ;
			eDateTimeStr = request.getParameter("endDate") + " " + request.getParameter("endTime") + ".0" ;
		} else {//request의 start 타임과 edot의 startTime이 같고 request의 endTime과 edot의 endTime이 같을 때 (시간 변동 없음)
			sDateTimeStr = request.getParameter("startDate") + " " + request.getParameter("startTime") + ".0"  ;
			eDateTimeStr = request.getParameter("endDate") + " " + request.getParameter("endTime") + ".0" ;
		}
		
		// 처리
		eDTO.setStartDate(Timestamp.valueOf(sDateTimeStr));
		eDTO.setEndDate(Timestamp.valueOf(eDateTimeStr));
    	eDTO.setSubject(request.getParameter("subject"));
    	eDTO.setEventColor(request.getParameter("eventColor"));
    	eDTO.setAllDay(Boolean.parseBoolean(request.getParameter("allDay")));
    	eDTO.setContent(request.getParameter("content"));
		mapper.update(eDTO);
		
	}


}



