package com.yayo.user.facade.node;

import com.yayo.base.mq.server.node.ConsumerNode;
import com.yayo.base.mq.server.node.Node;
import com.yayo.sys.mapper.UserDao;
import com.yayo.sys.mapper.dataobject.User;
import com.yayo.user.facade.UserMessageContext;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@ConsumerNode(code = "MessageNode")
@Slf4j
public class MessageNode implements Node<UserMessageContext> {

    @Autowired
    private UserDao userDao;

    @Override
    public void execute(UserMessageContext context) {
        try {
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        log.info("message node context:{}",context);
    }
}
