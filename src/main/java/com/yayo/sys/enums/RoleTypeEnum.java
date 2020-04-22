package com.yayo.sys.enums;

import lombok.Getter;

public enum RoleTypeEnum {

    ADMIN("admin","管理员"),
    EDITOR("editor","编辑"),
    AUTHOR("author","作者"),
    MEMBER("member","会员"),
    USER("user","用户");

    private String code;

    private String desc;

    RoleTypeEnum(String code,String desc){
        this.code = code;
        this.desc = desc;
    }

    public String code(){
        return this.code;
    }

    public String desc(){
        return this.desc;
    }
}
