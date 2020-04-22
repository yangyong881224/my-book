package com.yayo.user.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import java.io.Serializable;

@Data
@EqualsAndHashCode
@ToString
public class PaperDTO implements Serializable {
    private static final long serialVersionUID = -8566379511194453683L;

    private Long paperId;
    private String paperName;
    private Long paperTime;


}
