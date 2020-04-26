package com.yayo.sys.controller.request;

import lombok.Data;

@Data
public class MessageCreateRequest {

    private Long typeId;
    private Long userId;
    private String userPhone;
    private Integer sendType;
    private String title;
    private String content;
    private String examined;

}
