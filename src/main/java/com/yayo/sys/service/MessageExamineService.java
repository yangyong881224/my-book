package com.yayo.sys.service;

import com.yayo.base.utils.Paging;
import com.yayo.sys.controller.info.MessageInfo;

public interface MessageExamineService {
    Paging<MessageInfo> paging(Integer pageNo, Integer pageSize, String title, Integer examineStatus);
}
