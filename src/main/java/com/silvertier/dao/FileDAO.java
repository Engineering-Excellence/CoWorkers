package com.silvertier.dao;

import com.silvertier.dto.FileDTO;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class FileDAO {

    private static final FileDAO instance = new FileDAO();

    public static FileDAO getInstance() {
        return instance;
    }


    public int fileSelectCount(SqlSession mapper) {
        System.out.println("FileDAO 클래스의 selectCount() 메서드 실행");
        return (int) mapper.selectOne("fileSelectCount");
    }

    public ArrayList<FileDTO> fileSelectNotice(SqlSession mapper) {
        System.out.println("FileDAO 클래스의 selectNotice() 메서드 실행");
        return (ArrayList<FileDTO>) mapper.selectList("fileSelectNotice");
    }

    public List<FileDTO> fileSelectList(SqlSession mapper, HashMap<String, Integer> hashMap) {
        System.out.println("FileDAO 클래스의 selectList() 메서드 실행");
        return (ArrayList<FileDTO>) mapper.selectList("fileSelectList", hashMap);
    }
}
