package com.crunch.domain;

import lombok.Data;
import org.springframework.stereotype.Component;

@Component
@Data
public class MemoDTO {
    private int memoID;
    private int userID;
    private String userName;
    private String accountID;
    private int receiverID;
    private String content;
    private String subject;
    private java.sql.Date writeDate;
    private int delete;
    private int isnew;
    private int marked;
    private int important;

}