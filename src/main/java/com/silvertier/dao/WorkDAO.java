package com.silvertier.dao;


import com.silvertier.dto.WorkDTO;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Logger;

//조우철
public class WorkDAO {
    Logger logger = Logger.getLogger(this.getClass().getName());
    private static WorkDAO instance = new WorkDAO();

    private WorkDAO() {

    }

    public static WorkDAO getInstance() {
        return instance;
    }

    public void workInsert(SqlSession mapper, WorkDTO dto) {
        System.out.println("dao insert()");
        mapper.insert("workInsert", dto);
    }


    public int workSelectCount(SqlSession mapper) {
        System.out.println("dao selectCount()");
        return (int) mapper.selectOne("workSelectCount");
    }

    public ArrayList<WorkDTO> workSelectList(SqlSession mapper, HashMap<String, Integer> hmap) {
        System.out.println("dao selectList()");
        return (ArrayList<WorkDTO>) mapper.selectList("workSelectList", hmap);
    }

    public ArrayList<WorkDTO> workSelectPriority(SqlSession mapper) {
        System.out.println("dao selectPriority()");
        return (ArrayList<WorkDTO>) mapper.selectList("workSelectPriority");
    }


    public WorkDTO workSelectByWorkID(SqlSession mapper, int workID) {
        System.out.println("dao selectByWorkID()");
        return (WorkDTO) mapper.selectOne("workSelectByWorkID", workID);
    }

    public void workDelete(SqlSession mapper, int workID) {
        System.out.println("dao delete()");
        mapper.delete("workDelete", workID);
    }

    public void workUpdate(SqlSession mapper, WorkDTO dto) {
        System.out.println("dao update()");
        mapper.update("workUpdate", dto);
    }
}
