package com.yayo.sys.service.impl;

import com.google.common.collect.Maps;
import com.yayo.base.utils.PageInfo;
import com.yayo.base.utils.Paging;
import com.yayo.sys.controller.info.MessageInfo;
import com.yayo.sys.controller.request.MessageCreateRequest;
import com.yayo.sys.convert.MessageConverter;
import com.yayo.sys.mapper.MessageDao;
import com.yayo.sys.mapper.MessageTypeDao;
import com.yayo.sys.mapper.dataobject.Message;
import com.yayo.sys.mapper.dataobject.MessageType;
import com.yayo.sys.service.MessageProducer;
import com.yayo.sys.service.MessageService;
import com.yayo.user.facade.UserMessageContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class MessageServiceImpl implements MessageService {

    @Autowired
    private MessageDao messageDao;

    @Autowired
    private MessageConverter messageConverter;

    @Autowired
    private MessageTypeDao messageTypeDao;

    @Autowired
    private MessageProducer messageProducer;

    @Override
    public Paging<MessageInfo> paging(Integer pageNo, Integer pageSize) {
        PageInfo pageInfo = new PageInfo(pageNo , pageSize);
        Map<String,Object> params = Maps.newHashMap();
        params.put("offset",pageInfo.getOffset());
        params.put("limit",pageInfo.getLimit());
        params.put("createdBy","SYS");
        Paging<Message> messagePaging = messageDao.paging(params);
        if(messagePaging.isEmpty()){
            return Paging.empty();
        }
        //查询typeId集合
        List<Long> messageTypeIdList = messagePaging.getData().stream().map(Message::getTypeId).collect(Collectors.toList());
        //根据typeId 查询所有消息类型名称
        List<MessageType> messageTypeList = messageTypeDao.findByIds(messageTypeIdList);

        List<MessageInfo> messageInfoList = messagePaging.getData().stream().map(messageConverter::do2info).collect(Collectors.toList());
        messageInfoList.stream().forEach(messageInfo -> {
            MessageType messageType = messageTypeList.stream().filter(mt -> messageInfo.getTypeId().equals(mt.getId())).findFirst().orElse(null);
            messageInfo.setTypeName(messageType.getMessageType());
        });
        return new Paging<>(messagePaging.getTotal(),messageInfoList);
    }

    @Override
    public Boolean create(MessageCreateRequest messageCreateRequest) {
        return messageDao.create(messageConverter.req2do(messageCreateRequest));
    }

    @Override
    public Boolean sendMessage(Long id) {
        Message message = messageDao.findById(id);
        MessageType messageType = messageTypeDao.findById(message.getTypeId());
        UserMessageContext userMessageContext = buildMessageContext(message,messageType);
        Boolean result = messageProducer.sendMSG(userMessageContext);
        if(result){
            message.setSendStatus(1);
            messageDao.update(message);
        }
        return result;
    }

    @Override
    public Boolean update(MessageInfo messageInfo) {
        Message message = messageConverter.info2do(messageInfo);
        return messageDao.update(message);
    }

    private UserMessageContext buildMessageContext(Message message, MessageType messageType) {
        UserMessageContext userMessageContext = new UserMessageContext();
        userMessageContext.setId(message.getId());
        userMessageContext.setTypeId(messageType.getId());
        userMessageContext.setTypeName(messageType.getMessageType());
        userMessageContext.setTypeIcon(messageType.getMessageIcon());
        userMessageContext.setTitle(message.getTitle());
        userMessageContext.setContent(message.getContent());
        userMessageContext.setSendType(message.getSendType());
        userMessageContext.setUserId(message.getUserId());
        userMessageContext.setUserPhone(message.getUserPhone());
        userMessageContext.setClazz(UserMessageContext.class);
        return userMessageContext;
    }


}
