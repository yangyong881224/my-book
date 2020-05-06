package com.yayo.sys.service.impl;

import com.google.common.collect.Maps;
import com.yayo.base.utils.PageInfo;
import com.yayo.base.utils.Paging;
import com.yayo.sys.controller.info.MessageInfo;
import com.yayo.sys.convert.MessageConverter;
import com.yayo.sys.mapper.MessageDao;
import com.yayo.sys.mapper.dataobject.Message;
import com.yayo.sys.service.MessageExamineService;
import com.yayo.sys.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class MessageExamineServiceImpl implements MessageExamineService {

    @Autowired
    private MessageDao messageDao;

    @Autowired
    private MessageConverter messageConverter;

    @Autowired
    private MessageService messageService;

    @Override
    public Paging<MessageInfo> paging(Integer pageNo, Integer pageSize, String title, Integer examineStatus) {
        Message message = new Message();
        message.setTitle(title);
        message.setExamineStatus(examineStatus);
        message.setExamined(1);
        message.setCreatedBy("SYS");
        return messageService.paging(pageNo,pageSize,message);
    }
}
