package com.yayo.user.dto.info;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class ChoiceInfo implements Serializable {
    private static final long serialVersionUID = 8144570768598432795L;

    private Long choiceId;
    private Long categoriesId;
    private String choiceQuestion;
    private String choiceAnswer;
    private Integer choiceType;
    private String choiceTrue;
    private Date createdAt;
    private Long createdBy;
}
