package com.yayo.sys.mapper.dataobject;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class MessageType implements Serializable {

    private static final long serialVersionUID = 9156342638161051548L;
    private Long id;
    private String messageType;
    private String messageIcon;
    private Integer viewStatus;
    private Date createdAt;
    private Date updatedAt;

}
