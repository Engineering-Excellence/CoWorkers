package com.crunch.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crunch.service.EventService;

import com.crunch.domain.EventDTO;
import com.crunch.mapper.BoardCommentMapper;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/event")
@Slf4j
public class CalendarController {
	
	@Setter(onMethod_ = @Autowired)
	private EventService service;
	
	@RequestMapping(value="/calendar", method = RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> calendarList(){
		log.info("calendarList()");
		List<EventDTO> eList = service.selectEList();
//		log.info(eList + "");
//		log.info("eList.get(0).getStartDate(): " + eList.get(0).getStartDate() );
		
		//time 처리용
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String startDate;
		String endDate;
		
		//json 배열 처리용.
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		
		for (int i=0; i < eList.size(); i++) {
			// eList 처리
			hmap.put("id", eList.get(i).getEventID());	
			hmap.put("title", eList.get(i).getSubject());	
			
			// time 처리
			startDate = sdf.format(eList.get(i).getStartDate());
			startDate = startDate.substring(1, startDate.length());
			startDate = "2" + startDate;
			startDate = startDate.replace(" ", "T");
			endDate = sdf.format(eList.get(i).getEndDate());
			endDate = endDate.substring(1, endDate.length());
			endDate = "2" + endDate;
			endDate = endDate.replace(" ", "T");
//			log.info("startDate: " + startDate); 
//			log.info("endDate: " + endDate);
			hmap.put("start", startDate); 
			hmap.put("end", endDate); 
			hmap.put("backgroundColor", eList.get(i).getEventColor());
			hmap.put("borderColor", "#FFFFFF"); 
			hmap.put("textColor", "#000000");	
			if(eList.get(i).isAllDay() == true) {
				hmap.put("allDay", true);	
			} else {
				hmap.put("allDay", eList.get(i).isAllDay());	
			}
			// json 배열 객체 
			jsonObj = new JSONObject(hmap);	//{}, {key:value, key:value, ...}
			jsonArr.add(jsonObj);	//[], [{key:value, key:value, ...}]
		}
//		log.info("jsonArrcheck: {}", jsonArr);
		return jsonArr;
	}
	
	// 이벤트 추가
	@RequestMapping(value="/insertEvent", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public void insertEvent(@RequestBody EventDTO eDTO){
		log.info("insertEvent()");
		//처리
		service.insert(eDTO);
	}

}
