package com.silvertier.dao;

import org.apache.ibatis.session.SqlSession;

import com.silvertier.dto.EventDTO;

public class EventDAO {
//	싱글톤 디자인 패턴
	private static EventDAO instance = new EventDAO();
	private EventDAO() {	}
	public static EventDAO getInstance() {
		return instance;
	}
	
	public void insert(SqlSession mapper, EventDTO eDTO) {
		System.out.println("insert() Method of EventDAO Class");
		mapper.insert("insert", eDTO);
	}
	
	

}
