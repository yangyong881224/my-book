package com.yayo.user.converter;


import com.yayo.sys.mapper.dataobject.Paper;
import com.yayo.user.dto.PaperDTO;
import org.mapstruct.Mapper;
import org.springframework.stereotype.Component;

@Mapper(componentModel = "spring")
@Component
public interface PaperConverter {
    public PaperDTO doToDto(Paper paper);
}
