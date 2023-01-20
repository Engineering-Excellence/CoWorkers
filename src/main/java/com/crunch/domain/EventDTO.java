package com.crunch.domain;

import lombok.*;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

//캘린더에 표시하는 일정 DTO
@Component
@Data
@Getter
@Setter
@ToString
public class EventDTO {

    private int eventID; //PK, 일정 번호
    private int groupID; //일정 그룹 
    
    private String subject;    // 일정 제목
    private String userName ="emma";
    private String content;    // 일정 내용
    private String eventColor;    //	일정(스케줄) 별 색(16진수rbc값), 일정의 backgroundColor
    private boolean allDay = false; // all day 일정 이벤트 여부 => 값 : y/n
    
    private String textColor = "black";
    private String borderColor = eventColor; // eventColor와 동일
    
    private Timestamp startDate;    // 일정 시작하는 날짜, start
    private Timestamp endDate;    // 일정 끝나는 날짜, end
    private java.sql.Date writeDate;    //작성일
    private java.sql.Date updateDate;    //수정일
    private java.sql.Date deleteDate;    //삭제일
    private int hit = 0;    //	일정(스케줄) 내용 조회수
    private String ip;    //작성자 ip
    private int userID=1111; //FK, 사번(작성자)
    private int commentCount=0;
    
    private String view;

}
