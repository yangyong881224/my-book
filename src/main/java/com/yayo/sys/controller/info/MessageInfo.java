package com.yayo.sys.controller.info;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class MessageInfo implements Serializable {
    private static final long serialVersionUID = 7418370524681697504L;

    private Long id;
    private Long typeId;
    private String typeName;
    private Integer sendType;
    private Long userId;
    private String userPhone;

    private String title;
    private String content;
    private Integer sendStatus;

    private Integer examined;
    private Integer examineStatus;

    private Date createdAt;
}
