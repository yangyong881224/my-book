package com.yayo.user.facade;


import com.yayo.base.mq.server.node.MessageContext;
import lombok.Data;

@Data
public class UserMessageContext extends MessageContext {

    private Integer sendType;
    private Long userId;
    private String userPhone;
    private Long id;
    private Long typeId;
    private String typeName;
    private String typeIcon;
    private String title;
    private String content;

}
