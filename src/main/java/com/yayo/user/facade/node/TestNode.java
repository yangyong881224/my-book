package com.yayo.user.facade.node;

import com.yayo.base.mq.server.node.ConsumerNode;
import com.yayo.base.mq.server.node.Node;

@ConsumerNode(code = "TestNode1")
public class TestNode implements Node<TestMessageContext> {

    @Override
    public void execute(TestMessageContext context) {
        System.out.println("TestNode正在运行    "+ context);
    }
}
