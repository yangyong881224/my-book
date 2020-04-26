package com.yayo.base.mq.server.api;

import com.yayo.base.mq.exception.MQException;
import com.yayo.base.mq.server.node.MessageContext;

public interface MQMessage {
    boolean sendMSG(String topic, String tags, MessageContext context, Long timeOut, int level) throws MQException;
}
