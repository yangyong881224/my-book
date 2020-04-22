package com.yayo.base.mq.utils;

import com.yayo.base.mq.server.ConsumeTask;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component
public class MqUtils {

    @Autowired
    private ConsumeTask consumeTask;

    @PostConstruct
    public void init(){
        MqUtils.getInstance().consumeTask = this.consumeTask;
    }

    /**
     * Singleton  Start
     */
    private static class SingletonHolder{
        private static final MqUtils INSTANCE = new MqUtils();
    }

    private MqUtils(){}

    public static final MqUtils getInstance(){
        return SingletonHolder.INSTANCE;
    }

    /**
     * impplements singleton end
     * @return
     */
    public ConsumeTask getConsumeTask(){
        return MqUtils.getInstance().consumeTask;
    }

}
