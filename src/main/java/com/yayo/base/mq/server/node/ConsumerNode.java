package com.yayo.base.mq.server.node;

import org.springframework.stereotype.Component;

import java.lang.annotation.*;

@Documented
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.TYPE})
@Component
public @interface ConsumerNode {
    /**
     * 节点
     * @return
     */
    String code() default "";

}
