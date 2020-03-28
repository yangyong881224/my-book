package com.yayo.sys.mapper;

import com.yayo.sys.bean.Paper;
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

    @Select("select * from paper limit #{offset},#{limit}")
    public List<Paper> getPaperList(Map<String,Object> params);

    @Select("select count(paper_id) from paper")
    public Integer getPaperCount(Map<String,Object> params);

    @Insert("insert into paper (paper_name,paper_time) values (#{paperName},#{paperTime})")
    public boolean create(Paper paper);

    @Update("<script>update paper set " +
            "<if test='paperName!=null'>paper_name = #{paperName}, paper_time = #{paperTime}</if>" +
            "<if test='choiceIds!=null'>choice_ids = #{choiceIds} </if>" +
            "<if test='paperStatus!=null'>paper_status = #{paperStatus} </if>" +
            " where paper_id = #{paperId}</script>")
    public boolean update(Paper paper);

    @Delete("delete from paper where paper_id = #{paperId}")
    boolean delete(Integer paperId);

    @Select("select * from paper where paper_id = #{paperId}")
    Paper getPaperById(int paperId);
}
