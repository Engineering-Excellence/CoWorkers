package com.silvertier.service;

import com.silvertier.dao.WorkDAO;
import com.silvertier.dto.WorkDTO;
import com.silvertier.dto.WorkList;
import com.silvertier.mybatis.MySession;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

public class WorkService {
    private static WorkService instance = new WorkService();

    private WorkService() {

    }
    private WorkDAO dao = WorkDAO.getInstance();
    public static WorkService getInstance() {
        return instance;
    }


    public void insert(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("service insert()");
        SqlSession mapper = MySession.getSession();
        WorkDTO dto = new WorkDTO();
        dto.setIp(request.getRemoteAddr());
        dto.setSubject(request.getParameter("subject"));
        dto.setContent(request.getParameter("content"));
        dto.setPriority(Integer.parseInt(request.getParameter("priority")));
        dto.setCurrentProgress(Integer.parseInt(request.getParameter("currentProgress")));
        dto.setWorkProgress(Integer.parseInt(request.getParameter("workProgress")));
        dto.setStartDate(Date.valueOf(request.getParameter("startDate")));
        dto.setDeadline(Date.valueOf(request.getParameter("deadline")));
//        dto.setUserName(request.getParameter("userName"));
//        dto.setPositionCode(request.getParameter("userID"));
        dao.insert(mapper, dto);

        mapper.commit();
        mapper.close();
    }



    public void selectList(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("Service selectList()");
        SqlSession mapper = MySession.getSession();

        int currentPage = 1;
        try {
            System.out.println("currentPage: " + request.getParameter("currentPage"));
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        } catch (NumberFormatException e) {
//            e.printStackTrace();
        }


        int pageSize = 10;
        int totalCount = dao.selectCount(mapper);
        System.out.println("totalCount: "+totalCount);

        WorkList workList = new WorkList(pageSize, totalCount, currentPage);

        HashMap<String, Integer> hmap = new HashMap<>();
        hmap.put("startNo", workList.getStartNo());
        hmap.put("endNo", workList.getEndNo());

        workList.setList(dao.selectList(mapper, hmap));
        System.out.println("list: " + workList.getList());

        request.setAttribute("workList", workList);

        mapper.close();

    }


    public void selectEmergency(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("service selectEmergency()");
        SqlSession mapper = MySession.getSession();
        ArrayList<WorkDTO> emergency = dao.selectEmergency(mapper);
        request.setAttribute("emergency", emergency);
        System.out.println("emergency: " + emergency);
        mapper.close();
    }
}