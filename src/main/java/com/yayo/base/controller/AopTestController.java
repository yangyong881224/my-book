package com.yayo.base.controller;

import com.yayo.base.component.RequestContext;
import com.yayo.base.enums.ErrorTypeEnum;
import com.yayo.base.exception.ApiException;
import org.aspectj.lang.annotation.AfterThrowing;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/api/admin")
public class AopTestController {

    public void test() throws Exception{
        System.out.println("Controller test is Running");
        try {
            RequestContext.getUserId();
        }catch (NullPointerException e){
            throw new ApiException(ErrorTypeEnum.SYSTEM_ERROR);
        }catch (Exception e){
            throw e;
        }
    }
}
