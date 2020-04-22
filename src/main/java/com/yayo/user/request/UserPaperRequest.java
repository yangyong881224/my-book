package com.yayo.user.request;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class UserPaperRequest implements Serializable {
    private static final long serialVersionUID = -782550181527984284L;

    private Long id;
    private Long userId;
    private Long paperId;
    private String upRight;
    private String upWrong;
    private Date createdAt;
}
