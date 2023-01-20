package com.crunch.domain;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class UserInfoList {

// 사원목록 페이지 분기 (추후 추가용)	
	
	  private List<UserInfoDTO> list = new ArrayList<>();
	    private int pageSize;
	    private int totalCount;
	    private int currentPage;
	    private int totalPage = 0;
	    private int startNo = 0;
	    private int endNo = 0;
	    private int startPage = 0;
	    private int endPage = 0;

	    public void initUserInfoList(int pageSize, int totalCount, int currentPage) {
	        this.pageSize = pageSize;
	        this.totalCount = totalCount;
	        this.currentPage = currentPage;
	        calculator();
	    }

	    private void calculator() {
	        totalPage = (totalCount - 1) / pageSize + 1;
	        currentPage = Math.min(currentPage, totalPage);
	        startNo = (currentPage - 1) * pageSize + 1;
	        endNo = startNo + pageSize - 1;
	        endNo = Math.min(endNo, totalCount);
	        startPage = (currentPage - 1) / 10 * 10 + 1;
	        endPage = startPage + 9;
	        endPage = Math.min(endPage, totalPage);
	    }
}
