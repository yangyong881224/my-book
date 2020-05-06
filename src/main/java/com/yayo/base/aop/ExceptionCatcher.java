package com.yayo.base.aop;

import com.yayo.base.exception.ApiException;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;

@Aspect
@Component
@Slf4j
public class ExceptionCatcher {

    @Pointcut(value = "execution(public * com.yayo..*.*(..))")
    public void catcher(){

    }
//TODO add exception catcher
//    @AfterThrowing(value = "catcher()")
//    public void around(ProceedingJoinPoint proceedingJoinPoint){
//        try {
//            proceedingJoinPoint.proceed();
//        }catch (ApiException e){
//            System.out.println(e.toString());
//            e.printStackTrace();
//        }catch (Exception e){
//            e.printStackTrace();
//        } catch (Throwable throwable) {
//            throwable.printStackTrace();
//        }
//    }
//
}
