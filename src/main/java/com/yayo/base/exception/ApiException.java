package com.yayo.base.exception;

import com.yayo.base.enums.ErrorTypeEnum;

public class ApiException extends Exception {
    private static final long serialVersionUID = -7723135943395500948L;

    private String errorMsg;
    private String errorCode;


    public ApiException(ErrorTypeEnum errorTypeEnum){
        this(errorTypeEnum.getCode(),errorTypeEnum.getMsg());
    }

    public ApiException(String errorCode,String errorMsg){
        super(errorMsg);
        this.errorCode = errorCode;
        this.errorCode = errorMsg;

    }

    public String getErrorMsg() {
        return errorMsg;
    }

    public String getErrorCode() {
        return errorCode;
    }

    @Override
    public String toString() {
        return "ApiException{" +
                "errorMsg='" + errorMsg + '\'' +
                ", errorCode='" + errorCode + '\'' +
                '}';
    }
}
