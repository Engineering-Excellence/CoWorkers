package com.crunch.mapper;

import com.crunch.domain.MemoDTO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface MemoMapper {
    void memoInsert(MemoDTO memoDTO);

    void memoDelete(int memoID);

    void memoDeleteOK(int memoID);

    int memoSelectCount();

    List<MemoDTO> memoList(HashMap<String, Integer> hashMap);

    MemoDTO selectByMemoID(int memoID);

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

    void memoMark(int memoID);

    void memoMarkGG(int memoID);

    MemoDTO selectLastInform(int userID);

    List<String> allAccountID();
}
