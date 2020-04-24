package com.yayo.sys.controller.dto;

import lombok.Data;

@Data
public class MessageTypeDTO {

    private Long id;
    private String messageType;
    private String messageIcon;
    private Integer viewStatus;
}
