package com.yayo.base.mq.server;

import com.yayo.base.mq.server.node.Context;
import com.yayo.base.mq.server.node.NodeTrigger;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.client.consumer.listener.ConsumeConcurrentlyContext;
import org.apache.rocketmq.client.consumer.listener.ConsumeConcurrentlyStatus;
import org.apache.rocketmq.common.message.Message;
import org.apache.rocketmq.common.message.MessageExt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.UnsupportedEncodingException;
import java.util.List;


@Component
@Slf4j
public class ConsumeTask {

    @Autowired
    private NodeTrigger nodeTrigger;

    public ConsumeConcurrentlyStatus consumeMessage(List<MessageExt> msgs, ConsumeConcurrentlyContext context) {
        try {
            for (Message msg : msgs) {

                //消费者获取消息 这里只输出 不做后面逻辑处理
                String body = new String(msg.getBody(), "utf-8");
                try{
                    nodeTrigger.fire(msg.getTags(), new Context());
                }catch (Exception e){
                    e.printStackTrace();
                }
                log.info("Consumer-获取消息-主题topic为={}, tags={},消费消息为={}", msg.getTopic(),msg.getTags(), body);
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return ConsumeConcurrentlyStatus.RECONSUME_LATER;
        }
        return ConsumeConcurrentlyStatus.CONSUME_SUCCESS;
    }
}
