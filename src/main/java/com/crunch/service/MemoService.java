package com.crunch.service;

import com.crunch.domain.MemoDTO;

import java.util.HashMap;
import java.util.List;

public interface MemoService {
    int memoSelectCount();

    void insert(MemoDTO memoDTO);

    void delete(int memoID);

    void deleteOK(int memoID);

    MemoDTO selectByMemoID(int memoID);

    List<MemoDTO> memoList(HashMap<String, Integer> hashMap);

    int memoReceiveCount(int userID);

    int memoSelectDeleteCount(int userID);

    int memoSelectNewCount(int userID);

    int memoSelectImportantCount(int userID);

    int memoSelectMarkedCount(int userID);

    void memoRead(int memoID);

    List<MemoDTO> memoDeletedList(HashMap<String, Integer> hashMap);

    List<MemoDTO> memoNewList(HashMap<String, Integer> hashMap);

    List<MemoDTO> memoImportantList(HashMap<String, Integer> hashMap);

    List<MemoDTO> memoMarkedList(HashMap<String, Integer> hashMap);

    int memoReceiverCount(int userID);

    void memoRestore(int memoID);

    void mark(int memoID);

    void markGG(int memoID);

    MemoDTO selectLastInform(int userID);
}
