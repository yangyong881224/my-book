package com.yayo.user.facade.impl;

import com.yayo.base.component.RequestContext;
import com.yayo.base.utils.Paging;
import com.yayo.sys.mapper.dataobject.Choice;
import com.yayo.sys.mapper.dataobject.Paper;
import com.yayo.user.converter.ChoiceConverter;
import com.yayo.user.dto.ChoiceExameDTO;
import com.yayo.user.dto.PaperDTO;
import com.yayo.sys.service.PaperService;
import com.yayo.user.converter.PaperConverter;
import com.yayo.user.facade.UserPaperReadFacade;
import com.yayo.user.server.UserPaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserPaperReadFacadeImpl implements UserPaperReadFacade {

    @Autowired
    private PaperService paperService ;


    @Autowired
    private PaperConverter paperConverter;

    @Autowired
    private ChoiceConverter choiceConverter;

    @Autowired
    private UserPaperService userPaperService;

    @Override
    public Paging<PaperDTO> paging(Integer pageNo, Integer pageSize) {
        Paper paper = new Paper();
        paper.setPaperStatus(1);
        Paging<Paper> paperPaging = paperService.getPaperList(pageNo,pageSize,paper);
        if(paperPaging.getData().isEmpty()){
           return Paging.empty();
        }
        List<PaperDTO> paperDTOList = paperPaging.getData().stream().map(paperConverter::doToDto).collect(Collectors.toList());
        return new Paging<>(paperPaging.getTotal(),paperDTOList);
    }

    @Override
    public List<ChoiceExameDTO> makeExam(Long paperId) {
        //进入考试先记录一条

        userPaperService.create(paperId,RequestContext.getUserId());

        List<Choice> choiceList = paperService.ChoiceInPaper(paperId);
        return choiceList.stream().map(choiceConverter::doToDto).collect(Collectors.toList());
    }
}
