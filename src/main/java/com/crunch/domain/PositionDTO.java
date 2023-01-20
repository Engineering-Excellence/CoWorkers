package com.crunch.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class PositionDTO {

	private int positionCode; // PK, 직급번호
	private String positionName; // 직급(사원 ~ 대표)
	private String admin; // 관리자 권환
	
}
