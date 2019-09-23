package com.yayo.base.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import java.lang.reflect.ParameterizedType;

public abstract class MyBatisDao<T> {

//    @Autowired
    private SqlSession sqlSession;

    private static final String FIND_BY_ID = "findById";

    public final String nameSpace;

    public MyBatisDao() {
        if (this.getClass().getGenericSuperclass() instanceof ParameterizedType) {
            this.nameSpace = ((Class)((ParameterizedType)this.getClass().getGenericSuperclass()).getActualTypeArguments()[0]).getSimpleName();
        } else {
            this.nameSpace = ((Class)((ParameterizedType)this.getClass().getSuperclass().getGenericSuperclass()).getActualTypeArguments()[0]).getSimpleName();
        }

    }

    public T findById(Integer id){
        return this.sqlSession.selectOne(this.getSqlId("findById"), id);
    }

    protected String getSqlId(String id){
        return  this.nameSpace + "." + id;
    }
}
