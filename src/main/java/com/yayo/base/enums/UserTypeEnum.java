package com.yayo.base.enums;

import lombok.Getter;

public enum UserTypeEnum {
    ADMIN(0,"admin"),
    EDITOR(1,"editor"),
    MEMBER(2,"member"),
    USER(3,"user");

    @Getter
    private Integer code;
    @Getter
    private String desc;

    private UserTypeEnum(Integer code,String desc){
        this.code = code;
        this.desc = desc;
    }

}
