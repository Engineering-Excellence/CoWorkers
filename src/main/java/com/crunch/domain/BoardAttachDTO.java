package com.crunch.domain;

import lombok.Data;
import org.springframework.stereotype.Component;

@Component
@Data
public class BoardAttachDTO {

    private String uuid;
    private String uploadPath;
    private String fileName;
    private boolean fileType;

    private int postID;
}
