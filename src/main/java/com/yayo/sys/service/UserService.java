package com.yayo.sys.service;

import com.yayo.base.utils.Paging;
import com.yayo.sys.controller.info.UserInfo;

import java.util.List;

/**
 * @Author: Yayo
 * @Description:
 * @Created at: 2019/9/12 10:53
 */
public interface UserService {
    public Paging<UserInfo> paging(Integer pageNo, Integer pageSize);

    UserInfo findById(Long userId);

    List<UserInfo> findByIds(List<Long> userIdList);

    UserInfo findByUsername(String username);
}
