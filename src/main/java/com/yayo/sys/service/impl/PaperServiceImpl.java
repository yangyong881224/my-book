package com.yayo.sys.service.impl;

import com.yayo.base.utils.PageInfo;
import com.yayo.base.utils.Paging;
import com.yayo.sys.bean.Paper;
import com.yayo.sys.mapper.PaperMapper;
import com.yayo.sys.service.PaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: Yayo
 * @Description:
 * @Created at: 2019/9/16 9:16
 */
@Service
public class PaperServiceImpl implements PaperService {

    @Autowired
    private PaperMapper paperMapper;

    @Override
    public Paging<Paper> getPaperList(Integer pageNo, Integer pageSize) {
        PageInfo pageInfo = PageInfo.of(pageNo,pageSize);
        Map<String,Object> params = new HashMap<>();
        params.put("limit",pageInfo.getLimit());
        params.put("offset",pageInfo.getOffset());
        Integer total = paperMapper.getPaperCount(params);
        if(total <= 0 ){
            return Paging.empty();
        }
        List<Paper> paperList = paperMapper.getPaperList(params);
        Paging<Paper> paging = new Paging<Paper>(total,paperList);
        paging.setTotal(total);
        return paging;
    }

    @Override
    public boolean createPaper(Paper paper) {
        return paperMapper.create(paper);
    }

    @Override
    public boolean updatePaper(Paper paper) {
        return paperMapper.update(paper);
    }

    @Override
    public boolean deletePaper(Integer paperId) {
        return paperMapper.delete(paperId);
    }
}
