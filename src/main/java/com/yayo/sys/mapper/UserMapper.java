package com.yayo.sys.mapper;

import com.yayo.sys.bean.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface UserMapper {

    @Select("select * from user where username = #{username} and password = #{password}")
    public User findByUserNamePassword(String username,String password);

    @Select("select * from user where user_type <> 0")
    public List<User> findUserListAll();
}
