package com.yayo.base.mq.server;

import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.client.consumer.DefaultMQPushConsumer;
import org.apache.rocketmq.client.consumer.listener.ConsumeConcurrentlyContext;
import org.apache.rocketmq.client.consumer.listener.ConsumeConcurrentlyStatus;
import org.apache.rocketmq.client.consumer.listener.MessageListenerConcurrently;
import org.apache.rocketmq.client.exception.MQClientException;
import org.apache.rocketmq.common.consumer.ConsumeFromWhere;
import org.apache.rocketmq.common.message.MessageExt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.List;

@Slf4j
@Component
public class Consumer {

    @Value("${mq.nameServer}")
    private String NAME_SERVER;

    @Value("${mq.topic}")
    private String TOPIC;

    /**
     * 消费者组
     */
    @Value("${mq.consumer.list.consumerGroup}")
    private String CONSUMER_GROUP;

    @Autowired
    private ConsumeTask consumeTask;



    /**
     * 初始化consumer
     * @throws MQClientException
     */
    @PostConstruct
    public void init() throws MQClientException {

        DefaultMQPushConsumer consumer = new DefaultMQPushConsumer(CONSUMER_GROUP);
        consumer.setNamesrvAddr(NAME_SERVER);
        //消费模式:一个新的订阅组第一次启动从队列的最后位置开始消费 后续再启动接着上次消费的进度开始消费
        consumer.setConsumeFromWhere(ConsumeFromWhere.CONSUME_FROM_LAST_OFFSET);
        //订阅主题和 标签（ * 代表所有标签)下信息
        consumer.subscribe(TOPIC, "*");
        // //注册消费的监听 并在此监听中消费信息，并返回消费的状态信息
        consumer.registerMessageListener((MessageListenerConcurrently) // msgs中只收集同一个topic，同一个tag，并且key相同的message
                // 会把不同的消息分别放置到不同的队列中
                //消费者获取消息 这里只输出 不做后面逻辑处理
                consumeTask::consumeMessage);
        consumer.start();
        log.info("================RocketMQ Consumer start==============");
    }

}
