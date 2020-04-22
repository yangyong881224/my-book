package com.yayo.sys.service.impl;

import com.google.common.collect.Lists;
import com.yayo.base.utils.PageInfo;
import com.yayo.base.utils.Paging;
import com.yayo.sys.mapper.dataobject.Choice;
import com.yayo.sys.mapper.dataobject.Paper;
import com.yayo.sys.controller.dto.ChoiceDTO;
import com.yayo.sys.mapper.PaperMapper;
import com.yayo.sys.service.ChoiceService;
import com.yayo.sys.service.PaperService;
import org.apache.commons.lang.StringUtils;
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

    @Autowired
    private ChoiceService choiceService;

    @Override
    public Paging<Paper> getPaperList(Integer pageNo, Integer pageSize, Paper paper) {
        PageInfo pageInfo = PageInfo.of(pageNo,pageSize);
        Map<String,Object> params = new HashMap<>();
        params.put("limit",pageInfo.getLimit());
        params.put("offset",pageInfo.getOffset());
        params.put("paperName",paper.getPaperName());
        params.put("paperStatus",paper.getPaperStatus());
        Long total = paperMapper.getPaperCount(params);
        if(total <= 0 ){
            return Paging.empty();
        }
        List<Paper> paperList = paperMapper.getPaperList(params);
        Paging<Paper> paging = new Paging<Paper>(total,paperList);
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
    public boolean deletePaper(Long paperId) {
        return paperMapper.delete(paperId);
    }

    @Override
    public Paging<ChoiceDTO> paperChoiceList(Integer pageNo, Integer pageSize, Long paperId) {
        Paper paper = paperMapper.getPaperById(paperId);
        Paging<ChoiceDTO> choicePaging = choiceService.paperChoiceList(pageNo, pageSize,paper.getChoiceIdList());
        return choicePaging;
    }

    @Override
    public boolean addPaperChoice(Paper paper) {
        Paper oldPaper = paperMapper.getPaperById(paper.getPaperId());
        if(StringUtils.isNotBlank(oldPaper.getChoiceIds())){
            String choiceIds = oldPaper.getChoiceIds() + "," + paper.getChoiceIds();
            paper.setChoiceIds(choiceIds);
        }
        return paperMapper.update(paper);
    }

    @Override
    public List<Choice> ChoiceInPaper(Long paperId) {
        Paper paper = paperMapper.getPaperById(paperId);
        if(paper.getChoiceIdList()!=null && paper.getChoiceIdList().size() != 0){
            return choiceService.getChoiceByIds(paper.getChoiceIdList());
        }else{
            return Lists.newArrayList();
        }
    }

    @Override
    public boolean deleleChoice(Paper paper) {
        Paper oldPaper = paperMapper.getPaperById(paper.getPaperId());
        oldPaper.getChoiceIdList().removeAll(paper.getChoiceIdList());
        paper.setChoiceIdList(oldPaper.getChoiceIdList());
        return paperMapper.update(paper);
    }
}
