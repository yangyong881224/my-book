package com.yayo.sys.convert;

import com.yayo.sys.controller.info.MessageInfo;
import com.yayo.sys.controller.request.MessageCreateRequest;
import com.yayo.sys.mapper.dataobject.Message;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface MessageConverter {

    MessageInfo do2info(Message message);

    Message req2do(MessageCreateRequest request);
}
