package com.silvertier.dao;


import com.silvertier.dto.WorkDTO;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Logger;

public class WorkDAO {
    Logger logger = Logger.getLogger(this.getClass().getName());
    private static WorkDAO instance = new WorkDAO();

    private WorkDAO() {

    }

    public static WorkDAO getInstance() {
        return instance;
    }
    public void insert(SqlSession mapper, WorkDTO dto) {
        System.out.println("dao insert()");
        mapper.insert("insert", dto);
    }


    public int selectCount(SqlSession mapper) {
        System.out.println("dao selectCount()");
        return (int) mapper.selectOne("selectCount");
    }

    public ArrayList<WorkDTO> selectList(SqlSession mapper, HashMap<String, Integer> hmap) {
        System.out.println("dao selectList()");
        return (ArrayList<WorkDTO>) mapper.selectList("selectList", hmap);
    }

    public ArrayList<WorkDTO> selectEmergency(SqlSession mapper) {
        System.out.println("dao selectEmergency()");
        return (ArrayList<WorkDTO>) mapper.selectList("selectEmergency");
    }


}
