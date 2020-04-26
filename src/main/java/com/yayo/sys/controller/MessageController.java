package com.yayo.sys.controller;

import com.yayo.base.utils.Paging;
import com.yayo.sys.controller.info.MessageInfo;
import com.yayo.sys.controller.request.MessageCreateRequest;
import com.yayo.sys.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/admin/message")
public class MessageController {

    @Autowired
    private MessageService messageService;

    @GetMapping("/paging")
    public Paging<MessageInfo> paging(Integer pageNo, Integer pageSize){
        return messageService.paging(pageNo,pageSize);
    }

    @PostMapping("/create")
    public Boolean create(MessageCreateRequest messageCreateRequest){
        messageCreateRequest.setCreatedBy("SYS");
        return messageService.create(messageCreateRequest);
    }

    @PostMapping("/send")
    public Boolean sendMessage(Long id){
        return messageService.sendMessage(id);
    }


}
