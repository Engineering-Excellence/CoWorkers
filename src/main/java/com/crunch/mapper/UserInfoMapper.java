package com.crunch.mapper;

import com.crunch.domain.UserInfoDTO;

import java.util.List;

public interface UserInfoMapper {

    void userInfoInsert(UserInfoDTO userInfoDTO);

    String userInfoCompareID(String accountID);

    String userInfoComparePW(String accountPassword);

    List<UserInfoDTO> userInfoSelect(String accountID);

    int selectUserID(String accountID); // 쪽지 보낸이 ID를 가져오기 위한 메서드
}
