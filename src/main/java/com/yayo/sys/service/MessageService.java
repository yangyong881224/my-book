package com.yayo.sys.service;

import com.yayo.base.utils.Paging;
import com.yayo.sys.controller.info.MessageInfo;
import com.yayo.sys.controller.request.MessageCreateRequest;

public interface MessageService {
    Paging<MessageInfo> paging(Integer pageNo, Integer pageSize);

    Boolean create(MessageCreateRequest messageCreateRequest);

    Boolean sendMessage(Long id);

    Boolean update(MessageInfo messageInfo);
}
