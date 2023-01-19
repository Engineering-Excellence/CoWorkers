package com.crunch.service;

import com.crunch.domain.MemoDTO;
import com.crunch.mapper.MemoMapper;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
@Slf4j
public class MemoServiceImpl implements MemoService {

    @Setter(onMethod_ = @Autowired)
    private MemoMapper mapper;

    @Override
    public int memoSelectCount() {
        log.info("MemoServiceImpl의 selectCount() 실행");
        return mapper.memoSelectCount();
    }

    @Override
    public void insert(MemoDTO memoDTO) {
        log.info("MemoServiceImpl의 insert() 실행");

        mapper.memoInsert(memoDTO);

    }

    @Override
    public void delete(int memoID) {
        log.info("MemoServiceImpl의 delete() 실행");
        mapper.memoDelete(memoID);
    }

    @Override
    public void deleteOK(int memoID) {
        log.info("MemoServiceImpl의 deleteOK() 실행");
        mapper.memoDeleteOK(memoID);
    }

    @Override
    public List<MemoDTO> memoList(HashMap<String, Integer> hashMap) {
        return mapper.memoList(hashMap);
    }

    @Override
    public int memoReceiveCount(int userID) {
        return mapper.memoReceiveCount(userID);
    }

    @Override
    public int memoSelectDeleteCount(int userID) {
        return mapper.memoSelectDeleteCount(userID);
    }

    @Override
    public int memoSelectNewCount(int userID) {
        return mapper.memoSelectNewCount(userID);
    }

    @Override
    public int memoSelectImportantCount(int userID) {
        return mapper.memoSelectImportantCount(userID);
    }

    @Override
    public int memoSelectMarkedCount(int userID) {
        return mapper.memoSelectMarkedCount(userID);
    }

    @Override
    public void memoRead(int memoID) {
        mapper.memoRead(memoID);
    }

    @Override
    public List<MemoDTO> memoDeletedList(HashMap<String, Integer> hashMap) {
        return mapper.memoDeletedList(hashMap);
    }

    @Override
    public List<MemoDTO> memoNewList(HashMap<String, Integer> hashMap) {
        return mapper.memoNewList(hashMap);
    }

    @Override
    public List<MemoDTO> memoImportantList(HashMap<String, Integer> hashMap) {
        return mapper.memoImportantList(hashMap);
    }

    @Override
    public List<MemoDTO> memoMarkedList(HashMap<String, Integer> hashMap) {
        return mapper.memoMarkedList(hashMap);
    }

    @Override
    public int memoReceiverCount(int userID) {
        return mapper.memoReceiverCount(userID);
    }

    @Override
    public void memoRestore(int memoID) {
        mapper.memoRestore(memoID);
    }

    @Override
    public void mark(int memoID) {
        mapper.memoMark(memoID);
    }

    @Override
    public void markGG(int memoID) {
        mapper.memoMarkGG(memoID);
    }

    @Override
    public MemoDTO selectByMemoID(int memoID) {
        return mapper.selectByMemoID(memoID);
    }

    @Override
    public MemoDTO selectLastInform(int userID) {
        return mapper.selectLastInform(userID);
    }

    @Override
    public List<String> allAccountID() {
        return mapper.allAccountID();
    }


}
