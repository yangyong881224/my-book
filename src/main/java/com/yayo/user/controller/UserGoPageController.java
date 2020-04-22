package com.yayo.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserGoPageController {

    @RequestMapping("/user/index")
    public String index(){
        return "user/index";
    }

    @RequestMapping("/user/api/study")
    public String study(){
        return "user/paper_list";
    }

    @RequestMapping("/user/api/exam/{paperId}")
    public String exam(@PathVariable Long paperId){
        return "user/exam";
    }

}
