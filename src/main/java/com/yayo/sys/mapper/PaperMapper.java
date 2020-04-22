package com.yayo.sys.mapper;

import com.yayo.sys.mapper.dataobject.Paper;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * @Author: Yayo
 * @Description:
 * @Created at: 2019/9/16 9:32
 */
@Mapper
@Component
public interface PaperMapper {

    @Select("<script>select * from paper where paper_flag = 0 " +
            " <if test='paperName!=null'>and paper_name = #{paperName}</if>" +
            " <if test='paperStatus!=null'>and paper_status = #{paperStatus} </if>" +
            "limit #{offset},#{limit}</script>")
    public List<Paper> getPaperList(Map<String,Object> params);

    @Select("<script>select count(paper_id) from paper where paper_flag = 0 " +
            " <if test='paperName!=null'>and paper_name = #{paperName}</if>" +
            " <if test='paperStatus!=null'>and paper_status = #{paperStatus} </if>" +
            "</script>")
    public Long getPaperCount(Map<String,Object> params);

    @Insert("insert into paper (paper_name,paper_time) values (#{paperName},#{paperTime})")
    public boolean create(Paper paper);

    @Update("<script>update paper set " +
            "<if test='paperName!=null'>paper_name = #{paperName}, paper_time = #{paperTime}</if>" +
            "<if test='choiceIds!=null'>choice_ids = #{choiceIds} </if>" +
            "<if test='paperStatus!=null'>paper_status = #{paperStatus} </if>" +
            " where paper_id = #{paperId}</script>")
    public boolean update(Paper paper);

    @Delete("update paper set paper_flag = 1 where paper_id = #{paperId}")
    boolean delete(Long paperId);

    @Select("select * from paper where paper_id = #{paperId}")
    Paper getPaperById(Long paperId);
}
