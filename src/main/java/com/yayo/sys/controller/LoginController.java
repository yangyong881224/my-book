package com.yayo.sys.controller;

import com.yayo.base.component.RequestContext;
import com.yayo.base.utils.Encryption;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.security.NoSuchAlgorithmException;
import java.util.Set;

@Controller
@Slf4j
@RequestMapping(value = "/api/admin")
public class LoginController {

    /**
     * 登录
     * @param username
     * @param password
     * @return
     */
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public @ResponseBody Boolean login(@RequestParam String username, @RequestParam String password, HttpServletRequest request){
        try {
            password = Encryption.strToMD5(password);
            log.info(password);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        Subject subject = SecurityUtils.getSubject();
        // 在认证提交前准备 token（令牌）
        UsernamePasswordToken token = new UsernamePasswordToken(username,password);
        try {
            subject.login(token);
        }catch (UnknownAccountException e){
            log.error("未知账户");
            token.clear();
            return false;
        }catch (IncorrectCredentialsException e){
            log.error( "密码不正确");
            token.clear();
            return false;
        }catch (LockedAccountException e){
            log.error( "账户已锁定");
            token.clear();
            return false;
        }catch (ExcessiveAttemptsException e){
            log.error("用户名密码错误次数过多");
            token.clear();
            return false;
        }catch (AuthenticationException e){
            log.error( "用户名密码不正确");
            token.clear();
            return false;
        }
        if(subject.isAuthenticated()){
            subject.getSession().setAttribute("rolePermission",subject.getPrincipal());
            return true;
        }else{
            token.clear();
            return false;
        }

    }

    /**
     * 登出
     * @return
     */
    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout(){
        RequestContext.clearPerssion();
        RequestContext.clearUser();
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "redirect:/";
    }

    @GetMapping("/checkRole")
    public @ResponseBody Set<String> checkRole(){
        return RequestContext.getPermission();
    }
}
