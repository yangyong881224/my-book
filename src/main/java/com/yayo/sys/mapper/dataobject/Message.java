package com.yayo.sys.mapper.dataobject;

import lombok.Data;

import java.util.Date;

@Data
public class Message {

    private Long id;
    private Long typeId;
    private Integer sendType;
    private Long userId;
    private String userPhone;

    private String title;
    private String content;
    private Integer sendStatus;

    private Integer examined;
    private Integer examineStatus;

    private String createdBy;
    private Date createdAt;
}
