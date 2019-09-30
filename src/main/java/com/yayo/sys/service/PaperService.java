package com.yayo.sys.service;

import com.yayo.base.utils.Paging;
import com.yayo.sys.bean.Choice;
import com.yayo.sys.bean.Paper;
import com.yayo.sys.dto.ChoiceDTO;

import java.util.List;
import java.util.Map;

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

    Paging<ChoiceDTO> paperChoiceList(Map<String, Object> params);

    boolean addPaperChoice(Paper paper);

    List<Choice> ChoiceInPaper(Integer paperId);

    boolean deleleChoice(Paper paper);
}
