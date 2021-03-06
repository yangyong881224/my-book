package com.yayo.starter;

import com.google.common.collect.Maps;
import com.yayo.base.mq.exception.MQException;
import com.yayo.base.mq.request.MessageRequest;
import com.yayo.base.mq.server.Consumer;
import com.yayo.base.mq.server.Producer;
import com.yayo.base.mq.server.api.MQMessage;
import com.yayo.base.mq.server.node.ConsumerNode;
import com.yayo.base.mq.server.node.MessageContext;
import com.yayo.base.mq.server.node.Node;
import com.yayo.base.mq.server.node.NodeTrigger;
import com.yayo.user.facade.UserMessageContext;
import com.yayo.user.facade.node.TestMessageContext;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.client.producer.SendResult;
import org.apache.rocketmq.common.message.Message;
import org.assertj.core.util.Lists;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
@ComponentScan("com.yayo")
public class MQTests {

    @Autowired
    private MQMessage mqMessage;

    @Autowired
    private Producer producer;

    @Autowired
    private NodeTrigger nodeTrigger;

    private List<String> messageList;

    public MQTests(){
        messageList = Lists.newArrayList();
        messageList.add("123");
        messageList.add("qwe");
        messageList.add("asd");
        messageList.add("ddgf");
    }

    @Autowired
    private Consumer consumer;

    @Test
    public void testProducer() throws Exception{
        //总共发送五次消息
        for (String s : messageList) {
            //创建生产信息
            Message message = new Message("mytest", "Test"+s, ("Test:" + s).getBytes());
            message.setDelayTimeLevel(3);
            //发送
            SendResult sendResult = producer.getProducer().send(message);
            log.info("输出生产者信息={}",sendResult);
        }
        log.info("成功");

        Thread.sleep(20 * 1000);
        log.info("完事");
    }

    @Test
    public void test() throws MQException {
        TestMessageContext testMessageContext = new TestMessageContext();
        testMessageContext.setClazz(TestMessageContext.class);
        testMessageContext.setTitle("123123123213213123123");
        mqMessage.sendMSG("mytest","TestNode1",testMessageContext,1000L,0);
        try {
            Thread.sleep(30 * 1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }


    @Test
    public void nodeTest(){
        nodeTrigger.fire("TestNode",new MessageContext());
    }


}
