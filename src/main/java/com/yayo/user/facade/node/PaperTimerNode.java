package com.yayo.user.facade.node;

import com.yayo.base.mq.server.node.ConsumerNode;
import com.yayo.base.mq.server.node.Context;
import com.yayo.base.mq.server.node.Node;


@ConsumerNode(code = "TestNode")
public class PaperTimerNode implements Node<Context> {

    @Override
    public void execute(Context context) {
        System.out.println("node正在运行");
    }
}
