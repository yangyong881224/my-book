package com.yayo.user.facade;

import com.yayo.base.utils.Paging;
import com.yayo.user.dto.ChoiceExameDTO;
import com.yayo.user.dto.PaperDTO;

import java.util.List;

public interface UserPaperReadFacade {
    Paging<PaperDTO> paging(Integer pageNo, Integer pageSize);

    List<ChoiceExameDTO> makeExam(Long paperId);
}
