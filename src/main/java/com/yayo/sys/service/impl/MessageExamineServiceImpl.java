package com.yayo.sys.service.impl;

import com.google.common.collect.Maps;
import com.yayo.base.utils.PageInfo;
import com.yayo.base.utils.Paging;
import com.yayo.sys.controller.info.MessageInfo;
import com.yayo.sys.convert.MessageConverter;
import com.yayo.sys.mapper.MessageDao;
import com.yayo.sys.mapper.dataobject.Message;
import com.yayo.sys.service.MessageExamineService;
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

    @Override
    public Paging<MessageInfo> paging(Integer pageNo, Integer pageSize, String title, Integer examineStatus) {
        PageInfo pageInfo = new PageInfo(pageNo, pageSize);
        Map<String,Object> params = Maps.newHashMap();
        params.put("offset",pageInfo.getOffset());
        params.put("limit",pageInfo.getLimit());
        params.put("title",title);
        params.put("examineStatus",examineStatus);
        //需要审核的
        params.put("examined",1);
        //手动发送的
        params.put("createdBy","SYS");
        Paging<Message> messagePaging = messageDao.paging(params);
        if(messagePaging.isEmpty()){
            return Paging.empty();
        }
        List<MessageInfo> list = messagePaging.getData().stream().map(messageConverter::do2info).collect(Collectors.toList());
        return new Paging<>(messagePaging.getTotal(),list);
    }
}
