package com.yayo.user.facade.node;

import com.yayo.base.mq.server.node.ConsumerNode;
import com.yayo.base.mq.server.node.Node;
import com.yayo.sys.controller.info.MessageInfo;
import com.yayo.sys.service.MessageService;
import com.yayo.user.facade.UserMessageContext;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;

@ConsumerNode(code = "MessageNode")
@Slf4j
public class MessageNode implements Node<UserMessageContext> {

    @Autowired
    private MessageService messageService;

    @Override
    public void execute(UserMessageContext context) {
        log.info("Message node context:{}",context);
        MessageInfo messageInfo = new MessageInfo();
        messageInfo.setId(context.getId());
        messageInfo.setSendStatus(2);
        Boolean result = false;
        try{
            result = messageService.update(messageInfo);
        }catch (Exception e){
            log.error("send.message.error:{}",e.getStackTrace());
        }finally {
            log.info("send.message.result:{}",result);
            if(!result){
                messageInfo.setSendStatus(0);
                messageService.update(messageInfo);
            }
        }
    }
}
