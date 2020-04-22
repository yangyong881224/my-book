package com.yayo.user.dao.dataobject;

import com.google.common.collect.Lists;
import lombok.Data;
import org.apache.commons.lang.StringUtils;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
public class UserPaperDO implements Serializable {

    private static final long serialVersionUID = 2084556686430196429L;

    private Long upId;
    private Long userId;
    private Long paperId;
    private String upRight;
    private String upWrong;
    private Date createdAt;

    private List<Long> rightList;
    private List<Long> wrongList;

    public void setRightList(List<Long> rightList){
        this.rightList = rightList;
        if(rightList != null)
            this.upRight = rightList.toString().replace("[","").replace("]","");
    }

    public void setWrongList(List<Long> wrongList){
        this.wrongList = wrongList;
        if(wrongList != null)
            this.upWrong = wrongList.toString().replace("[","").replace("]","");
    }

    public List<Long> getRightList(){
        this.rightList = Lists.newArrayList();
        if(StringUtils.isNotBlank(this.upRight)){
            String[] rightArr = this.upRight.split(",");
            for(String right : rightArr){
                rightList.add(Long.parseLong(StringUtils.trim(right)));
            }
        }
        return this.rightList;
    }

    public List<Long> getWrongList(){
        this.wrongList = Lists.newArrayList();
        if(StringUtils.isNotBlank(this.upWrong)){
            String[] wrongArr = this.upRight.split(",");
            for(String wrong : wrongArr){
                rightList.add(Long.parseLong(StringUtils.trim(wrong)));
            }
        }
        return this.wrongList;
    }

}
