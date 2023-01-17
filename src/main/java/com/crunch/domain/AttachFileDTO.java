package com.crunch.domain;

import lombok.Data;
import org.springframework.stereotype.Component;

@Component
@Data
public class AttachFileDTO {

    private String uuid;    // PK, 파일 UUID
    private String fileName;    // 파일명
    private String uploadPath;  // 파일 업로드 경로
    private boolean image;  // 파일 이미지 여부
}
