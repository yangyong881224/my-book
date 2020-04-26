package com.yayo.user.facade.node;

import com.yayo.base.mq.server.node.ConsumerNode;
import com.yayo.base.mq.server.node.MessageContext;
import com.yayo.base.mq.server.node.Node;


@ConsumerNode(code = "TestNode")
public class PaperTimerNode implements Node<MessageContext> {

    @Override
    public void execute(MessageContext context) {
        System.out.println("node正在运行");
    }
}
