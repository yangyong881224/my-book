package com.yayo.sys.controller;

import com.yayo.sys.bean.User;
import com.yayo.sys.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: Yayo
 * @Description:
 * @Created at: 2019/9/12 9:54
 */
@RequestMapping("/api/admin/user")
@Slf4j
@RestController
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/list" , method = RequestMethod.GET)
    public Map<String , Object> getUserList(){
        Map<String , Object> userMap = new HashMap<>();
        List<User> userList = userService.getUserListAll();
        userMap.put("userList",userList);
        if(userList != null){
            userMap.put("code","0000");
            userMap.put("msg","查询成功！");
        }else{
            userMap.put("code","0001");
            userMap.put("msg","暂时没有用户！");
        }
        return userMap;
    }
}
