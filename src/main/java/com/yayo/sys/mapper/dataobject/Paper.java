package com.yayo.sys.mapper.dataobject;

import com.google.common.collect.Lists;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import org.apache.commons.lang.StringUtils;

import java.io.Serializable;
import java.util.List;

/**
 * @Author: Yayo
 * @Description:
 * @Created at: 2019/9/16 9:34
 */
@Data
@EqualsAndHashCode
@ToString
public class Paper implements Serializable {
    private static final long serialVersionUID = 2931418484747999449L;

    private Long paperId;
    private String paperName;
    private Integer paperFlag;
    private String choiceIds;
    private Long paperTime;
    private Integer paperStatus;

    private List<Long> choiceIdList;

    public void setChoiceIds(String choiceIds){
        if(StringUtils.isNotBlank(choiceIds)){
            this.choiceIds = choiceIds;
            String[] choiceIdArr = choiceIds.split(",");
            choiceIdList = Lists.newArrayList();
            for(String id : choiceIdArr){
                if(!"".equals(id.trim()))
                    choiceIdList.add(Long.parseLong(id.trim()));
            }
        }
    }

    public void setChoiceIdList(List<Long> choiceIdList){
        this.choiceIdList = choiceIdList;
        if(choiceIdList != null){
            this.choiceIds =choiceIdList.toString().replace("[","").replace("]","").trim();
        }
    }

}
