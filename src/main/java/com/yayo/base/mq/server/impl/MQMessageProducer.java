package com.yayo.base.mq.server.impl;

import com.yayo.base.mq.exception.MQException;
import com.yayo.base.mq.server.Producer;
import com.yayo.base.mq.server.api.MQMessage;
import com.yayo.base.mq.server.node.MessageContext;
import com.yayo.base.utils.JsonMapper;
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
public class MQMessageProducer implements MQMessage {

    @Autowired
    private Producer producer;

    @Override
    public boolean sendMSG(String topic, String tags, MessageContext context, Long timeOut, int level) throws MQException {
        log.info("send mq message topic:{},tags:{},request:{}",topic,tags, context);
        String json = JsonMapper.nonEmptyMapper().toJson(context);
        Message message = new Message(topic, tags, json.getBytes());
        message.setDelayTimeLevel(level);
        //发送
        try {
            producer.start();
            SendResult sendResult = producer.getProducer().send(message);
            log.info("producer send msg result : {}",sendResult);
        } catch (MQClientException | RemotingException | MQBrokerException | InterruptedException e) {
            throw new MQException();
        }finally {
            producer.shutdown();
        }
        return true;
    }
}
