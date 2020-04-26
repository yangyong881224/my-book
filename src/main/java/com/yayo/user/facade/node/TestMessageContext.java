package com.yayo.user.facade.node;

import com.yayo.base.mq.server.node.MessageContext;
import lombok.Data;

@Data
public class TestMessageContext extends MessageContext {
    private String title;
}
