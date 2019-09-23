package com.yayo.sys.controller;

import com.yayo.sys.bean.Categories;
import com.yayo.sys.service.CategoriesService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Author: Yayo
 * @Description:
 * @Created at: 2019/9/18 8:52
 */
@RestController
@RequestMapping(value = "/api/admin/categories")
@Slf4j
public class CategoriesController {

    @Autowired
    private CategoriesService categoriesService;

    @RequestMapping(value = "/list" , method = RequestMethod.GET)
    public List<Categories> getParentCategories(Integer parentId){
        List<Categories> categoriesList = categoriesService.getParentCategories(parentId);
        return categoriesList;
    }

    @RequestMapping(value = "/insert" , method = RequestMethod.POST)
    public boolean insert(Categories categories){
        return categoriesService.insert(categories);
    }

    @RequestMapping(value = "/delete" , method = RequestMethod.DELETE)
    public boolean delete(Integer categoriesId){
        return categoriesService.delete(categoriesId);
    }


}
