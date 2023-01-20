package com.crunch.controller;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.crunch.domain.EventDTO;
import com.crunch.service.EventService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@AllArgsConstructor
@Slf4j
public class EventController {

	@Setter
    private EventService service;

//	calendar 뷰로
    @RequestMapping("/event")
    public String event() {
    	log.info("event()");
    	return "event/event";
    }
    
//  개별 일정 페이지로 
    @RequestMapping("/eventView")
    public String eventView(HttpServletRequest request, Model model) {
    	log.info("eventView()");
    	
    	int eventID = Integer.parseInt(request.getParameter("eventID"));
    	EventDTO eDTO = service.selectByEventID(eventID);
    	model.addAttribute("eDTO", eDTO);
		model.addAttribute("enter", "\n");
    	return "event/eventView";
    }
    
//  일정 페이지에서 삭제 요청
    @RequestMapping("/eventDelete")
    public String eventDelete(HttpServletRequest request, Model model) {
    	log.info("eventDelete()");
    	String view = request.getParameter("view");
    	service.delete(Integer.parseInt(request.getParameter("eventID")));
    	model.addAttribute("view", view);
    	
    	return "redirect:event";
    }
    
//  개별 일정 수정 페이지로
    @RequestMapping("/eventUpdate")
    public String eventUpdate(HttpServletRequest request, Model model) {
    	log.info("eventUpdate()");
    	String view = request.getParameter("view");
    	int eventID = Integer.parseInt(request.getParameter("eventID"));
    	log.info("view: " + view);
    	log.info("eventID: " + eventID);
    	EventDTO eDTO = service.selectByEventID(eventID);
    	//time 처리
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String startDate = sdf.format(eDTO.getStartDate());
		startDate = startDate.substring(1, startDate.length());
		startDate = "2" + startDate;
		String startTime = startDate.substring(11, startDate.length());
		startDate = startDate.substring(0, 10);
		String endDate = sdf.format(eDTO.getEndDate());
		endDate = endDate.substring(1, endDate.length());
		endDate = "2" + endDate;
		String endTime = endDate.substring(11, endDate.length());
		endDate = endDate.substring(0, 10);
    	
    	model.addAttribute("eDTO", eDTO);
		model.addAttribute("enter", "\r\n");
    	model.addAttribute("view", view);
    	model.addAttribute("startDate", startDate);
    	model.addAttribute("startTime", startTime);
    	model.addAttribute("endDate", endDate);
    	model.addAttribute("endTime", endTime);
    	return "event/eventUpdate";
    }
    
//  수정 페이지에서 update 요청
    @RequestMapping("/eventUpdateOK")
    public String eventUpdateOK(HttpServletRequest request, Model model) {
    	log.info("eventUpdateOK()");
    	String view = request.getParameter("view");
    	int eventID = Integer.parseInt(request.getParameter("eventID"));
    	// bring eDTO by eventID.
    	EventDTO eDTO = service.selectByEventID(eventID);
//    	log.info("eDTO: " + eDTO);
    	
    	// time 처리 및 기타 처리 후 mapper에 update 요청을 넣는 함수 update()를 서비스에 요청.
    	service.update(request, eDTO);
    	model.addAttribute("enter", "\r\n");
    	model.addAttribute("view", view);
    	model.addAttribute("eventID", eventID);
    	return "redirect:eventView";
    }



}
