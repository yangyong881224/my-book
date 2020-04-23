package com.yayo.starter;

import com.google.common.collect.Maps;
import com.yayo.base.utils.PageInfo;
import com.yayo.base.utils.Paging;
import com.yayo.sys.mapper.CategoriesMapper;
import com.yayo.sys.mapper.ChoiceMapper;
import com.yayo.sys.mapper.RoleDao;
import com.yayo.sys.mapper.UserDao;
import com.yayo.sys.mapper.dataobject.Categories;
import com.yayo.sys.mapper.dataobject.Choice;
import com.yayo.sys.mapper.dataobject.Role;
import com.yayo.sys.mapper.dataobject.User;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class MyBookApplicationTests {

    @Autowired
    private CategoriesMapper categoriesMapper;
    @Autowired
    private ChoiceMapper choiceMapper;

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private UserDao userDao;

    @Test
    public void testUserDao(){
        User user = userDao.findByUserNamePassword("123","123");
        System.out.println(user);
    }

    @Test
    public void test123(){
        PageInfo pageInfo = new PageInfo(1,20);
        Map<String,Object> params = Maps.newHashMap();
        params.put("limit",pageInfo.getLimit());
        params.put("offset",pageInfo.getOffset());
        Paging<Role> rolePaging = roleDao.paging(params);
        System.out.println(rolePaging);
    }

    @Test
    public void test() {
        Categories categories = new Categories();
        categories.setCategoriesName("测试");
        categories.setCategoriesParent(0L);
        Boolean result = categoriesMapper.insert(categories);
        System.out.println(categories.getCategoriesId());

        boolean isDelete = categoriesMapper.delete(categories.getCategoriesId());

        System.out.println(isDelete);
    }

    @Test
    public void test1() {
        Categories categories = new Categories();
        categories.setCategoriesName("测试");
        categories.setCategoriesId(1L);
        boolean isTrue = categoriesMapper.update(categories);
        System.out.println(isTrue);
    }

    @Test
    public void test2() {
        List<Categories> categoriesList = new ArrayList<>();
        for(long i = 0 ; i < 100 ; i ++){
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
        for(long i = 0 ; i < 100 ; i ++){
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
