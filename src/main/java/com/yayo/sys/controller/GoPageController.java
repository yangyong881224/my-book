package com.yayo.sys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @Author: Yayo
 * @Description:
 * @Created at: 2019/9/11 23:28
 */
@Controller
public class GoPageController {

    @RequestMapping(value = "/welcome",method = RequestMethod.GET)
    public String welcome(){
        return "sys/welcome";
    }

    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String index(){
        return "sys/index";
    }

    @RequestMapping(value = "/user" , method = RequestMethod.GET)
    public String users(){return "sys/user";}

    @RequestMapping(value = "/paper" , method = RequestMethod.GET)
    public String paper(){return "sys/paper";}

    @RequestMapping(value = "/categories" , method = RequestMethod.GET)
    public String categories(){
        return "sys/categories";
    }

    @RequestMapping(value = "/choice" , method = RequestMethod.GET)
    public String choice(){
        return "sys/choice";
    }

    @RequestMapping(value = "choice_create" , method = RequestMethod.GET)
    public String choiceCreate(){
        return "sys/choice_create";
    }

    @RequestMapping(value = "/choice_update/{choiceId}" , method = RequestMethod.GET)
    public String choiceUpdate(@PathVariable Long choiceId){
        return "sys/choice_update";
    }

    @RequestMapping(value = "/templates" , method = RequestMethod.GET)
    public String templates(){
        return "sys/templates";
    }

    @RequestMapping(value="/user_info" , method = RequestMethod.GET)
    public String userInfo(){
        return "sys/user_info";
    }

    @RequestMapping(value = "/{paperId}/paper_add_choice")
    public String paperAddChoice(@PathVariable Long paperId){
        return "sys/paper_add_choice";
    }

    @RequestMapping(value = "/message")
    public String message(){
        return "sys/message";
    }

    @RequestMapping(value = "/message_type")
    public String messageType(){
        return "sys/message_type";
    }

    @RequestMapping(value = "/message_examine")
    public String messageExamine(){
        return "sys/message_examine";
    }

    @RequestMapping(value = "/role")
    public String role(){
        return "sys/role";
    }

    @RequestMapping(value = "/role_user")
    public String roleUser(){
        return "sys/role_user";
    }

    @RequestMapping(value = "role_create")
    public String roleCreate(){
        return "sys/role_create";
    }
}
