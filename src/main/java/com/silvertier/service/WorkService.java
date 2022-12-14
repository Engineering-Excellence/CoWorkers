package com.silvertier.service;

import com.silvertier.dao.WorkDAO;
import com.silvertier.dto.WorkDTO;
import com.silvertier.dto.WorkList;
import com.silvertier.mybatis.MySession;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

//조우철
public class WorkService {
    private static WorkService instance = new WorkService();

    private WorkService() {

    }

    private WorkDAO dao = WorkDAO.getInstance();

    public static WorkService getInstance() {
        return instance;
    }


    public void workInsert(HttpServletRequest request, HttpServletResponse response) {
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

        dto.setUserName(request.getParameter("userName"));

        dto.setUserID(Integer.parseInt(request.getParameter("userID")));

        System.out.println("userID : " + request.getParameter("userID"));

        dao.workInsert(mapper, dto);


        mapper.commit();
        mapper.close();
    }


    public void workSelectList(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("Service selectList()");
        SqlSession mapper = MySession.getSession();

        int currentPage = 1;
        try {
//            System.out.println("넘어온 페이지 번호 : " + request.getParameter("currentPage"));
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
//            System.out.println("넘어온 페이지 번호 : " + request.getParameter("currentPage"));
        } catch (NumberFormatException e) {
//            e.printStackTrace();
        }


        int pageSize = 10;
        int totalCount = dao.workSelectCount(mapper);
//        System.out.println("totalCount: " + totalCount);

        WorkList workList = new WorkList(pageSize, totalCount, currentPage);

        HashMap<String, Integer> hmap = new HashMap<>();
        hmap.put("startNo", workList.getStartNo());
        hmap.put("endNo", workList.getEndNo());

        workList.setList(dao.workSelectList(mapper, hmap));
//        System.out.println("list: " + workList.getList());

        request.setAttribute("workList", workList);

        mapper.close();

    }


    public void workSelectPriority(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("Service selectPriority()");
        SqlSession mapper = MySession.getSession();

        ArrayList<WorkDTO> priority = dao.workSelectPriority(mapper);
//        System.out.println("priority: " + priority);

        request.setAttribute("priority", priority);

        mapper.close();


    }

    public void workSelectByWorkID(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("Service selectByWorkID()");
        SqlSession mapper = MySession.getSession();

        int workID = Integer.parseInt(request.getParameter("workID"));
//        System.out.println("workID: " + workID);
        int currentPage = Integer.parseInt(request.getParameter("currentPage"));

        WorkDTO dto = dao.workSelectByWorkID(mapper, workID);
        request.setAttribute("dto", dto);
        request.setAttribute("currentPage", currentPage);


        mapper.close();
    }


    public void workDelete(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("Service delete()");
        SqlSession mapper = MySession.getSession();

        int workID = Integer.parseInt(request.getParameter("workID"));
//        System.out.println("workID: " + workID);
        dao.workDelete(mapper, workID);

        mapper.commit();
        mapper.close();
    }

    public void workUpdate(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("Service update()");
        System.out.println(request.getMethod());


        System.out.println(request.getParameterMap());
        Map<String, String[]> map = request.getParameterMap();
        Iterator<Map.Entry<String, String[]>> itr = map.entrySet().iterator();
        while (itr.hasNext()) {
            Map.Entry<String, String[]> entry = itr.next();
            System.out.println(String.format("%s : %s", entry.getKey(), String.join(", ", entry.getValue())));
        }


        SqlSession mapper = MySession.getSession();
        WorkDTO dto = new WorkDTO();
        dto.setContent(request.getParameter("content"));
        dto.setPriority(Integer.parseInt(request.getParameter("priority")));
        dto.setSubject(request.getParameter("subject"));
        dto.setStartDate(Date.valueOf(request.getParameter("startDate")));
        dto.setDeadline(Date.valueOf(request.getParameter("deadline")));
        dto.setIp(request.getRemoteAddr());
        dto.setWorkProgress(Integer.parseInt(request.getParameter("workProgress")));
        dto.setCurrentProgress(Integer.parseInt(request.getParameter("currentProgress")));
        dto.setWorkID(Integer.parseInt(request.getParameter("workID")));


        dao.workUpdate(mapper, dto);
        mapper.commit();
        mapper.close();
    }
}