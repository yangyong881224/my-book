package com.yayo.sys.service;

import com.yayo.base.mq.server.node.MessageContext;

public interface MessageProducer {

    public Boolean sendMSG(MessageContext messageContext);
}
