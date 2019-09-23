package com.yayo.sys.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@Slf4j
public class ErrorPage {

    @RequestMapping(value = "/500" , method = RequestMethod.GET)
    public String errorPage(){
        return "/error_pages/500";
    }

    @RequestMapping(value = "/404" , method = RequestMethod.GET)
    public String notFoundPage(){
        return "/error_pages/404";
    }
}
