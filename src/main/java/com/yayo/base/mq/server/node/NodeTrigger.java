package com.yayo.base.mq.server.node;

import com.yayo.base.mq.server.profiler.Profiler;
import lombok.extern.slf4j.Slf4j;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author created by yzf on 2018/7/11
 */
@Slf4j
@Component
public class NodeTrigger {

    @Autowired
    private NodeRegistry nodeRegistry;

    public void fire(@NotNull String tags, @NotNull Object context) {
        Node node = nodeRegistry.getNode(tags);
        try {
            Profiler.record(node.getNodeCode());
            node.execute(context);
        }finally {
            Profiler.release();
        }
    }
}
