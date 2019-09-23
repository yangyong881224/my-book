package com.yayo.sys.service;

import com.yayo.base.utils.Paging;
import com.yayo.sys.bean.Paper;

import java.util.List;

/**
 * @Author: Yayo
 * @Description:
 * @Created at: 2019/9/16 9:16
 */
public interface PaperService {

    Paging<Paper> getPaperList(Integer pageNo, Integer pageSize);

    boolean createPaper(Paper paper);

    boolean updatePaper(Paper paper);

    boolean deletePaper(Integer paperId);
}
