package com.yayo.sys.controller;

import com.yayo.base.utils.Paging;
import com.yayo.sys.bean.Paper;
import com.yayo.sys.service.PaperService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: Yayo
 * @Description:
 * @Created at: 2019/9/16 9:09
 */
@RestController
@RequestMapping("/api/admin/paper")
@Slf4j
public class PaperController {

    @Autowired
    private PaperService paperService;

    @RequestMapping(value = "/list" , method = RequestMethod.GET)
    public Paging<Paper> getPaperList(Integer pageNo, Integer pageSize){
        Paging<Paper> paging = paperService.getPaperList(pageNo,pageSize);
        return paging;
    }


    @RequestMapping(value = "/create" , method = RequestMethod.POST)
    public boolean createPaper(Paper paper){
        boolean result = paperService.createPaper(paper);
        return result;
    }

    @RequestMapping(value = "/update" , method = RequestMethod.PUT)
    public boolean updatePaper(Paper paper){
        boolean result = paperService.updatePaper(paper);
        return result;
    }

    @RequestMapping(value = "/delete" , method = RequestMethod.DELETE)
    public boolean deletePaper(Integer paperId){
        return paperService.deletePaper(paperId);
    }
}
