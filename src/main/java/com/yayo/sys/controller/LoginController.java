package com.yayo.sys.controller;

import com.yayo.base.utils.Encryption;
import com.yayo.sys.bean.User;
import com.yayo.sys.service.LoginService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.NoSuchAlgorithmException;

@Controller
@Slf4j
@RequestMapping(value = "/api/admin")
public class LoginController {

    @Autowired
    private LoginService loginService;

    /**
     * 登录
     * @param username
     * @param password
     * @param request
     * @return
     */
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(@RequestParam String username, @RequestParam String password, HttpServletRequest request, HttpServletResponse response){
        try {
            password = Encryption.strToMD5(password);
            log.info(password);
        } catch (NoSuchAlgorithmException e) {
            log.error("user.not.login");
            e.printStackTrace();
        }
        User user = loginService.login(username,password);
        if(user != null && user.getUserType()==0){
            request.getSession().setAttribute("user",user);
            return "redirect:/welcome";
        }else{
            return "redirect:/";
        }
    }

    /**
     * 登出
     * @param request
     * @return
     */
    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout(HttpServletRequest request){
        request.getSession().removeAttribute("user");
        return "redirect:/";
    }
}
