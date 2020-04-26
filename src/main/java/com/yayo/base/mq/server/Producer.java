package com.yayo.base.mq.server;

import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.client.exception.MQClientException;
import org.apache.rocketmq.client.producer.DefaultMQProducer;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Slf4j
@Component
public class Producer {

    @Value("${mq.nameServer}")
    private String NAME_SERVER;

    @Value("${mq.producer.producerGroup}")
    private String producerGroup ;

    private DefaultMQProducer producer;

    public Producer(){

    }

//    @PostConstruct
//    public void init(){
//        //示例生产者
//        producer = new DefaultMQProducer(producerGroup);
//        //不开启vip通道 开通口端口会减2
//        producer.setVipChannelEnabled(false);
//        //绑定name server
//        producer.setNamesrvAddr(NAME_SERVER);
//        start();
//    }
    /**
     * 对象在使用之前必须要调用一次，只能初始化一次
     */
    public void start(){
        try {
            //示例生产者
            producer = new DefaultMQProducer(producerGroup);
            //不开启vip通道 开通口端口会减2
            producer.setVipChannelEnabled(false);
            //绑定name server
            producer.setNamesrvAddr(NAME_SERVER);
            this.producer.start();
        } catch (MQClientException e) {
            e.printStackTrace();
        }
    }

    public DefaultMQProducer getProducer(){
        return this.producer;
    }
    /**
     * 一般在应用上下文，使用上下文监听器，进行关闭
     */
    public void shutdown(){
        this.producer.shutdown();
    }
}
