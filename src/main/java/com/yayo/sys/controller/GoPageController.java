package com.yayo.sys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * @Author: Yayo
 * @Description:
 * @Created at: 2019/9/11 23:28
 */
@Controller
public class GoPageController {

    @RequestMapping(value = "/welcome",method = RequestMethod.GET)
    public String welcome(){
        return "/welcome";
    }

    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String index(){
        return "/index";
    }

    @RequestMapping(value = "/user" , method = RequestMethod.GET)
    public String users(){return "/user";}

    @RequestMapping(value = "/paper" , method = RequestMethod.GET)
    public String paper(){return "/paper";}

    @RequestMapping(value = "/categories" , method = RequestMethod.GET)
    public String categories(){
        return "/categories";
    }

    @RequestMapping(value = "/choice" , method = RequestMethod.GET)
    public String choice(){
        return "/choice";
    }

    @RequestMapping(value = "choice_create" , method = RequestMethod.GET)
    public String choiceCreate(){
        return "/choice_create";
    }

    @RequestMapping(value = "/choice_update/{choiceId}" , method = RequestMethod.GET)
    public String choiceUpdate(@PathVariable Long choiceId){
        return "/choice_update";
    }

    @RequestMapping(value = "/templates" , method = RequestMethod.GET)
    public String templates(){
        return "/templates";
    }

    @RequestMapping(value="/user_info" , method = RequestMethod.GET)
    public String userInfo(){
        return "/user_info";
    }
}
