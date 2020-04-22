package com.yayo.base.mq.server.api;

import com.yayo.base.mq.exception.MQException;
import com.yayo.base.mq.request.MessageRequest;

public interface MQMessage {
    boolean sendMSG(String topic, String tags, MessageRequest messageRequest, Long timeOut, int level) throws MQException;
}
