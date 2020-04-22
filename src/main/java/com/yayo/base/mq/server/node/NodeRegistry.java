package com.yayo.base.mq.server.node;

import com.yayo.base.mq.exception.ProcessException;
import org.mapstruct.ap.internal.util.Strings;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.stereotype.Component;
import org.springframework.util.ClassUtils;
import org.springframework.util.CollectionUtils;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.function.Supplier;


@Component
public class NodeRegistry implements ApplicationContextAware {

    private Map<String, Node> nodeMap;

    public Node getNode(String nodeCode) {
        return Optional
                .ofNullable(nodeMap.get(nodeCode))
                .orElseThrow((Supplier<ProcessException>) () -> new ProcessException("consumer.node.code.not.exists:" + nodeCode));
    }


    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        nodeMap = new HashMap<>(16);
        Map<String, Object> beanMap = applicationContext.getBeansWithAnnotation(ConsumerNode.class);
        if (!CollectionUtils.isEmpty(beanMap)) {
            beanMap.forEach((beanName, node) -> {
                ConsumerNode nodeAnnotation = AnnotationUtils.findAnnotation(node.getClass(), ConsumerNode.class);
                if (ClassUtils.isAssignableValue(Node.class, node)) {
                    String nodeCode = Strings.isEmpty(nodeAnnotation.code()) ? node.getClass().getSimpleName() : nodeAnnotation.code();
                    if (nodeMap.containsKey(nodeCode)) {
                        throw new ProcessException("trade.process.node.code.already.exists:" + nodeCode);
                    }
                    nodeMap.put(nodeCode, (Node) node);
                }
            });
        }
    }

}