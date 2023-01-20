package com.crunch.service;

import com.crunch.domain.UserInfoDTO;
import com.crunch.mapper.UserInfoMapper;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class UserInfoServiceImpl implements UserInfoService {

    // 인스턴스 변수(mapper)에 알맞은 타입의 객체(UserInfoMapper)를 자동으로 주입하는 어노테이션
    @Setter(onMethod_ = @Autowired)
    private UserInfoMapper mapper;

    // 회원가입 정보 insert
    @Override
    public void insert(UserInfoDTO userInfoDTO) {

        log.info("UserInfoServiceImpl의 userInfoInsert() 실행");

        mapper.userInfoInsert(userInfoDTO);
    }

    // 로그인 시 ID 비교
    @Override
    public String compareID(String accountID) {

        log.info("UserInfoServiceImpl의 userInfoCompareID() 실행");

        return mapper.userInfoCompareID(accountID);
    }

    // 로그인 시 PW 비교
    @Override
    public String comparePW(String accountPassword) {

        log.info("UserInfoServiceImpl의 userInfoComparePW() 실행");

        return mapper.userInfoComparePW(accountPassword);
    }

    // 유저 1인 정보 가져오기
    @Override
    public List<UserInfoDTO> select(String accountID) {

        log.info("UserInfoServiceImpl의 userInfoComparePW() 실행");

        return mapper.userInfoSelect(accountID);
    }

    // 쪽지 보낸이 ID를 가져오기 위한 메서드
    @Override
    public int selectUserID(String accountID) {
        return mapper.selectUserID(accountID); 
    }
    
 // 회원가입 ID 중복 비교
    @Override
    public int accountIDCount(String accountID) {
    	
    	log.info("UserInfoServiceImpl의 userInfoAccountIDCount() 실행");
    	// log.info("service ID :" + accountID);
    	
    	int idResult = mapper.userInfoAccountIDCount(accountID);
    	
		// log.info("service impl accountID: " + accountID);
		// log.info("service impl idResult: " + idResult);
    	
    	return idResult;
    }
    
    // 회원가입 주민등록번호 중복 비교
    @Override
    public int registerNumberCount(String registerNumber) {
    	
    	log.info("UserInfoServiceImpl의 registerNumberCount() 실행");
    	
    	int regResult = mapper.userInfoRegisterNumberCount(registerNumber);
    	
    	// log.info("service impl regResult: " + regResult);
    	
    	return regResult;
    }

    // 사원목록 리스트 가져오기
	@Override
	public List<UserInfoDTO> getUserInfoList() {

		log.info("UserInfoServiceImpl의 getUserInfoList() 실행");
		
		return mapper.getUserInfoList();
	}

    // ID 찾기 이름 비교
	@Override
	public String findIdByName(String userName) {

		log.info("UserInfoServiceImpl의 findIdByName() 실행");
		
		return mapper.userInfoFindIdByName(userName);
	}

    // ID 찾기 메일 비교
	@Override
	public String findIdByMail(String email) {

		log.info("UserInfoServiceImpl의 findIdByMail() 실행");
		
		return mapper.userInfoFindIdByMail(email);
	}

    // PW 찾기 아이디 비교
	@Override
	public String findPwById(String accountID) {

		log.info("UserInfoServiceImpl의 findPwById() 실행");
		
		return mapper.userInfoFindPwById(accountID);
	}

    // PW 찾기 이름 비교
	@Override
	public String findPwByName(String userName) {

		log.info("UserInfoServiceImpl의 findPwByName() 실행");
		
		return mapper.userInfoFindPwByName(userName);
	}

    // PW 찾기 메일 비교
	@Override
	public String findPwByMail(String email) {

		log.info("UserInfoServiceImpl의 findPwByMail() 실행");
		
		return mapper.userInfoFindPwByMail(email);
	}
}
