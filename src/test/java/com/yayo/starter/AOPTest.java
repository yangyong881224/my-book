package com.yayo.starter;

import com.yayo.base.controller.AopTestController;
import com.yayo.sys.mapper.dataobject.User;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.web.context.request.RequestContextHolder;

@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
@ComponentScan("com.yayo")
public class AOPTest {

    @Autowired
    private AopTestController aopTestController;

    @Test
    public void test () throws Exception {
        User user = new User();
        user.setUserNickname("张三丰");
        RequestContextHolder.getRequestAttributes().setAttribute("user",user,1);
        aopTestController.test();
    }
}
