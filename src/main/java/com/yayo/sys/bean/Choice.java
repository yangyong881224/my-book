package com.yayo.sys.bean;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author: Yayo
 * @Description:
 * @Created at: 2019/9/16 9:42
 */
@Data
public class Choice implements Serializable {
    private static final long serialVersionUID = 3189846556843043575L;

    private Long choiceId;
    private Integer categoriesId;
    private String choiceQuestion;
    private String choiceAnswer;
    private Integer choiceType;
    private String choiceTrue;
    private Date createdAt;
    private Integer createdBy;

}
