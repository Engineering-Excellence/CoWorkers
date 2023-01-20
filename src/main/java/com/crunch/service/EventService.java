package com.crunch.service;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.crunch.domain.EventDTO;

public interface EventService {

    void insert(EventDTO eDTO);
    
    List<EventDTO> selectEList();
    
    EventDTO selectByEventID(int eventID);
    
    void delete(int eventID);
    
//    void update(EventDTO eventDTO);

	void update(HttpServletRequest request, EventDTO eDTO);

}
