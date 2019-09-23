package com.yayo.sys.mapper;

import com.yayo.sys.bean.Categories;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @Author: Yayo
 * @Description:
 * @Created at: 2019/9/18 8:57
 */
@Mapper
@Component
public interface CategoriesMapper {

    @Select("select * from categories where categories_parent = #{parentId}")
    public List<Categories> getCategoriesByParentId(Integer parentId);

    @Insert("insert into categories (categories_name, categories_parent) values (#{categoriesName}, #{categoriesParent})")
    @SelectKey(statement = "select last_insert_id()",resultType = Integer.class , before = false, keyProperty = "categoriesId")
    public Boolean insert(Categories categories);

    @Delete("delete from categories where categories_id = #{categoriesId}")
    public boolean delete(Integer categoriesId);

    @Update("update categories set categories_name = #{categoriesName} where categories_id = #{categoriesId}")
    public boolean update(Categories categories);

    @Select("<script>select * from categories where categories_parent in <foreach collection='parents' item='categories' open='(' separator=',' close=')'>#{categories.categoriesId}</foreach></script>")
    List<Categories> getCategoriesByParentIds(@Param("parents") List<Categories> parents);
}
