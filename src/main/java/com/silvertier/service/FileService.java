package com.silvertier.service;

import com.silvertier.dao.FileDAO;
import com.silvertier.dto.FileDTO;
import com.silvertier.dto.FileList;
import com.silvertier.mybatis.MySession;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;

public class FileService {

    private static final FileService instance = new FileService();

    public static FileService getInstance() {
        return instance;
    }

    private final FileDAO dao = FileDAO.getInstance();

    public void fileSelectList(HttpServletRequest request, HttpServletResponse response) {

        System.out.println("FileService 클래스의 selectList() 메서드 실행");
        SqlSession mapper = MySession.getSession();

        int currentPage = 1;
        try {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        } catch (NumberFormatException e) {
        }

        int pageSize = 10;
        int totalCount = dao.fileSelectCount(mapper);

        ArrayList<FileDTO> notice = dao.fileSelectNotice(mapper);
        FileList fileList = new FileList(pageSize, totalCount, currentPage);

        HashMap<String, Integer> hashMap = new HashMap<>();
        hashMap.put("startNo", fileList.getStartNo());
        hashMap.put("endNo", fileList.getEndNo());
        fileList.setList(dao.fileSelectList(mapper, hashMap));

        request.setAttribute("notice", notice);
        request.setAttribute("fileList", fileList);

        mapper.close();
        
    }
}
