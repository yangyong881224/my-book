package com.yayo.sys.convert;

import com.yayo.sys.controller.dto.MessageTypeDTO;
import com.yayo.sys.controller.request.MessageTypeCreateRequest;
import com.yayo.sys.mapper.dataobject.MessageType;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface MessageTypeConverter {

    MessageTypeDTO do2dto(MessageType messageType);

    MessageType req2do(MessageTypeCreateRequest request);


}
