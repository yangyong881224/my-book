package com.yayo.sys.dto;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Data;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import java.io.IOException;
import java.io.Serializable;
import java.util.*;

/**
 * @Author: Yayo
 * @Description:
 * @Created at: 2019/9/21 15:03
 */
@Data
public class ChoiceUpdateDTO implements Serializable {

    private static final long serialVersionUID = -1119087946119244214L;

    private static final ObjectMapper objectMapper = new ObjectMapper();

    private Long choiceId;
    private Integer categoriesId;
    private String choiceQuestion;
    private String choiceAnswer;
    private Integer choiceType;
    private String choiceTrue;
    private Date createdAt;
    private Integer createdBy;
    private Map<Object,Object> answerMap;

    public void setChoiceAnswer(String choiceAnswer) throws IOException {
        this.choiceAnswer = choiceAnswer;
        JSONArray jsonArray = JSONArray.fromObject(choiceAnswer);
        Map<Object,Object> map = new HashMap<>();
        for(Object json : jsonArray){
             Map<String,Object> params = objectMapper.readValue(json.toString(),Map.class);
             map.put(params.get("num"),params.get("answer"));
        }
        this.answerMap = map;
    }

    public void setAnswerMap(Map<Object,Object> answerMap){
        this.answerMap = answerMap;
        if(answerMap != null){
            List<String> list = new ArrayList<>();
            answerMap.forEach((key,value)->{
                Map<Object,Object> params = new HashMap<>();
                params.put("num", key);
                params.put("answer", value);
                try {
                    String answerJson = objectMapper.writeValueAsString(params);
                    list.add(answerJson);
                } catch (JsonProcessingException e) {
                    e.printStackTrace();
                }
            });
            this.choiceAnswer = list.toString();
        }
    }

}
