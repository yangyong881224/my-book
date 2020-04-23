package com.yayo.sys.mapper;

import com.google.common.collect.Maps;
import com.yayo.base.dao.MyBatisDao;
import com.yayo.sys.mapper.dataobject.User;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class UserDao extends MyBatisDao<User> {

    public User findByUserNamePassword(String username,String password){
        Map<String,Object> params = Maps.newHashMap();
        params.put("username",username);
        params.put("password",password);
        return this.sqlSession.selectOne(this.sqlId("findByUserNamePassword"),params);
    }
}
