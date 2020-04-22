package com.yayo.base.mq.exception;

import lombok.Getter;

/**
 * @author created by yzf on 2018/7/12
 */
public class ProcessException extends RuntimeException {

    private static final long serialVersionUID = -4068977263217097908L;

    @Getter
    private String node;

    public ProcessException(String msg) {
        super(msg);
    }

    public ProcessException(String msg, Throwable t) {
        super(msg, t);
    }

    public ProcessException(String node, String msg) {
        super(msg);
        this.node = node;
    }

    public ProcessException(String node, String msg, Throwable t) {
        super(msg, t);
        this.node = node;
    }
}
