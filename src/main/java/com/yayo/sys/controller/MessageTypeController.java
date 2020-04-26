package com.yayo.sys.controller;

import com.yayo.base.utils.Paging;
import com.yayo.sys.controller.dto.MessageTypeDTO;
import com.yayo.sys.controller.request.MessageTypeCreateRequest;
import com.yayo.sys.service.MessageTypeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/admin/message_type")
@Slf4j
public class MessageTypeController {

    @Autowired
    private MessageTypeService messageTypeService;

    @GetMapping("/paging")
    public Paging<MessageTypeDTO> paging(Integer pageNo, Integer pageSize){
        return messageTypeService.paging(pageNo, pageSize);
    }

    @PostMapping("/create_or_update")
    public Boolean createOrUpdate(MessageTypeCreateRequest messageTypeCreateRequest){
        return messageTypeService.createOrUpdate(messageTypeCreateRequest);
    }

    @GetMapping("/list")
    public List<MessageTypeDTO> list(){
        return messageTypeService.list();
    }
}
