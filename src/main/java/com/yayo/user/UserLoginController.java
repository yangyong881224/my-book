package com.yayo.user;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: Yayo
 * @Description:
 * @Created at: 2019/10/6 22:10
 */
@Controller
@Slf4j
@RequestMapping("/api/user")
public class UserLoginController {

    @RequestMapping("/login")
    public String login(String username , String password){

        return "";
    }
}
