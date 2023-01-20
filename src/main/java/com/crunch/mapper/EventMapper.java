package com.crunch.mapper;

import java.util.List;

import com.crunch.domain.*;

public interface EventMapper {

    void insert(EventDTO eventDTO);
    
    List<EventDTO> selectEList();
    
//    List<WorkDTO> selectWList();
    
    EventDTO selectByEventID(int eventID);
    
    void delete(int eventID);
    
    void update(EventDTO eventDTO);

}
