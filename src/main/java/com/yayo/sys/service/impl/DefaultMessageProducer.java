package com.yayo.sys.service.impl;

import com.yayo.base.mq.exception.MQException;
import com.yayo.base.mq.server.api.MQMessage;
import com.yayo.base.mq.server.node.MessageContext;
import com.yayo.sys.service.MessageProducer;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class DefaultMessageProducer implements MessageProducer {

    @Value("${mq.topic}")
    private String topic;

    @Autowired
    private MQMessage mqMessage;

    public Boolean sendMSG(MessageContext messageContext){
        try {
            mqMessage.sendMSG(topic,"MessageNode",messageContext,0L,0);
            return true;
        } catch (MQException e) {
            e.printStackTrace();
            return false;
        }
    }
}
