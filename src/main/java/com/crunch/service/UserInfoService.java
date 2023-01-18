package com.crunch.service;

import com.crunch.domain.UserInfoDTO;

import java.util.List;

public interface UserInfoService {

    void insert(UserInfoDTO userInfoDTO);

    String compareID(String accountID);

    String comparePW(String accountPassword);

    List<UserInfoDTO> select(String accountID);

    int selectUserID(String accountID); // 쪽지 보낸이 ID를 가져오기 위한 메서드
}
