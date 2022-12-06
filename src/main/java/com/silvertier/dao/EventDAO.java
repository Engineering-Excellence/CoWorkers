package com.silvertier.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.silvertier.dto.EventDTO;
import com.silvertier.dto.WorkDTO;

public class EventDAO {
    //	싱글톤 디자인 패턴
    private static EventDAO instance = new EventDAO();

    private EventDAO() {
    }

    public static EventDAO getInstance() {
        return instance;
    }

    public void eventInsert(SqlSession mapper, EventDTO eDTO) {
        System.out.println("insert() Method of EventDAO Class");
//		System.out.println(eDTO);
        mapper.insert("eventInsert", eDTO);
    }

    public int eventSelectCount(SqlSession mapper) {
        System.out.println("eventSelectCount() Method of EventDAO Class");
        return (int) mapper.selectOne("eventSelectCount");
    }

    public ArrayList<EventDTO> eventSelectList(SqlSession mapper, HashMap<String, Integer> hmap) {
        System.out.println("EventSelectList() Method of EventDAO Class");
        return (ArrayList<EventDTO>) mapper.selectList("eventSelectList", hmap);
    }

    public ArrayList<EventDTO> eventSelectArrayList(SqlSession mapper) {
        System.out.println("eventSelectArrayList() Method of EventDAO Class");
        return (ArrayList<EventDTO>) mapper.selectList("eventSelectArrayList");
    }

    public ArrayList<WorkDTO> workSelectArrayList(SqlSession mapper) {
        System.out.println("workSelectArrayList() Method of EventDAO Class");
        return (ArrayList<WorkDTO>) mapper.selectList("workSelectArrayList");
    }

    public EventDTO eventSelectByEventID(SqlSession mapper, int eventID) {
        System.out.println("eventSelectByEventID() Method of EventDAO Class");
        return (EventDTO) mapper.selectOne("eventSelectByEventID", eventID);
    }

    public void eventUpdate(SqlSession mapper, EventDTO eDTO) {
        System.out.println("eventUpdate() Method of EventDAO Class");
//		System.out.println(eDTO);
        mapper.update("eventUpdate", eDTO);

    }

    public void eventDelete(SqlSession mapper, int eventID) {
        System.out.println("eventDelete() Method of EventDAO Class");
        System.out.println(eventID);
        mapper.delete("eventDelete", eventID);
    }

	public ArrayList<EventDTO> selectEList(SqlSession mapper) {
		System.out.println("selectEList() Method of EventDAO Class");
        return (ArrayList<EventDTO>) mapper.selectList("selectEList");
	}


}
