package com.yayo.user.dto;

import com.yayo.user.dto.info.ChoiceInfo;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
public class ChoiceExameDTO implements Serializable {

    private PaperDTO paperDTO;
    private List<ChoiceInfo> choiceInfoList;

}
