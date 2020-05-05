package com.yayo.base.enums;

public enum ErrorTypeEnum {
    SYSTEM_ERROR("system.error","系统错误"),
    SYSTEM_BUSY("system.busy","系统繁忙");

    private String code;

    private String msg;

    public String getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }

    ErrorTypeEnum(String code, String msg){
        this.code = code;
        this.msg = msg;
    }
}
