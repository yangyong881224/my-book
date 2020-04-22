package com.yayo.user.converter;

import com.yayo.sys.mapper.dataobject.Choice;
import com.yayo.user.dto.ChoiceExameDTO;
import org.mapstruct.Mapper;
import org.springframework.stereotype.Component;

@Mapper(componentModel = "spring")
@Component
public interface ChoiceConverter {
    public ChoiceExameDTO doToDto(Choice choice);
}
