package com.yayo.base.mq.request;

import com.alibaba.fastjson.JSONObject;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import java.io.Serializable;
import java.util.Map;

@Data
@EqualsAndHashCode
@ToString
public class MessageRequest implements Serializable {
    private static final long serialVersionUID = 7844923588548391519L;

    private Map<String, Object> params;

    public String getJson(){
        if(params != null && !params.isEmpty()){
            return JSONObject.toJSONString(params);
        }
        return "";
    }
}
