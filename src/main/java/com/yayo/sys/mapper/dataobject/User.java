package com.yayo.sys.mapper.dataobject;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class User implements Serializable {
    private static final long serialVersionUID = -6192317374745446843L;
    private Long userId;
    private String userNickname;
    private String username;
    private String password;
    private String userEmaill;
    private String userIdCard;
    private String userType;
    private String userJson;
    private Date userLastLogin;
    private Date createdAt;
    private Date updatedAt;

}
