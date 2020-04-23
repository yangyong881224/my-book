package com.yayo.sys.convert;

import com.yayo.sys.controller.info.UserInfo;
import com.yayo.sys.mapper.dataobject.User;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface UserConverter {

    UserInfo do2info(User user);


}
