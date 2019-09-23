package com.yayo.sys.mapper;

import com.yayo.sys.bean.Choice;
import com.yayo.sys.dto.ChoiceUpdateDTO;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * @Author: Yayo
 * @Description:
 * @Created at: 2019/9/19 11:36
 */

@Mapper
@Component
public interface ChoiceMapper {

    @Select("<script>select * from choice where categories_id in <foreach collection='categoriesList' item='categories' open='(' separator=',' close=')'>#{categories.categoriesId}</foreach> limit #{offset},#{limit}</script>")
    public List<Choice> list(Map<String,Object> params);

    @Select("<script>select count(choice_id) from choice where categories_id in <foreach collection='categoriesList' item='categories' open='(' separator=',' close=')'>#{categories.categoriesId}</foreach></script>")
    public Integer count(Map<String,Object> params);

    @Insert("insert into choice (categories_id, choice_question, choice_type, choice_answer,choice_true, created_at, created_by) " +
            "values (#{categoriesId},#{choiceQuestion},#{choiceType},#{choiceAnswer},#{choiceTrue},now(),#{createdBy})")
    public boolean create(Choice choice);

    @Delete("delete from choice where choice_id = #{choiceId}")
    boolean delete(Long choiceId);

    @Select("select * from choice where choice_id = #{choiceId}")
    public Choice findById(Long choiceId);

    @Update("update choice set choice_question=#{choiceQuestion},choice_type=#{choiceType},choice_answer=#{choiceAnswer},choice_true=#{choiceTrue} where choice_id=#{choiceId}")
    boolean update(Choice choice);

    @Insert("<script>insert into choice (categories_id, choice_question, choice_type, choice_answer,choice_true, created_at, created_by) values" +
            "<foreach collection='list' item='c' separator=','>" +
            "(#{c.categoriesId},#{c.choiceQuestion},#{c.choiceType},#{c.choiceAnswer},#{c.choiceTrue},now(),#{c.createdBy})" +
            "</foreach></script>")
    boolean insertBatch(List<ChoiceUpdateDTO> list);
}
