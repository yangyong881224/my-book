package com.yayo.base.mq.server.node;

import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.util.StringUtils;

public interface Node<Context> {

    /**
     * 节点具体逻辑
     *
     * @param context 执行上下文
     */
    void execute(Context context);

    default String getNodeCode(){
        ConsumerNode processNode = AnnotationUtils.findAnnotation(this.getClass(), ConsumerNode.class);
        if(processNode == null){
            return this.getClass().getSimpleName();
        }
        if(StringUtils.isEmpty(processNode.code())){
            return this.getClass().getSimpleName();
        }
        return processNode.code();
    }
}
