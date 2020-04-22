package com.yayo.base.mq.server.impl;

import com.yayo.base.mq.exception.MQException;
import com.yayo.base.mq.request.MessageRequest;
import com.yayo.base.mq.server.Producer;
import com.yayo.base.mq.server.api.MQMessage;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.client.exception.MQBrokerException;
import org.apache.rocketmq.client.exception.MQClientException;
import org.apache.rocketmq.client.producer.SendResult;
import org.apache.rocketmq.common.message.Message;
import org.apache.rocketmq.remoting.exception.RemotingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class MessageProducer implements MQMessage {

    @Autowired
    private Producer producer;

    @Override
    public boolean sendMSG(String topic, String tags, MessageRequest messageRequest, Long timeOut, int level) throws MQException {
        log.info("send mq message topic:{},tags:{},request:{}",topic,tags, messageRequest);
        Message message = new Message(topic, tags, messageRequest.getJson().getBytes());
        message.setDelayTimeLevel(level);
        //发送
        try {
            SendResult sendResult = producer.getProducer().send(message);
            log.info("producer send msg result : {}",sendResult);
        } catch (MQClientException | RemotingException | MQBrokerException | InterruptedException e) {
            throw new MQException();
        }
        return true;
    }
}
