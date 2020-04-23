package com.yayo.sys.controller;

import com.yayo.base.utils.Paging;
import com.yayo.sys.controller.info.UserInfo;
import com.yayo.sys.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

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

    @RequestMapping(value = "/paging" , method = RequestMethod.GET)
    public Paging<UserInfo> getUserList(Integer pageNo,Integer pageSize){
        return userService.paging(pageNo,pageSize);
    }
}
