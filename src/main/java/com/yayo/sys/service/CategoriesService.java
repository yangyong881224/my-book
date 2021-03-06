package com.yayo.sys.service;

import com.yayo.sys.mapper.dataobject.Categories;

import java.util.List;

/**
 * @Author: Yayo
 * @Description:
 * @Created at: 2019/9/18 8:56
 */
public interface CategoriesService {
    List<Categories> getParentCategories(Long parentId);

    boolean insert(Categories categories);

    boolean delete(Long categoriesId);
}
