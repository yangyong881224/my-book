package com.yayo.sys.service;

import com.yayo.base.utils.Paging;
import com.yayo.sys.controller.dto.MessageTypeDTO;
import com.yayo.sys.controller.request.MessageTypeCreateRequest;

public interface MessageTypeService {
    Paging<MessageTypeDTO> paging(Integer pageNo, Integer pageSize);

    Boolean createOrUpdate(MessageTypeCreateRequest messageTypeCreateRequest);
}
