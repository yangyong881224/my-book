package com.yayo.starter;

import com.yayo.sys.bean.Categories;
import com.yayo.sys.bean.Choice;
import com.yayo.sys.mapper.CategoriesMapper;
import com.yayo.sys.mapper.ChoiceMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Import;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MyBookApplicationTests {

    @Autowired
    private CategoriesMapper categoriesMapper;
    @Autowired
    private ChoiceMapper choiceMapper;

    @Test
    public void test() {
        Categories categories = new Categories();
        categories.setCategoriesName("测试");
        categories.setCategoriesParent(0);
        Boolean result = categoriesMapper.insert(categories);
        System.out.println(categories.getCategoriesId());

        boolean isDelete = categoriesMapper.delete(categories.getCategoriesId());

        System.out.println(isDelete);
    }

    @Test
    public void test1() {
        Categories categories = new Categories();
        categories.setCategoriesName("测试");
        categories.setCategoriesId(1);
        boolean isTrue = categoriesMapper.update(categories);
        System.out.println(isTrue);
    }

    @Test
    public void test2() {
        List<Categories> categoriesList = new ArrayList<>();
        for(int i = 0 ; i < 100 ; i ++){
            Categories categories = new Categories();
            categories.setCategoriesId(i);
            categoriesList.add(categories);
        }
//        List<Integer> categoriesList = new ArrayList<>();
//        for(int i = 0 ; i < 100 ; i ++){
//            categoriesList.add(i);
//        }
        List<Categories> categories = categoriesMapper.getCategoriesByParentIds(categoriesList);
        for(Categories c : categories){
            System.out.println(c);
        }
    }

    @Test
    public void test3() {
        List<Categories> categoriesList = new ArrayList<>();
        for(int i = 0 ; i < 100 ; i ++){
            Categories categories = new Categories();
            categories.setCategoriesId(i);
            categoriesList.add(categories);
        }
        Map<String,Object> params = new HashMap<>();
        params.put("limit",20);
        params.put("offset",0);
        params.put("categoriesList",categoriesList);
        List<Choice> choices = choiceMapper.list(params);
        for(Choice choice : choices){
            System.out.println(choice);
        }
    }

}
