package com.yayo.sys.mapper;

import com.yayo.base.dao.MyBatisDao;
import com.yayo.sys.mapper.dataobject.UserRole;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserRoleDao extends MyBatisDao<UserRole> {

    public List<UserRole> findByUserId(Long userId) {
        return this.sqlSession.selectList(this.sqlId("findByUserId"),userId);
    }
}
