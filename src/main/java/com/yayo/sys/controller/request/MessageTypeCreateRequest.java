package com.yayo.sys.controller.request;

import lombok.Data;

@Data
public class MessageTypeCreateRequest {

    private Long id;

    private String messageIcon;

    private String messageType;

    private Integer viewStatus;
}
