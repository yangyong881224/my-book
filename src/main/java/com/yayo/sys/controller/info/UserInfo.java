package com.yayo.sys.controller.info;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class UserInfo {
    private Long userId;
    private String userNickname;
    private String username;
    private String password;
    private String userEmaill;
    private String userIdCard;
    private String userType;
    private String userJson;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date userLastLogin;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createdAt;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updatedAt;
}
