package com.yayo.sys.service;

import com.yayo.base.utils.Paging;
import com.yayo.sys.mapper.dataobject.Choice;
import com.yayo.sys.mapper.dataobject.Paper;
import com.yayo.sys.controller.dto.ChoiceDTO;

import java.util.List;

/**
 * @Author: Yayo
 * @Description:
 * @Created at: 2019/9/16 9:16
 */
public interface PaperService {

    Paging<Paper> getPaperList(Integer pageNo, Integer pageSize, Paper paper);

    boolean createPaper(Paper paper);

    boolean updatePaper(Paper paper);

    boolean deletePaper(Long paperId);

    Paging<ChoiceDTO> paperChoiceList(Integer pageNo, Integer pageSize, Long paperId);

    boolean addPaperChoice(Paper paper);

    List<Choice> ChoiceInPaper(Long paperId);

    boolean deleleChoice(Paper paper);

}
