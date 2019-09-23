package com.yayo.sys.bean;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author: Yayo
 * @Description:
 * @Created at: 2019/9/16 9:34
 */
@Data
public class Paper implements Serializable {
    private static final long serialVersionUID = 2931418484747999449L;

    private Integer paperId;
    private String paperName;
    private Integer paperFlag;
    private String choiceIds;
}
