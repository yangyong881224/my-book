package com.yayo.sys.controller;

import com.yayo.base.utils.Paging;
import com.yayo.sys.mapper.dataobject.Choice;
import com.yayo.sys.mapper.dataobject.Paper;
import com.yayo.sys.controller.dto.ChoiceDTO;
import com.yayo.sys.service.PaperService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

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

    /**
     * 分页查询试卷
     * @param pageNo
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "/list" , method = RequestMethod.GET)
    public Paging<Paper> getPaperList(Integer pageNo, Integer pageSize,String paperName){
        Paper paper = new Paper();
        paper.setPaperName(paperName);
        Paging<Paper> paging = paperService.getPaperList(pageNo,pageSize,paper);
        return paging;
    }


    /**
     * 创建试卷
     * @param paper
     * @return
     */
    @RequestMapping(value = "/create" , method = RequestMethod.POST)
    public boolean createPaper(Paper paper){
        boolean result = paperService.createPaper(paper);
        return result;
    }

    /**
     * 更新试卷标题
     * @param paper
     * @return
     */
    @RequestMapping(value = "/update" , method = RequestMethod.PUT)
    public boolean updatePaper(Paper paper){
        boolean result = paperService.updatePaper(paper);
        return result;
    }

    /**
     * 删除试卷
     * @param paperId
     * @return
     */
    @RequestMapping(value = "/delete" , method = RequestMethod.DELETE)
    public boolean deletePaper(Long paperId){
        return paperService.deletePaper(paperId);
    }

    /**
     * 分页查询未插入试卷的题库
     * @param pageNo
     * @param pageSize
     * @param paperId
     * @return
     */
    @RequestMapping(value = "/paper_choice_list" , method = RequestMethod.GET)
    public Paging<ChoiceDTO> paperChoiceList(Integer pageNo,Integer pageSize,Long paperId){
        return paperService.paperChoiceList(pageNo,pageSize,paperId);
    }

    /**
     * 将习题加入试卷
     * @param paperId
     * @param choiceIds
     * @return
     */
    @RequestMapping(value = "/add_choice" , method = RequestMethod.POST)
    public boolean addChoice(Long paperId, String choiceIds){
        Paper paper = new Paper();
        paper.setPaperId(paperId);
        paper.setChoiceIds(choiceIds);
        return paperService.addPaperChoice(paper);
    }

    @RequestMapping(value = "/choice_ids_in_paper" , method = RequestMethod.GET)
    public List<Choice> ChoiceInPaper(Long paperId){
        return paperService.ChoiceInPaper(paperId);
    }

    @RequestMapping(value = "/del_choice" , method = RequestMethod.DELETE)
    public boolean delChoice(Long paperId,String choiceIds){
        Paper paper = new Paper();
        paper.setPaperId(paperId);
        paper.setChoiceIds(choiceIds);
        return paperService.deleleChoice(paper);
    }
}
