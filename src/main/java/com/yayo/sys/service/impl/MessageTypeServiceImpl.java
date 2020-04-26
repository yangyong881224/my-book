package com.yayo.sys.service.impl;

import com.google.common.collect.Maps;
import com.yayo.base.utils.PageInfo;
import com.yayo.base.utils.Paging;
import com.yayo.sys.controller.dto.MessageTypeDTO;
import com.yayo.sys.controller.request.MessageTypeCreateRequest;
import com.yayo.sys.convert.MessageTypeConverter;
import com.yayo.sys.mapper.MessageTypeDao;
import com.yayo.sys.mapper.dataobject.MessageType;
import com.yayo.sys.service.MessageTypeService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class MessageTypeServiceImpl implements MessageTypeService {

    @Autowired
    private MessageTypeDao messageTypeDao;

    @Autowired
    private MessageTypeConverter messageTypeConverter;

    @Override
    public Paging<MessageTypeDTO> paging(Integer pageNo, Integer pageSize) {
        PageInfo pageInfo = new PageInfo(pageNo,pageSize);
        Map<String,Object> params = Maps.newHashMap();
        params.put("limit",pageInfo.getLimit());
        params.put("offset",pageInfo.getOffset());
        Paging<MessageType> messageTypePaging = messageTypeDao.paging(params);
        if(messageTypePaging.isEmpty()){
            return Paging.empty();
        }
        List<MessageTypeDTO> messageTypeDTOList = messageTypePaging.getData().stream().map(messageTypeConverter::do2dto).collect(Collectors.toList());
        return new Paging<>(messageTypePaging.getTotal(),messageTypeDTOList);
    }

    @Override
    public Boolean createOrUpdate(MessageTypeCreateRequest messageTypeCreateRequest) {
        MessageType messageType = messageTypeConverter.req2do(messageTypeCreateRequest);
        if(messageType.getId() == null){
            if(StringUtils.isBlank(messageType.getMessageIcon())){
                messageType.setMessageIcon("/assets/upload/misc_icon/default_misc_icon.png");
            }
            return messageTypeDao.create(messageType);
        }else{
            return messageTypeDao.update(messageType);
        }
    }

    public List<MessageTypeDTO> list(){
        List<MessageType> messageTypeList = messageTypeDao.listAll();
        return messageTypeList.stream().map(messageTypeConverter::do2dto).collect(Collectors.toList());
    }
}
