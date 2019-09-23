package com.yayo.sys.service.impl;

import com.yayo.sys.bean.Categories;
import com.yayo.sys.mapper.CategoriesMapper;
import com.yayo.sys.service.CategoriesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: Yayo
 * @Description:
 * @Created at: 2019/9/18 8:56
 */
@Service
public class CategoriesServiceImpl implements CategoriesService {

    @Autowired
    private CategoriesMapper categoriesMapper;

    @Override
    public List<Categories> getParentCategories(Integer parentId) {
        return categoriesMapper.getCategoriesByParentId(parentId);
    }

    @Override
    public boolean insert(Categories categories) {
        return categoriesMapper.insert(categories);
    }

    @Override
    public boolean delete(Integer categoriesId) {
        List<Categories> categoriesList = categoriesMapper.getCategoriesByParentId(categoriesId);
        if(!categoriesList.isEmpty()){
            return false;
        }
        return categoriesMapper.delete(categoriesId);
    }
}
