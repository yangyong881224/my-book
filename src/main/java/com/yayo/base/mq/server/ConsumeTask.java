package com.yayo.base.mq.server;

import com.yayo.base.mq.server.node.MessageContext;
import com.yayo.base.mq.server.node.NodeTrigger;
import com.yayo.base.utils.JsonMapper;
import com.yayo.user.facade.UserMessageContext;
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

    public ConsumeConcurrentlyStatus consumeMessage(List<MessageExt> msgs, ConsumeConcurrentlyContext consumeConcurrentlyContext) {
        try {
            for (Message msg : msgs) {
                //消费者获取消息 这里只输出 不做后面逻辑处理
                String body = new String(msg.getBody(), "utf-8");
                log.info("Consumer-获取消息-主题topic为={}, tags={},消费消息为={}", msg.getTopic(),msg.getTags(), body);
                MessageContext messageContext = JsonMapper.nonEmptyMapper().fromJson(body,MessageContext.class);
                Object context = JsonMapper.nonEmptyMapper().fromJson(body,messageContext.getClazz());
                try{
                    nodeTrigger.fire(msg.getTags(), context);
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return ConsumeConcurrentlyStatus.RECONSUME_LATER;
        }
        return ConsumeConcurrentlyStatus.CONSUME_SUCCESS;
    }
}
