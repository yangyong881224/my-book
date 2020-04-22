package com.yayo.user.server.impl;

import com.yayo.user.dao.UserPaperDao;
import com.yayo.user.dao.dataobject.UserPaperDO;
import com.yayo.user.request.UserPaperRequest;
import com.yayo.user.server.UserPaperService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class UserPaperServiceImpl implements UserPaperService {

    @Autowired
    private UserPaperDao userPaperDao;

    @Override
    public Boolean updateUserPaper(UserPaperRequest userPaperRequest) {
        log.info("更新了用户答题表");
        return true;
    }

    @Override
    public void create(Long paperId, Long userId) {
        UserPaperDO userPaperDO = new UserPaperDO();
        userPaperDO.setPaperId(paperId);
        userPaperDO.setUserId(userId);
        userPaperDao.create(userPaperDO);
    }
}
