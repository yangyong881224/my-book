package com.yayo.sys.controller;

import com.yayo.base.utils.Paging;
import com.yayo.sys.controller.info.MessageInfo;
import com.yayo.sys.service.MessageExamineService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/admin/message_examin")
@Slf4j
public class MessageExamineController {

    @Autowired
    private MessageExamineService messageExamineService;

    @GetMapping("/paging")
    public Paging<MessageInfo> paging(Integer pageNo, Integer pageSize, String title, Integer examineStatus){
        return messageExamineService.paging(pageNo, pageSize, title,examineStatus);
    }
}
